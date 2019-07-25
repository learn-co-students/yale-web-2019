class Square {
  constructor(sideLength, color = "blue") {
    this.sideLength = sideLength
    this.color = color
    this.render()
  }

  render() {
    const container = document.querySelector('#square-container')
    const div = document.createElement('div')
    // console.log(container, div)
    div.style.background = this.color
    div.style.height = `${this.sideLength}px`
    div.style.width = `${this.sideLength}px`
    container.append(div)
  }
}
