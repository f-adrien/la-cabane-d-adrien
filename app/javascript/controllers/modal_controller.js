import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect(){       
    $(this.element).modal({
      backdrop: 'static',
      keyboard: false  // to prevent closing with Esc button (if you want this too)
    });
  }

  disconnect() {    
    $(this.element).modal('hide');      
  }  
}