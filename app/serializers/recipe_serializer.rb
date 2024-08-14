# frozen_string_literal: true

class RecipeSerializer
  include JSONAPI::Serializer
  attributes :title, :cuisine, :image, :cook_time, :prep_time, :ratings, :ingredients, :category, :user, :ratings,
             :short_desc, :slug
end
