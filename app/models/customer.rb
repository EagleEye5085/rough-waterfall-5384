class Customer < ApplicationRecord
  belongs_to :supermarket
  has_many :customer_items
  has_many :items, through: :customer_items

  def total_items_price(id)
    customer = Customer.find(id)
    Item.all.joins(:customer_items).joins(:customers).where(customers: {id: customer.id}).sum(:Price)
  end
end
