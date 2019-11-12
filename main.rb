require_relative "../Dark_Library/src/entities/library"
require_relative "../Dark_Library/src/utils/dark_console"
require 'time'

lib = Library.new
console = DarkConsole.new

loop do
  console.case_description

  case console.input_int("enter case number")
  when "0" #exit
    break
  when "1" #addBook
    lib.add_books(Book.new(console.input("enter book title"), Author.new(console.input("enter Author name"))))
  when "2" #create order
    console.output(lib.get_book_list)
    bookIndex = console.input_int("enter book number\n  do you want add new book? enter 0")
    if bookIndex == 0
      lib.add_books(Book.new(console.input("enter book title"), Author.new(console.input("enter Author name"))))
      book = lib.books.last
    else
      book = lib.get_book(bookIndex-1)
    end
    console.output(lib.get_readers_list)
    readerIndex = console.input_int("enter reader number\n  do you want add new reader? enter 0")
    if readerIndex == 0
      lib.add_readers( Reader.new(console.input("name"), console.input("email"), console.input("city"), console.input("street"), console.input("house")))
      reader = lib.readers.last
    else
      reader = lib.get_reader(readerIndex-1)
    end
   #"{ reader = lib.get_reader(console.input("enter reader number"))}"
    lib.creature_orders(book,reader)
    console.output(lib.get_orders_list)
  when "3"
    lib.save
    console.output("saved")
  when "4"
    lib.read
    console.output("read")
  when "5"
    console.output(lib.top_reader.inspect)
  when "6"
    console.output(lib.top_book.inspect)
  when "7"
    lib.add_readers( Reader.new(console.input("name"), console.input("email"), console.input("city"), console.input("street"), console.input("house")))
  when "8"
   console.output(lib.three_most_popular_books.inspect)
  when "9"
    console.output("reader count ="+ lib.readers_count_hwo_get_most_popular_books.to_s)
  else
    console.input("bad num")
  end
end
