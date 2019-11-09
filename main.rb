require_relative "../Dark_Library/src/entities/library"
require_relative "../Dark_Library/src/utils/dark_console"

lib = Library.new
console = DarkConsole.new

loop do
  console.case_description

  case console.input("enter case number")
  when "0" #exit
    break
  when "1" #addBook
    lib.add_books(Book.new(console.input("enter book title"), Author.new(console.input("enter Author name"))))
  when "2" #create order
    lib.creature_orders(Book.new(console.input("enter book title"), Author.new(console.input("enter Author name"))), Reader.new(console.input("name"), console.input("email"), console.input("city"), console.input("street"), console.input("house")))
  when "3"
    lib.save
    console.output("saved")
  when "4"
    lib.read
    console.output("read")
  when "5"
    console.output(lib.top_reader.inspect)
  else
    console.input("bad num")
  end
end
