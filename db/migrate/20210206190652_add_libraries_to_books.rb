class AddLibrariesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :library, foreign_key: true
  end
end
