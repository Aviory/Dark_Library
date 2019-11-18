require_relative "../entities/author"

class Book
  attr_reader :author, :title

  def initialize(title, author)
    if !title.is_a?(String) or title.size == nil or author.is_a?(Author)
      begin
        raise CustomError.new("Invalid argument")
      rescue => e
        puts e.msg
      end
    else
      @title = title
      @author = author
    end
  end

  def to_s
    " #{title}: #{author}"
  end
end
