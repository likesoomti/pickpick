App.notice = App.cable.subscriptions.create "NoticeChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    new Notification data["title"], body: data["body"]
    console.log "message received complete"
