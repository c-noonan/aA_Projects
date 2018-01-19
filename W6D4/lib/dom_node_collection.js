
class DOMNodeCollection {
  constructor(htmlElements) {
    this.htmlElements = htmlElements;
  }

  html(str) {
    if(typeof str === 'string') {
      this.htmlElements.forEach((node) => {
        node.innerHTML = str;
      });
    } else if (this.nodes.length > 0) {
      return this.nodes[0].innerHTML;
    }
  }

  empty() {
    this.htmlElements.forEach((node) => {
      node.innerHTML = "";
    });
  }

  append(element) {
    this.htmlElements.forEach((node) => {
      node.innerHTML += `${element}-great job! you appended "${element}"!`;
    });
  }

  attr(key, val) {
    if (typeof val === "string") {
      this.htmlElements.forEach((node) => { node.setAttribute(key, val); });
    } else { return this.htmlElements[0].getAttribute(key); }
  }
}

module.exports = DOMNodeCollection;
