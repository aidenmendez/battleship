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
    show_main_menu
  end

  def game_over?
    game_over = false
    if @computer.board.render(true).!include?("S")
      @winner = "You"
      game_over = true
    elsif @user.board.render(true).!include?("S")
      @winner = "I"
      game_over = true
    end
    game_over
  end

  def report_winner
    puts "#{winner} won. Womp womp."
  end

  def user_shot
    puts "Your turn. Enter the coordinate for your shot:"
    shot = gets.chomp.upcase

    until @computer.board.valid_coordinate?(shot)
      if @computer.board.cells[shot].fired_upon?
        puts "You already fired there. Numpty. Try again:"
      else
        puts "Please enter a valid coordinate:"
      end
      
      shot = gets.chomp.upcase
    end
    shot
  end

  def turn
    @computer.render_board
    @user.render_board
    @computer.shot_at(user_shot)

    @user.shot_at(some computer method)

  end

  # Psuedo code for turns
  # 
  # 
  # 
  # puts and do computer takes a shot (not rum, or .whiskey)
  # 
end