require 'pry'
require_relative './author'
require_relative './book'


prince = Author.new("Prince", 1, "College")
prince.write_book("The Little Corgi That Could", 10, "Children")
prince.write_book("A Tail of Two Corgis", 100, "Horror")
binding.pry
0
