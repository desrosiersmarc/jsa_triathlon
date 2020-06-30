let divToClose = document.getElementById("hp-new-content");
let closeDivButton = document.getElementById("close-div-button");

closeDivButton.onclick = function () {
  divToClose.style.display = "none";
};

console.log('Hi close-div-hp');
