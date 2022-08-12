const form = document.getElementById('form')
const username = document.getElementById('username')
const checkUsername = document.getElementById('checkUsername')
const email = document.getElementById('email')
const checkEmailBtn = document.getElementById('checkEmail')
const password = document.getElementById('password')
const confirmpassword = document.getElementById('confirmpassword')

let errorExist = false
let availableUsername = false
let availableEmail = false

async function usernameCheck(username) {
	if (username.value == '') {
		alert("아이디를 입력하세요");
		availableUsername = false
	} else {
		let param = "username=" + username.value;
		let url = "/usernamecheck?" + param;

		let status = "상태"

		let response = await fetch(url)
			.then((res) => res.json())
			.then((data) => {
				if (data.result === "ok") {
					alert(data.str)
					availableUsername = true
				} else {
					alert(data.str)
					availableUsername = false
				}
			});

	}
}

async function emailCheck(email) {
	if (email.value == '') {
		alert("email을 입력하세요");
		availableEmail = false
	} else {
		let param = "email=" + email.value;
		let url = "/emailcheck?" + param;

		let status = "상태"

		let response = await fetch(url)
			.then((res) => res.json())
			.then((data) => {
				if (data.result === "ok") {
					alert(data.str)
					availableEmail = true
				} else {
					alert(data.str)
					availableEmail = false
				}
			});

	}
}

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

function isValidEmail(email) {
	String(email)
		.toLowerCase()
		.match(
			/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
		);
}

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
/*email 및 username 중복체크 버튼 클릭시 이벤트 발생*/
checkUsername.addEventListener('click', (e) => {
	e.preventDefault()

	usernameCheck(username)
})

checkEmailBtn.addEventListener('click', (e) => {
	e.preventDefault()

	emailCheck(email)
})

form.addEventListener('submit', (e) => {
	e.preventDefault()
	if (!availableUsername) {
		alert("username 중복체크에 통과 하셔야 합니다")
	}
	
	if (!availableEmail) {
		alert("email 중복체크에 통과 하셔야 합니다")
	}



	checkRequired([username, email, password, confirmpassword])
	checkLength(username, 3, 15)
	checkLength(password, 6, 15)
	checkEmail(email)
	checkPasswordMatch(password, confirmpassword)
	if (errorExist || !availableUsername || !availableUsername ) { 
		errorExist = false
		availableUsername = false }
	else { form.submit() }

})