# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# this sets up the ajax loader, and it will stay until the method specific js removes it

ready = undefined

ready = ->
  # init Isotope
  $container = $('.isotope').isotope(
    itemSelector: '.task'
    layoutMode: 'fitRows'
    getSortData:
      title: '.title'
      priority: '[data-priority] parseInt'
      due_date: '[data-date]')

  # bind filter button click
  $('#filters').on 'click', 'button', ->
    filterValue = $(this).attr('data-filter')
    $container.isotope filter: filterValue
    return

  # bind sort button click
  $('#sorts').on 'click', 'button', ->
    sortByValue = $(this).attr('data-sort-by')
    $container.isotope sortBy: sortByValue
    return

  # change active class on buttons
  $('.btn-group').each (i, buttonGroup) ->
    $buttonGroup = $(buttonGroup)
    $buttonGroup.on 'click', 'button', ->
      $buttonGroup.find('.active').removeClass 'active'
      $(this).addClass 'active'
      return
    return
  return

reload_tasks = undefined

reload_tasks = ->
  $('.modal-footer .btn:first').on 'click', 'button', ->
    $('.isotope').isotope('reloadItems')

$(document).ready ready
$(document).on 'page:load', ready
$(document).on 'page:change', reload_tasks
