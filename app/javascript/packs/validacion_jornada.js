document.addEventListener("turbo:load", () => {
  const form = document.querySelector("form");
  if (!form) return;

  form.addEventListener("submit", function (e) {
    const tiempoInputs = document.querySelectorAll(".tiempo-empleado");
    const totalTiempo = Array.from(tiempoInputs).reduce((acc, input) => acc + parseInt(input.value || 0), 0);
    const jornada = parseInt(document.querySelector("#parte_produccion_jornada_laboral")?.value || 0);

    if (totalTiempo !== jornada) {
      e.preventDefault();
      alert(`La suma de los tiempos (${totalTiempo} min) no coincide con la jornada laboral de ${jornada} min.`);
    }
  });
});