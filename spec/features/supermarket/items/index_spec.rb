require 'rails_helper'

RSpec.describe 'supermarket items index page' do
  before :each do

    @supermarket_1 = Supermarket.create!(name: 'Wallmart', location: '123 beach st.')
    @supermarket_2 = Supermarket.create!(name: 'Wallmart', location: '123 beach st.')

    @customer_1 = @supermarket_1.customers.create!(name: "Chris")
    @customer_2 = @supermarket_1.customers.create!(name: "Thomas")

    @item_1 = @supermarket_1.items.create!(name: 'soda', price: 200)
    @item_2 = @supermarket_1.items.create!(name: 'chips', price: 300)
    @item_3 = @supermarket_1.items.create!(name: 'cheese', price: 100)
    @item_4 = @supermarket_1.items.create!(name: 'milk', price: 250)
    @item_5 = @supermarket_1.items.create!(name: 'beer', price: 1000)
    @item_6 = @supermarket_2.items.create!(name: 'pizza', price: 200)
    @item_7 = @supermarket_2.items.create!(name: 'candy', price: 300)

    @customer_item_1 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_1.id)
    @customer_item_2 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_2.id)
    @customer_item_3 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_3.id)
    @customer_item_4 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_4.id)
    @customer_item_5 = CustomerItem.create!(customer_id:   @customer_2.id, item_id: @item_1.id)
    @customer_item_6 = CustomerItem.create!(customer_id:   @customer_2.id, item_id: @item_2.id)
    @customer_item_7 = CustomerItem.create!(customer_id:   @customer_2.id, item_id: @item_3.id)
    @customer_item_8 = CustomerItem.create!(customer_id:   @customer_2.id, item_id: @item_5.id)

      visit "/supermarkets/#{@supermarket_1.id}/items"

    end

    it 'shows a unique list of all the items for a supermarket' do
      within '#supermarket-items-section' do
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

        expect(page).to_not have_content('candy')
        expect(page).to_not have_content('pizza')
      end
    end
  end
