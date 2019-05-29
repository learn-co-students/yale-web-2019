# Book
# pages, title, genre

class Book

  attr_reader :pages, :title, :genre, :author

  # No matter how a book gets created, whether through #write_book in the Author
  # or if they call Book.new, we will be able to keep track of the book in the **class** variable
  @@all = []

  def initialize(pages, title, genre, author)
    @pages = pages
    @title = title
    @genre = genre
    @author = author

    # Each time we create a new book, it is going to be added to this class variable
    @@all << self
  end


  # In order to have access to this class variable inside of other files, we will want
  # to have a class method
  # Remember a class method is called with the name of the class and then the method name
  def self.all
    @@all
  end






end
