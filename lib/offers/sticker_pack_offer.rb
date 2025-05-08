# frozen_string_literal: true

class StickerPackOffer < Offer

  def initialize(product_code:)
    @product_code = product_code
    @applied = false
  end

  def description
    LoggerHelper.log(:warn, "Get a sticker pack when you spend at least #{STICKER_OFFER_MINIMUM}.")
  end

  def apply(items, current_total)
    # if the total of the items is greater than STICKER_OFFER_MINIMUM ,
    # we will attach a sticker pack
    unless items.empty?
      if @applied == false && current_total >= STICKER_OFFER_MINIMUM
        LoggerHelper.log(:info, "Sticker pack offer applied")
        @applied = true # Settings Attribute that can be used later if needed
      end
    end
    current_total
  end
end
