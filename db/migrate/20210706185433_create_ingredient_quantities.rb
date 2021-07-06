class CreateIngredientQuantities < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_quantities do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.integer :quantity
      t.string :unit
      t.string :description

      t.timestamps
    end
  end
end
