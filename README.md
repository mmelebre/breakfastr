# Breakfastr

An app bringing baked breakfast items to your door!

## Walkthrough

1. Setting up routes

	Planning out the routes for a Rails app is an important step. URLs are the interface for interacting with a website so it's important to get them clear in your mind when planning a project.

	Think about the primary resource first. For a bakery the primary resource is baked goods, we've called ours "Pastries".

	Think about the views for this primary resource: Do I want to list all of the pastries on my homepage? Do I want to look in more detail at one pastry? Do I need to be able to edit pastries?

	The `resources` method available in the routes file gives us a concise way to specefy 7 routes that let us manage resources at a predictable pattern of URL actions: `:index`, `:show`, `:new`, `:create`, `:edit`, `:update` and `:destroy`.

	It's important to plan out as many of the core features of the app early, but when it comes to coding, start with one resource and finish it before moving on. The planning gets the routes, associations and views clear in your mind but when you're coding, things can get confusing quickly so get all CRUD actions working for pastries before moving on to users for example.

2. Controller#action

	After setting up some routes, an `UninitialisedConstant` exception is the prompt that tells us to generate a controller to handle the routed request.

	```
	$ rails g controller Pastries index show new edit
	```
	From the controller we can talk to views using instance variables: `@pastries`, `@pastry`.

3. View logic

	Views that deal with collections of a resource (generally an index action), require loops. A common pattern is to pass an Array of ActiveRecord objects to the `index.html.erb` view and loop over them in a block that spits out attributes for each object in the Array:

	```HTML+ERB
	<% @pastries.each do |pastry| %>
		<%= pastry.name %>
		<%= pastry.price_in_pence %>
		<# etc... %>
	<% end %>
	```

4. Models & Migrations

	Generating model provides two important things: an interface to a database table and the database table itself.

	The second of the two is achieved through a migration file. After generating a model add the column names an datatypes for your resource in the generated migration file.

	```ruby
	
	```







































