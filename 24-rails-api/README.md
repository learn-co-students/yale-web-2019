# Building a backend API with Rails

### Starting off Rails project

When we build out a Rails API, we want to be sure to run the configuration of:

```bash
rails new <project name> --api --database=postgresql
rails new comics_api --api --database=postgresql
```

### Differences between a standard Rails app and an API mode

Remember the differences of API mode:

  - 1. We don't use our views
  - 2. We render out json `render json: ...`
  - 3. We can use serializers to avoid `.to_json` everything


### Making Requests work on the frontend

When making requests to our frontend **we must enable CORS**
going to our `config/initializers/cors.rb` and uncommenting and also
**change origins to '*'**:

```rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

You **must also go to your `Gemfile` and have `gem 'rack-cors'`** there and
`bundle install`.

---

When accepting data from the frontend, we want to make sure we are using
**strong parameters as well**. So when we did `POST /toys`:

```rb
# Inside app/controllers/characters_controller.rb
class CharactersController < ApplicationController
  # Other methods...

  def create

    # From our frontend, we make the request in this format
    # POST /characters
    # Body: { name: "", super_name: "", power: ""}


    # The backend receives everything nested so we want to be sure to use
    # strong params
    @toy = Toy.create(toy_params)
    render json: @toy
  end
  # Other methods ...

  private
  def toy_params
    params.permit(:name, :image, :likes)
  end
end