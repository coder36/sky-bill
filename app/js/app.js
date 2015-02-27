$(function() {
  $('.expandable').click( function() {
    $(this).closest('section').toggleClass('opened')
  })
})
