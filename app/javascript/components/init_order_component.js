let available_set = 0;
let price = 0
let  price_unit = ""

const number = (number) =>  Number.parseInt(number, 10);


const display = (value) => {
  const formInputs = document.querySelector('form');
  formInputs.querySelector('#order_passenger_number').value = value
  formInputs.querySelector('input[type=submit]').value = `Pay ${price_unit} ${parseFloat(price * value).toFixed(2)}`;

  const minus = document.querySelector('#actions a.minus');

  if (value > 1) {
    minus.removeAttribute('disabled');
  } else {
    minus.setAttribute("disabled", "disabled");
  }

  const plus = document.querySelector('#actions a.plus');

  if (value < available_set) {
    plus.removeAttribute('disabled');
  } else {
    plus.setAttribute("disabled", "disabled");
  }
};

const valuateOnClick = (event) => {
  const offset = number(event.currentTarget.dataset.offset);

  const counterElement = document.getElementById('counter');
  const count = number(counterElement.innerText);

  const value = count + offset

  if (value > 0 && value <= available_set) {
    counterElement.innerText = value;
    display(value);
  }
}

const setValues = ()=>{
   const element = document.getElementById('price')
    available_set =  number(document.getElementById('available_set').innerText);
    price = number(element.dataset.amountCents);
    price_unit = element.dataset.priceUnit;
};

const initDisplayValue = (value) =>{

  const elements = document.querySelectorAll('#order #actions a')

  if(elements.length > 0 ){
    setValues();
    elements.forEach(item => item.addEventListener('click', valuateOnClick));
  }

};

export { initDisplayValue }
