# Tax Driver

Welcome to Tax Driver, a website where Uber/Lyft drivers are able to easily keep track of their monthly expenses so that file taxes can be that much easier!

## Installation

Download this repository. From the terminal (in the project directory), run ```bundle install``` to install gem dependencies. Then, run ```rails db:migrate``` to set up the database. You'll also need to run ```rake db:seed``` to fill the database with necessary data.Lastly, run ```thin start --ssl``` to start a web server and navigate to localhost:3000 in your web browser. In order to use the Github OmniAuth login, you will need to set up your own Github key and secret in a .env file in the root directory of the project.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bthornton505/uber-lyft-expense-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
