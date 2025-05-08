class ProductCatalogue

  def initialize(products = [])
    @products = products.each_with_object({}) do |product, hash|
      hash[product.code] = product
    end
  end

  # fastest lookup for product by code
  # O(1) time complexity
  # O(n) space complexity
  def find(code)
    @products[code]
  end
end
