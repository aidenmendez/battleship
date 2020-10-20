require "./lib/board"
require "./lib/user"
require "./lib/computer"

class Controller
  attr_reader :winner,
              :user,
              :computer

  def initialize()
    @winner = nil
    @user = User.new
    @computer = Computer.new
  end

  def show_main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    menu_selection = gets.chomp
    if menu_selection == "p"
      start_game
    elsif menu_selection == "q"
      puts "Goodbye." 
    end
  end

  def start_game
    @computer.setup
    @user.board.render(true)
    @user.setup

    until game_over?
      turn
    end

    report_winner
    reset_boards
    show_main_menu
  end

  def game_over?
    game_over = false
    if !@computer.board.render(true).include?("S")
      @winner = "You"
      game_over = true
    elsif !@user.board.render(true).include?("S")
      @winner = "I"
      game_over = true
    end
    game_over
  end

  def report_winner
    render_boards
    puts "#{winner} won. Womp womp."
  end

  def user_shot
    puts "Your turn. Enter the coordinate for your shot:"
    shot = gets.chomp.upcase

    until @computer.board.valid_shot?(shot) && !@computer.board.cells[shot].fired_upon?
      if @computer.board.cells[shot] == nil
        puts "Please enter a valid coordinate:"
      elsif @computer.board.cells[shot].fired_upon?
        puts "You already fired there. Numpty. Try again:"
      else
        puts "Please enter a valid coordinate:"
      end
      
      shot = gets.chomp.upcase
    end
    shot
  end

  def random_shot
    available_cells = @user.board.cells.select do |cell, cell_value|
      !cell_value.fired_upon?
    end
    available_cells = available_cells.keys
    available_cells.shuffle.shift
  end

  def display_shots(user_fires_at, computer_shot)
    puts "You shot at #{user_fires_at}. It was a #{@computer.shot_result(user_fires_at)}."
    puts "My shot on #{computer_shot} was a #{@user.shot_result(computer_shot)}."

  end

  def render_boards
    @computer.render_board
    @user.render_board
  end

  def turn
    render_boards
    user_fires_at = user_shot 
    @computer.shot_at(user_fires_at)
    computer_shot = random_shot
    @user.shot_at(computer_shot)
    display_shots(user_fires_at, computer_shot)
  end

  def reset_boards 

  end
end