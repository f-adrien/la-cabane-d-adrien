import { Controller } from "stimulus"

export default class extends Controller {

  deploySection(e) {
    const currentSection = e.currentTarget
    if (currentSection.classList.contains('tab-deployed')) {
      $(`#${currentSection.dataset.value}`).slideUp(400);
      currentSection.classList.remove('tab-deployed');
    } else {
      $(`#${currentSection.dataset.value}`).slideDown(400);
      currentSection.classList.add('tab-deployed');
    }
  }
}