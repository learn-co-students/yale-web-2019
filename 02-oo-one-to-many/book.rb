# Book
# pages, title, genre

class Book

  attr_reader :pages, :title, :genre, :author

  @@all = []

  def initialize(pages, title, genre, author)
    @pages = pages
    @title = title
    @genre = genre
    @author = author

    @@all << self
  end


  def self.all
    @@all
  end






end
