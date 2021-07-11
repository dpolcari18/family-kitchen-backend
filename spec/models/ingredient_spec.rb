require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  
  subject {
    described_class.new(name: 'Cereal')
  }

  describe 'create' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should not be valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'should not accept an ingredient with the same name' do
      ingredient_one = Ingredient.create(name: subject.name)
      ingredient_two = Ingredient.create(name: subject.name)
      expect(ingredient_two).not_to be_valid
    end
    
    it 'should not accept an ingredient with the same name - case insensitive' do
      ingredient_one = Ingredient.create(name: subject.name)
      ingredient_two = Ingredient.create(name: 'ceReAl')
      expect(ingredient_two).not_to be_valid
    end
  end

end
