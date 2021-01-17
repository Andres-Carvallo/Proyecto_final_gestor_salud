$(document).on('turbolinks:load', function(){
    
    $('#collaborator-button').click(function (){
        var form2 = document.getElementById("collaborator-form");
        if(form2.style.display == "none"){
            form2.style.display = "block";
        }else{
            form2.style.display = "none";
        }
    }) 
    
    $('#client-button').click(function (){
        var form = document.getElementById("client-form");
        if(form.style.display == "none"){
            form.style.display = "block";
        }else{
            form.style.display = "none";
        }
    }) 
})
