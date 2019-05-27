# Hashketball

## Objectives

* Distinguish between data types in Ruby
* How to look up documentation for data types in Ruby
* Demonstrate the use of common Array methods
  * `#each`
  * `#map`
  * `#select`
  * `#find`
* Differentiate array methods by their respective return values
* Define the Single Responsibility Principle
* Employ test-driven development best practices in their labs
  * `rspec --fail-fast` handle one error at a time
  * Red, Green, Refactor
  * Make it work \(shameless green\), make it right, make it fast






Wait till Prince says to start on these


# Student Exercises

1. Define a method called get_names that takes an array of instructors and returns just their names

```ruby
instructors = [{name: 'Prince', hometown: 'Wetzlar, Germany', mood: 'excited'}, {name: 'Gigi', hometown: 'New York, New York'}, {name: 'Niky', hometwon: 'Queenstown, New Zealand'}]
def get_names(instructors)

end
```

2. What would the return values be for these iterators

```ruby
arr = (1..100).to_a

# what do the following return?

arr.map do |num|
  num.even?
end

arr.select do |num|
  7
end
```
