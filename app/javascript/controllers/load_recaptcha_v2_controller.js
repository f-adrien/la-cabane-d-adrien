import { Controller } from "stimulus"

export default class extends Controller {
  static values = { siteKey: String }

  connect() {
    grecaptcha.render("recaptchaV2", { sitekey: this.siteKeyValue } )
  }
}