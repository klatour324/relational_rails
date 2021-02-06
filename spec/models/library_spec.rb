require 'rails_helper'

describe Library, type: :model do
  describe 'relationships' do
    it {should have_many :books}
  end
end
