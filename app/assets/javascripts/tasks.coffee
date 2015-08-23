# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# this sets up the ajax loader, and it will stay until the method specific js removes it

ready = undefined

ready = ->
  # init Isotope
  $container = $('.isotope').isotope(
    itemSelector: '.task'
    layoutMode: 'vertical'
    getSortData:
      title: '.title'
      priority: '[data-priority] parseInt'
      date: '[data-date]')

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

  toggleCheckboxes = (selector, bool) ->
    check_box = selector
    check_box.each ->
      if $(this).parent().css('display') == "block"
        $(this).prop('checked', bool)
      return
    return

  $('#check_all').on 'click', ->
    toggleCheckboxes $('input[id^="task_ids"]'), true
    
  $('#uncheck_all').on 'click', ->
    toggleCheckboxes $('input[id^="task_ids"]'), false
    

  $('#delete_selected').on 'click', ->
    $visible_selected_check_boxes = $.grep $('input[id^="task_ids"]'), (e) ->
      $(e).prop('checked') and $(e).parent().css('display') == 'block'
    $ids = []
    $visible_selected_check_boxes.forEach (e) ->
      $ids.push($(e).attr('id').split('_')[2])
    $.ajax
      url: '/tasks/destroy_all'
      type: 'DELETE'
      data:
        id: $ids
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

$(document).ready ready
$(document).on 'page:load', ready