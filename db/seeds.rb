# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# {
#   "title": 'Golden Sweet Cornbread',
#   "cook_time": 25,
#   "prep_time": 10,
#   "ingredients": [
#     '1 cup all-purpose flour',
#     '1 cup yellow cornmeal',
#     '⅔ cup white sugar',
#     '1 teaspoon salt',
#     '3 ½ teaspoons baking powder',
#     '1 egg',
#     '1 cup milk',
#     '⅓ cup vegetable oil'
#   ],
#   "ratings": 4.74,
#   "cuisine": '',
#   "category": 'Cornbread',
#   "author": 'bluegirl',
#   "image": 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2021%2F10%2F26%2Fcornbread-1.jpg'
# }
#
# require 'json'
#
# json_file = File.read(Rails.root.join('db', 'recipes-en.json'))
# recipe_data = JSON.parse(json_file)
#
# recipe_data.each do |r|
#   user = User.where(username: r['author'].downcase).first_or_create!
#
#   category = Category.where(name: r['category'].downcase).first_or_create!
#   ingredients = r['ingredients'].map do |ingredient|
#     Ingredient.where(description: ingredient.downcase).first_or_create!
#   end
#
#   Recipe.create!(
#     title: r['title'],
#     image: r['image'],
#     category:,
#     user:,
#     ingredients:,
#     cuisine: r['cuisine'],
#     cook_time: r['cook_time'],
#     prep_time: 10
#   )
# end
require 'json'

BATCH_SIZE = 1000 # Adjust batch size based on your needs

def seed_recipes_from_json(file_path)
  # Read the file in chunks to manage memory usage
  File.open(file_path, 'r') do |file|
    buffer = ''
    while chunk = file.read(1024 * 1024) # Read 1 MB at a time
      buffer << chunk
      while buffer.include?("\n")
        json_object, buffer = buffer.split("\n", 2)
        next if json_object.strip.empty?

        begin
          recipe_data = JSON.parse(json_object)
          process_recipe_data(recipe_data)
        rescue JSON::ParserError => e
          Rails.logger.error("Failed to parse JSON: #{e.message}")
        end
      end
    end
    # Process remaining data in buffer
    process_recipe_data(JSON.parse(buffer)) unless buffer.strip.empty?
  end
end

def process_recipe_data(recipe_data)
  # Process data in batches
  recipe_data.each_slice(BATCH_SIZE) do |batch|
    users = {}
    categories = {}
    ingredients = {}

    # Collect all the unique values for Users, Categories, and Ingredients
    batch.each do |r|
      users[r['author'].downcase] = true
      categories[r['category'].downcase] = true
      r['ingredients'].each { |ingredient| ingredients[ingredient.downcase] = true }
    end

    # Create Users, Categories, and Ingredients
    users_ids = User.where(username: users.keys).pluck(:username, :id).to_h
    categories_ids = Category.where(name: categories.keys).pluck(:name, :id).to_h
    ingredients_ids = Ingredient.where(description: ingredients.keys).pluck(:description, :id).to_h

    users_to_create = users.keys - users_ids.keys
    categories_to_create = categories.keys - categories_ids.keys
    ingredients_to_create = ingredients.keys - ingredients_ids.keys

    User.create!(users_to_create.map { |username| { username: } }) unless users_to_create.empty?
    Category.create!(categories_to_create.map { |name| { name: } }) unless categories_to_create.empty?
    unless ingredients_to_create.empty?
      Ingredient.create!(ingredients_to_create.map do |description|
                           { description: }
                         end)
    end

    # Refresh in-memory IDs after creation
    users_ids = User.where(username: users.keys).pluck(:username, :id).to_h
    categories_ids = Category.where(name: categories.keys).pluck(:name, :id).to_h
    ingredients_ids = Ingredient.where(description: ingredients.keys).pluck(:description, :id).to_h

    # Create recipes with associated records
    Recipe.transaction do
      batch.each do |r|
        recipe_ingredients = r['ingredients'].map { |ingredient| ingredients_ids[ingredient.downcase] }
        Recipe.create!(
          title: r['title'],
          image: r['image'],
          category: Category.find(categories_ids[r['category'].downcase]),
          user: User.find(users_ids[r['author'].downcase]),
          cuisine: r['cuisine'],
          cook_time: r['cook_time'],
          prep_time: r['prep_time'],
          ingredients: Ingredient.where(id: recipe_ingredients)
        )
      end
    end
  end
end

# Start seeding
seed_recipes_from_json(Rails.root.join('db', 'recipes-en.json'))
