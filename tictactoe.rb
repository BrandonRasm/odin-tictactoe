# frozen_string_literal: true

# It tic. It tacs. It toes.
class TicTacToe
  def initialize
    @p1 = Player.new('X')
    @p2 = Player.new('O')
  end
end

# Its a player
class Player
  def initialize(team)
    puts "what is the name of the #{team} player?"
    @name = gets.chomp
    @team = team
  end

  def introduce
    puts "Hi I'm #{@name} on #{@team} Team!"
  end
end

# Board Class
class Board
  def initialize; end
end

x = TicTacToe.new
