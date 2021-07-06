class AddFamilyIdToRecipe < ActiveRecord::Migration[6.1]
  def change
      add_column :recipes, :family_id, :integer
  end
end
