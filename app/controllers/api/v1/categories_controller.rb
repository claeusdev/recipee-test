# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @categories = Category.all.limit(50)
        render json: CategorySerializer.new(@categories).to_json
      end

      def show
        @category = Category.includes(recipes: :user).friendly.find(params[:id])
        render json: CategorySerializer.new(@category, { params: { include_recipes: true } }).serializable_hash.to_json
      end
    end
  end
end
