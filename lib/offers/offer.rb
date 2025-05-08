# frozen_string_literal: true
class Offer
  # Ruleset for the Sticker Pack Offer Minimum
  STICKER_OFFER_MINIMUM = 20.0

  def apply(items, current_total)
    raise NotImplementedError
  end
end
