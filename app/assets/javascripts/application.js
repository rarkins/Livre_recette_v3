// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require quill.global
//= require cloudinary
//= require attachinary
//= require application
//= require_tree .
//= require quill.global

var defaults = {
    theme: 'snow',
    modules: {
        toolbar: [
            [{ 'header': [1, 2, 3, false] }],
            ['bold', 'italic', 'underline'],
            [{ 'list': 'ordered'}, { 'list': 'bullet' }],
            ['clean']
        ]
    }
};

//This is the global config object
Quilljs.setDefaults(defaults)



$(function() {
  $('#soumettre').click(function() {
    $('#search_form').submit();
  });
});
$(function() {
  $('#soumettre_categorie').click(function() {
    $('#new_category').submit();
  });
});
$(function() {
  $('#connexion').click(function() {
    $('#new_user').submit();
  });
});
$(function() {
  $('#sign_up').click(function() {
    $('#new_user').submit();
  });
});
$(function() {
  $('#instructions').click(function() {
    $('#new_user').submit();
  });
});
$(function() {
  $('#Commentaire').click(function() {
    $('#new_comment').submit();
  });
});
$(function() {
  $('#Soumettre').click(function() {
    $('#edit_comment').submit();
  });
});
$(function() {
  $('#soumettre_recette').click(function() {
    $('#edit_comment').submit();
  });
});