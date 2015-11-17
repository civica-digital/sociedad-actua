# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#investor_city").chosen
    allow_single_deselect: true
    no_results_text: 'No se encontraron coincidencias'
    width: '200px'

$ ->
  $("#investor_causes_supported").chosen
    allow_single_deselect: true
    no_results_text: 'No se encontraron coincidencias'
    width: '400px'
$ ->
  $("#investor_organization").chosen
    allow_single_deselect: true
    no_results_text: 'No se encontraron coincidencias'
    width: '400px'
