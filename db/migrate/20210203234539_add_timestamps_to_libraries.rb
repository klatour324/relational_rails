class AddTimestampsToLibraries < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :libraries
  end
end
