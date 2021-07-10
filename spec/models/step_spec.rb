require 'rails_helper'

RSpec.describe Step, type: :model do
  
  subject {
    family = Family.create(name: 'Polcari')
    recipe = Recipe.create(family_id: family.id, name: 'Cereal', prep_time: 15, cuisine_type: 'Breakfast')
    described_class.new(recipe_id: recipe.id, number: 1, directions: 'Make cereal')
  }

  describe 'create' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should not be valid without a recipe id' do
      subject.recipe_id = nil
      expect(subject).not_to be_valid
    end

    it 'should not be valid without a step number' do
      subject.number = nil
      expect(subject).not_to be_valid 
    end

    it 'should not be valid without directions' do
      subject.directions = nil
      expect(subject).not_to be_valid
    end

    it 'should not accept a step number and recipe id combo that already exists' do
      step1 = Step.create(recipe_id: subject.recipe_id, number: subject.number, directions: 'Pour milk')
      step2 = Step.create(recipe_id: subject.recipe_id, number: subject.number, directions: 'Eat cereal')
      expect(step2).not_to be_valid
    end
  end
end
