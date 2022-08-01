class AddSupermarketIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :supermarket, foreign_key: true
  end
end
