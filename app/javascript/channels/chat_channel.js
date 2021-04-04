import consumer from "./consumer"

const initConsumer = function(channel, roomId) {
  consumer.subscriptions.create({channel: 'ChatChannel', room: roomId }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      $('.messages').append('<div class="message"><strong>' + data.content.user + '</strong>: ' + data.content.message + '</div>')
    }
  });
}

$(document).on('turbolinks:load', function() {
  if ($('#chat-room').length) {
    var roomId = $('#chat-room').data('room-id')
    if (roomId) initConsumer('ChatChannel', roomId)
  }
})
