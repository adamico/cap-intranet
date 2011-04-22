
// credits to http://jquery-howto.blogspot.com/2009/09/get-url-parameters-values-with-jquery.html
$.extend({
  getUrlVars: function(){
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
      hash = hashes[i].split('=');
      vars.push(hash[0]);
      vars[hash[0]] = hash[1];
    }
    return vars;
  },
  getUrlVar: function(name){
    return $.getUrlVars()[name];
  }
});


$(function(){
  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();

  $('#calendar').fullCalendar({
    editable: false,
    header: {
      left: 'prev,next today',
    center: 'title',
    right: 'month,agendaWeek,agendaDay'
    },
    defaultView: 'month',
    height: 500,
    slotMinutes: 15,

    loading: function(bool){
      if (bool)
    $('#loading').show();
      else
    $('#loading').hide();
    },

    // a future calendar might have many sources.
    eventSources: [{
                    url: '/events',
                    data: {
                      categorie: $.getUrlVar('categorie')
                    },
                    color: 'yellow',
                    textColor: 'black',
                    ignoreTimezone: false
                  }],
    monthNames:
      ['Janvier','Février','Mars','Avril','Mai','Juin','Juillet','Août','Septembre','Octobre','Novembre','Décembre'],
    monthNamesShort:
      ['janv.','févr.','mars','avr.','mai','juin','juil.','août','sept.','oct.','nov.','déc.'],
    dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'],
    dayNamesShort: ['Dim', 'Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam'],
    titleFormat: {
      month: 'MMMM yyyy', // ex : Janvier 2010
      week: "d[ MMMM][ yyyy]{ - d MMMM yyyy}", // ex : 10  16 Janvier 2010, semaine à cheval : 28 Décembre 2009 - 3 Janvier 2010
        // todo : ajouter le numéro de la semaine
      day: 'dddd d MMMM yyyy' // ex : Jeudi 14 Janvier 2010
    },
    columnFormat: {
      month: 'ddd', // Ven.
      week: 'ddd d', // Ven. 15
      day: '' // affichage déja complet au niveau du 'titleFormat'
    },
    axisFormat: "H:mm",
    timeFormat: {
      '': "H:mm",
      agenda: "H:mm{ - H:mm}"
    },
    firstDay:1,
    buttonText: {
      today: 'aujourd\'hui',
      day: 'jour',
      week:'semaine',
      month:'mois'
    },

    dragOpacity: "0.5",

    //http://arshaw.com/fullcalendar/docs/event_ui/eventDrop/
    eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
      updateEvent(event);
    },

    // http://arshaw.com/fullcalendar/docs/event_ui/eventResize/
    eventResize: function(event, dayDelta, minuteDelta, revertFunc){
                   updateEvent(event);
                 },

    // http://arshaw.com/fullcalendar/docs/mouse/eventClick/
    eventClick: function(event, jsEvent, view){
                  // would like a lightbox here.
                },
  });
});

function updateEvent(the_event) {
  $.update(
      "/events/" + the_event.id,
      { event: { title: the_event.title,
                 starts_at: "" + the_event.start,
    ends_at: "" + the_event.end,
    description: the_event.description
               }
      },
      function (reponse) { alert('successfully updated task.'); }
      );
}
