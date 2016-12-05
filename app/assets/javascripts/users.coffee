# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#user_dateofbirth').datepicker {
        dateFormat: 'yyyy-mm-dd',
        weekStart: 1,
        language: "de",
        daysOfWeekHighlighted: "0,6",
        todayBtn: true,
        todayHighlight: true,
        firstDay: 1
    }