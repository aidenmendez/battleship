require "./lib/board"
require "./lib/user"
require "./lib/computer"
require "./lib/ship"

class Controller
  attr_reader :winner,
              :user,
              :computer,
              :user_ships,
              :computer_ships

  def initialize()
    @winner = nil
    @user = nil
    @computer = nil
    @computer_ships = [cruiser = Ship.new("Cruiser", 3), submarine = Ship.new("Submarine", 2)]
    @user_ships = [cruiser = Ship.new("Cruiser", 3), submarine = Ship.new("Submarine", 2)]

  end

  def show_main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play with current ships."
    puts "Enter c to view or edit ships." 
    puts "Enter q to quit."

    menu_selection = gets.chomp
    if menu_selection == "p"
      start_game
    elsif menu_selection == "c"
      ship_menu
    elsif menu_selection == "q"
      puts "Goodbye." 
    end
  end

  def start_game
    @user = User.new(user_ships)
    @computer = Computer.new(computer_ships)
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

  def reset_boards
    @user.board.reset_board
    @computer.board.reset_board
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

  def ship_menu
    display_current_ships
    custom_ships_arr if edit_ships?
    start_game
  end

  def display_current_ships
    puts "Current ships include and are limited to:"
    @user_ships.each do |ship|
      puts "#{ship.name} is length #{ship.length}"
    end
  end

  def edit_ships?
    puts "Would you like to edit ships (y/n)?"
    gets.chomp.upcase == "Y"
  end
  
  def custom_ships_arr
    ship_quant = get_ship_quant
    max_length = 3
    @user_ships = []
    @computer_ships = []

    ship_quant.times {create_ship(max_length)}
  end

  def get_ship_quant
    puts "How many ships (max 3)"
    ship_quant = gets.chomp.to_i

    until (1..3).include?(ship_quant)
      puts "Invalid quantity. Try again:"
      ship_quant = gets.chomp.to_i
    end

    ship_quant
  end

  def create_ship(max_length)
    name = get_ship_name
    ship_length = get_ship_length(max_length)
    user_ship_gen(name, ship_length)
    computer_ship_gen(name, ship_length)
  end

  def get_ship_name
    puts "Enter ship name:"
    name = gets.chomp
    name
  end

  def get_ship_length(max_length)
    puts "Enter ship length (max of #{max_length}):"
    ship_length = gets.chomp.to_i
    unless (2..max_length).include?(ship_length)
      puts "Invalid length. Try again:"
      ship_length = gets.chomp.to_i
    end

    ship_length
  end

  def computer_ship_gen(name, ship_length)
    computer_ship = Ship.new(name, ship_length)
    @computer_ships << computer_ship
    computer_ship
  end

  def user_ship_gen(name, ship_length)
    user_ship = Ship.new(name, ship_length)
    @user_ships << user_ship
    user_ship
  end
end