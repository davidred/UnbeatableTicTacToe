require_relative 'computer_player.rb'
require_relative 'game_node.rb'

class UnbeatableComputer < ComputerPlayer # The unbeatable CPU

  def initialize(name); super name; end

  def get_move(game, mark)  # Checks to see if there are any possible winning moves, and if there aren't any, takes a move that is not a losing move.
    node = TTTNode.new(game.board, mark)
    pos_moves = node.children
    #any possible winning moves?
    node = pos_moves.find{ |child| child.winning_node?(mark) }
    return node.prev_move if node
    #take a move that isn't a losing move
    node = pos_moves.find{ |child| !child.losing_node?(mark) }
    return node.prev_move if node
  end

end
