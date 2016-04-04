class Product < ActiveRecord::Base
    has_many :line_items
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	before_destroy :ensure_not_referenced_by_any_line_item

	private
	  def ensure_not_referenced_by_any_line_item
	  if line_items.empty?
	     return true
	  else
	  	errors.add(:base,' line items present')
	  	return false
	  end
	end

end
