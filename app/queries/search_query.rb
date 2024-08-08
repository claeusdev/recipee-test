# frozen_string_literal: true

class SearchQuery
  def initialize(term, filter, category)
    @term = term
    @filter = filter
    @category = category
  end

  def to_relation
    relation = Recipe.includes(:user, :category, :ingredients).joins(:ingredients)
                     .where('recipes.title ILIKE :term OR ingredients.description ILIKE :term', term: "%#{term}%")

    relation = relation.by_category(category) if category.present?

    relation = relation.popular if filter == 'popular'
    relation = relation.quick_cook if filter == 'quick-prep'

    relation
  end

  private

  attr_reader :term, :filter, :category
end
