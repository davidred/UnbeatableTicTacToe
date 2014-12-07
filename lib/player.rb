class Player

  attr_reader :name

  def initialize(name), @name = name, end

  def get_move(game, mark)
    puts "#{@name}, Enter a move: "
    pos = gets.chomp.split(',').map(&:to_i)
    until valid_move? pos
      puts "Invalid move, enter 2 numbers between 0 and 2, separated by a comma. e.g: 0,1"
      pos = gets.chomp.split(',').map(&:to_i)
    end
    pos
  end


  private

  def valid_move?(pos) # Checks if move is on the board
    pos.all? { |coord| (0..2).include?(coord) } && pos.length == 2
  end

end
