
function displayLogin() {
  let mainContainer = document.querySelector('main')
  mainContainer.innerHTML = `
  <form>
    <input type="email" name="email"/>
    <input type="submit"/>
  </form>`

  const loginForm = mainContainer.querySelector('form')
  loginForm.addEventListener('submit', function(e){
    e.preventDefault()

    const email = e.target[0].value
    fetch(`${BASE_URL}/login`, {
      method: "POST",
      headers: {
        "Content-Type": 'application/json'
      },
      body: JSON.stringify({
        email
      })
    })
    .then(res => res.json())
    .then(data => {
      // When we are successful!

      // After they have logged in, this is how we can remember them
      localStorage.setItem("user_id", data.id)

      displayHomePage(data)
    })
  })
}

function displayHomePage(user){
  let mainContainer = document.querySelector('main')
  mainContainer.innerHTML = `<h2>Welcome back, ${user.name}</h2>
  <button id="logout">Logout</button>`
  
  // Logout functionality
  const logoutButton = document.getElementById('logout')
  logoutButton.addEventListener('click', function(e){
    localStorage.removeItem('user_id')
    displayLogin()
  })
}