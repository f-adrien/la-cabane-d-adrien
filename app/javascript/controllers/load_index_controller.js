import { Controller } from "stimulus"

export default class extends Controller {
  static values = { url: String }
  static targets = [ 'inject', 'searchIndex' ]

  connect() {
    const TurboPreview = document.documentElement.hasAttribute("data-turbo-preview")
    if (!TurboPreview) {
      this.load()
    }
  }

  load() {
    var searchParam = this.hasSearchIndexTarget ? this.searchIndexTarget.value : ''
    fetch(`${this.urlValue}?search_index=${searchParam}`, { method: "GET", credentials: "same-origin" })
      .then(response => response.text())
      .then(data => this.injectTarget.innerHTML = data)
  }
}