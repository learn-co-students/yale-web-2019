const BASE_URL = "http://localhost:3000"

// document.addEventListener("DOMContentLoaded", function(e){
  
  if(localStorage.getItem('user_id')){
    // If the user id is found, that means we've logged in
    const userId = localStorage.getItem('user_id')
    // http://localhost:3000/users/1
    fetch(`${BASE_URL}/users/${userId}`)
    .then(res => res.json())
    .then(user => {
      displayHomePage(user)
    })
    
  } else {
    // Display Login
    displayLogin()
  }
  

  
// })
