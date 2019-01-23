let closeTaxe = document.getElementById("taxes");
let closeTaxeShift = document.getElementById("taxes-shift");
let closeTaxeButton = document.getElementById("taxes-close");

closeTaxeButton.onclick = function() {
  closeTaxeDiv();
};

function closeTaxeDiv(){
  closeTaxe.style.display = "none";
  closeTaxeShift.style.display = "none";
  sessionStorage.setItem('closeTaxeDisplay', 'false');
};

var closeTaxeDisplay = sessionStorage.getItem('closeTaxeDisplay');

if (closeTaxeDisplay == 'false') {
  closeTaxeDiv();
};


