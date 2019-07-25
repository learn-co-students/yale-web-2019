document.addEventListener('DOMContentLoaded', () => {
  const adapter = new Adapter('http://localhost:3000/pups')

  adapter.getAllDogs().then(dogs => {
    dogs.forEach(dog => {
      const doggo = new Doggo(dog, adapter)
      // doggo.renderSpan()
    })
  })

})
