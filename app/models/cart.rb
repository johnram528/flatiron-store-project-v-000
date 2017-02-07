class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item)
    line_item = self.line_items.find_by(item_id: item)
    if line_item.blank?
      item = Item.find_by(id: item)
      item.line_items.build(cart: self)
    else
      line_item.quantity += 1
      line_item
    end
  end

  def total
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end


end
