
// ```js
// const imgUrl = "https://dog.ceo/api/breeds/image/random/4"
// ```

// Add JavaScript so that:

// - on page load
// - fetch the images using the url above ⬆️
// - parse the response as `JSON`
// - add image elements to the DOM **for each**🤔 image in the array

function getDogBreeds() {
  const dogBreedUrl = "https://dog.ceo/api/breeds/list/all"
  return fetch(dogBreedUrl).then(res => res.json())
}

function createDogLi(breed){
  const dogLi = document.createElement('li')
  dogLi.innerText = breed
  return dogLi
}

// Add doglis to the ul
// Given an array of breeds
function addDogBreeds(breeds){
  const dogBreedsUl = document.querySelector("#dog-breeds")
  for(let breed of breeds){
    // console.log(data.message[beed])
    // const dogLi = document.createElement('li')
    // dogLi.innerText = breed
    dogBreedsUl.appendChild(createDogLi(breed))
  }
}


// Challenge 1
// 1. Wait for the page to load
document.addEventListener('DOMContentLoaded', function(){
  const imgUrl = "https://dog.ceo/api/breeds/image/random/4"
  // 2. fetch to the url
  fetch(imgUrl)
  .then(res => res.json())
  .then(data => {
    // 3. once i've fetched I need to go through data and load images

    // forEach
    // data.message.forEach(function(element){
    //   console.log(element)
    //   const imgTag = document.createElement('img')
    //   // imgTag.src = element // same as below
    //   imgTag.setAttribute("src", element)

    //   const dogImageContainer = document.getElementById("dog-image-container")

    //   dogImageContainer.appendChild(imgTag)
    // })
    // for
    // for(let i = 0; i < data.message.length; i++){
    //   const imgTag = document.createElement('img')
    //     // imgTag.src = element // same as below
    //     imgTag.setAttribute("src", data.message[i])
  
    //     const dogImageContainer = document.getElementById("dog-image-container")
  
    //     dogImageContainer.appendChild(imgTag)
    // }
    // for of
    for(let url of data.message){
      const imgTag = document.createElement('img')
          // imgTag.src = element // same as below
          imgTag.setAttribute("src", url)
    
          const dogImageContainer = document.getElementById("dog-image-container")
    
          dogImageContainer.appendChild(imgTag) 
    }
  })



  // Challenge 2
  const dogBreedUrl = "https://dog.ceo/api/breeds/list/all"
  const dogBreedsUl = document.querySelector("#dog-breeds")
  
  getDogBreeds()
  .then(data => {
    
    addDogBreeds(Object.keys(data.message))
    // for(let breed in data.message){
    //   // console.log(data.message[beed])
    //   // const dogLi = document.createElement('li')
    //   // dogLi.innerText = breed
    //   dogBreedsUl.appendChild(createDogLi(breed))
    // }

    // Object.keys(data.message).forEach(species => {
    //   console.log(species)
    // })

  })


  // Challenge 3
  dogBreedsUl.addEventListener('click', function(event){
    if(event.target.tagName === "LI"){
      event.target.style.color =  "#" + (Math.random() * 0xFFFFFF << 0).toString(16)
    }
  })


  // Challenge 4
  // 1. When I change the options in the select tag
  document.querySelector('select').addEventListener('change', function(event){
    let letter = event.target.value
    getDogBreeds()
    .then(data => {
      // filter takes in a function
      let filteredBreeds = Object.keys(data.message).filter(breed => breed.startsWith(letter))

      dogBreedsUl.innerHTML = ""
      addDogBreeds(filteredBreeds)
      // for(let breed of filteredBreeds){
      //   // const dogLi = document.createElement('li')
      //   //     dogLi.innerText = breed
      //       dogBreedsUl.appendChild(createDogLi(breed))
      // }
      // dogBreedsUl.innerHTML = ""
      // for(let species in data.message){
      //   if(species.startsWith(letter)){
      //     const dogLi = document.createElement('li')
      //     dogLi.innerText = species
      //     dogBreedsUl.appendChild(dogLi)
      //   }
      // }
    })

  })
  // 2. filter a list of dog breeds if they match the first letter 
  // 3. render them onto the page 
})


