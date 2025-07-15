document.addEventListener("DOMContentLoaded", () => {
  const addBtn = document.getElementById("add-orden");
  const container = document.getElementById("ordenes-container");
  const template = document.getElementById("orden-template");

  if (addBtn && container && template) {
    addBtn.addEventListener("click", () => {
      const time = new Date().getTime();
      const clone = template.content.cloneNode(true);

      clone.querySelectorAll("[name]").forEach((el) => {
        el.name = el.name.replace(/NEW_INDEX/g, time);
      });

      container.appendChild(clone);
    });

    document.addEventListener("click", (e) => {
      if (e.target && e.target.classList.contains("remove-orden")) {
        e.preventDefault();
        e.target.closest(".orden-servicio-fields").remove();
      }
    });
  }
});