class AddTimestampsToLocations < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :locations
  end
end
