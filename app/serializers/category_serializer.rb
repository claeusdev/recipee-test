# frozen_string_literal: true

class CategorySerializer
  include JSONAPI::Serializer
  attributes :name

  attribute :recipes, if: proc { |_record, opts|
    opts[:include_recipes]
  }
end
