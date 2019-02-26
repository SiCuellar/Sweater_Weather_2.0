require 'rails_helper'

RSpec.describe UserFavorite, type: :model do
  describe 'relationships' do
    it {should belong_to(:favorite)}
    it {should belong_to(:user) }
  end
end
