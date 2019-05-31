# Many-To-Many Relationships Review

Let's say we're building an app to sell tickets for events. Our app will need these three models: `Event`, `Ticket`, and `Attendee`.

We can visualize the relationship of our models like this:

Event >- Ticket -< Attendee

When describing this relationship, we'd say an `Event` has many `Attendee`s through `Ticket`s and also that an `Attendee` has many `Event`s through `Ticket`s. A `Ticket` belongs to an `Event` and an `Attendee.`

Without a `Ticket`, an `Event` would have no `Attendee`s, and vice-versa. The `Ticket` model, then, is our single source of truth in this relationship. Think about it from experience: when a ticket is created for you, it has the name of the `Attendee`, *you*, on it, as well as information about the `Event`. If we want to know who is going to be at the event, we would check each `Ticket` for its `Attendee` and make a list of all of them, and if you're an `Attendee` who wants information about the `Event`, you'd check the information on the `Ticket`. The `Ticket` is proof of both the connection between the `Event` and the `Attendee`.

## Topics

- Classes vs Instances
- Variable Scope ( Class, Instance, Local )
- Object Relationships
- Arrays and Array Methods
- Class Methods

## Notes

Your goal is to build out all of the methods listed in the deliverables below. Do your best to follow Ruby best practices. For example, use higher-level array methods such as `map`, `select`, and `find` when appropriate in place of `each`.

We've provided you with a console that you can use to test your code! That's right: no tests. It's up to you to see if your code works. To enter a console session, run `ruby tools/console.rb` in your terminal. *You must run this from this assignment's root directory.* A pry session will open up, and you'll be able to test out the methods that you wrote. Take a look at that file to see how you can pre-define variables and create object instances, rather than manually doing it in every single console session. When you run `ruby tools/console.rb', a pry session will start, and all the pre-defined variables that you wrote in there will have been created and you can use them in the session without having to define them again!

## Deliverables

The files for each model have already been created for you in the `app/models` folder.  Go into each file and write out everything necessary to get the methods below to work. Methods separated with `.` are class methods, while methods separated with `#` are instance methods. For example: `Event.all` denotes a class method, and `Event#sell_to_break_even` denotes an instance method.

*NOTE: In order to build out the methods below, it may be in your interest to write some extra helper methods! These are not required methods per the deliverables, but they will make your code a lot nicer to look at. Remember that we generally want each method to complete only one task! If it does more than one task, we should break that into a smaller method when possible.*

### `Event`

Each `Event` should have a name, a total_cost, and a ticket_price. The total_cost is the amount of money that has been spent on over-head costs and needs to be made back in ticket sales for the event to reach the break-even point and begin making profit. The ticket price is the amount each ticket is sold for. It's up to you to make up these attributes for each `Event` instance

<!-- + `Event.all`
  + Returns an array of all `Event`s -->
+ `Event#sell_to_break_even`
  + Returns the number of `Ticket`s that still need to be "purchased" for this `Event` before the `Event` reaches the break-even point. If the `Event` has sold enough `Ticket`s to break-even, return the number 0.
<!-- + `Event#attendees`
  + Returns an array of `Attendee`s that have `Ticket`s for the `Event` -->
<!-- + `Event#average_age`
  + Returns the average age of all the `Attendee`s that will be at the `Event` -->

### `Ticket`

A `Ticket` instance represents an `Attendee`'s purchase of a `Ticket` for an `Event`. All a ticket needs to be initiated is an `Attendee` and an `Event`

<!-- + `Ticket.all`
  + Returns an array of all Tickets -->

### `Attendee`

Each `Attendee` should have a name and an age

<!-- + `Attendee.all`
  + Returns an array of all `Attendees`
+ `Attendee#events`
  + Returns an array of all `Event`s that the `Attendee` is attending.
+ `Attendee#money_spent`
  + Returns the dollar amount this `Attendee` has spent on `Tickets` for `Events` -->

## Bonus Model

### `Venue`

Let's create another file in `app/models` for a new model that we'll call `Venue`. Make it so each `Venue` has a name, a location, and a rental_fee. When you create `Venue` instances, it'll be up to you to determine these attributes upon initiation. Then, build out the methods below. Go back into the file for the `Event` model and add an attribute that links each `Event` instance to a `Venue` instance. Draw out on a piece of paper how this new model looks in relation to the pre-existing model. Test your code in `tools/console.rb` to see if it works.

+ `Venue.all`
  + Returns an array of all `Venue`s
+ `Venue#events`
  + Returns an array of `Event`s that are take place at this `Venue`
+ `Venue#revenue`
  + Returns the total amount of money the venue has made from hosting `Event`s
+ `Venue#attendees`
  + Returns an array of every `Attendee` that has purchased a `Ticket` for an `Event` held at this `Venue`

## Bonus Method

+ `Venue.guest_lists`
  + Returns an array of hashes for each `Event` being held at this particular `Venue`. Each hash will have the keys "name", and "guest_list", where "name" returns a string of the name of the `Event`, and "guest_list" returns an array of `Attendee`s attending that event.

### Other Bonus Methods

+ `Attendee#venues`
  + Returns an array of each `Venue` instance for every `Event` the particular `Attendee` has a `Ticket` for.
