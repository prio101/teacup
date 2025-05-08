# frozen_string_literal: true
require 'colorize'
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

# Initialize product catalogue
catalogue = ProductCatalogue.new(products)

# Setup delivery rules
delivery_rule = DeliveryRule.new

# Setup offers
offers = [
  StickerPackOffer.new(product_code: "R01")
]

# Initialize basket
basket = Basket.new(catalogue: catalogue,
                    delivery_rule: delivery_rule,
                    offers: offers)

# add the terminal inputs, from user
LoggerHelper.log(:info,"Please enter the product code to add to the basket (or 'done/d' to finish):")
LoggerHelper.log(:info,"You can add multiple products, just enter the product code and press enter.")
LoggerHelper.log(:info,"Choose from the following product codes: R01, G01, B01 [Case Insensitive]")

loop do
  logger.log(:info,"Enter Input [R01, G01, B01] or [d/Done] to Finish:")
  input = gets.chomp
  break if input.downcase == 'done' || input.downcase == 'd'

  # read from the comma separated list
  # R01, G01, B01, R01, G01
  input = input.split(",").map(&:strip)
  input.each do |code|
    begin
      case code.downcase
      when 'r01'
        LoggerHelper.log(:info, "Adding Red Widget to the basket.")
        basket.add(code.upcase)
      when 'g01'
        LoggerHelper.log(:info, "Adding Green Widget to the basket.")
        basket.add(code.upcase)
      when 'b01'
        basket.add(code.upcase)
        LoggerHelper.log(:info, "Adding Blue Widget to the basket.")
      else
        raise "Invalid product code: #{code}"
      end
    rescue => e
      LoggerHelper.log(:error, e.message)
    end
  end

  # Display the current total
  LoggerHelper.log(:info, "Total: $#{basket.total}")
end
