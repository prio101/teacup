# frozen_string_literal: true


# Example usage:
# puts RoundUp.call(2.345, 2) # => 2.35

module RoundUp
  def self.call(value, places)
    value.round(places).ceil(places)
  end
end
