countDescription = document.getElementById('counter-description')

description = document.getElementById('product_description')

function countChar() {
  countDescription.innerHTML = description.value.length + '/240';
};

function showCounter(){
  document.getElementById('counter-description').classList.remove('counter-hide');
  countChar();
};

function hideCounter(){
  document.getElementById('counter-description').classList.add('counter-hide');
};

description.addEventListener('keydown', countChar);

description.addEventListener('focus', showCounter);

description.addEventListener('blur', hideCounter);



