class ChangeNameColToCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :from, :min
    rename_column :categories, :to, :max
  end
end
