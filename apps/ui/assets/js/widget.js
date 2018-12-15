var url = document.currentScript.src.replace("/js/widget.js", "");

var container = document.createElement("div");
container.setAttribute("id", "commentable-thread");
document.currentScript.parentNode.insertBefore(container, document.currentScript);

var iframe = document.createElement("iframe");

iframe.style.width = `${container.offsetWidth}px`
iframe.style.height = "0px";
iframe.style.border = "none";
iframe.setAttribute("src", `${url}?url=${window.location.href}`);

function receiver(e) {
  if (e.data["x-commentable-message-height"] !== undefined) {
    iframe.style.height = `${e.data["x-commentable-message-height"]}px`;
  }
}

iframe.onload = function() {
  iframe.contentWindow.postMessage("x-commentable-message-resize-me", "*");
};

container.appendChild(iframe);

window.addEventListener("message", receiver, false);
