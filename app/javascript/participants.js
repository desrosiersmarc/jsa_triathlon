console.log("participants");

let div_read = document.getElementById('912');

let div_display = document.getElementById('912-participants');

div_read.addEventListener("mouseover", function(event){
  div_display.classList.add("display-participants");
});

div_read.addEventListener("mouseleave", function(event){
  div_display.classList.remove("display-participants");
});

