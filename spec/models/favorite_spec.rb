require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:location)}
  end

  describe 'relationships' do
    it {should have_many(:user_favorites)}
    it {should have_many(:users).through(:user_favorites)}
  end
end
