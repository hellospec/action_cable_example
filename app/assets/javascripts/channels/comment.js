$(document).on('turbolinks:load', function(){
  // let browser finish load in order to get discussion-id
  // before create socket connetion

  App.comment = App.cable.subscriptions.create({
    channel: "CommentChannel",
    discussion_id: $(".topic-head").data("discussion-id") 
  }, {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data.content)
      $(".comments").append(data.content);
      $("#comment_content").val("");
    }
  });
});
