# Object Relational Mappers

The goal is to avoid having to write SQL every single time to do all of the work
we want to be doing to interface with the database

### Directory Structure
Our project is broken up to several folders to separate out our logic.

- `bin/` - is for all files we plan to execute in the Terminal. This is where
we run our script to be able to play around with the app or open up a console.
- `config/` - is where all of the configurations we want to be placing for our
application to live. You'll notice the `environment.rb` file. It is where we
will store a constant that will have the connection to the database, require
all of the files we want form our `lib/` folder for definitions and include
all of our gems at the top level.
- `lib/` - this is where we will want to put all of our class definitions. All
of our models will be here.
- `db/` - this is where we will store all of our databases/migrations, anything
we will use to setup our database so others can replicate it
- `Gemfile` - lists out all of the gems we want to be using
- `Gemfile.lock` - is saying these are the versions of Gem that are currently be
used to make the project build
