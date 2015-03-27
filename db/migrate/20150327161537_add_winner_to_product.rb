class AddWinnerToProduct < ActiveRecord::Migration
  def change
    add_column :products, :winner, :integer
  end
end
