
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
    compliments.forEach((compliment) => {
      ulTag.innerHTML += `<li>
      <img width="200" src='https://placekitten.com/500/250' />
      <h3>"${compliment.message}"</h3>
      <div>
        <cite>Hugged 0 times</cite>
        <button>🤗 it</button>
      </div>
    </li>`
    })

  })


  // Logic for updating the like count
  document.addEventListener('click', function(beef){
    if(beef.target.tagName === "BUTTON"){
      
      let hugElement = beef.target.parentElement.children[0]
      // let hugElement = beef.target.previousElementSibling
      // debugger

      let hugCount = parseInt(hugElement.innerText.split(" ")[1], 10)
      hugCount += 1
      
      hugElement.innerText = `Hugged ${hugCount} times`
      
    }
  })


  // Logic to add a compliment
  document.querySelector('form').addEventListener('submit', function(e){
    // Stop the page from refreshing
    e.preventDefault()
    
    
    // Find the input tags and their values
    const compliment = e.target.children[0].value // DO NOT USE INNERTEXT FOR INPUTS
    const imgUrl = e.target.children[1].value // USE VALUE

    // Tell the page to update with the values from our forms
    const ulTag = document.querySelector('ul')
    // Needs to be added to the UL tag
    ulTag.innerHTML = `<li>
    <img width="200" src='${imgUrl}' />
    <h3>"${compliment}"</h3>
    <div>
      <cite>Hugged 0 times</cite>
      <button>🤗 it</button>
    </div>
  </li>` + ulTag.innerHTML
  })
  
});

