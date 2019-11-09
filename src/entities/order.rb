

require_relative "../entities/Book"
require_relative "../entities/Reader"


class Order
  attr_reader :book, :reader, :date

  def initialize(book,reader )
    @book = book
    @reader = reader
    #@date = Time.strftime('%Y%m%d')

  end


end