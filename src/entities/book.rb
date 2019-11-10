
require_relative "../entities/Author"
def equals mach_reader
  if self.title == mach_book.title
    true
  else
    false
  end
end
class Book
  attr_reader :author, :title

  def initialize(title, author )
    @title = title
    @author = author
  end

  def to_s
    " #{self.title}: #{self.author}"
  end

end