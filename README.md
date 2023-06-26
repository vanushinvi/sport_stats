# README

# Football Statistics

This project is a football statistics tracking application. It allows you to manage teams, players, matches, and their performance statistics.

## Installation

1. Clone the repository:
   git clone https://github.com/vanushinvi/football-statistics.git

2. Change into the project directory:
   cd football-statistics

3. Install the dependencies:
   bundle install

4. Set up the database:
   rails db:create
   rails db:migrate

5. Run seeds
   rails db:seed

6. Prepare test environment
   rails db:migrate RAILS_ENV=test

## Usage

The application provides the following features:

- Create, edit, and delete teams.
- Create, edit, and delete players associated with teams.
- Create, edit, and delete matches between teams.
- Track performance statistics for players in matches, such as goals, assists, pass accuracy, and distance covered.
- View top players by specific performance metrics in a team or across all teams.

## Testing

To run the test suite, use the following command:
rspec
