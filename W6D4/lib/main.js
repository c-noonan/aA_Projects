const DOMNodeCollection = require('./dom_node_collection');

window.$l = (selector) => {
  if (typeof selector === "string") {
    console.log("selector is HTML el");
    let doc = document.querySelectorAll(selector);
    return new DOMNodeCollection(Array.from(doc));
  } else {
    return new DOMNodeCollection(selector);
  }
};


window.logHello = () => { console.log('hello'); };
