require('@rails/ujs').start();
require('@rails/activestorage').start();
require('data-confirm-modal');

import '@hotwired/turbo-rails';
import'../src/jquery';
import 'jquery-ui-dist/jquery-ui.js';
import Popper from "popper.js"
import 'bootstrap';
import 'bootstrap-datepicker';
import 'chartkick/chart.js';

// Importing Stimulus controllers
import '../controllers'

dataConfirmModal.setDefaults({
  commit: 'Oui',
  cancel: 'Non',
  onConfirm: function() { console.log('modal-confirmed') }
});

// reload page when using history
window.addEventListener('popstate', function (e) {
  const state = e.state;
  console.log(window.location.pathname)
  if (state !== null) {
    location.reload();
  }
});