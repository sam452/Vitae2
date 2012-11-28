/**
 * Unobtrusive scripting adapter for jQuery
 *
 * Requires jQuery 1.6.0 or later.
 * https://github.com/rails/jquery-ujs

 * Uploading file using rails.js
 * =============================
 *
 * By default, browsers do not allow files to be uploaded via AJAX. As a result, if there are any non-blank file fields
 * in the remote form, this adapter aborts the AJAX submission and allows the form to submit through standard means.
 *
 * The `ajax:aborted:file` event allows you to bind your own handler to process the form submission however you wish.
 *
 * Ex:
 *     $('form').live('ajax:aborted:file', function(event, elements){
 *       // Implement own remote file-transfer handler here for non-blank file inputs passed in `elements`.
 *       // Returning false in this handler tells rails.js to disallow standard form submission
 *       return false;
 *     });
 *
 * The `ajax:aborted:file` event is fired when a file-type input is detected with a non-blank value.
 *
 * Third-party tools can use this hook to detect when an AJAX file upload is attempted, and then use
 * techniques like the iframe method to upload the file instead.
 *
 * Required fields in rails.js
 * ===========================
 *
 * If any blank required inputs (required="required") are detected in the remote form, the whole form submission
 * is canceled. Note that this is unlike file inputs, which still allow standard (non-AJAX) form submission.
 *
 * The `ajax:aborted:required` event allows you to bind your own handler to inform the user of blank required inputs.
 *
 * !! Note that Opera does not fire the form's submit event if there are blank required inputs, so this event may never
 *    get fired in Opera. This event is what causes other browsers to exhibit the same submit-aborting behavior.
 *
 * Ex:
 *     $('form').live('ajax:aborted:required', function(event, elements){
 *       // Returning false in this handler tells rails.js to submit the form anyway.
 *       // The blank required inputs are passed to this function in `elements`.
 *       return ! confirm("Would you like to submit the form with missing info?");
 *     });
 */
(function(e,t){var n;e.rails=n={linkClickSelector:"a[data-confirm], a[data-method], a[data-remote], a[data-disable-with]",inputChangeSelector:"select[data-remote], input[data-remote], textarea[data-remote]",formSubmitSelector:"form",formInputClickSelector:"form input[type=submit], form input[type=image], form button[type=submit], form button:not(button[type])",disableSelector:"input[data-disable-with], button[data-disable-with], textarea[data-disable-with]",enableSelector:"input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled",requiredInputSelector:"input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",fileInputSelector:"input:file",linkDisableSelector:"a[data-disable-with]",CSRFProtection:function(t){var n=e('meta[name="csrf-token"]').attr("content");n&&t.setRequestHeader("X-CSRF-Token",n)},fire:function(t,n,r){var i=e.Event(n);return t.trigger(i,r),i.result!==!1},confirm:function(e){return confirm(e)},ajax:function(t){return e.ajax(t)},handleRemote:function(r){var i,s,o,u=r.data("cross-domain")||null,a=r.data("type")||e.ajaxSettings&&e.ajaxSettings.dataType,f;if(n.fire(r,"ajax:before")){if(r.is("form")){i=r.attr("method"),s=r.attr("action"),o=r.serializeArray();var l=r.data("ujs:submit-button");l&&(o.push(l),r.data("ujs:submit-button",null))}else r.is(n.inputChangeSelector)?(i=r.data("method"),s=r.data("url"),o=r.serialize(),r.data("params")&&(o=o+"&"+r.data("params"))):(i=r.data("method"),s=r.attr("href"),o=r.data("params")||null);f={type:i||"GET",data:o,dataType:a,crossDomain:u,beforeSend:function(e,i){return i.dataType===t&&e.setRequestHeader("accept","*/*;q=0.5, "+i.accepts.script),n.fire(r,"ajax:beforeSend",[e,i])},success:function(e,t,n){r.trigger("ajax:success",[e,t,n])},complete:function(e,t){r.trigger("ajax:complete",[e,t])},error:function(e,t,n){r.trigger("ajax:error",[e,t,n])}},s&&(f.url=s),n.ajax(f)}},handleMethod:function(n){var r=n.attr("href"),i=n.data("method"),s=n.attr("target"),o=e("meta[name=csrf-token]").attr("content"),u=e("meta[name=csrf-param]").attr("content"),a=e('<form method="post" action="'+r+'"></form>'),f='<input name="_method" value="'+i+'" type="hidden" />';u!==t&&o!==t&&(f+='<input name="'+u+'" value="'+o+'" type="hidden" />'),s&&a.attr("target",s),a.hide().append(f).appendTo("body"),a.submit()},disableFormElements:function(t){t.find(n.disableSelector).each(function(){var t=e(this),n=t.is("button")?"html":"val";t.data("ujs:enable-with",t[n]()),t[n](t.data("disable-with")),t.prop("disabled",!0)})},enableFormElements:function(t){t.find(n.enableSelector).each(function(){var t=e(this),n=t.is("button")?"html":"val";t.data("ujs:enable-with")&&t[n](t.data("ujs:enable-with")),t.prop("disabled",!1)})},allowAction:function(e){var t=e.data("confirm"),r=!1,i;return t?(n.fire(e,"confirm")&&(r=n.confirm(t),i=n.fire(e,"confirm:complete",[r])),r&&i):!0},blankInputs:function(t,n,r){var i=e(),s,o=n||"input,textarea";return t.find(o).each(function(){s=e(this);if(r?s.val():!s.val())i=i.add(s)}),i.length?i:!1},nonBlankInputs:function(e,t){return n.blankInputs(e,t,!0)},stopEverything:function(t){return e(t.target).trigger("ujs:everythingStopped"),t.stopImmediatePropagation(),!1},callFormSubmitBindings:function(n){var r=n.data("events"),i=!0;return r!==t&&r.submit!==t&&e.each(r.submit,function(e,t){if(typeof t.handler=="function")return i=t.handler(t.data)}),i},disableElement:function(e){e.data("ujs:enable-with",e.html()),e.html(e.data("disable-with")),e.bind("click.railsDisable",function(e){return n.stopEverything(e)})},enableElement:function(e){e.data("ujs:enable-with")!==t&&(e.html(e.data("ujs:enable-with")),e.data("ujs:enable-with",!1)),e.unbind("click.railsDisable")}},e.ajaxPrefilter(function(e,t,r){e.crossDomain||n.CSRFProtection(r)}),e(n.linkDisableSelector).live("ajax:complete",function(){n.enableElement(e(this))}),e(n.linkClickSelector).live("click.rails",function(r){var i=e(this),s=i.data("method"),o=i.data("params");if(!n.allowAction(i))return n.stopEverything(r);i.is(n.linkDisableSelector)&&n.disableElement(i);if(i.data("remote")!==t)return(r.metaKey||r.ctrlKey)&&(!s||s==="GET")&&!o?!0:(n.handleRemote(i),!1);if(i.data("method"))return n.handleMethod(i),!1}),e(n.inputChangeSelector).live("change.rails",function(t){var r=e(this);return n.allowAction(r)?(n.handleRemote(r),!1):n.stopEverything(t)}),e(n.formSubmitSelector).live("submit.rails",function(r){var i=e(this),s=i.data("remote")!==t,o=n.blankInputs(i,n.requiredInputSelector),u=n.nonBlankInputs(i,n.fileInputSelector);if(!n.allowAction(i))return n.stopEverything(r);if(o&&i.attr("novalidate")==t&&n.fire(i,"ajax:aborted:required",[o]))return n.stopEverything(r);if(s)return u?n.fire(i,"ajax:aborted:file",[u]):!e.support.submitBubbles&&n.callFormSubmitBindings(i)===!1?n.stopEverything(r):(n.handleRemote(i),!1);setTimeout(function(){n.disableFormElements(i)},13)}),e(n.formInputClickSelector).live("click.rails",function(t){var r=e(this);if(!n.allowAction(r))return n.stopEverything(t);var i=r.attr("name"),s=i?{name:i,value:r.val()}:null;r.closest("form").data("ujs:submit-button",s)}),e(n.formSubmitSelector).live("ajax:beforeSend.rails",function(t){this==t.target&&n.disableFormElements(e(this))}),e(n.formSubmitSelector).live("ajax:complete.rails",function(t){this==t.target&&n.enableFormElements(e(this))})})(jQuery);