class AddColumnsToLibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :public, :boolean
    add_column :libraries, :years_opened, :integer
    add_column :libraries, :created_at, :datetime
    add_column :libraries, :updated_at, :datetime
  end
end
