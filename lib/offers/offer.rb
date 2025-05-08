# frozen_string_literal: true
class Offer
  # Ruleset for the Sticker Pack Offer Minimum
  STICKER_OFFER_MINIMUM = 20.0
  HALF_OFFER_MINIMUM = 2

  def self.description
    raise NotImplementedError
  end

  def apply(items, current_total)
    raise NotImplementedError
  end
end
