# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  subject do
    described_class.new(
      title: 'Grilled Cheese Sandwich',
      ratings: 4.8,
      cook_time: 20,
      user:,
      category:
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a category' do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  describe 'scopes' do
    let!(:popular_recipe) { create(:recipe, ratings: 4.9) }
    let!(:quick_recipe) { create(:recipe, cook_time: 25) }
    let!(:other_recipe) { create(:recipe, ratings: 4.0, cook_time: 45) }

    context '.popular' do
      it 'returns recipes with ratings >= 4.5' do
        expect(described_class.popular).to include(popular_recipe)
        expect(described_class.popular).to_not include(other_recipe)
      end
    end

    context '.quick_cook' do
      it 'returns recipes with cook_time < 30' do
        expect(described_class.quick_cook).to include(quick_recipe)
        expect(described_class.quick_cook).to_not include(other_recipe)
      end
    end

    context '.by_category' do
      let!(:category) { create(:category, slug: 'sandwiches') }
      let!(:sandwich_recipe) { create(:recipe, category:) }
      let!(:other_recipe) { create(:recipe) }

      it 'returns recipes for the given category' do
        expect(described_class.by_category('sandwiches')).to include(sandwich_recipe)
        expect(described_class.by_category('sandwiches')).to_not include(other_recipe)
      end
    end
  end

  describe '#short_desc' do
    let(:recipe) { create(:recipe) }
    let!(:ingredients) do
      [
        create(:ingredient, description: 'Tomato'),
        create(:ingredient, description: 'Basil'),
        create(:ingredient, description: 'Garlic'),
        create(:ingredient, description: 'Olive Oil')
      ]
    end

    before do
      ingredients.each { |ingredient| create(:recipe_ingredient, recipe:, ingredient:) }
    end

    it 'returns a comma-separated string of the first three ingredient descriptions' do
      expect(recipe.short_desc).to eq('Tomato, Basil, Garlic')
    end

    context 'when there are fewer than three ingredients' do
      before do
        recipe.recipe_ingredients.destroy_all
        ingredients[0..1].each { |ingredient| create(:recipe_ingredient, recipe:, ingredient:) }
      end

      it 'returns all ingredient descriptions' do
        expect(recipe.short_desc).to eq('Tomato, Basil')
      end
    end

    context 'when there are no ingredients' do
      before do
        recipe.recipe_ingredients.destroy_all
      end

      it 'returns an empty string' do
        expect(recipe.short_desc).to eq('')
      end
    end
  end
end
