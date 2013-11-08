jQuery ->
  users = $('#user.id').html()
  console.log(users)
  $('#event.id').change ->
    event = $('#user.id :selected').text()
    options = $(users).filter("optgroup[label=#{event}]").html()
    console.log(events)
    if options
      $('#user.id').html(options)
    else
      $('#user.id').empty()