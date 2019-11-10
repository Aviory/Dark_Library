

require_relative "../entities/Book"
require_relative "../entities/Reader"


class Order
  attr_reader :book, :reader, :date

  def initialize(book,reader )
    @book = book
    @reader = reader
    time = Time.now
    @date = time.strftime('%Y%m%d')

  end

  def to_s
    " #{self.book}: #{self.reader}  #{self.date}"
    end


end