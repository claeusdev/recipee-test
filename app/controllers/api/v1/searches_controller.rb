# frozen_string_literal: true

module Api
  module V1
    class SearchesController < ApplicationController
      def index
        @pagy, @records = pagy(SearchQuery.new(search_term, params[:filter], params[:category]).to_relation)
        render json: { data: RecipeSerializer.new(@records), meta: @pagy }
      end

      private

      def search_term
        params[:q]
      end
    end
  end
end
