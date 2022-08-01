require 'rails_helper'

RSpec.describe 'customer show page' do
  before :each do

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

      visit "/customers/#{@customer_1.id}"

  end

  it "shows a list of all customer items" do
    # save_and_open_page
    within '#customer-items-section' do
      within "#item-#{@item_1.id}" do
        expect(page).to have_content('soda')
      end

      within "#item-#{@item_2.id}" do
        expect(page).to have_content('chips')
      end

      within "#item-#{@item_3.id}" do
        expect(page).to have_content('cheese')
      end

      within "#item-#{@item_4.id}" do
        expect(page).to have_content('milk')
      end

      expect(page).to_not have_content('beer')
    end
  end

  it 'shows the customers supermarket' do
    expect(page).to have_content('Wallmart')
  end

  it 'shows the total price of all items' do
    # save_and_open_page
    expect(page).to have_content('Total price: $8.50')
  end

end
