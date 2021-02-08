class Library < ApplicationRecord
  has_many :books

  def self.order_by_created_date
    order('created_at desc')
  end
end
