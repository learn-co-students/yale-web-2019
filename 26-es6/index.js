// Focus block scope

// const shoe = "Boost50"
// let brand = "Yeezy"

// function callShoe() {
//   console.log(shoe)
//   console.log(brand)
// }
// var shoe = "Testing";
// var brand = "New Brand";
// function callShoe() {
//    var shoe = "Boost50"
//    var brand = "Yeezy"
//   console.log(shoe)
//   console.log(brand)
// }

// callShoe()

// console.log(shoe)
// console.log(brand)


// Hoisting
// const shoe = "Boost50"
// let brand = "Yeezy"

// console.log(callShoe(brand, shoe))
// This const doesn't get hoisted to the top
// const callShoe = (brand, shoe) => {
//   return `I just bought the ${brand} ${shoe}`
// }

// This function gets hoisted and can be declared below
function callShoe(brand, shoe){
  return `I just bought the ${brand} ${shoe}`
}

// console.log(someVar)
// var someVar = "Wow";

// var someVar;
// console.log(someVar)
// someVar = "Wow";


// let and const don't get hoisted

// console.log(someLet)
// let someLet = "Who dis?"



const someObject = {
  shoe: "Boost50",
  brand: "Yeezy",
  size: "Medium",
  color: "Red",
  aglet: false
}

// Variable Assignment using Destructuring
// let { shoe, size, color, aglet } = someObject

// // For the first assignment
// someObject.shoe === shoe

// shoe = "something else"

// someObject.shoe !== shoe

// Spread Operator
// Copy an object


// let newShoe = someObject // Save teh same reference to someObject into the newShoe variable
// newShoe.shoe = "Crocs with Socks"

// newShoe.shoe === someObject.shoe // currently true

// // Using Spread
// let newObject = {...someObject}
// newObject.shoe = "Crocs with no socks"

// newObject.shoe === someObject.shoe // FALSE


// Class Syntax
class Dog {
  // Similar to initialize
  constructor(name){
    console.log("Here is a new object")
    this.name = name
  }

  // This knows it is an instance method
  bark(){
    console.log("the dog barks")
  }

  static all(){
    console.log("All dogs are great")
  }
}

Dog.someClassVariable = "wow"

// const newDog = new Dog("Petey")

// Equivalent to the above
// {
//   name: "Petey"
//   bark: function(){ console.log("this dog barks") }
// }