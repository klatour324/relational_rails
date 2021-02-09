class Library < ApplicationRecord
  has_many :books

  def sort_alphabetically
    books.order('title')
  end
end
