# frozen_string_literal: true

require_relative './lib/products/product'
require_relative './lib/products/product_catalogue'
require_relative './lib/delivery_rules/delivery_rule'
require_relative './lib/basket'
require_relative './lib/offers/offer'
require_relative './lib/offers/sticker_pack_offer'
require_relative './lib/utils/logger_helper'
require_relative './lib/utils/round_up'


logger = LoggerHelper
logger.log(:info,"Starting the cart basket application")
# Setup product catalog
products = [
  Product.new(code: "R01", name: "Red Widget", price: 32.95),
  Product.new(code: "G01", name: "Green Widget", price: 24.95),
  Product.new(code: "B01", name: "Blue Widget", price: 7.95)
]
catalogue = ProductCatalogue.new(products)

# Setup delivery rules
delivery_rule = DeliveryRule.new

# Setup offers
offers = [
  StickerPackOffer.new(product_code: "R01")
]

# Initialize basket
basket = Basket.new(catalogue: catalogue, delivery_rule: delivery_rule, offers: offers)

# Add products
basket.add("R01")
# basket.add("R01")
basket.add("G01")


# Print total
puts "Total: $#{basket.total}"
