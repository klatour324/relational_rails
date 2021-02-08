class Library < ApplicationRecord
  has_many :books




  def books_count
    books.count
  end
end
