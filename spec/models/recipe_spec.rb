require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
  subject {
    family = Family.create(name: 'Polcari')
    described_class.new(name: 'Cereal', prep_time: 15, cuisine_type: 'Breakfast', family_id: family.id)
  }

  describe 'create' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should not be valid without a family id' do
      subject.family_id = nil
      expect(subject).not_to be_valid
    end

    it 'should not be valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'should not be valid without prep time' do
      subject.prep_time = nil
      expect(subject).not_to be_valid
    end

    it 'should not be valid without a cuisine type' do
      subject.cuisine_type = nil
      expect(subject).not_to be_valid
    end
  end
end
