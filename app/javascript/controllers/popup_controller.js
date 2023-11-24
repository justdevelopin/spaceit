import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["popup", "blur", "form", "popupContainer", "totalPrice"];

  connect() {
    this.closePopup();
  }

  togglePopup(event) {
    event.preventDefault()
    if (this.popupTarget.style.visibility === 'hidden') {
      this.submitForm()
    } else {
      this.closePopup();
    }
  }

  showPopup() {

    document.body.classList.add("no-scroll");
    this.popupContainerTarget.classList.remove("d-none")
    this.popupTarget.style.visibility = 'visible';
    this.popupTarget.style.transform = 'translate(-50%, -50%)';
  }

  closePopup() {
    document.body.classList.remove("no-scroll")
    this.popupContainerTarget.classList.add("d-none")
    this.popupTarget.style.visibility = 'hidden';
    this.popupTarget.style.transform = 'translate(-50%, -50%)';
  }

  submitForm() {
    fetch(this.formTarget.action, {
      method: "POST",
      headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      if (data.status == "created") {
        this.totalPriceTarget.textContent = `$${data.total_price.toFixed(2)}`;
        this.showPopup();
      } else{
        console.log(data)
        return "error with dates";
      }
      }) .catch((error) => {
        console.log('Error:', error);
      });
    }
}
