class RemoveColumnsFromLibraries < ActiveRecord::Migration[5.2]
  def change
    remove_column :libraries, :created_at, :datetime
    remove_column :libraries, :updated_at, :datetime
  end
end
