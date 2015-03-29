class AddAdditionaltimeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :additionaltime, :integer, :default => 7200 #7200 segundos
  end
end
