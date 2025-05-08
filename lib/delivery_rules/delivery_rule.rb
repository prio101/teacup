# frozen_string_literal: true
class DeliveryRule
  # Threshold rules for delivery fees
  THRESHOLDS = [
    { min: 90, fee: 0.00 },
    { min: 50, fee: 2.95 },
    { min: 0,  fee: 4.95 }
  ]

  def initialize
    @thresholds = THRESHOLDS.sort_by { |t| t[:min] }.reverse
  end

  def calculate(subtotal)
    rule = @thresholds.find { |t| subtotal >= t[:min] }
    formatted_subtotal = RoundUp.call(subtotal, 2)

    if rule
      LoggerHelper.log(:info, "Delivery fee applied: $#{rule[:fee]} for subtotal: $#{formatted_subtotal}")
      rule[:fee]
    else
      LoggerHelper.log(:warn, "No delivery rule found for subtotal: $#{formatted_subtotal}")
      @thresholds.find { |t| t[:min] == 0 }[:fee]
    end
  end
end
