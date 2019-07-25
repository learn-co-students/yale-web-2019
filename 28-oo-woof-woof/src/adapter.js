class Adapter {

  constructor(baseUrl) {
    this.baseUrl = baseUrl
  }

  getAllDogs() {
    return fetch(this.baseUrl).then(r => r.json())
  }

  options(method, body) {
    return {
      method: method,
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json'
      },
      body: JSON.stringify(body)
    }
  }

  patchDog(id, body) {
    return fetch(`${this.baseUrl}/${id}`, this.options('PATCH', body)).then(r => r.json())
  }

}
