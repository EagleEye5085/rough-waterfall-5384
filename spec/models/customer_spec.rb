require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to(:supermarket) }
    it { should have_many(:customer_items)}
    it { should have_many(:items).through(:customer_items)}
  end

  it ' can give a total price for its items' do
    @supermarket_1 = Supermarket.create!(name: 'Wallmart', location: '123 beach st.')

    @customer_1 = @supermarket_1.customers.create!(name: "Chris")

    @item_1 = @supermarket_1.items.create!(name: 'soda', price: 200)
    @item_2 = @supermarket_1.items.create!(name: 'chips', price: 300)
    @item_3 = @supermarket_1.items.create!(name: 'cheese', price: 100)
    @item_4 = @supermarket_1.items.create!(name: 'milk', price: 250)
    @item_5 = @supermarket_1.items.create!(name: 'beer', price: 1000)

    @customer_item_1 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_1.id)
    @customer_item_2 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_2.id)
    @customer_item_3 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_3.id)
    @customer_item_4 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_4.id)

    expect(@customer_1.total_items_price(@customer_1.id)).to eq(850)
  end
end
