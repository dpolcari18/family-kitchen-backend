require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(auth_id: 'anotherid')
  }

  describe 'create' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a authorization id' do
      subject.auth_id = nil
      expect(subject).not_to be_valid
    end
  end
end
