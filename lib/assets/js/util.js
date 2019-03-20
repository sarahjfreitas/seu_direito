function show_success_notification(mensagem){
  $.notify({
    icon: "ti-thumb-up",
    message: mensagem
  },{
    type: type[2],
    timer: 4000,
    placement: {
      from: 'top',
      align: 'right'
    }
  });
}
function show_error_notification(mensagem){
  $.notify({
    icon: "ti-thumb-down",
    message: mensagem
  },{
    type: type[4],
    timer: 4000,
    placement: {
      from: 'top',
      align: 'right'
    }
  });
}