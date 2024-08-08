# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RecipesController, type: :controller do
  describe 'GET #show' do
    let(:recipe) { create(:recipe) }

    it 'returns a successful response' do
      get :show, params: { id: recipe.slug }
      expect(response).to be_successful
    end

    it 'assigns the requested recipe' do
      get :show, params: { id: recipe.slug }
      expect(assigns(:recipe)).to eq(recipe)
    end

    it 'returns the recipe as JSON' do
      get :show, params: { id: recipe.slug }
      expect(JSON.parse(response.body)).to eq(JSON.parse(RecipeSerializer.new(recipe).to_json))
    end
  end
end
