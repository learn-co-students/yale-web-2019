
// JavaScript for daysss

// Waiting for the page to load before interacting
// Alternative way to wait for the page to load before running javascipt
document.addEventListener('DOMContentLoaded', function(){
  fetch("http://localhost:3000/compliments")
  .then(response => response.json())
  .then(compliments => {

      // Find the ul tag
    const ulTag = document.querySelector('ul');
    console.log(ulTag);

    // the value of compliments is still undefined here
    // for(let index = 0; index < compliments.length; index += 1){
    //   console.log(compliments[index].message)
    //   ulTag.innerHTML += `<li>
    //   <img width="200" src='https://placekitten.com/500/250' />
    //   <h3>"${compliments[index].message}"</h3>
    //   <div>
    //     <cite>Hugged 0 times</cite>
    //     <button>🤗 it</button>
    //   </div>
    // </li>`
    // }
    compliments.reverse().forEach((compliment) => {
      ulTag.innerHTML += `<li>
      <img width="200" src='https://placekitten.com/500/250' />
      <h3>"${compliment.message}"</h3>
      <div>
        <cite>Hugged ${compliment.hug_count} times</cite>
        <button class="hug-btn" data-id=${compliment.id}>🤗 it</button>
        <button class="delete-btn" data-id=${compliment.id}>🗑 it</button>
      </div>
    </li>`
    })

  })


  // Logic for updating the like count
  document.addEventListener('click', function(beef){
    if(beef.target.tagName === "BUTTON" && beef.target.className === "hug-btn"){
      
      let hugElement = beef.target.parentElement.children[0]
      // let hugElement = beef.target.previousElementSibling
      // debugger

      let hugCount = parseInt(hugElement.innerText.split(" ")[1], 10)
      hugCount += 1
      
      
      hugElement.innerText = `Hugged ${hugCount} times`

      fetch(`http://localhost:3000/compliments/${event.target.dataset.id}`, {
        method: "PATCH",
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          hug_count: hugCount
        })
      })
      
    }
    else if(beef.target.tagName === "BUTTON" && beef.target.className === "delete-btn"){
      console.log("trashing it")

      fetch(`http://localhost:3000/compliments/${beef.target.dataset.id}`, {
        method: "DELETE"
      })
      .then(data => {
        beef.target.parentElement.parentElement.remove()
      })
    }
  })


  // Logic to add a compliment
  document.querySelector('form').addEventListener('submit', function(e){
    // Stop the page from refreshing
    e.preventDefault()
    
    
    // Find the input tags and their values
    const compliment = e.target.children[0].value // DO NOT USE INNERTEXT FOR INPUTS
    const imgUrl = e.target.children[1].value // USE VALUE


    
    // Optimistic Rendering - Changing the DOM before waiting for the server to send a response 
    
  //   // Adding Fetch Code here to send a request to the backend
  //   fetch("http://localhost:3000/compliments",{
  //     method: "POST",
  //     headers: {
  //       // Tells the server what data format I am sending
  //       'Content-Type': 'application/json',

  //       // Tells the server that the client can only accept JSON
  //       'Accept': 'application/json'
  //     },
  //     body: JSON.stringify({
  //       "message": compliment
  //     })
  //   })



  //   // Tell the page to update with the values from our forms
  //   const ulTag = document.querySelector('ul')
  //   // Needs to be added to the UL tag
  //   ulTag.innerHTML = `<li>
  //   <img width="200" src='${imgUrl}' />
  //   <h3>"${compliment}"</h3>
  //   <div>
  //     <cite>Hugged 0 times</cite>
  //     <button>🤗 it</button>
  //   </div>
  // </li>` + ulTag.innerHTML

  // Pessimistic Rendering 

      // Adding Fetch Code here to send a request to the backend
      fetch("http://localhost:3000/compliments",{
        method: "POST",
        headers: {
          // Tells the server what data format I am sending
          'Content-Type': 'application/json',
  
          // Tells the server that the client can only accept JSON
          'Accept': 'application/json'
        },
        body: JSON.stringify({
          "message": compliment
        })
      }).then(res => res.json())
      .then(data => {
        // Tell the page to update with the values from our forms
        const ulTag = document.querySelector('ul')
        // Needs to be added to the UL tag
        ulTag.innerHTML = `<li>
        <img width="200" src='${imgUrl}' />
        <h3>"${compliment}"</h3>
        <div>
          <cite>Hugged ${data.hug_count} times</cite>
          <button data-id=${data.id}>🤗 it</button>
        </div>
      </li>` + ulTag.innerHTML
      })
  })
  
});

