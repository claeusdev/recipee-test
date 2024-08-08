# Recipe Book

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

## Testing

Tests have been added to spec out the most critical parts of the api. 

`bundle exec rspec`
