import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["popup"];

  connect() {
    this.closePopup();
  }

  togglePopup(event) {
    event.preventDefault()
    if (this.popupTarget.style.visibility === 'hidden') {
      this.showPopup();
    } else {
      this.closePopup();
    }
  }

  showPopup() {
    this.popupTarget.style.visibility = 'visible';
    this.popupTarget.style.transform = 'translate(-50%, -50%)';
  }

  closePopup() {
    this.popupTarget.style.visibility = 'hidden';
    this.popupTarget.style.transform = 'translate(-50%, -50%)';
  }
}
