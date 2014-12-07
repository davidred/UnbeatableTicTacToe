#!/bin/bash ruby

require_relative 'board'
require_relative 'player'
require_relative 'computer_player'
require_relative 'unbeatable_computer'

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

if __FILE__ == $PROGRAM_NAME
  puts "Enter your name"
  name = gets.chomp
  p1 = Player.new(name)
  puts "Want to play 1. Another human, 2. Dumb Computer, or 3. Unbeatable Computer"
  choice = gets.chomp.to_i
  until choice >= 1 && choice <= 3
    puts "Invalid option, enter either number 1, 2, or 3"
    choice = gets.chomp.to_i
  end
  case choice
  when 1
    puts "Enter second player's name"
    name = gets.chomp
    p2 = Player.new(name)
  when 2
    puts "Enjoy playing the dumb computer"
    p2 = ComputerPlayer.new("Dumb Computer")
  when 3
    puts "Hope you can at least tie against the unbeatable computer"
    p2 = UnbeatableComputer.new("Unbeatable Computer")
  end
  g = TicTacToe.new(p1,p2)
  g.start
end
