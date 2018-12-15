// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import "./commentable-widget"

function receiver(e) {
  switch (e.data) {
    case "x-commentable-message-resize-me":
      const height = document.getElementById("commentable-widget").offsetHeight;
      window.parent.postMessage({"x-commentable-message-height": height}, e.origin);
  }
}

window.addEventListener("message", receiver, false);
