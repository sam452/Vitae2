﻿$(document).ready(function () {
    $('<div id="ContentDialog"><div id="ContentDialogContent"><img src="assets/ajax-loader.gif" /></div><a href="#" id="hlContentDialogClose">Close</a></div>').appendTo('body');
    $('<div id="ModalOverlay"></div>').appendTo('body');

    $(".contentDialog").click(function (e) {
        $("#ContentDialog #ContentDialogContent").load($(this).attr("href"));
        $("#ContentDialog #ContentDialogTitle").text($(this).attr("title"));
        $("#ContentDialog").show();
        $("#ModalOverlay").show();
        $("body").scrollTop(0);
        e.preventDefault();
    });

    $("#hlContentDialogClose").click(function (e) {
        $("#ContentDialog").hide();
        $("#ModalOverlay").hide();
        e.preventDefault();
    });
});