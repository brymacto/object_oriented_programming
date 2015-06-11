class Product
  def initialize(quantity, desc, price)
    @tax_rate = 0.10
    @product_details = {
      quantity: quantity,
      desc: desc,
      price: price
    }
  end

  def to_s
    "Quantity: #{@product_details[:quantity]}, #{@product_details[:desc]}, #{@product_details[:price]}"
  end

end

class Book < Product
  def initialize()
end

class Food < Product

end

class MedicalProducts < Product

end


test = Product.new(1,"apples","2.00")
puts test