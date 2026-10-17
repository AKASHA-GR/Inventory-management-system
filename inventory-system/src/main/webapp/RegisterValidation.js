function validateForm(){

let isValid = true;

let firstName = document.getElementById("firstName").value;
let lastName = document.getElementById("lastName").value;
let email = document.getElementById("email").value;
let psw = document.getElementById("password").value;
let cpsw = document.getElementById("confirmPassword").value;
let pnum = document.getElementById("phoneNumber").value;

console.log(firstName);
console.log(lastName);
console.log(email);
console.log(psw);
console.log(cpsw);
console.log(pnum);

return isValid;

}