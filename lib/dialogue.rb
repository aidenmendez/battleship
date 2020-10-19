class Dialogue
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
  end
end