# frozen_string_literal: true

class Recipe < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  belongs_to :category

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
