# frozen_string_literal: true

# General game state control. Turns and player info
class TicTacToe
  def initialize
    @board = Board.new
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
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    display_board
  end

  def display_board
    counter = 0
    @board.each do |row|
      print counter.zero? ? '' : "-----\n"
      puts "#{row[0]}|#{row[1]}|#{row[2]}"
      counter += 1
    end
  end
end

x = TicTacToe.new
