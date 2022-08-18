const password = document.getElementById('password')
const newPassword = document.getElementById('newPassword')
const confirmPassword = document.getElementById('confirmPassword')
const updatePassword = document.getElementById('updatePassword')

let errorExist = false

function showError(input, message) {
	const formControl = input.parentElement
	formControl.className = "form-control error"
	const small = formControl.querySelector('small')
	small.innerText = message
}

function getFeildName(input) {
	return input.id.charAt(0).toUpperCase() + input.id.slice(1)
}

function showSuccess(input) {
	const formControl = input.parentElement
	formControl.className = "form-control success"
}

function checkPasswordMatch(input1, input2) {
	if (input1.value !== input2.value) {
		showError(input2, "Password is not match")
		errorExist = true
	}
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

updatePassword.addEventListener('click', (e) => {
	e.preventDefault()

    checkRequired([ password, newPassword, confirmPassword])
	
	checkLength(newPassword, 6, 15)
	checkLength(confirmPassword, 6, 15)
	checkPasswordMatch(newPassword, confirmPassword)
	
	if(errorExist){
		errorExist = false
	}
	else{
	
		let oldPassword = password.value
		let updatePassword = newPassword.value
		$.ajax({
            type: "POST",
            url: "/user/updatePassword",
            data: {
                "oldPassword": oldPassword,
                "updatePassword": updatePassword
            },
            success: function (res) {
            	if(res.result == "ok"){
            		alert(res.str)
            		location.href = "/main"
            	}else{
            		alert(res.str)
            	}
            }
        })
	}



})