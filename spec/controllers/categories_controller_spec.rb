# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller do
  describe 'GET #index' do
    let(:categories) { create_list(:category, 3) }

    before do
      allow(controller).to receive(:pagy).and_return([Pagy.new(count: categories.count), categories])
    end

    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns the categories' do
      get :index
      expect(assigns(:categories)).to eq(categories)
    end

    it 'returns the categories as JSON' do
      get :index
      response_data = JSON.parse(response.body)['data']
      expect(response_data['data'].size).to eq(categories.size)
    end

    it 'includes the pagination meta data' do
      get :index
      expect(JSON.parse(response.body)['meta']).to be_present
    end
  end
end
