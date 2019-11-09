require 'yaml'

require_relative "../entities/Author"
require_relative "../entities/library_data"

require_relative "../entities/Book"
require_relative "../entities/Reader"
require_relative "../entities/Order"



class Library
  attr_reader  :books, :orders

  def initialize ()
    if read == "Rescued"
      @books =  Array.new
      @orders =  Array.new

      puts "Empty data"
    else

      puts " File loaded"
    end
  end

  def add_books(book)
    @books.push(book)

  end

  def creature_orders(book, reader)
    #if book exist
    #
    order = Order.new(book,reader)

    @orders.push(order)
  end

  def save
    libraryData = LibraryData.new
    libraryData.books = @books
    libraryData.orders = @orders

    File.write("data.yml", libraryData.to_yaml)
  end

  def read
    begin
      libraryData = YAML.load (File.read ("data.yml"))
      @books = libraryData.books
      @orders = libraryData.orders
    rescue
      "Rescued"
    end
  end

  def top_reader
    max = 0
    count = 0
    reader = @orders[0].reader

    @orders.each do |current_order| @orders.each do |mach_order| if current_order.reader.equal?mach_order.reader
                                                                   count += 1 end end
    if(count > max)
      max = count
      reader = current_order.reader
    end
    count = 0
    end
    reader
  end


end