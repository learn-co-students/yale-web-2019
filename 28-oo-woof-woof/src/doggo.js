class Doggo {
  constructor({ id, name, image, isGoodDog }, adapter) {
    this.id = id
    this.name = name
    this.image = image
    this.isGoodDog = isGoodDog
    this.adapter = adapter
    // this.renderDetails = this.renderDetails.bind(this)
    this.renderSpan()
  }

  renderSpan() {
    const span = document.createElement('span')
    span.addEventListener('click', this.renderDetails)
    const dogBar = document.querySelector('#dog-bar')
    span.innerText = this.name
    dogBar.append(span)
  }

  get buttonText() {
    return this.isGoodDog ? 'Good Dog!' : 'Bad Dog!'
  }

  renderDetails = () => {
    const dogInfo = document.querySelector('#dog-info')
    dogInfo.innerHTML = `
      <img src=${this.image}>
      <h2>${this.name}</h2>
      <button>${this.buttonText}</button>
    `
    const dogButton = dogInfo.querySelector('button')
    dogButton.addEventListener('click', this.toggleIsGoodDog)
  }

  toggleIsGoodDog = (evt) => {
    this.isGoodDog = !this.isGoodDog
    evt.target.innerText = this.buttonText
    this.adapter.patchDog(this.id, { isGoodDog: this.isGoodDog }).then(console.log)
  }

}
