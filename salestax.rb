
class Basket
  def initialize(inputs)
    @products = Array.new
    inputs.each do |input|
      # puts inputs.index[input]
      @products << scan(input)
    end
  end

  def scan(item)
    item_elements = item.split
    price = item_elements.last
    quantity = item_elements.first
    desc = item_elements.slice(1..(item_elements.length - 3)).join(" ")
    Product.new(quantity, desc, price)
  end

  def checkout
    @products.each do |product|
      puts "#{product.quantity} #{product.desc}: #{product.price} "


    end
  end

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
    @taxes = 0.00
    @total = 0.00 # For now, until tax is calculated
  end

  def quantity
    @product_details[:quantity]
  end
  def desc
    @product_details[:desc]
  end
  def price
    @product_details[:price]
  end

  def total
    if @product_details[:desc].downcase.index("books")
      @tax_rate = 0.00
    end
    @taxes = @product_details[:price].to_f * (@tax_rate + @duty_rate)
    @total = @product_details[:price] + @taxes
    @total

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

basket1 = Basket.new(["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"])
basket1.checkout


# puts "Example: 1 book at 12.49"
# scan("1 book at 12.49")
# scan("1 music CD at 14.99")


# test = Product_Exempt.new(1,"apples",2.00 )
# puts test

# test2 = Product.new(2,"oranges",1.25 )
# puts test2