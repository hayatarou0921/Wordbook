require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ create(:user) }

  context 'valid' do
    it 'is valid with email and password' do
      expect(user).to be_valid
    end
  end

  context 'invalid' do

    it 'is invalid without email' do
      invalid = build(:user, email: nil)
      expect(invalid).to be_invalid
    end

    it 'is invalid without password' do
      invalid = build(:user, password: nil)
      expect(invalid).to be_invalid
    end

    it 'is invalid with duplicate email' do
      valid = user
      invalid = build(:user)
      expect(invalid).to be_invalid
    end
  end

end
