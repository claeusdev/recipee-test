# frozen_string_literal: true

FactoryBot.define do
  factory :recipe_ingredient do
    recipe
    ingredient
  end
end
