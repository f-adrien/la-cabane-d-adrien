import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    $(".alert").delay(3000).fadeOut(2000);
  }
}