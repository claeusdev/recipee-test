# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    description { Faker::Food.ingredient }
  end
end
