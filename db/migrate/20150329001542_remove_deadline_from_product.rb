class RemoveDeadlineFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :deadline, :datetime
  end
end
