require 'rails_helper'

RSpec.describe 'supermarkets show page' do
  before :each do

    @supermarket_1 = Supermarket.create!(name: 'Wallmart', location: '123 beach st.')

    @customer_1 = @supermarket_1.customers.create!(name: "Chris")
    @customer_2 = @supermarket_1.customers.create!(name: "Thomas")
    @customer_3 = @supermarket_1.customers.create!(name: "Tyler")
    @customer_4 = @supermarket_1.customers.create!(name: "Adam")

    @item_1 = @supermarket_1.items.create!(name: 'soda', price: 200)
    @item_2 = @supermarket_1.items.create!(name: 'chips', price: 300)
    @item_3 = @supermarket_1.items.create!(name: 'cheese', price: 100)
    @item_4 = @supermarket_1.items.create!(name: 'milk', price: 250)
    @item_5 = @supermarket_1.items.create!(name: 'beer', price: 1000)

    @customer_item_1 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_1.id)
    @customer_item_2 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_2.id)
    @customer_item_3 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_3.id)
    @customer_item_4 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_4.id)

    @customer_item_5 = CustomerItem.create!(customer_id:   @customer_2.id, item_id: @item_2.id)
    @customer_item_6 = CustomerItem.create!(customer_id:   @customer_2.id, item_id: @item_4.id)
    @customer_item_7 = CustomerItem.create!(customer_id:   @customer_2.id, item_id: @item_3.id)

    @customer_item_8 = CustomerItem.create!(customer_id:   @customer_3.id, item_id: @item_3.id)
    @customer_item_9 = CustomerItem.create!(customer_id:   @customer_3.id, item_id: @item_2.id)

    @customer_item_10 = CustomerItem.create!(customer_id:   @customer_4.id, item_id: @item_3.id)

      visit "/supermarkets/#{@supermarket_1.id}"

  end

  it 'has link to supermarket items index' do
    expect(page).to have_link('Items list')

    click_link 'Items list'

    expect(current_path).to eq("/supermarkets/#{@supermarket_1.id}/items")
  end

  it 'shows the three most popular items' do

    within "#top-3-items" do
      expect(@item_3.name).to appear_before(@item_2.name)
      expect(@item_2.name).to appear_before(@item_4.name)
    end
  end

end
