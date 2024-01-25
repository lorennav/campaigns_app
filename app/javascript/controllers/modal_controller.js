import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static values = { url: String };

  open(event) {
    const modal = document.getElementById('modal');
    modal.classList.remove('hidden');

    const frame = document.getElementById('modal_frame');
    frame.src = this.urlValue;
  }

  close() {
    const modal = document.getElementById('modal');
    modal.classList.add('hidden');
  }
}
