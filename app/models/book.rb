class Book < ApplicationRecord
  belongs_to :library

  def self.is_checked_out
    where(checked_out: true).to_a
  end

  def self.filter_by_pages(pages)
    where("pages > ?", pages)
  end

  def self.sort_alphabetically
    order(:title)
  end
end
