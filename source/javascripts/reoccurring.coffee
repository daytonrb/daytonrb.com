@Reoccurring=
  
  pattern: {}

  # Pass in a params hash to set proper pattern options
  #
  # Options:
  #   start, every, unit, end_condition, until, rfor, nth, occurrence_of
  options: (params) ->
    for key, value in params
      @pattern.key = value

  # Send pattern through RecurringDate class to get date set
  generate: (pattern) ->
    dates = @recurring_date pattern
    console.log dates

  recurring_date: (pattern) ->
