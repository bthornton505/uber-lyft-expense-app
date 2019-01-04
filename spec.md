# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - A User has_many Expense Reports
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - An Expense Report belongs_to a User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - An Expense has_many Categories through Comments, A Category has_many Expenses through Comments
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - This is taken care of with Expenses and Categories having each other through Comments
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - This is taken care of in Comment with a description for the comment.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - I have presence validations in place for User, Expense Report, Expense, Category, and Comment
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - This requirement is met with a class method in Expense Report called by_year(year) which allows a user to filter all their expenses and see the given reports for the year selected
- [x] Include signup (how e.g. Devise) - users/new includes a new_user route that creates a user through the create action in the UsersController
- [x] Include login (how e.g. Devise) - The get /login route maps to the new action on the Sessions controller and posts to the create route in the Sessions controller. The user is Authenticated (bcrypt/has_secure_password) and then a session[:user_id] is assigned.
- [x] Include logout (how e.g. Devise) - a link to get /logout is in the navbar on all pages once logged in. This maps to the sessions#destroy action.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - OmniAuth Github login enabled
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - A User can view all of their Expense Reports at the index route /users/:user_id/expense_reports
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - A new Expense Report can only be created at the nested new route /users/:user_id/expense_reports/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - When filling out a form for login/signup User, creating Expense Reports, and creating Expenses, a User will be shown the errors if they do not fill them out properly

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate - I found some helper methods such as :current_user and :logged_in very useful
- [x] Views use partials if appropriate - I used partials with my new/edit views by creating a form used for both. Also made partials for other methods such as search_by_year 
