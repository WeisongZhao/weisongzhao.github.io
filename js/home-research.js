document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.preview-research-grid').forEach(function (grid) {
    grid.addEventListener('toggle', function (event) {
      var current = event.target;

      if (!current.matches('.preview-card-details') || !current.open) {
        return;
      }

      grid.querySelectorAll('.preview-card-details[open]').forEach(function (details) {
        if (details !== current) {
          details.open = false;
        }
      });
    }, true);
  });
});
