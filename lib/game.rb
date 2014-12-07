class TicTacToe

    attr_reader :board, :turn

    def initialize(player1, player2)
      @players = { x: player1, o: player2 }
      @board = Board.new
      @turn = :x
    end

    def start
      until @board.won? || @board.tie?
        puts @winner
        show_board
        move = @players[@turn].get_move(self, self.turn)
        until valid_move?(move)
          puts "Invalid move, that square is not empty"
          move = @players[@turn].get_move(self, self.turn)
        end
        self.board.place_mark(move, @turn)
        @turn = swap_turn
      end
      if self.board.winner
        show_board
        puts "#{@players[self.board.winner].name} wins!"
      else
        show_board
        puts "tie game!"
      end
    end

    private

    def valid_move?(pos)
      #check if square is empty
      self.board.empty?(pos)
    end

    def show_board
      self.board.grid.each { |row| p row }
    end

    def swap_turn
      @turn == :x ? :o : :x
    end
end
