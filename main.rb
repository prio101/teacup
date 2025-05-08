# frozen_string_literal: true
require 'colorize'
require 'artii'
require 'logger'
require 'debug'

# Load all the files in the lib directory
Dir[File.join(__dir__, 'lib', '**', '*.rb')].sort.each { |file| require_relative file }


# Making ascii art for the title
artii = Artii::Base.new(font: 'slant')
puts artii.asciify('Basket Application').colorize(:blue).bold


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
  StickerPackOffer.new(product_code: "G01"),
  HalfOffer.new(product_code: "R01", quantity: 2),
]

# Initialize basket
basket = Basket.new(catalogue: catalogue,
                    delivery_rule: delivery_rule,
                    offers: offers)

# add the terminal inputs, from user
LoggerHelper.log(:info,"Please enter the product code to add to the basket (or 'done/d' to finish):")
LoggerHelper.log(:info,"You can add multiple products, just enter the product code and press enter.")
LoggerHelper.log(:info,"Choose from the following product codes: R01, G01, B01 [Case Insensitive]")

begin
  loop do
    logger.log(:info, "Enter Input [R01, G01, B01] or [d/Done] to Finish:")
    input = gets.chomp
    break if input.downcase == 'done' || input.downcase == 'd'

    # read from the comma-separated list
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
  end
rescue Interrupt
  LoggerHelper.log(:info, "Program interrupted. Exiting gracefully...")
end

LoggerHelper.log(:info, "Total: $#{basket.total}")
