# frozen_string_literal: true

class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
end
