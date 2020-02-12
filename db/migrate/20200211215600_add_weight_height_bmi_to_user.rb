class AddWeightHeightBmiToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :weight, :float
    add_column :users, :height, :float
    add_column :users, :bmi, :float
  end
end
