# frozen_string_literal: true
class Offer
  # Ruleset for the Offer Minimum
  STICKER_OFFER_MINIMUM = 20.0
  HALF_OFFER_MINIMUM = 2

  def description
    raise NotImplementedError
  end

  def apply(items, current_total)
    raise NotImplementedError
  end
end
