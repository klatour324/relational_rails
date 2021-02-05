class CreateBookstore < ActiveRecord::Migration[5.2]
  def change
    create_table :bookstores do |t|
      t.string :name
      t.integer :inventory
      t.boolean :open

      t.timestamps
    end
  end
end
