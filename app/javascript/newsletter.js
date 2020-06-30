console.log('Here I pass in the newsletter.js');
let selectElement = document.getElementsByClassName("nl-form-date");
let documentState = document.readyState;

if (selectElement.length > 0) {

  let menuDate = document.getElementById('newsletter_send_newsletter_date');

  menuDate.addEventListener('change', (event) => {
    console.log('Change date');
    selectElement[0].classList.remove("nl-form-date");
  });

};

