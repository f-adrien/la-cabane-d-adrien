import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { siteKey: String }

  connect() {
    grecaptcha.render("recaptchaV2", { sitekey: this.siteKeyValue } )
  }
}