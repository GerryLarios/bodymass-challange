class AddFromLimitToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :from, :float
    add_column :categories, :to, :float
  end
end
