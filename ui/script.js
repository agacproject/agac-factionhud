// const data = {
//     cash: 382,
//     health: 20,
//     stamina: 80,
//     armor: 0
// }

$(document).ready(function() {
    $('body').fadeIn();
})

window.addEventListener('message', function(event) {
    switch(event.data.type){
        case 'updateHud':
            updateHud(event.data.data);
            break;
    }
})

function updateHud(data) {
    $('#health').css('width', data.health+'%');
    $('#stamina').css('width', data.stamina+'%');
    $('#armor').css('width', data.armor+'%');

    $('#denizCash').html("$"+data.cash);
    $('#health').html("%"+data.health);
    $('#stamina').html("%"+data.stamina+".00");
    $('#armor').html("%"+data.armor+".00");
}
