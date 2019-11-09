class DarkConsole
  def input(msg)
    puts msg
    gets.chomp
  end

  def output(msg)
    puts msg
  end

  def case_description
    puts "1. add book in Library"
    puts "2. create new order"
    puts "3. save data "
    puts "4. read data"
    puts "5. top reader"
    puts "6. "
    puts "0. exit (don't enter zero plz >_<) "

  end

end