

<h1>Hoang Hai Ho -T2A2 

<h2>Shoes market- Ruby on Rails two-sided marketplace application

<h3>1.Explain the different high-level components (abstractions) in your App.

<h4>Shoes market is a two-sided marketplace application that was built using Ruby on Rails framework and architected using MVC (Model, View, Controller) where the View with minimal logic display user interface in the front-end. In the back-end,Controller accepts user input and converts it to commands for the Model or View. Model manages the data, logic and rules of the application, which Postgresql is the data base of choice.
<h4> User authorization, authentication and data sanitizing methods are applied for better user experience and to protect to app from malicious activities.
<h3>2. List and describe any 3rd party services.

<h4>Devise: this Ruby gem is added to provide user authentication, the process of determining whether someone who declares themselves to be, it allows my application to verify and give access to the resources to the user. When a user visit the site , if they are not logged in , they can only see parts of the site. Only when they signed up they can view a listing, create, edit or destroy the listing they create.

<h4>Stripe: The Stripe API provides a safe, easy and user friendly payment service within the app but all the monetary transactions are handled by Stripe outside the app, which makes customer feel safer.

<h4>Amazon S3: Cloud service that stores the images that user upload to the site.

<h4>Randsack: Ruby gem that used for the search function, based on the `_cont` we give it.

<h4>Bootstrap Framework: is used for styling the web application.