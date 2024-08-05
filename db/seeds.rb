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
