$(document).on('turbolinks:load', function(){
    $('#collaborator-button').click(function (){
        var form = document.getElementById("collaborator-form");
        if(form.style.display == "none"){
            $('#collaborator-form').show();
        }else{
            $('#collaborator-form').hide();
        }
    }) 

    $('#client-button').click(function (){
        var form = document.getElementById("client-form");
        if(form.style.display == "none"){
            $('#client-form').show();
        }else{
            $('#client-form').hide();
        }
    }) 
})

