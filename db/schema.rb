# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_806_124_525) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.index ['slug'], name: 'index_categories_on_slug', unique: true
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope',
                                           unique: true
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index %w[sluggable_type sluggable_id], name: 'index_friendly_id_slugs_on_sluggable_type_and_sluggable_id'
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.index ['slug'], name: 'index_ingredients_on_slug', unique: true
  end

  create_table 'recipe_ingredients', force: :cascade do |t|
    t.bigint 'recipe_id', null: false
    t.bigint 'ingredient_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ingredient_id'], name: 'index_recipe_ingredients_on_ingredient_id'
    t.index ['recipe_id'], name: 'index_recipe_ingredients_on_recipe_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'title'
    t.integer 'cook_time'
    t.integer 'prep_time'
    t.decimal 'ratings'
    t.string 'cuisine'
    t.bigint 'user_id', null: false
    t.string 'image'
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.index ['category_id'], name: 'index_recipes_on_category_id'
    t.index ['slug'], name: 'index_recipes_on_slug', unique: true
    t.index ['user_id'], name: 'index_recipes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'recipe_ingredients', 'ingredients'
  add_foreign_key 'recipe_ingredients', 'recipes'
  add_foreign_key 'recipes', 'categories'
  add_foreign_key 'recipes', 'users'
end
