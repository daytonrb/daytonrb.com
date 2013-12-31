@Main=
  init: ->
    @meetup = new Meetup
    @meetup.fetch(Main.updateDate)

  updateDate: (meetup) ->
    @results = meetup
    Main.setMainDate(@results[0].time)
    Main.upcomingDates(@results)

  setMainDate: (time) ->
    $("#next_meetup").find('span').text(Main.formattedDate(time))

  upcomingDates: (results) ->
    dates = [
      Main.formattedDate(results[1].time, false),
      Main.formattedDate(results[2].time, false),
      Main.formattedDate(results[3].time, false)
    ]
    $(".event .date").each (index) ->
      $(this).find("h4").html(dates[index])

  formattedDate: (date, long = true) ->
    rawDate = new Date(date)
    if long
      moment(rawDate).format("ddd , MMM D YYYY [at] hh:mmA")
    else
      moment(rawDate).format("MMM [<span>]D[</span>]")

$ ->
  Main.init()
