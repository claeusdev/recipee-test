# frozen_string_literal: true

module Api
  module V1
    class RecipesController < ApplicationController
      def index
        @recipes = Recipe.includes(:user, :category, :ingredients).limit(50)
        render json: RecipeSerializer.new(@recipes).to_json
      end

      def show; end
    end
  end
end
