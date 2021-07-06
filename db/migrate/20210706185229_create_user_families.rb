class CreateUserFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_families do |t|
      t.integer :user_id
      t.integer :family_id
      t.boolean :head

      t.timestamps
    end
  end
end
