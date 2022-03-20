# frozen_string_literal: true

# General game state control. Turns and player info
class TicTacToe
  def initialize
    @board = Board.new
    @p1 = Player.new('X')
    @p2 = Player.new('O')
  end

  def play_game
    round = 1
    @board.play_move(@p1)
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

  def get_input(current_player)
    puts "Which volumn would #{current_player.name} like to place in(left to right:0,1, or 2)"
    column = gets.chomp.to_i
    puts "Which row would #{current_player.name} like to place in(top to bottom:0,1, or 2)"
    row = gets.chomp.to_i
    [row, column]
  end

  def play_move(current_player)
    # gets inputs and updates the board when a proper input is found
    while true
      move = get_input(current_player)
      break if @board[move[0]][move[1]] == ' '
    end
    @board[move[0]][move[1]] = current_player.team
    display_board

    check_win(move, current_player.team)
  end

  def check_win(move, current_team)
    player_won = true

    # checks vertical line
    @board[move[0]].each do |item|
      player_won = false if item != current_team
    end
    return player_won if player_won

    # checks horizontal line
    @board.each do |item|
      player_won = false if item[move[1]] != current_team
    end

    return player_won if player_won

    # check diagonals
    player_won = true if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]

    player_won = true if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]

    player_won
  end
end

x = TicTacToe.new
x.play_game
