
require_relative "../entities/Author"


class Book
  attr_reader :author, :title

  def initialize(title, author )
    @title = title
    @author = author
  end


  def eql?(other)
    if self.title.eql?other.title
      true
    else
      false
    end
  end


  def to_s
    " #{self.title}: #{self.author}"
  end

end