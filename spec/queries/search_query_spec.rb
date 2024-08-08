# frozen_string_literal: true

# spec/services/search_query_spec.rb
require 'rails_helper'

RSpec.describe SearchQuery do
  let(:category1) { create(:category, name: 'Desserts', slug: 'desserts') }
  let(:category2) { create(:category, name: 'Main Courses', slug: 'main-courses') }
  let(:user) { create(:user) }
  let(:ingredient1) { create(:ingredient, description: 'Sugar') }
  let(:ingredient2) { create(:ingredient, description: 'Salt') }

  let!(:recipe1) do
    create(:recipe, title: 'Chocolate Cake', ratings: 4.6, cook_time: 60, user:,
                    category: category1).tap do |recipe|
      create(:recipe_ingredient, recipe:, ingredient: ingredient1)
    end
  end

  let!(:recipe2) do
    create(:recipe, title: 'Quick Salad', ratings: 4.2, cook_time: 10, user:, category: category2).tap do |recipe|
      create(:recipe_ingredient, recipe:, ingredient: ingredient2)
    end
  end

  describe '#to_relation' do
    context 'when searching by term' do
      it 'returns recipes matching the title or ingredient description' do
        search_query = SearchQuery.new('Chocolate', nil, nil)
        results = search_query.to_relation

        expect(results).to contain_exactly(recipe1)
      end

      it 'returns recipes matching ingredient description' do
        search_query = SearchQuery.new('Salt', nil, nil)
        results = search_query.to_relation

        expect(results).to contain_exactly(recipe2)
      end
    end

    context 'when filtering by category' do
      it 'returns recipes in the specified category' do
        search_query = SearchQuery.new('', nil, 'desserts')
        results = search_query.to_relation

        expect(results).to contain_exactly(recipe1)
      end
    end

    context 'when filtering by popular recipes' do
      it 'returns recipes with ratings of 4.5 and above' do
        search_query = SearchQuery.new('', 'popular', nil)
        results = search_query.to_relation

        expect(results).to contain_exactly(recipe1)
      end
    end

    context 'when filtering by quick cook recipes' do
      it 'returns recipes with cook time less than 30 minutes' do
        search_query = SearchQuery.new('', 'quick-prep', nil)
        results = search_query.to_relation

        expect(results).to contain_exactly(recipe2)
      end
    end

    context 'when filtering by category and popular recipes' do
      it 'returns recipes matching both category and popular criteria' do
        search_query = SearchQuery.new('', 'popular', 'desserts')
        results = search_query.to_relation

        expect(results).to contain_exactly(recipe1)
      end
    end
  end
end
