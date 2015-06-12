

  def scan(item)
    item_elements = item.split
    price = item_elements.last
    quantity = item_elements.first
    desc = item_elements.slice(1..(item_elements.length - 3)).join(" ")
    Product.new(quantity, desc, price)
  end



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
    "Quantity: #{@product_details[:quantity]}\nDescription: #{@product_details[:desc]}\nPrice: #{@product_details[:price]}\nTax rate: #{@tax_rate}\nDuty rate: #{@duty_rate}"
  end

end

class Product_Exempt < Product
  def initialize(quantity, desc, price)
    super(quantity, desc, price)
    @tax_rate = 0.0
  end

  def to_s
    super
  end
end

puts "Please enter your shopping items in the format [qty] [item] at [price]"
puts "Example: 1 book at 12.49"
scan("1 book at 12.49")
scan("1 music CD at 14.99")


# test = Product_Exempt.new(1,"apples",2.00 )
# puts test

# test2 = Product.new(2,"oranges",1.25 )
# puts test2