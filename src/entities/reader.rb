class Reader

  def to_s
    " #{self.name}"
  end



  def eql?(other)
    if self.name.eql?other.name
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