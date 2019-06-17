# Sinatra Intro

- HTTP Server Model (Request-Response Lifecycle)
- Model View Controller (MVC) Pattern
- 'Convention over configuration'
- Request Methods
- RESTful Routes


### HTTP Server Model

HTTP (Hypertext Transfer Protocol) is the language of the web and describes how webpages and files are sent over the internet. The protocol is based on a model of client and server: the client is either a program or a browser, and the server is the computer that has information about the web page.

The server that we make this request to is always located using a URL or URI which is composed of a few parts. Consider this URI: `https://go.flatironschool.com/getting_started`. The first part is the protocol `http://` or `https://` at the beginning of the URI, which describes the language that we're using to communicate with this website. The next is the domain which can either be an IP address or a string like `go.flatironschool.com`. When the domain is formatted as a string, we can divide each part of the string into separate parts: com is the top-level domain, flatironschool is the second-level domain, and we can continue with subdomains like go in the example above. Following the domain is a port address which is formatted like `go.flatironschool.com:80`, but these ports are implicit when accessing servers over either HTTP or HTTPS. And lastly is the resource that you want from this domain. In our example, it's the `/getting_started` resource.

### MVC

In a typical application you will find these three fundamental parts:
- Model
  - The model represents the data, and does nothing else. The model does NOT depend on the controller or the view.
- View
  - The view displays the data through the controller, and sends user actions (e.g. button clicks) to the controller. The view is independent of both the model and the controller.
- Controller
  - The controller provides model data to the view, and interprets user actions such as button clicks. The controller depends on the view and the model.

  **Rule 1 is the golden rule of MVC**:
> The model represents the data, and does nothing else. The model does NOT depend on the controller or the view. In other words, **THE MODEL DOES NOT INTERACT WITH THE VIEW, AND THE CONTROLLER DOES ALL THE WORK!**

### 'Convention over configuration'
It is important for us to follow the conventions for Sinatra

- Model names must correspond to tables with the same name but plural
- Controllers need to match their filenames (`application_controller.rb` -> `ApplicationController`)
- We need to be sure to put our files in the appropriate folders (views go into the view folder)

### Request Methods
There are several types of request methods:

- `GET`: We're retrieving information for our application
- `POST`: We're adding data to our database
- `DELETE`: We're deleting data from our database
- `PATCH`/`PUT`: We're updating data within our database

Each of these will correspond to the 4 database actions we can do (CRUD)

### Convention over Configuration
Convention over configuration (also known as coding by convention) is a software design paradigm used by software frameworks that attempts to decrease the number of decisions that a developer using the framework is required to make without necessarily losing flexibility.

# Application Flow
This is absolutely important! You will need to understand how the from the url to the view works. Remember,
you want type into the URL for the web browser, then it hits the application controller then it goes through
each action then performs whatever it is supposed to then pops up into the screen.

### Helpful Packages

* For Atom, you will want to go into Atom > Preferences > Install Packages > Add the
package 'Rails Snippets'
* For VS Code, you'll want to go into Code > Prefences > Extensions > Search for
'Rails Snippets' (might be the second one)
