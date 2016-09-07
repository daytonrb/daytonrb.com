class @Meetup

  constructor: ->
    @url = "https://www.crossorigin.me/http://api.meetup.com/2/events?&key=2d561c49585f18396f462b792567e&group_urlname=daytonrb"

  fetch: (callback, index = 0)->
    $.ajax @url,
      success: (data, status, xhr) =>
        console.log data
        callback(data.results)
      error: (data, status, xhr) =>
        console.log data, status, xhr
        today = new Date()
        ms = today.getMilliseconds()
        results = [
          {time: ms},
          {time: ms},
          {time: ms},
          {time: ms}
        ]
        callback(results)
