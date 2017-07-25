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
* What's the main functionality
* You can also do another thing
* If you get really randy, you can even do this

## Configuration

Here you should write what are all of the configurations a user can enter when
using the project.

#### Argument 1
Type: `String`  
Default: `'default value'`

State what an argument does and how you can use it. If needed, you can provide
an example below.

Example:
```bash
awesome-project "Some other value"  # Prints "You're nailing this readme!"
```

#### Argument 2
Type: `Number|Boolean`  
Default: 100

Copy-paste as many of these as you need.

## Contributing

When you publish something open source, one of the greatest motivations is that
anyone can just jump in and start contributing to your project.

These paragraphs are meant to welcome those kind souls to feel that they are
needed. You should state something like:

"If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome."

If there's anything else the developer needs to know (e.g. the code style
guide), you should link it here. If there's a lot of things to take into
consideration, it is common to separate this section to its own file called
`CONTRIBUTING.md` (or similar). If so, you should say that it exists here.

## Licensing

One really important part: Give your project a proper license. Here you should
state what the license is and how to find the text version of the license.
Something like:

"The code in this project is licensed under MIT license."
