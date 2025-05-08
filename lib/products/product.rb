class Product
  attr_reader :code, :name, :price

  # Using keyword arguments for clarity
  # and to avoid confusion with positional arguments.
  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = price
  end
end
