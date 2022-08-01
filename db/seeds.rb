# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@supermarket_1 = Supermarket.create!(name: 'Wallmart', location: '123 beach st.')

@customer_1 = @supermarket_1.customers.create!(name: "Chris")

@item_1 = @supermarket_1.items.create!(name: 'soda', price: 200)
@item_2 = @supermarket_1.items.create!(name: 'chips', price: 300)
@item_3 = @supermarket_1.items.create!(name: 'cheese', price: 100)
@item_4 = @supermarket_1.items.create!(name: 'milk', price: 250)
@item_5 = @supermarket_1.items.create!(name: 'beer', price: 1000)

@customer_item_1 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_1.id)
@customer_item_1 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_2.id)
@customer_item_1 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_3.id)
@customer_item_1 = CustomerItem.create!(customer_id:   @customer_1.id, item_id: @item_4.id)
