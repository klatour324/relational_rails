class Book < ApplicationRecord
  belongs_to :library

  def self.is_checked_out
    where(checked_out: true).to_a
  end

  def self.records_within_criteria(criteria)
    where("pages > ?", criteria)
  end
end
