class DarkConsole
  def input(msg)
    puts msg
    gets.chomp
  end

  def input_int(msg)
    puts msg
    input = gets.chomp
    if input.to_i.to_s != input
      raise ConsoleInputExceptions
    else
      input
    end
  end

  def is_integer?
    self.to_i.to_s == self
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
    puts "6. top book"
    puts "7. add reader in Library"
    puts "8. three most popular books"
    puts "9. readers_count_hwo_get_most_popular_books"

    puts "0. exit (don't enter zero plz >_<) "

  end

end