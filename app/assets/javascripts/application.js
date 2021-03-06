// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require vk-open-api.js
//= require jquery
//= require colorbox-rails
//= require jquery_ujs
//= #require jquery.ui.datepicker
//= #require jquery.ui.datepicker-ru
//= require twitter/bootstrap
//= require bootstrap_and_overrides
//= require underscore
//= require underscore.string
//= require backbone
//= require backbone_rails_sync
//= require backbone_datalink
//= require backbone/castle
//= require hamlcoffee
//= require moment
//= require moment/ru.js
//= require js-routes
//= require microfiche
//= require fotorama
//= require web/custom
//= require disqus
//= #require select2
//= require web/user_echo
//= require web/ask_button

$(function() {
  window.router = new Castle.Routers.CalendarsRouter();
  Backbone.history.start();
});