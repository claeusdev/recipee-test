# frozen_string_literal: true

module Api
  module V1
    class SearchesController < ApplicationController
      def index
        @results = SearchQuery.new(search_term).to_relation
        render json: RecipeSerializer.new(@results).to_json
      end

      private

      def search_term
        params[:q]
      end
    end
  end
end
