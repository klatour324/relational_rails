class CreateLocation < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :population
      t.boolean :urban
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
