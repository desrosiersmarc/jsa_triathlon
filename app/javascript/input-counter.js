countDescription = document.getElementById('counter-description');
countName = document.getElementById('counter-name');

description = document.getElementById('product_description');
productName = document.getElementById('product_name');

function countCharDescription(){
  countDescription.innerHTML = description.value.length + '/240';
};

function countCharName(){
  countName.innerHTML = productName.value.length + '/22';
};

function showCounter(){
  countDescription.classList.remove('counter-hide');
  countCharDescription();
};

function showCounterName(){
  countName.classList.remove('counter-hide');
  countCharName();
};

function hideCounter(){
  countDescription.classList.add('counter-hide');
};

function hideCounterName(){
  countName.classList.add('counter-hide');
};

description.addEventListener('keydown', countCharDescription);
productName.addEventListener('keydown', countCharName);

description.addEventListener('focus', showCounter);
productName.addEventListener('focus', showCounterName);

description.addEventListener('blur', hideCounter);
productName.addEventListener('blur', hideCounterName);



