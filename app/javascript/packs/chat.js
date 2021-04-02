$(document).on('turbolinks:load', function() {
  $('.chat-form').on('submit', function(e) {
    setTimeout(function() {
      $('.chat-input').val('')
    })
  })
})