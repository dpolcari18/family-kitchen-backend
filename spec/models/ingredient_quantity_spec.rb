require 'rails_helper'

RSpec.describe IngredientQuantity, type: :model do
  
  subject {
    family = Family.create(name: 'Polcari')
    ingredient = Ingredient.create(name: 'Onion')
    recipe = Recipe.create(family_id: family.id, name: 'Soup', prep_time: '60', cuisine_type: 'American')
    described_class.new(ingredient_id: ingredient.id, recipe_id: recipe.id, quantity: 1, unit: 'cup', description: 'Diced')
  }

  describe 'create' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'should be valid without a description' do
      subject.description = nil
      expect(subject).to be_valid
    end

    it 'should not be valid without a ingredient id' do
      subject.ingredient_id = nil
      expect(subject).not_to be_valid
    end

    it 'should not be valid without a recipe id' do    
      subject.recipe_id = nil
      expect(subject).not_to be_valid
    end

    it 'should not be valid without a quantity' do      
      subject.quantity = nil
      expect(subject).not_to be_valid
    end
    
    it 'should not be valid without a unit' do      
      subject.unit = nil
      expect(subject).not_to be_valid
    end

    it 'should not be valid without a valid unit' do
      subject.unit = 'CUP'
      expect(subject).not_to be_valid
    end
  end
end
