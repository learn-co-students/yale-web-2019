# ActiveRecord

This is the ORM (Object Relational Mapper) we'll be using throughout the rest
of our program! This is the database layer we use in Ruby on Rails so it is
important to get this in your tool belt!


# Building our Database
In order to build our database we'll need to use a tool called Rake, built into
ActiveRecord. There are a bunch of "tasks" that Rake allows us to run and each
help us to update our database. To see all of the available tasks you'll run:
`rake -T`

In order to make a change, or "migration", to our database we first need to
create a migration: `rake db:create_migration <name of migration>`

Then we must run the migration
