# frozen_string_literal: true

class SearchQuery
  def initialize(term, filter, category)
    @term = term
    @filter = filter
    @category = category
  end

  def to_relation
    relation = Recipe.includes(:user, :category, :ingredients)

    if term.present?
      terms = term.split(/[,\s]+/).map { |t| "%#{t.strip}%" }

      relation = relation.joins(:ingredients)
                         .where('ingredients.description ILIKE ANY (ARRAY[?])', terms)
    end

    relation = relation.by_category(category) if category.present?
    relation = relation.popular if filter == 'popular'
    relation = relation.quick_cook if filter == 'quick-prep'

    relation
  end

  private

  attr_reader :term, :filter, :category
end
