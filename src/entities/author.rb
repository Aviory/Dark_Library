class Author
  attr_reader :name
  attr_accessor :biography

  def initialize(name)
    @name = name
  end

  def to_s
    "Author:  #{@name}, #{@biography}"
  end

  def biography
    if (biography != nil)
      @biography
    else
      puts "non biography"
    end
  end

  def biography=(value)
    @biography = value
  end

  end
