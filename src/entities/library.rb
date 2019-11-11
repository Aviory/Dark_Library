require 'yaml'

require_relative "../entities/Author"
require_relative "../entities/library_data"

require_relative "../entities/Book"
require_relative "../entities/Reader"
require_relative "../entities/Order"


class Library
  attr_reader :books, :orders, :readers

  def initialize ()
    if read == "Rescued"
      @books = Array.new
      @orders = Array.new
      @readers = Array.new

      puts "Empty data"
    else

      puts " File loaded"
    end
  end

  def add_books(book)
    @books.push(book)
    save

  end

  def add_readers(reader)
    @readers.push(reader)
    save
  end

  def creature_orders(book, reader)
    #if book exist
    #
    order = Order.new(book, reader)

    @orders.push(order)
    save
  end

  def save
    libraryData = LibraryData.new
    libraryData.books = @books
    libraryData.orders = @orders
    libraryData.readers = @readers

    File.write("data.yml", libraryData.to_yaml)
  end

  def read
    begin
      libraryData = YAML.load (File.read ("data.yml"))
      @books = libraryData.books
      @orders = libraryData.orders
      @readers = libraryData.readers
      #@readers = Array.new
    rescue
      "Rescued"
    end
  end

  def top_reader
    max = 0
    count = 0
    reader = @orders[0].reader

    @orders.each do |current_order|
      @orders.each do |mach_order|
        if current_order.reader.equal? mach_order.reader and !current_order.book.equal? mach_order.book
          count += 1
        end
      end
      if (count > max)
        max = count
        reader = current_order.reader
      end
      count = 0
    end
    reader
  end

  def top_book
    max = 0
    count = 0
    book = @orders[0].book

    @orders.each do |current_order|
      @orders.each do |mach_order|
        if current_order.book.equal? mach_order.book and !current_order.reader.equal? mach_order.reader
          count += 1
        end
      end
      if (count > max)
        max = count
        book = current_order.book
      end
      count = 0
    end
    book
  end

  def get_book(i)
    @books[i]

  end

  def get_book_list
    response = ""
    if @books.length == 0
      response = "we haven't books :("
    end
    index = 1
    @books.each do |book|
      response += " #{index}:  #{book.to_s}\n"
      index += 1
    end
    response
  end

  def get_reader(i)
    @readers[i]

  end

  def get_readers_list
    response = ""
    if @readers.length == 0
      response = "we haven't readers :("
    end
    index = 1
    @readers.each do |reader|
      response += " #{index}:  #{reader.to_s}\n"
      index += 1
    end
    response
  end

  def get_orders_list
    response = ""
    if @orders.length == 0
      response = "we haven't orders :("
    end
    index = 1
    @orders.each do |order|
      response += " #{index}:  #{order.to_s}\n"
      index += 1
    end
    response
  end

  def readers_count_three_most_popular_books
    top_books = Hash.new
    isValueAdd = false
    @orders.each do |current_order|
      top_books.each_key do |order_key, value|
        if current_order.book.eql? order_key.book and !current_order.reader.eql?order_key.reader
          top_books[order_key] += 1
          #top_books.update(top_books){|order_key, value| value + 1 }
          isValueAdd = true
          break
        end
      end
      if !isValueAdd
        top_books[current_order] = 1
      end
      isValueAdd = false
    end
    p top_books
    p top_books.sort
    rr = {top_books.keys[-1].book => top_books.values[-1],top_books.keys[-2].book => top_books.values[-2],top_books.keys[-3].book => top_books.values[-3]}
    rr
  end


end