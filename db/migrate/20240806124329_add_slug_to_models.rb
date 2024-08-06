# frozen_string_literal: true

class AddSlugToModels < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :slug, :string
    add_column :recipes, :slug, :string
    add_column :ingredients, :slug, :string

    add_index :categories, :slug, unique: true
    add_index :recipes, :slug, unique: true
    add_index :ingredients, :slug, unique: true
  end
end
