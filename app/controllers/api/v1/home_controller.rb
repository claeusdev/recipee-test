# frozen_string_literal: true

module Api
  module V1
    class HomeController < ApplicationController
      def index
        @categories = Category.includes(:recipes).limit(50)
        render json: CategorySerializer.new(@categories).to_json
      end
    end
  end
end
