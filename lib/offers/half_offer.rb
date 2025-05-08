# frozen_string_literal: true
require_relative 'offer'

# Spcial offer for if buy one then second one will be half price
class HalfOffer < Offer
  def initialize(product_code:, quantity: nil)
    @product_code = product_code
    @quantity = quantity || HALF_OFFER_MINIMUM
    @applied = false
  end

  def description
    LoggerHelper.log(:warn, "Get half price on your order when you buy at least #{@quantity} items.")
  end

  def apply(items, current_total)
    # Check if the number of items is greater than or equal to the minimum required
    if items.size >= @quantity
      discounted_price = 0
      items.each_with_index do |item, index|
        # Apply half price to every second item
        next if item.code != @product_code

        discounted_price += item.price / 2 if index.odd?
      end

      # Apply the discount to the current total
      current_total -= discounted_price
      LoggerHelper.log(:info, "Half price offer applied #{discounted_price}")
    end

    current_total
  end
end
