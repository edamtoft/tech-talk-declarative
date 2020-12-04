class Renderer {
  constructor(canvas) {
    this.canvas = canvas;
    this.document = document;
    this.ctx = canvas.getContext("2d");
    this.basis = 0;
  }

  render(doc) {
    this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
    this.basis = 0;
    for (let element of doc) {
      switch (element.type) {
        case "header":
          this._printHeader(element.text);
          break;
        case "break":
          this._printHorizontal();
          break;
        case "item":
          this._printListItem(element.text);
          break;
      }
    }
  }

  _printHorizontal() {
    this.ctx.moveTo(0, this.basis + 5);
    this.ctx.lineTo(this.canvas.width, this.basis + 5);
    this.ctx.stroke();
    this.basis += 10;
  }

  _printHeader(text) {
    this.ctx.font = "bold 20px Arial";
    this.ctx.fillText(text, 5, this.basis + 25);
    this.basis += 35;
  }

  _printListItem(item) {
    this.ctx.font = "normal 12px Arial";
    this.ctx.beginPath();
    this.ctx.arc(10, this.basis + 11, 2, 0, 2 * Math.PI);
    this.ctx.fill();
    this.ctx.fillText(item, 20, this.basis + 14);
    this.basis += 20;
  }

  static fromSelector(selector) {
    const canvas = document.querySelector(selector);
    return new Renderer(canvas);
  }
}