var form_validity = [];
var citizenship_field;
var citizenship_id;
var citizenship_typeahead;
var citizenship_input;
var citizenship_countries = [];
var citizenship_country_names = [];

var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];

    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        matches.push(str);
      }
    });

    cb(matches);
  };
};

function initCitizenshipFromId( ) {
  var code = "?";
  var id = citizenship_id.val();
  var name = "";

  $.each (citizenship_countries, function ( c, n ) {
    if ( id == n.id ) {
      name = n.name;
      citizenship_typeahead.typeahead('val', name);
      return false;
    };
  });
};


function checkCitizenship( ) {
  var content = citizenship_typeahead.typeahead('val');
  // var content = citizenship_input.val();

  if(citizenship_countries.length > 0) { // Only execute validation if JSON already filled the list
    var id = "???";
    var legal = false;

    $.each (citizenship_countries, function ( c, n ) {
      if ( content.toLowerCase() == n.name.toLowerCase() ) {
        id = n.id;
        legal = true;
        return false;
      };
    });

    citizenship_id.val(id);

    if(legal) {
      citizenship_field.removeClass('has-danger');
      citizenship_field.addClass('has-success');
      citizenship_input.removeClass('form-control-danger');
      citizenship_input.addClass('form-control-success');
    } else {
      citizenship_field.removeClass('has-success');
      citizenship_field.addClass('has-danger');
      citizenship_input.removeClass('form-control-success');
      citizenship_input.addClass('form-control-danger');
    };
  };
};

function citizenshipIdChanged() {
  var id = citizenship_id.val();
  $.each (citizenship_countries, function ( c, n ) {
    if ( id == n.id ) {
      citizenship_typeahead.val(n.name);
      legal = true;
      return false;
    };
  });

  if (legal) {
    citizenship_field.removeClass('has-danger');
    citizenship_field.addClass('has-success');
    citizenship_input.removeClass('form-control-danger');
    citizenship_input.addClass('form-control-success');
  } else {
    citizenship_field.removeClass('has-success');
    citizenship_field.addClass('has-danger');
    citizenship_input.removeClass('form-control-success');
    citizenship_input.addClass('form-control-danger');
  }
}

function validateCode( param ) {
  var inputid;
  if(typeof param === 'object') {
    inputid = this.id;
  } else {
    inputid = param;
  };
  var input = document.getElementById(inputid);
  var td = document.getElementById('td_'+inputid);
  if(input.value.length == 8) {
    input.className = "form-control form-control-success hdb-form-input";
    td.className = "hdb-form-field has-success";
    form_validity[inputid] = true;
  } else {
    input.className = "form-control form-control-danger hdb-form-input";
    td.className = "hdb-form-field has-danger";
    form_validity[inputid] = false;
  };
};

function validateString( param ) {
  var inputid;
  if(typeof param === 'object') {
    inputid = this.id;
  } else {
    inputid = param;
  };
  var input = document.getElementById(inputid);
  var div = document.getElementById('div_'+inputid);

  if(input.value.length >= 2) {
    input.className = "form-control form-control-success";
    div.className = "col-sm-4 has-success";
    form_validity[inputid] = true;
  } else {
    input.className = "form-control form-control-danger";
    div.className = "col-sm-4 has-danger";
    form_validity[inputid] = false;
  };
};

function validateForm ( field ) {
  var valid = true;
  for (var v in form_validity) {
    // use hasOwnProperty to filter out keys from the Object.prototype
    if (form_validity.hasOwnProperty(v)) {
      if(!form_validity[v]) { valid = false };
    };
  };
  if(valid) {
    $('#btnSubmit').prop('disabled', false);
  } else {
    $('#btnSubmit').prop('disabled', true);
  }
};

function addCodeValidator( fieldid ) {
  var fieldid_td = "#td_" + fieldid;
  var fieldid_input = "#" + fieldid;
  form_validity[fieldid] = false;
  $(fieldid_input).on('input', validateCode);
  validateCode(fieldid);
  $(fieldid_input).on('input', validateForm);
  validateForm();
};

function addStringValidator( fieldid ) {
  var fieldid_div = "#div_" + fieldid;
  form_validity[fieldid] = false;
  var fieldid_input = "#" + fieldid;
  $(fieldid_input).on('input', validateString);
  validateString(fieldid);
  $(fieldid_input).on('input', validateForm);
  validateForm();
};

function checkToggleReferrerFreetext () {
  if ( $('#client_referrer_id').val() == "O") {
    $('#client_referrerfreetext').prop('hidden', false);
    $('#client_referrerfreetext_label').prop('hidden', false);
  } else {
    $('#client_referrerfreetext').prop('hidden', true);
    $('#client_referrerfreetext_label').prop('hidden', true);
  }
}

function toggleRangeBirthdate () {
  if ( $('#birthdate_selectrange').prop('checked') == true) {
    $('#birthdate_rangestart').prop('hidden', false);
    $('#birthdate_rangeend').prop('hidden', false);
  } else {
    $('#birthdate_rangestart').prop('hidden', true);
    $('#birthdate_rangeend').prop('hidden', true);
  }
}

function toggleRangeDatefirstcontact () {
  if ( $('#datefirstcontact_selectrange').prop('checked') == true) {
    $('#datefirstcontact_rangestart').prop('hidden', false);
    $('#datefirstcontact_rangeend').prop('hidden', false);
  } else {
    $('#datefirstcontact_rangestart').prop('hidden', true);
    $('#datefirstcontact_rangeend').prop('hidden', true);
  }
}

function toggleSelectCitizenship () {
  if ( $('#citizenship_select').prop('checked') == true) {
    $('#citizenship_searchinput').prop('hidden', false);
    $('#citizenship_id').prop('hidden', false);
    checkCitizenship();
  } else {
    $('#citizenship_searchinput').prop('hidden', true);
    $('#citizenship_id').prop('hidden', true);
  }
}

$( document ).on('turbolinks:load', function() {


  if( $('#client_searchform').length || $('.client-form').length) {

    // Client Form
    if( $('.client-form').length) {
      citizenship_field = $('#div_client_citizenship_typeahead')
      citizenship_typeahead = $('#div_client_citizenship_typeahead .typeahead');
      citizenship_id = $('#client_citizenship_id');
      citizenship_input = $('#citizenship_input');
    };

    // Client Index/Search Form
    if( $('#client_searchform').length) {
      citizenship_field = $('#citizenship_searchfield');
      citizenship_typeahead = $('#citizenship_searchfield .typeahead');
      citizenship_id = $('#citizenship_id');
      citizenship_input = $('#citizenship_searchinput');
    };


    if (citizenship_countries.length)
    {

      citizenship_typeahead.typeahead({
        hint: true,
        highlight: true,
        minLength: 2
      },
      {
        name: 'citizenship_countries',
        source: substringMatcher(citizenship_country_names)
      });

      citizenship_typeahead.bind('input', checkCitizenship);
      citizenship_typeahead.bind('typeahead:select', checkCitizenship);
      citizenship_typeahead.bind('typeahead:cursorchange', checkCitizenship);
      citizenship_typeahead.bind('typeahead:selected', checkCitizenship);
      citizenship_typeahead.bind('typeahead:change', checkCitizenship);
      citizenship_typeahead.bind('typeahead:idle', checkCitizenship);

      if( $('.client-form').length && citizenship_id.val()) { // If in client input form, init CS name from CS id
        initCitizenshipFromId();
      };

      checkCitizenship();

    } else {

      $.getJSON( "/citizenships.json", function( citizenship_json ) {
        $.each ( citizenship_json, function ( i, x ) {
          citizenship_countries.push( x );
          citizenship_country_names.push( x.name );
        });

        citizenship_typeahead.typeahead({
          hint: true,
          highlight: true,
          minLength: 2
        },
        {
          name: 'citizenship_countries',
          source: substringMatcher(citizenship_country_names)
        });

        citizenship_typeahead.bind('input', checkCitizenship);
        citizenship_typeahead.bind('typeahead:select', checkCitizenship);
        citizenship_typeahead.bind('typeahead:cursorchange', checkCitizenship);
        citizenship_typeahead.bind('typeahead:selected', checkCitizenship);
        citizenship_typeahead.bind('typeahead:change', checkCitizenship);
        citizenship_typeahead.bind('typeahead:idle', checkCitizenship);

        if( $('.client-form').length && citizenship_id.val()) { // If in client input form, init CS name from CS id
          initCitizenshipFromId();
        };

        checkCitizenship();
      });
    };


    // Client Form
    if( $('.client-form').length) {

      $('#client_birthdate_datepicker').datepicker({
        format: "dd.mm.yyyy",
        startDate: "01.01.1900",
        endDate: "today",
        weekStart: 1,
        maxViewMode: 3,
        startView: 3,
        defaultViewDate: { year: 1970, month: 01, day: 01 },
        todayHighlight: true,
        clearBtn: true,
        language: "de",
        autoclose: true
      });

      $('#client_datefirstcontact_datepicker').datepicker({
        format: "dd.mm.yyyy",
        startDate: "09.06.2016",
        endDate: "today",
        weekStart: 1,
        maxViewMode: 3,
        todayHighlight: true,
        todayBtn: "linked",
        clearBtn: true,
        language: "de",
        autoclose: true
      });

      addCodeValidator('client_id');

      $('#client_referrer_id').on('change', checkToggleReferrerFreetext);
      checkToggleReferrerFreetext();

    };

    // Client Index/Search Form
    if( $('#client_searchform').length) {

      $('#birthdate_selectrange').on('change', toggleRangeBirthdate);
      toggleRangeBirthdate();

      $('#birthdate_rangestart').datepicker({
        format: "dd.mm.yyyy",
        startDate: "01.01.1900",
        endDate: "today",
        weekStart: 1,
        maxViewMode: 3,
        startView: 3,
        defaultViewDate: { year: 1970, month: 01, day: 01 },
        todayHighlight: true,
        todayBtn: "linked",
        clearBtn: true,
        language: "de",
        autoclose: true
      });

      $('#birthdate_rangeend').datepicker({
        format: "dd.mm.yyyy",
        startDate: "01.01.1900",
        endDate: "today",
        weekStart: 1,
        maxViewMode: 3,
        startView: 3,
        defaultViewDate: { year: 1970, month: 01, day: 01 },
        todayHighlight: true,
        todayBtn: "linked",
        clearBtn: true,
        language: "de",
        autoclose: true
      });

      $('#datefirstcontact_selectrange').on('change', toggleRangeDatefirstcontact);
      toggleRangeDatefirstcontact();

      $('#datefirstcontact_rangestart').datepicker({
        format: "dd.mm.yyyy",
        startDate: "09.06.2016",
        endDate: "today",
        defaultViewDate: "today",
        weekStart: 1,
        maxViewMode: 3,
        todayHighlight: true,
        todayBtn: "linked",
        clearBtn: true,
        language: "de",
        autoclose: true
      });

      $('#datefirstcontact_rangeend').datepicker({
        format: "dd.mm.yyyy",
        startDate: "09.06.2016",
        endDate: "today",
        defaultViewDate: "today",
        weekStart: 1,
        maxViewMode: 3,
        todayHighlight: true,
        todayBtn: "linked",
        clearBtn: true,
        language: "de",
        autoclose: true
      });

      $('#citizenship_select').on('change', toggleSelectCitizenship);
      toggleSelectCitizenship();

    };

  citizenship_id.on('change', citizenshipIdChanged);

  };


});
