var iframe = document.createElement("iframe");
var container = document.getElementById("commentable_thread");

iframe.style.width = '250px';
iframe.style.height = '300px';
iframe.style.border = 'none';
iframe.src = `https://localhost:4001?href=${window.location.href}`;

container.appendChild(iframe);
