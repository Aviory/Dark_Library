class Reader

  def to_s

  end

  def equals mach_reader
    if self.name == mach_reader.name
      true
    else
      false
    end
  end


  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end


end