# frozen_string_literal: true

# General game state control. Turns and player info
class TicTacToe
  def initialize
    @p1 = Player.new('X')
    @p2 = Player.new('O')
  end
end

# Player Info class
class Player
  attr_reader :name, :team

  def initialize(team)
    puts "what is the name of the #{team} player?"
    @name = gets.chomp
    @team = team
  end

  def introduce
    puts "Hi I'm #{@name} on #{@team} Team!"
  end
end

# Holds the state of the board and the logic to determine outcomes
class Board
  def initialize; end
end

x = TicTacToe.new
