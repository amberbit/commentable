var iframe = document.createElement("iframe");
var container = document.getElementById("commentable-thread");

iframe.style.width = `${container.offsetWidth}px`
iframe.style.height = "0px";
iframe.style.border = "none";
iframe.setAttribute("src", `https://localhost:4001?href=${window.location.href}`);

function receiver(e) {
  switch (e.origin) {
    case "https://localhost:4001":
      if (e.data.height !== undefined) {
        iframe.style.height = `${e.data.height}px`;
      }
  }
}

iframe.onload = function() {
  iframe.contentWindow.postMessage("resize-me", "*");
};

container.appendChild(iframe);

window.addEventListener("message", receiver, false);
