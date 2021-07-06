class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :prep_time
      t.string :cuisine_type

      t.timestamps
    end
  end
end
