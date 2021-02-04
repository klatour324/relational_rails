class CreateBookstore < ActiveRecord::Migration[5.2]
  def change
    create_table :bookstores do |t|
      t.string :name
      t.boolean :open
      t.integer :inventory

      t.timestamps
    end
  end
end
