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

  $('#check_all').on 'click', ->
    $check_box = $('input[type=checkbox]')
    $check_box.each ->
      if $(this).parent().css('display') == "block"
        $(this).prop('checked', true)
      return
    return

  $('#uncheck_all').on 'click', ->
    $check_box = $('input[type=checkbox]')
    $check_box.each ->
      if $(this).parent().css('display') == "block"
        $(this).prop('checked', false)
      return
    return

  $('#delete_selected').on 'click', ->
    $check_box = $('input[type=checkbox]')
    $check_box.each ->
      if $(this).prop('checked') && ($(this).parent().css('display') == "block")
        $('.isotope').isotope('remove', $(this).parent()).isotope('layout')
      return
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