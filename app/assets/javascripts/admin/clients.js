$(document).on('turbolinks:load', function() {
    $(".clickable_row tr td:not(:last-child)").click(function() {
        window.location = $(this.closest('tr')).data("url");
    });
});