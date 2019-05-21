# Tax Driver

Welcome to Tax Driver, a website where Uber/Lyft drivers are able to easily keep track of their monthly expenses so that file taxes can be that much easier!

As of now the available features are:

- **Login and Registration**
- **Logged in users can create Expense Reports for each month and create individual expenses for the reports**
- **Users can edit and delete expense reports and expenses**
- **Users can filter expense reports based on a given year**
- **Users can sort expenses based on cost**

Features soon to be added:

- **Year end summary report of a given years expenses, will include a graph to visualize where money was spent**
- **A user will be able to print and/or email this report**
- **Possibly add a feature to help user track car mileage which will be included in year end report**

## Installation

Assuming you have Ruby, Rails and JQuery installed,

- Fork and clone this repo
- cd into the uber-lyft-expense-ap directory
  - Run `$ bundle install`
  - Run `$ rake db:migrate`
  - Run `$ rake db:seed`
  - Run `$ rails server`
- Now you should have the app open up in your browser

<!-- In order to use the Github OmniAuth login, you will need to set up your own Github key and secret in a .env file in the root directory of the project. -->

## Frameworks and Libraries Used

- Front-end: JavaScript libraries ([JQuery](https://jquery.com/))
- Back-end: [Ruby on Rails](https://github.com/rails/rails)
- [Bootstrap](https://getbootstrap.com/)

## Author

- [Brenden Thornton](https://github.com/bthornton505)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bthornton505/uber-lyft-expense-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
