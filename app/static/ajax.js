$(document).ready(function () {
    $("form").on("submit", function (event) {
      $.ajax({
        data: {
          firstName: $("#firstName").val(),
          lastName: $("#lastName").val(),
        },
        type: "POST",
        url: "/robotframework",
      }).done(function (data) {
        $("#output").text(data.output).show();
        $("#output").text(data.error).show();
      });
      event.preventDefault();
    });
    $.ajax({
      url: "/frameworks",
      type: "GET",
      success: function (data) {
        const frameworks = data.frameworks;
        $(".data").append('<table class="table"></table>');
        $(".table").append(
          "<tr><th>Framework</th><th>Author</th><th>Commits</th><th>Open Source</th></tr>"
        );
  
        frameworks.forEach((element) => {
          $(".table").append(
            `<tr><td>${element.name}</td><td>${element.props.author}</td><td>${element.props.commits}</td><td>${element.props.opensource}</td></tr>`
          );
        });
      },
      error: function () {
        $(".data").append(
            `<div id="frameworkError" class="alert alert-danger" role="alert">ERROR: retrieving framework information failed</div>`
        );
      },
    });
});

function generateError() {
    console.error("THIS IS A VERY SERIOUS CONSOLE ERROR, PAYMENT FAILED")
}
