const BASE_URL = "http://localhost:3000"
const TRAINERS_URL = `${BASE_URL}/trainers`
const POKEMONS_URL = `${BASE_URL}/pokemons`

// Wait for the page to load
document.addEventListener("DOMContentLoaded", function(e){
  // Make our fetch request
  fetch(TRAINERS_URL)
  .then(res => res.json())
  .then(trainers => {
    console.log(trainers)
    // Tell our page how it should look like given the request
    const main = document.querySelector('main')
    trainers.forEach((trainer) => {

  //     main.innerHTML += `
  //     <div class="card" data-id="${trainer.id}"><p>${trainer.name}</p>
  //   <button data-trainer-id="${trainer.id}">Add Pokemon</button>
  //   <ul>
  //   ${trainer.pokemons.map(pokemon => {
  //     return `<li>${pokemon.nickname} (${pokemon.species})
  //     <button class="release" data-pokemon-id="${pokemon.id}">Release</button></li>`
  //   }).join("")}
  //   </ul>
  // </div>`
      main.innerHTML += createTrainerCard(trainer)

      // Could also do with the createElement method
    })

    document.addEventListener('click', function(event){
      // I am delegating the work for the specific tag

      // Checking for classes event.target.className === "add"
      // Checking for classes event.target.classList.include("add")
      // debugger
      if(event.target.className === "add"){
        // debugger
        const trainerId = parseInt(event.target.dataset.trainerId, 10)
        fetch("http://localhost:3000/pokemons", {
          method: "POST",
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            trainer_id: trainerId
          })
        })
        .then(res => res.json())
        .then(pokemon => {
          if(pokemon.error){
            alert("You got too many pokemon")
          } else {
          console.log(pokemon)
          // Add the new pokemon to the trainer card
          const ulTag = event.target.parentElement.children[2] // Getting the ulTag for that trainer card
          ulTag.innerHTML += `<li>${pokemon.nickname} (${pokemon.species})
          <button class="release" data-pokemon-id="${pokemon.id}">Release</button></li>`
          }
        })
      } else if(event.target.className === "release"){
        // Optimistic Rendering
        // Updating the page before the request has been sent
        // let pokemonId = event.target.dataset.pokemonId

        // delete the dom element
        // event.target.parentElement.remove()

        // fetch(`http://localhost:3000/pokemons/${pokemonId}`, {
        //   method: "DELETE"
        // })


        // Pessimistic Rendering
        // Update the page AFTER the request has been sent
        let pokemonId = event.target.dataset.pokemonId
        fetch(`http://localhost:3000/pokemons/${pokemonId}`, {
          method: "DELETE"
        }).then(data => {
          // delete the dom element
          event.target.parentElement.remove()
        })
      }
    })
    
  })

  function createTrainerCard(trainer) {
    return `
      <div class="card" data-id="${trainer.id}"><p>${trainer.name}</p>
        <button class="add" data-trainer-id="${trainer.id}">Add Pokemon</button>
        <ul>
        ${trainer.pokemons.map(pokemon => {
          return `<li>${pokemon.nickname} (${pokemon.species})
          <button class="release" data-pokemon-id="${pokemon.id}">Release</button></li>`
        }).join("")}
        </ul>
    </div>`
  }
})

