function checkToggleContactreasonFreetext () {
  if ( $('#contact_contactreason_id').val() == "O") {
    $('#contact_contactreasonfreetext').prop('hidden', false);
    $('#contact_contactreasonfreetext_label').prop('hidden', false);
  } else {
    $('#contact_contactreasonfreetext').prop('hidden', true);
    $('#contact_contactreasonfreetext_label').prop('hidden', true);
  }
}

function toggleInsuranceProblem () {
  if ( $('#contact_has_insuranceproblem').prop('checked') == true) {
    $("#contact_insuranceproblem_id option[value='0']").remove();
    $('#contact_insuranceproblem_id').prop('hidden', false);
    $('#contact_insuranceproblem_id_label').prop('hidden', false);
  } else {
    $("#contact_insuranceproblem_id").append('<option value="0">nicht definiert</option>');
    $("#contact_insuranceproblem_id").val('0');
    $('#contact_insuranceproblem_id').prop('hidden', true);
    $('#contact_insuranceproblem_id_label').prop('hidden', true);
  }
}

function toggleHealthProblem () {
  if ( $('#contact_has_healthproblem').prop('checked')) {
    $("#contact_healthproblem_id option[value='0']").remove();
    $('#contact_healthproblem_id').prop('hidden', false);
    $('#contact_healthproblem_id_label').prop('hidden', false);
  } else {
    $("#contact_healthproblem_id").append('<option value="0">nicht definiert</option>');
    $("#contact_healthproblem_id").val('0');
    $('#contact_healthproblem_id').prop('hidden', true);
    $('#contact_healthproblem_id_label').prop('hidden', true);
  }
}

function switchReferrals () {
  if ( $('#contact_referral_id_d').prop('checked')) {
    $("#contact_referraldiakonie_id option[value='0']").remove();
    $('#contact_referraldiakonie_id').prop('hidden', false);
    $('#contact_referraldiakonie_id_label').prop('hidden', false);
  } else {
    $("#contact_referraldiakonie_id").append('<option value="0">nicht definiert</option>');
    $("#contact_referraldiakonie_id").val('0');
    $('#contact_referraldiakonie_id').prop('hidden', true);
    $('#contact_referraldiakonie_id_label').prop('hidden', true);
  };
  if ( $('#contact_referral_id_c').prop('checked')) {
    $("#contact_referralcaritas_id option[value='0']").remove();
    $('#contact_referralcaritas_id').prop('hidden', false);
    $('#contact_referralcaritas_id_label').prop('hidden', false);
  } else {
    $("#contact_referralcaritas_id").append('<option value="0">nicht definiert</option>');
    $("#contact_referralcaritas_id").val('0');
    $('#contact_referralcaritas_id').prop('hidden', true);
    $('#contact_referralcaritas_id_label').prop('hidden', true);
  };
  if ( $('#contact_referral_id_m').prop('checked')) {
    $("#contact_referralmedical_id option[value='0']").remove();
    $('#contact_referralmedical_id').prop('hidden', false);
    $('#contact_referralmedical_id_label').prop('hidden', false);
  } else {
    $("#contact_referralmedical_id").append('<option value="0">nicht definiert</option>');
    $("#contact_referralmedical_id").val('0');
    $('#contact_referralmedical_id').prop('hidden', true);
    $('#contact_referralmedical_id_label').prop('hidden', true);
  };
  if ( $('#contact_referral_id_a').prop('checked')) {
    $("#contact_referralauthority_id option[value='0']").remove();
    $('#contact_referralauthority_id').prop('hidden', false);
    $('#contact_referralauthority_id_label').prop('hidden', false);
  } else {
    $("#contact_referralauthority_id").append('<option value="0">nicht definiert</option>');
    $("#contact_referralauthority_id").val('0');
    $('#contact_referralauthority_id').prop('hidden', true);
    $('#contact_referralauthority_id_label').prop('hidden', true);
  };
  if ( $('#contact_referral_id_b').prop('checked')) {
    $("#contact_referralothercounselling_id option[value='0']").remove();
    $('#contact_referralothercounselling_id').prop('hidden', false);
    $('#contact_referralothercounselling_id_label').prop('hidden', false);
  } else {
    $("#contact_referralothercounselling_id").append('<option value="0">nicht definiert</option>');
    $("#contact_referralothercounselling_id").val('0');
    $('#contact_referralothercounselling_id').prop('hidden', true);
    $('#contact_referralothercounselling_id_label').prop('hidden', true);
  };
}


$( document ).on('turbolinks:load', function() {
  $('#contactdate_datepicker').datepicker({
    format: "dd.mm.yyyy",
    startDate: "09.06.2016",
    endDate: "today",
    defaultViewDate: "today",
    weekStart: 1,
    maxViewMode: 3,
    todayHighlight: true,
    todayBtn: "linked",
    clearBtn: true,
    language: "de"
  });


  $('#contact_contactreason_id').on('change', checkToggleContactreasonFreetext);
  checkToggleContactreasonFreetext();

  $('#contact_has_insuranceproblem').on('change', toggleInsuranceProblem);
  toggleInsuranceProblem();

  $('#contact_has_healthproblem').on('change', toggleHealthProblem);
  toggleHealthProblem();

  $('#contact_referral_id_n').on('change', switchReferrals);
  $('#contact_referral_id_d').on('change', switchReferrals);
  $('#contact_referral_id_c').on('change', switchReferrals);
  $('#contact_referral_id_m').on('change', switchReferrals);
  $('#contact_referral_id_a').on('change', switchReferrals);
  $('#contact_referral_id_b').on('change', switchReferrals);
  $('#contact_referral_id_o').on('change', switchReferrals);
  switchReferrals();


});
