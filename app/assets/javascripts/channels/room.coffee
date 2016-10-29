jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')

  if messages.length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop('scrollHeight'))

    messages_to_bottom()

    App.room = App.cable.subscriptions.create {
        channel:"RoomChannel",
        channel_id: messages.data('channel-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']

        messages_to_bottom()

      speak: (message, channel_id) ->
        @perform 'speak', message: message, channel_id: channel_id


    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.room.speak textarea.val(), messages.data('channel-room-id')
        textarea.val('')
      e.preventDefault()
      return false
