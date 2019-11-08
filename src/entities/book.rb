
require_relative "../entities/Author"

class Book
  attr_reader :author, :title

  def initialize(title, author )
    @title = title
    @author = author
  end

end