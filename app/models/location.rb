class Location < ApplicationRecord
  has_many :bookstores

  def self.sort_by_recently_created
    order('created_at').reverse
  end

  def bookstore_count
    bookstores.count
  end
end
