class CustomError < StandardError

  def initialize(msg = "msg")
      super(msg)
  end
end