![Logo of the project](http://www.bootscootbikes.com/wp-content/uploads/2013/10/Boot-Scoot-logo-long.png)

# Name of the project
Online commerce platform for online ordering.

## Installing / Getting started

To Install, you will need to verify that you have Ruby version >= 2.4 and Rails version >= 5
After forking or cloning this repository you will need to do the following.

```shell
bundle install
rake db:create db:migrate db:seed
```

If ran correctly you should see the installation of all gems and a creation of the tables with column migrations

## Developing

Here's a brief intro about what a developer must do in order to start developing
the project further:

```shell
git clone https://github.com/swdonovan/little_shop
cd little_shop/
bundle install
rake db:create db:migrate db:seed
```

If ran correctly you should see the installation of all gems and a creation of the tables with column migrations

<!-- ### Building

If your project needs some additional steps for the developer to build the
project after some code changes, state them here:

```shell
./configure
make
make install
```

Here again you should state what actually happens when the code above gets
executed. -->

### Deploying / Publishing

7-24-17 Currently Deployed to heroku app through Heroku.com

```shell
heroku create  --if there is not a heroku repository created
git push heroku master
heroku run rake db:migrate
```

## Features

What's all the bells and whistles this project can perform?
* Users can create accounts, add items to their cart, and checkout
* Ability to browse items by category
* Admin privileges for application control
* Dynamic functionality with cart items
  - Ability to increase or decrease item quantity from cart View
  - Ability to remove items from cart with link in flash message to add item back to cart
  - Each item in cart has a link to it's individual page
