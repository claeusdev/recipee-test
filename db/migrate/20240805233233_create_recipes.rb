class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cook_time
      t.integer :prep_time
      t.decimal :ratings
      t.string :cuisine
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
