class Location < ApplicationRecord
  has_many :bookstores

  def self.sort_by_recently_created
    order('created_at').reverse
  end

  def bookstore_count
    bookstores.count
  end

  def bookstores_by_inventory(value)
    bookstores.where("inventory > #{value}")
  end

  def abc_bookstores
    bookstores.order('name')
  end
end
