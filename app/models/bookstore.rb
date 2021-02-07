class Bookstore < ApplicationRecord
  belongs_to :location

  def self.open_to_the_public
    where(open: true).to_a
  end
end
