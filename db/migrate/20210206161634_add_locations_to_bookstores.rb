class AddLocationsToBookstores < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookstores, :location, foreign_key: true
  end
end
