class Product < ActiveRecord::Base

	def self.find_products_for_sale
		order("title desc") 
	end	

	validates_presence_of :title, :description, :image_url
  validates_uniqueness_of :title
  validates_length_of :title,
		:minimum => 10,
		:message => 'title is too short, it must be longer 10 character.'
	validates_format_of :image_url, 
    :with => /\A.*\.(jpg|gif|png|bmp)\z/i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  protected
  def price_must_be_at_least_a_cent
    errors.add( :price, 'should be at least 0.01.' ) if price.nil? || price < 0.01
  end
end
