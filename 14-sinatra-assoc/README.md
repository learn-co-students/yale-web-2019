# Sinatra Forms

Today we learned about the other 5 RESTful routes.

| Request Method | PATH | Description |
| ------- | ------ | ------ |
| GET  | `/foods/new` | Form to display new food |
| POST  | `/foods` | After submitting a new food, create it in the database |
| GET  | `/foods/:id/edit` | Form to display a food to edit |
| PATCH  | `/foods/:id` | After submitting, edit it in the database |
| DELETE  | `/foods/:id` | Deletes an item from the database |

## TOC

- [Basics of forms](#basics-of-forms)
- [HTML](#html)
- [Inside the Controller](#inside-the-controller)
- [`method_override`](#method_override)
- [Using Multiple Controllers](#using-multiple-controllers)

## Basics of Forms

### HTML 
When dealing with forms, they must have two attributes, the method and the action.

- `method` describes which Request Method we're making (`GET` or `POST`)
  - Which can only by default be `GET` or `POST`
- `action` describes what URL are we going to for the request
  - It is not ever going to be the URL we're currently on

Here's an example:

```html
<form method="POST" action="/foods">
  <input name="name" type="text" />
  <input name="price" type="number" />
  <input type="submit" />
</form>
```

This is a form that will perform a `POST` request to `/foods`. For the data 
of the form to get sent to our controller, we want to make sure each input
that has user data has a `name` attribute on it.

### Inside the Controller

In RESTful convention, we need one route that will show us the new form and
then one which will handle the request the form makes.

```ruby
# inside the controller

  get "/foods/new" do 
    # renders the form
    erb :index
  end

  post "/foods" do
    # handles creating that item
    food = Food.create(name: params[:name], price: params[:price])
    redirect to("/foods/#{food.id}")
  end
```

With `POST`, `PATCH` and `DELETE`, they need to fulfill a new request
to render out the contents to the screen so we'll use a `redirect`.

## `method_override`

In order for your form to do anything beyond `POST` and `GET` inside of the
form, you will need to make sure your controller is configured to perform
the `method_override` hack. In your configure you'll need `set :method_override, true`:

```ruby
class ApplicationController < Sinatra::Base
  configure do
    # ...
    set :method_override, true
  end
end
```

That way in your forms where you want to do `PATCH`, `DELETE`, `PUT`, you just
need a hidden input with a name of `_method` and has a value of the request method
you want to make.

```html
<form method="POST" action="/foods">
  <input type="hidden" name="_method" value="PATCH">
</form>
```

So this will not make a `POST` request but instead a `PATCH` request!

### Using Multiple Controllers

This is a bit of a precursor to what we will be doing for the rest of the time
with Sinatra! We want to follow that good pattern that we learned about called
"separation of concerns", we don't want all of our logic to live inside of the
one controller. Our apps will have a bunch of models and so we want to be sure
to separate out the logic for the each associated model. So we'll want to build
out a new controller called `FoodsController` or if we had a dog model we'd say
`DogsController`.

The biggest thing you need to do after you create the file is go into the `config.ru`
and make sure to write

```ruby
use FoodsController # THE USE MUST GO ABOVE THE RUN
run ApplicationController
```