# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    user
    category

    after(:create) do |recipe|
      create_list(:recipe_ingredient, 3, recipe:)
    end
  end
end
