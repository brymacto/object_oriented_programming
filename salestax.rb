class Product
  def initialize(quantity, desc, price)
    @tax_rate = 0.10
    @duty_rate = 0.0
    @product_details = {
      quantity: quantity,
      desc: desc,
      price: price
    }
  end

  def to_s
    "Quantity: #{@product_details[:quantity]}, #{@product_details[:desc]}, Price: #{@product_details[:price]}, Tax rate: #{@tax_rate}, Duty rate: #{@duty_rate}"
  end

end

class Book < Product
  def initialize(quantity, desc, price)
    super(quantity, desc, price)
    @tax_rate = 0.0
  end

  def to_s
    super
  end
end

class Food < Product

end

class MedicalProducts < Product

end


test = Book.new(1,"apples",2.00 )
puts test

test2 = Product.new(2,"oranges",1.25 )
puts test2