require 'rails_helper'

RSpec.describe Family, type: :model do
  
  subject {
    described_class.new(name: 'Polcari')
  }

  describe 'create' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a family name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end
  end
end
