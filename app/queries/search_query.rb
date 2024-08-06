# frozen_string_literal: true

class SearchQuery
  def initialize(term)
    @term = term
  end

  def to_relation
    Recipe.includes(:user, :category, :ingredients).joins(:ingredients)
          .where('recipes.title ILIKE :term OR ingredients.description ILIKE :term', term: "%#{term}%").limit(50)
  end

  private

  attr_reader :term
end
