function showContactForm() {
    const form = document.getElementById("contact-form-wrapper");
    if (form) {
        form.classList.remove("hidden");
        form.scrollIntoView({ behavior: "smooth" });
    }
}
