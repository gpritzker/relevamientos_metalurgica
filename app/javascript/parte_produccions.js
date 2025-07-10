window.addDetalleRow = function () {
  const time = new Date().getTime();
  const regexp = new RegExp("new_detalle_produccions", "g");
  const container = document.getElementById('detalles-container');
  const template = document.getElementById('row-template').innerHTML;
  container.insertAdjacentHTML('beforeend', template.replace(regexp, time));
}
