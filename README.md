# Recipe Book
Find live application deployed to fly.io at: [RecipeBook](https://recipee.fly.dev/)
## User Stories
As a user:
- I am able to search by ingredients
- I am able to filter by category
- I am able to filter by popularity (determined by highest rated >= 4.5)
- I am able to filter by quick to cook (determined by quick to cook `cook_time` <= 30 minutes)

## Requirements
- Rails 7.1
- Ruby 3+
- PostgreSQL
- ReactJS
- Esbuild

## Database Structure

Here's an example entity-relationship diagram of the data model:

<img width="813" alt="Screenshot 2024-08-08 at 18 37 52" src="https://github.com/user-attachments/assets/949485de-f8c5-4d82-a731-3608fc7034ff">

## Configure to run locally

1. Install gems: `bundle install`
2. Database setup: `rake db:setup`
3. Run the migrations: `rails db:migrate`
4. Run `rails db:seed` to get recipe data from `db/recipe-en.json`
5. Run the server: `bin/dev`
   
You should now be able to open the application in your browser by visiting `http://localhost:3000/`.

## Testing

Tests have been added to spec out the most critical parts of the api. 

`bundle exec rspec`
