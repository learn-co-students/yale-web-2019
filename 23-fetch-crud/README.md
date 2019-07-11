# Intro to fetch

## Learning Goals

* Review what we know so far:
  * DOM manipulation (finding, creating, and changing elements)
  * Working with events ( ex. 'click', 'submit') + callbacks
* DRY up creating our HTML template
  * Understand the difference between implicit and explicit return
  * Replace `function() {}` with `() => {}`
* Understand how we persist data on our web app.
* Review the REST convention
* Explain the purpose of `fetch`
* Explain the purpose of a `Promise`
* Explain why you need to use `.then()`
* Explain the concept of sync vs async
* Use `fetch` to make a get request and add this new information to our webpage

## Our App So Far

As a user I now have...
* nicer styling on my app
* my list of nice compliments added
* the ability to add a "hug" to a compliment and see my hug count go up accordingly
* the ability to add my own compliments

# Deliverables

As a user I want...
* to save all of my data about my compliments
* to use my saved data to create all of my compliments from


## API Setup

To use this backend run these commands:

* `cd complimentor-api`
* `bundle`
* `rails db:create`
* `rails db:migrate`
* `rails db:seed`
* `rails s`

Once you have the rails server running checkout `localhost:3000/compliments` (you can also look at `localhost:3000/rails/info/routes` on any rails app to see your available routes)

## Fetch Docs

The syntax of `fetch`:

```js
fetch("http://api_url") // this is the simplest form of fetch

// fetch has a mandatory parameter of the url, and an optional parameter
// for configuration options. 
// - We would use this for setting the method ("PATCH", "DELETE", "POST", etc.)
// - We would be able to set the body of the request (like setting the `param` of our request)
// - We would be able to send any headers or metadata things 
//    - `Content-Type` which is for telling the server the client is sending a certain format
//    - `Accept` which is for telling the the server the client can only ACCEPT a certain format

// I am sending a GET request to this URL with a header that is telling the server
// the client (web browser in this case) is only accepting the json format
fetch("https://icanhazdadjoke.com", {
  method: "GET",
  headers: {
    "Accept": "application/json"
  }
})

// I'm sending a POST request to this url with a header that is telling the server
// the client is sending a body of a request of JSON. WE SHOULD ALWAYS DEFINE WHAT WE'RE SENDING IN THE REQUEST
// The body, if we're using JSON, we need to stringify the object because the web can only send text
fetch("http://loaclhost:3000/compliments", {
  method: "POST",
  headers: {
    "Content-Type": 'application/json'
  },
  body: JSON.stringify({
    message: "You're amazing"
  })
})
```

Remember that in order to access the result from the server, we must use `.then()`:

```js
fetch("https://icanhazdadjoke.com", {
  method: "GET",
  headers: {
    "Accept": "application/json"
  }
})
.then(res => res.json())
.then(data => {
  console.log(data) // At this point we can access the data from the server
})
```
