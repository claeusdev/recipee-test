# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        @pagy, @categories = pagy Category.all

        render json: { data: CategorySerializer.new(@categories), meta: @pagy }
      end
    end
  end
end
