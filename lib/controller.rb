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
   puts "Game started!"
  #  until game_over?
    #   do_turn
    # end
  end

  def game_over?
    is_over = false
    if user.
  end

  # Psuedo code for turns
  # display boards from user perspective
  # ask player for a valid coordinate
  # puts and do player's shot from coordinate -> calls computer.method
  # puts and do computer takes a shot (not rum, or .whiskey)
  # 
end