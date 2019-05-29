require 'pry'
# Author
# Name, Education, Age
class Author

  attr_accessor :name, :age, :education
  # attr_reader :name, :age, :education
  # attr_writer :name, :age, :education

  # Author.new
  def initialize(name, age, education=nil)
    @name = name
    @age = age
    @education = education
  end

  def write_book(title, pages, genre)
    # END RESULT: Is to add a new book to the @books for this author
    Book.new(pages, title, genre, self)
  end

  def books
    Book.all.select do |book|
      book.author.name == self.name
      # book.author.name == @name
    end
  end

  # def name=(new_name)
  #   @name = new_name
  # end


  # def name # instance
  #   @name
  # end
end
