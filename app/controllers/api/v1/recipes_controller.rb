# frozen_string_literal: true

module Api
  module V1
    class RecipesController < ApplicationController
      def index; end

      def show
        @recipe = Recipe.friendly.find(params[:id])
        render json: RecipeSerializer.new(@recipe).to_json
      end
    end
  end
end
