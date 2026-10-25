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

// Check if email exists via AJAX
function checkEmailExists() {
    let email = document.getElementById("email").value;
    let emailMessage = document.getElementById("emailMessage");

    if (email && emailMessage) {
        fetch("/InventoryManagement/checkEmailExit?email=" + encodeURIComponent(email))
            .then(response => response.text())
            .then(data => {
                emailMessage.textContent = data;
                if (data.includes("Already Exist")) {
                    emailMessage.className = "text-danger";
                } else {
                    emailMessage.className = "text-success";
                }
            })
            .catch(error => {
                console.error("Error checking email:", error);
            });
    }
}

// Add event listener to email field
document.addEventListener("DOMContentLoaded", function() {
    let emailInput = document.getElementById("email");
    if (emailInput) {
        emailInput.addEventListener("blur", checkEmailExists);
    }
});