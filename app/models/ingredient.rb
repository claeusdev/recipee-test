# frozen_string_literal: true

class Ingredient < ApplicationRecord
  extend FriendlyId
  friendly_id :description, use: :slugged

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
