class Author < Entity
  attr_reader :name, :biography

  def initialize(name, biography = "")
    @name = name

    if !name.is_a?(String) or name.size == nil
      begin
        raise CustomError.new("Invalid author name")
      rescue => e
        puts e.msg
      end
    end
  end

  def to_s
    "Author:  #{@name}, #{@biography}"
  end

end
