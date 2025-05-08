class Basket

  attr_reader :items

  def initialize(catalogue:, delivery_rule:, offers: [])
    @catalogue = catalogue
    @delivery_rule = delivery_rule
    @offers = offers
    @items = []
  end

  def add(product_code)
    product = @catalogue.find(product_code)
    raise "Invalid product code: #{product_code}" unless product

    @items << product
  end

  def total
    return 0.00 if @items.empty?

    subtotal = apply_offers(@items.dup)
    delivery = @delivery_rule.calculate(subtotal)
    RoundUp.call((subtotal + delivery), 2)
  end

  private

  def apply_offers(items)
    @offers.reduce(items.sum(&:price)) do |current_total, offer|
      offer.apply(items, current_total)
    end
  end
end
