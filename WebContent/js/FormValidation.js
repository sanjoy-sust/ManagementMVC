window.onload = init;

// The "onload" handler. Run after the page is fully loaded.
function init() {
	// Attach "onsubmit" handler
	document.getElementById("regForm").onsubmit = validateForm;
	// Attach "onclick" handler to "reset" button
	document.getElementById("reset").onclick = clearDisplay;
	// Set initial focus
	document.getElementById("fullName").focus();
}

function validateForm() {
	return (isNotEmpty("fullName", "Please Enter Your Full Name")
			&& isNotEmpty("name", "Please enter your name!")
			&& isNotEmpty("email", "Please Enter your email")
			&& isNotEmpty("password", "Please Enter a Password")
			&& isLengthMinMax("password", "Enter a valid password!", 6, 8)
			&& verifyPassword("password", "vpass",
					"Different from the password!")
			&& isChecked("gender", "Please check a gender!") && isValidEmail(
			"email", "Enter a valid email!"));
}

// Return true if the input value is not empty
function isNotEmpty(inputId, errorMsg) {
	var inputElement = document.getElementById(inputId);
	var errorElement = document.getElementById(inputId + "Error");
	var inputValue = inputElement.value.trim();
	var isValid = (inputValue.length != 0); // boolean
	showMessage(isValid, inputElement, errorMsg, errorElement);
	return isValid;
}

/*
 * If "isValid" is false, print the errorMsg; else, reset to normal display. The
 * errorMsg shall be displayed on errorElement if it exists; otherwise via an
 * alert().
 */
function showMessage(isValid, inputElement, errorMsg, errorElement) {
	if (!isValid) {
		// Put up error message on errorElement or via alert()
		if (errorElement != null) {
			errorElement.innerHTML = errorMsg;
		} else {
			alert(errorMsg);
		}
		// Change "class" of inputElement, so that CSS displays differently
		if (inputElement != null) {
			inputElement.className = "error";
			inputElement.focus();
		}
	} else {
		// Reset to normal display
		if (errorElement != null) {
			errorElement.innerHTML = "";
		}
		if (inputElement != null) {
			inputElement.className = "";
		}
	}
}

// Return true if the input value contains only digits (at least one)
function isNumeric(inputId, errorMsg) {
	var inputElement = document.getElementById(inputId);
	var errorElement = document.getElementById(inputId + "Error");
	var inputValue = inputElement.value.trim();
	var isValid = (inputValue.search(/^[0-9]+$/) != -1);
	showMessage(isValid, inputElement, errorMsg, errorElement);
	return isValid;
}

// Return true if the input value contains only letters (at least one)
function isAlphabetic(inputId, errorMsg) {
	var inputElement = document.getElementById(inputId);
	var errorElement = document.getElementById(inputId + "Error");
	var inputValue = inputElement.value.trim();
	var isValid = inputValue.match(/^[a-zA-Z]+$/);
	showMessage(isValid, inputElement, errorMsg, errorElement);
	return isValid;
}

// Return true if the input value contains only digits and letters (at least
// one)
function isAlphanumeric(inputId, errorMsg) {
	var inputElement = document.getElementById(inputId);
	var errorElement = document.getElementById(inputId + "Error");
	var inputValue = inputElement.value.trim();
	var isValid = inputValue.match(/^[0-9a-zA-Z]+$/);
	showMessage(isValid, inputElement, errorMsg, errorElement);
	return isValid;
}

// Return true if the input length is between minLength and maxLength
function isLengthMinMax(inputId, errorMsg, minLength, maxLength) {
	var inputElement = document.getElementById(inputId);
	var errorElement = document.getElementById(inputId + "Error");
	var inputValue = inputElement.value.trim();
	var isValid = (inputValue.length >= minLength)
			&& (inputValue.length <= maxLength);
	showMessage(isValid, inputElement, errorMsg, errorElement);
	return isValid;
}

// Return true if the input value is a valid email address
// (For illustration only. Should use regexe in production.)
function isValidEmail(inputId, errorMsg) {
	var inputElement = document.getElementById(inputId);
	var errorElement = document.getElementById(inputId + "Error");
	var inputValue = inputElement.value;
	var atPos = inputValue.indexOf("@");
	var dotPos = inputValue.lastIndexOf(".");
	var isValid = (atPos > 0) && (dotPos > atPos + 1)
			&& (inputValue.length > dotPos + 2);
	showMessage(isValid, inputElement, errorMsg, errorElement);
	return isValid;
}

// Return true if selection is made (not default of "") in <select> input
function isSelected(inputId, errorMsg) {
	var inputElement = document.getElementById(inputId);
	var errorElement = document.getElementById(inputId + "Error");
	var inputValue = inputElement.value;
	// You need to set the default value of <select>'s <option> to "".
	var isValid = inputValue != "";
	showMessage(isValid, inputElement, errorMsg, errorElement);
	return isValid;
}

// Return true if the one of the checkboxes or radio buttons is checked
function isChecked(inputName, errorMsg) {
	var inputElements = document.getElementsByName(inputName);
	var errorElement = document.getElementById(inputName + "Error");
	var isChecked = false;
	for ( var i = 0; i < inputElements.length; i++) {
		if (inputElements[i].checked) {
			isChecked = true; // found one element checked
			break;
		}
	}
	showMessage(isChecked, null, errorMsg, errorElement);
	return isChecked;
}

// Verify password. The password is kept in element with id "pwId".
// The verified password in id "verifiedPwId".
function verifyPassword(pwId, verifiedPwId, errorMsg) {
	var pwElement = document.getElementById(pwId);
	var verifiedPwElement = document.getElementById(verifiedPwId);
	var errorElement = document.getElementById(verifiedPwId + "Error");
	var isTheSame = (pwElement.value == verifiedPwElement.value);
	showMessage(isTheSame, verifiedPwElement, errorMsg, errorElement);
	return isTheSame;
}

// The "onclick" handler for the "reset" button to clear the display
function clearDisplay() {
	var elms = document.getElementsByTagName("*"); // all tags
	for ( var i = 0; i < elms.length; i++) {
		if ((elms[i].id).match(/Error$/)) { // no endsWith() in JS?
			elms[i].innerHTML = "";
		}
		if (elms[i].className == "error") { // assume only one class
			elms[i].className = "";
		}
	}
	// Set initial focus
	document.getElementById("name").focus();
}

function showAlert() {
	var successMsg = "Form Submitted Successfully";
	alert(successMsg);
}

$(document).ready(function() {
	$("#subbutton").click(function() {
		if (validateForm()) {
			var name = document.getElementById("name").value;
			var email = document.getElementById("email").value;
			var fullName = document.getElementById("fullName").value;
			var password = document.getElementById("password").value;
			var address = document.getElementById("address").value;
			var nationalId = document.getElementById("nationalId").value;
			var occupation = document.getElementById("occupation").value;
			var nationality = document.getElementById("nationality").value;
			var gender = document.getElementsByName("gender").value;

			var user = {
				name : name,
				email : email,
				fullName : fullName,
				password : password,
				address : address,
				nationalId : nationalId,
				occupation : occupation,
				nationality : nationality,
				gender : gender,
			};

//			$.ajax({
//				// this is the php file that processes the data and send mail
//				url : "registerSave.htm",
//
//				// GET method is used
//				type : "POST",
//
//				// pass the data
//				data : user,
//				dataType:"html",
//				// success
//				success : function(html) {
//					alert("in");
//					$("td input").each(function() {
//						$(this).val('');
//					});
//				},
//				error:function(request, status, error){alert(request.responseText); alert(status); alert(error);}
//			});
		}
	});
});