// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.plugin.min
//= require scripts
//= require data-confirm-modal
//= require flexslider.min
//= require confirm
//= require_tree


  dataConfirmModal.setDefaults({
    commitClass: 'btn btn-sm',
    cancelClass: 'btn btn-sm',
    title: 'Confirm your action',
    commit: 'Do It',
    focus: 'commit',
    cancel: 'Never'
  });
