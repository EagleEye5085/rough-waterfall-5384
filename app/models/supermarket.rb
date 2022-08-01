class Supermarket < ApplicationRecord
  has_many :customers
  has_many :items

  def top_items(id)
    supermarket = Supermarket.find(id)
    # binding.pry
    items = Item.all.where(supermarket_id: id).joins(:customer_items).group(:id).count
    binding.pry
  end
end
