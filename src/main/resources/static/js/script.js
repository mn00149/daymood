const form = document.getElementById('form')
const username = document.getElementById('username')
const email = document.getElementById('email')
const password = document.getElementById('password')
const confirmpassword = document.getElementById('confirmpassword')
let errorExist = false

function showError(input, message) {
    const formControl = input.parentElement
    formControl.className = "form-control error"
    const small = formControl.querySelector('small')
    small.innerText = message
}

function showSuccess(input) {
    const formControl = input.parentElement
    formControl.className = "form-control success"
}

function isValidEmail(email) {String(email)
.toLowerCase()
.match(
    /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
);}

function getFeildName(input) {
    return input.id.charAt(0).toUpperCase() + input.id.slice(1)
}

function checkRequired(inputArr) {
    inputArr.forEach(input => {
        if (input.value.trim() === "") {
            showError(input, `${getFeildName(input)} is required`)
            errorExist = true
        } else {
            showSuccess(input)
        }
    });
}

function checkLength(input, min, max) {
    if (input.value.length < min) {
        showError(input, `${getFeildName(input)} must be at least ${min} characters`)
        errorExist = true
    } else if (input.value.length > max) {
        showError(input, `${getFeildName(input)} must be less than ${max} characters`)
        errorExist = true
    } else {
        showSuccess(input)
    }
}

function checkPasswordMatch(input1, input2) {
    if (input1.value !== input2.value) {
        showError(input2, "Password is not match")
        errorExist = true
    } 
}

function checkEmail(input) {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  if (re.test(input.value.trim())) {
    showSuccess(input);
  } else {
    showError(input, 'Email is not valid');
    errorExist = true
  }
}

form.addEventListener('submit', (e) => {
    e.preventDefault()
    

    checkRequired([username, email, password, confirmpassword])
    checkLength(username, 3, 15)
    checkLength(password, 6, 15)
    checkEmail(email)
    checkPasswordMatch(password, confirmpassword)
    if(errorExist){errorExist = false}
    else{form.submit()}
    
})