require 'rails_helper'

RSpec.describe UserFamily, type: :model do
  
  subject {
    user = User.create(auth_id: 'newid')
    family = Family.create(name: 'Polcari')
    described_class.new(user_id: user.id, family_id: family.id, head: true)
  }

  describe 'create' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a user id' do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a family id' do
      subject.family_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a head of family boolean value' do
      subject.head = nil
      expect(subject).not_to be_valid
    end

    it 'should not accept a user id and family id combo that already exists' do
      user_family1 = UserFamily.create(user_id: subject.user_id, family_id: subject.family_id, head: true)
      user_family2 = UserFamily.create(user_id: subject.user_id, family_id: subject.family_id, head: true)
      expect(user_family2).not_to be_valid
    end
  end
end
