class AddCategoryToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :category, null: true, foreign_key: true
  end
end
