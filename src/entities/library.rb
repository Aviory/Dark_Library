require 'yaml'

require_relative "../entities/Author"
require_relative "../entities/Book"
require_relative "../entities/Reader"
require_relative "../entities/Order"


class Library
  include DB
  attr_reader :books, :orders, :readers



  def initialize (orders = [], books = [], authors = [], readers = [])
    if read == "Rescued"
      @books = books
      @orders = orders
      @readers = readers
      @authors = authors

      puts "Empty data"
    else

      puts " File loaded"
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


  def three_most_popular_books
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
    rr = top_books.sort_by {|k, v| v}
    #rr.select {|k, v | }
    {rr[-1][0].book => rr[-1][1],rr[-2][0].book => rr[-2][1],rr[-3][0].book => rr[-3][1]}
  end


  def readers_count_hwo_get_most_popular_books
    read_orders = Array.new
    books = three_most_popular_books
    @orders.each do |current_order|
      books.each do |book, value|
        if current_order.book.eql? book and read_orders.find_all do |contain_order|
          if contain_order.reader.eql?current_order.reader
            break
          end
          true
        end
          read_orders.push current_order
        end
      end
    end
    read_orders.size
  end


end
