require_relative 'game'

class TTTNode

  attr_reader :board, :prev_move, :next_mover

  def initialize(board, next_mover, prev_move = nil)
    @board, @prev_move, @next_mover =
    board, prev_move, next_mover
  end

  def losing_node?(evaluator)
    if board.won? || board.tie?
      return board.winner != evaluator && board.won?
    end

    if self.next_mover == evaluator
      self.children.all? { |node| node.losing_node?(evaluator) }
    else
      self.children.any? { |node| node.losing_node?(evaluator) }
    end

  end

  def winning_node?(evaluator)
    if self.board.won? || board.tie?
      return board.winner == evaluator
    end

    if self.next_mover == evaluator
      self.children.any? { |node| node.winning_node?(evaluator) }
    else
      self.children.all? { |node| node.winning_node?(evaluator) }
    end
  end

  def children
    children = []

    (0..2).each do |row_idx|
      (0..2).each do |col_idx|
        pos = [row_idx, col_idx]

        next unless board.empty?(pos)

        new_board = board.dup
        new_board.place_mark pos, next_mover
        next_mover = (self.next_mover == :x ? :o : :x)

        children << TTTNode.new(new_board, next_mover, pos)
      end
    end

    children
  end



end
