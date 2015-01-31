class Order < ActiveRecord::Base
	has_many :line_items

	PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
	
	validates :name, :address, :email, :pay_type, :presence => true
	validates :pay_type, :inclusion => PAYMENT_TYPES

	def add_line_items_from_cart(cart)
		cart.items.each do |item|
			li = LineItem.from_cart_item(item)
			line_items << li
		end
	end

end
