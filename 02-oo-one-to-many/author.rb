require 'pry'
# Author
# Name, Education, Age
class Author

  attr_accessor :name, :age, :education
  # attr_reader :name, :age, :education #=> Builds methods so that we can read instance variables with the same name
  # attr_writer :name, :age, :education #=> Builds methods so that we can write to instance variables with the same name

  # initialize is the method we can write to overwrite the default .new method
  # Author.new("Prince", 1, "College")
  def initialize(name, age, education=nil) # Make sure to put default variables at the end
    @name = name
    @age = age
    @education = education
  end

  # This method will create new instances of books for us, will require a title, pages, and genre to be passed in
  def write_book(title, pages, genre)
    # END RESULT: Is to add a new book to the @books for this author
    Book.new(pages, title, genre, self)
  end

  # This method is what we will use to build the relationship "has_many"
  # An Author **HAS MANY** books. We're making sure that we access all books
  # ever created and ** SELECTING ** the ones that belong to the particular author
  # that called it
  def books
    Book.all.select do |book|
      book.author.name == self.name
      # book.author.name == @name
      # A BETTER WAY TO CHECK IF THEY ARE THE SAME AUTHOR
      # vvvvvvvvvvvvvvv
      # book.author == self
    end
  end

  # Attribute Writer Method, we'll use a macro to take care of this
  # **REMEMBER TO NOT HAVE THIS METHOD AND THE MACRO ABOVE**
  # def name=(new_name)
  #   @name = new_name
  # end

  # Attribute Reader Method, we'll use a macro to take care of this
  # **REMEMBER TO NOT HAVE THIS METHOD AND THE MACRO ABOVE**
  # def name # instance
  #   @name
  # end
end
