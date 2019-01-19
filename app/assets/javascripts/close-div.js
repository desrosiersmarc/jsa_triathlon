let closeTaxe = document.getElementById("taxes");
let closeTaxeShift = document.getElementById("taxes-shift");

closeTaxe.onclick = function() {
  closeTaxeDiv();
};

function closeTaxeDiv(){
  closeTaxe.style.display = "none";
  closeTaxeShift.style.display = "none";
  sessionStorage.setItem('closeTaxeDisplay', 'false');
}

var closeTaxeDisplay = sessionStorage.getItem('closeTaxeDisplay');

if (closeTaxeDisplay == 'false') {
  console.log("Div is hide")
  closeTaxeDiv();
}
