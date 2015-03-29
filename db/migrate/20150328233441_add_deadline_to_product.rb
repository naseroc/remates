class AddDeadlineToProduct < ActiveRecord::Migration
  def change
    add_column :products, :deadline, :datetime, :default => 2.hours
  end
end
