# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SearchesController, type: :controller do
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

  describe 'GET #index' do
    context 'when searching by term' do
      it 'returns recipes matching the title or ingredient description' do
        get :index, params: { q: 'Chocolate' }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['data']['data'].size).to eq(1)
        expect(json_response['data']['data'].first['id']).to eq(recipe1.id.to_s)
      end
    end

    context 'when filtering by category' do
      it 'returns recipes in the specified category' do
        get :index, params: { category: 'desserts' }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['data']['data'].size).to eq(1)
        expect(json_response['data']['data'].first['id']).to eq(recipe1.id.to_s)
      end
    end

    context 'when filtering by popular recipes' do
      it 'returns recipes with ratings of 4.5 and above' do
        get :index, params: { filter: 'popular' }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['data']['data'].size).to eq(1)
        expect(json_response['data']['data'].first['id']).to eq(recipe1.id.to_s)
      end
    end

    context 'when filtering by quick cook recipes' do
      it 'returns recipes with cook time less than 30 minutes' do
        get :index, params: { filter: 'quick-prep' }

        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['data']['data'].size).to eq(1)
        expect(json_response['data']['data'].first['id']).to eq(recipe2.id.to_s)
      end
    end
  end
end
