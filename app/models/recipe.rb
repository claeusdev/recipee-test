# frozen_string_literal: true

class Recipe < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  belongs_to :category
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  scope :popular, -> { where('ratings >= 4.5') }
  scope :quick_cook, -> { where('cook_time < 30') }
  scope :by_category, ->(category) { joins(:category).where(categories: { slug: category }) }

  def short_desc
    ingredients.limit(3).pluck(:description).join(', ')
  end
end
