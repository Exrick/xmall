/*-----------H-ui前端框架-------------
* H-ui.js v3.1.3
* http://www.h-ui.net/
* Created & Modified by guojunhui
* Date modified 2017.05.26
*
* Copyright 2013-2017 北京颖杰联创科技有限公司 All rights reserved.
* Licensed under MIT license.
* http://opensource.org/licenses/MIT
*/
/*
Includes：
jQuery.IEMobileHack.js
jQuery.cookie.js v1.4.1
jQuery.form.js v3.51.0
jQuery.lazyload.js v1.9.3
jQuery.responsive-nav.js v1.0.39
jQuery.placeholder.js
jQuery.emailsuggest.js v1.0
jQuery.format.js
jQuery.togglePassword.js
jQuery.iCheck.js
jQuery.raty.js v2.4.5
jQuery.onePageNav.js
jQuery.stickUp.js
jQuery.ColorPicker.js

jQuery.HuiaddFavorite.js
jQuery.Huisethome.js
jQuery.Huisidenav.js
jQuery.Huihover.js v2.0
jQuery.Huifocusblur.js V2.0
jQuery.Huiselect.js
jQuery.Huitab.js v2.0
jQuery.Huifold.js v2.0
jQuery.Huitags.js v2.0
jQuery.Huitagsmixed.js
jQuery.Huitextarealength.js v2.0
jQuery.Huipreview.js v2.0
jQuery.Huimodalalert.js
jQuery.Huialert.js
jQuery.Huitotop.js v2.0
jQuery.Huimarquee.js
jQuery.Huispinner.js v2.0

Bootstrap.modal.js v3.3.0
Bootstrap.dropdown.js v3.3.0
Bootstrap.transition.js v3.3.0
Bootstrap.tooltip.js v3.3.0
Bootstrap.popover.js v3.3.0
Bootstrap.alert.js v3.3.0
Bootstrap.slider.js v1.0.1
Bootstrap.datetimepicker.js
Bootstrap.Switch v1.3

*/
/* =======================================================================
 * jQuery.IEMobileHack.js判断浏览器
 * ======================================================================== */
!function(){
	if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
		var msViewportStyle = document.createElement("style");
		msViewportStyle.appendChild(
			document.createTextNode(
				"@-ms-viewport{width:auto!important}"
			)
		);
		document.getElementsByTagName("head")[0].appendChild(msViewportStyle);
	}
} ();

/* =======================================================================
 * jQuery.stopDefault.js 阻止默认浏览器动作
 * ======================================================================== */
function stopDefault(e) {
	if (e && e.preventDefault) e.preventDefault();
	//IE中阻止函数器默认动作的方式
	else window.event.returnValue = false;
	return false;
}

/* =======================================================================
 * jQuery.cookie.js v1.4.1
 * https://github.com/carhartl/jQuery-cookie
 *
 * Copyright 2006, 2014 Klaus Hartl
 * Released under the MIT license
 * ======================================================================== */
!(function(factory) {
	if (typeof define === 'function' && define.amd) {
		// AMD (Register as an anonymous module)
		define(['jquery'], factory);
	} else if (typeof exports === 'object') {
		// Node/CommonJS
		module.exports = factory(require('jquery'));
	} else {
		// Browser globals
		factory(jQuery);
	}
}
(function($){
	var pluses = /\+/g;
	function encode(s) {
		return config.raw ? s : encodeURIComponent(s);
	}
	function decode(s) {
		return config.raw ? s : decodeURIComponent(s);
	}
	function stringifyCookieValue(value) {
		return encode(config.json ? JSON.stringify(value) : String(value));
	}
	function parseCookieValue(s) {
		if (s.indexOf('"') === 0) {
			// This is a quoted cookie as according to RFC2068, unescape...
			s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
		}

		try {
			// Replace server-side written pluses with spaces.
			// If we can't decode the cookie, ignore it, it's unusable.
			// If we can't parse the cookie, ignore it, it's unusable.
			s = decodeURIComponent(s.replace(pluses, ' '));
			return config.json ? JSON.parse(s) : s;
		} catch(e) {}
	}
	function read(s, converter) {
		var value = config.raw ? s: parseCookieValue(s);
		return $.isFunction(converter) ? converter(value) : value;
	}
	var config = $.cookie = function(key, value, options) {
		// Write
		if (arguments.length > 1 && !$.isFunction(value)) {
			options = $.extend({},
			config.defaults, options);

			if (typeof options.expires === 'number') {
				var days = options.expires,
				t = options.expires = new Date();
				t.setMilliseconds(t.getMilliseconds() + days * 864e+5);
			}

			return (document.cookie = [encode(key), '=', stringifyCookieValue(value), options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
			options.path ? '; path=' + options.path: '', options.domain ? '; domain=' + options.domain: '', options.secure ? '; secure': ''].join(''));
		}
		// Read
		var result = key ? undefined: {},
		// To prevent the for loop in the first place assign an empty array
		// in case there are no cookies at all. Also prevents odd result when
		// calling $.cookie().
		cookies = document.cookie ? document.cookie.split('; ') : [],
		i = 0,
		l = cookies.length;
		for (; i < l; i++) {
			var parts = cookies[i].split('='),
			name = decode(parts.shift()),
			cookie = parts.join('=');
			if (key === name) {
				// If second argument (value) is a function it's a converter...
				result = read(cookie, value);
				break;
			}
			// Prevent storing a cookie that we couldn't decode.
			if (!key && (cookie = read(cookie)) !== undefined) {
				result[name] = cookie;
			}
		}
		return result;
	};
	config.defaults = {};
	$.removeCookie = function(key, options) {
		// Must not alter options, thus extending a fresh object...
		$.cookie(key, '', $.extend({},
		options, {
			expires: -1
		}));
		return ! $.cookie(key);
	};
}));

/* =======================================================================
 * jQuery.form.js Plugin v3.51.0 2014.06.20
 * Requires jQuery v1.5 or later
 * Copyright (c) 2014 M. Alsup
 * Examples and documentation at: http://malsup.com/jquery/form/
 * Project repository: https://github.com/malsup/form
 * Dual licensed under the MIT and GPL licenses.
 * https://github.com/malsup/form#copyright-and-license
 * ======================================================================== */
// AMD support
(function(factory) {
	"use strict";
	if (typeof define === 'function' && define.amd) {
		// using AMD; register as anon module
		define(['jquery'], factory);
	} else {
		// no AMD; invoke directly
		factory((typeof(jQuery) != 'undefined') ? jQuery: window.Zepto);
	}
} (function($) {
	"use strict";
	/*
			Usage Note:
			-----------
			Do not use both ajaxSubmit and ajaxForm on the same form.  These
			functions are mutually exclusive.  Use ajaxSubmit if you want
			to bind your own submit handler to the form.  For example,
		
			$(document).ready(function() {
				$('#myForm').on('submit', function(e) {
					e.preventDefault(); // <-- important
					$(this).ajaxSubmit({
						target: '#output'
					});
				});
			});
		
			Use ajaxForm when you want the plugin to manage all the event binding
			for you.  For example,
		
			$(document).ready(function() {
				$('#myForm').ajaxForm({
					target: '#output'
				});
			});
		
			You can also use ajaxForm with delegation (requires jQuery v1.7+), so the
			form does not have to exist when you invoke ajaxForm:
		
			$('#myForm').ajaxForm({
				delegation: true,
				target: '#output'
			});
		
			When using ajaxForm, the ajaxSubmit function will be invoked for you
			at the appropriate time.
		*/
	/**
		 * Feature detection
		 */
	var feature = {};
	feature.fileapi = $("<input type='file'/>").get(0).files !== undefined;
	feature.formdata = window.FormData !== undefined;
	var hasProp = !!$.fn.prop;
	// attr2 uses prop when it can but checks the return type for
	// an expected string.  this accounts for the case where a form 
	// contains inputs with names like "action" or "method"; in those
	// cases "prop" returns the element
	$.fn.attr2 = function() {
		if (!hasProp) {
			return this.attr.apply(this, arguments);
		}
		var val = this.prop.apply(this, arguments);
		if ((val && val.jquery) || typeof val === 'string') {
			return val;
		}
		return this.attr.apply(this, arguments);
	};

	/**
		 * ajaxSubmit() provides a mechanism for immediately submitting
		 * an HTML form using AJAX.
		 */
	$.fn.ajaxSubmit = function(options) {
		/*jshint scripturl:true */
		// fast fail if nothing selected (http://dev.jquery.com/ticket/2752)
		if (!this.length) {
			log('ajaxSubmit: skipping submit process - no element selected');
			return this;
		}
		var method, action, url, $form = this;
		if (typeof options == 'function') {
			options = {
				success: options
			};
		} else if (options === undefined) {
			options = {};
		}
		method = options.type || this.attr2('method');
		action = options.url || this.attr2('action');
		url = (typeof action === 'string') ? $.trim(action) : '';
		url = url || window.location.href || '';
		if (url) {
			// clean url (don't include hash vaue)
			url = (url.match(/^([^#]+)/) || [])[1];
		}

		options = $.extend(true, {
			url: url,
			success: $.ajaxSettings.success,
			type: method || $.ajaxSettings.type,
			iframeSrc: /^https/i.test(window.location.href || '') ? 'javascript:false': 'about:blank'
		},
		options);

		// hook for manipulating the form data before it is extracted;
		// convenient for use with rich editors like tinyMCE or FCKEditor
		var veto = {};
		this.trigger('form-pre-serialize', [this, options, veto]);
		if (veto.veto) {
			log('ajaxSubmit: submit vetoed via form-pre-serialize trigger');
			return this;
		}

		// provide opportunity to alter form data before it is serialized
		if (options.beforeSerialize && options.beforeSerialize(this, options) === false) {
			log('ajaxSubmit: submit aborted via beforeSerialize callback');
			return this;
		}

		var traditional = options.traditional;
		if (traditional === undefined) {
			traditional = $.ajaxSettings.traditional;
		}

		var elements = [];
		var qx, a = this.formToArray(options.semantic, elements);
		if (options.data) {
			options.extraData = options.data;
			qx = $.param(options.data, traditional);
		}

		// give pre-submit callback an opportunity to abort the submit
		if (options.beforeSubmit && options.beforeSubmit(a, this, options) === false) {
			log('ajaxSubmit: submit aborted via beforeSubmit callback');
			return this;
		}

		// fire vetoable 'validate' event
		this.trigger('form-submit-validate', [a, this, options, veto]);
		if (veto.veto) {
			log('ajaxSubmit: submit vetoed via form-submit-validate trigger');
			return this;
		}

		var q = $.param(a, traditional);
		if (qx) {
			q = (q ? (q + '&' + qx) : qx);
		}
		if (options.type.toUpperCase() == 'GET') {
			options.url += (options.url.indexOf('?') >= 0 ? '&': '?') + q;
			options.data = null; // data is null for 'get'
		} else {
			options.data = q; // data is the query string for 'post'
		}

		var callbacks = [];
		if (options.resetForm) {
			callbacks.push(function() {
				$form.resetForm();
			});
		}
		if (options.clearForm) {
			callbacks.push(function() {
				$form.clearForm(options.includeHidden);
			});
		}

		// perform a load on the target only if dataType is not provided
		if (!options.dataType && options.target) {
			var oldSuccess = options.success ||
			function() {};
			callbacks.push(function(data) {
				var fn = options.replaceTarget ? 'replaceWith': 'html';
				$(options.target)[fn](data).each(oldSuccess, arguments);
			});
		} else if (options.success) {
			callbacks.push(options.success);
		}

		options.success = function(data, status, xhr) { // jQuery 1.4+ passes xhr as 3rd arg
			var context = options.context || this; // jQuery 1.4+ supports scope context
			for (var i = 0,
			max = callbacks.length; i < max; i++) {
				callbacks[i].apply(context, [data, status, xhr || $form, $form]);
			}
		};

		if (options.error) {
			var oldError = options.error;
			options.error = function(xhr, status, error) {
				var context = options.context || this;
				oldError.apply(context, [xhr, status, error, $form]);
			};
		}

		if (options.complete) {
			var oldComplete = options.complete;
			options.complete = function(xhr, status) {
				var context = options.context || this;
				oldComplete.apply(context, [xhr, status, $form]);
			};
		}

		// are there files to upload?
		// [value] (issue #113), also see comment:
		// https://github.com/malsup/form/commit/588306aedba1de01388032d5f42a60159eea9228#commitcomment-2180219
		var fileInputs = $('input[type=file]:enabled', this).filter(function() {
			return $(this).val() !== '';
		});

		var hasFileInputs = fileInputs.length > 0;
		var mp = 'multipart/form-data';
		var multipart = ($form.attr('enctype') == mp || $form.attr('encoding') == mp);

		var fileAPI = feature.fileapi && feature.formdata;
		log("fileAPI :" + fileAPI);
		var shouldUseFrame = (hasFileInputs || multipart) && !fileAPI;

		var jqxhr;

		// options.iframe allows user to force iframe mode
		// 06-NOV-09: now defaulting to iframe mode if file input is detected
		if (options.iframe !== false && (options.iframe || shouldUseFrame)) {
			// hack to fix Safari hang (thanks to Tim Molendijk for this)
			// see:  http://groups.google.com/group/jquery-dev/browse_thread/thread/36395b7ab510dd5d
			if (options.closeKeepAlive) {
				$.get(options.closeKeepAlive,
				function() {
					jqxhr = fileUploadIframe(a);
				});
			} else {
				jqxhr = fileUploadIframe(a);
			}
		} else if ((hasFileInputs || multipart) && fileAPI) {
			jqxhr = fileUploadXhr(a);
		} else {
			jqxhr = $.ajax(options);
		}

		$form.removeData('jqxhr').data('jqxhr', jqxhr);

		// clear element array
		for (var k = 0; k < elements.length; k++) {
			elements[k] = null;
		}

		// fire 'notify' event
		this.trigger('form-submit-notify', [this, options]);
		return this;

		// utility fn for deep serialization
		function deepSerialize(extraData) {
			var serialized = $.param(extraData, options.traditional).split('&');
			var len = serialized.length;
			var result = [];
			var i, part;
			for (i = 0; i < len; i++) {
				// #252; undo param space replacement
				serialized[i] = serialized[i].replace(/\+/g, ' ');
				part = serialized[i].split('=');
				// #278; use array instead of object storage, favoring array serializations
				result.push([decodeURIComponent(part[0]), decodeURIComponent(part[1])]);
			}
			return result;
		}

		// XMLHttpRequest Level 2 file uploads (big hat tip to francois2metz)
		function fileUploadXhr(a) {
			var formdata = new FormData();

			for (var i = 0; i < a.length; i++) {
				formdata.append(a[i].name, a[i].value);
			}

			if (options.extraData) {
				var serializedData = deepSerialize(options.extraData);
				for (i = 0; i < serializedData.length; i++) {
					if (serializedData[i]) {
						formdata.append(serializedData[i][0], serializedData[i][1]);
					}
				}
			}

			options.data = null;

			var s = $.extend(true, {},
			$.ajaxSettings, options, {
				contentType: false,
				processData: false,
				cache: false,
				type: method || 'POST'
			});

			if (options.uploadProgress) {
				// workaround because jqXHR does not expose upload property
				s.xhr = function() {
					var xhr = $.ajaxSettings.xhr();
					if (xhr.upload) {
						xhr.upload.addEventListener('progress',
						function(event) {
							var percent = 0;
							var position = event.loaded || event.position;
							/*event.position is deprecated*/
							var total = event.total;
							if (event.lengthComputable) {
								percent = Math.ceil(position / total * 100);
							}
							options.uploadProgress(event, position, total, percent);
						},
						false);
					}
					return xhr;
				};
			}

			s.data = null;
			var beforeSend = s.beforeSend;
			s.beforeSend = function(xhr, o) {
				//Send FormData() provided by user
				if (options.formData) {
					o.data = options.formData;
				} else {
					o.data = formdata;
				}
				if (beforeSend) {
					beforeSend.call(this, xhr, o);
				}
			};
			return $.ajax(s);
		}

		// private function for handling file uploads (hat tip to YAHOO!)
		function fileUploadIframe(a) {
			var form = $form[0],
			el,
			i,
			s,
			g,
			id,
			$io,
			io,
			xhr,
			sub,
			n,
			timedOut,
			timeoutHandle;
			var deferred = $.Deferred();

			// #341
			deferred.abort = function(status) {
				xhr.abort(status);
			};

			if (a) {
				// ensure that every serialized input is still enabled
				for (i = 0; i < elements.length; i++) {
					el = $(elements[i]);
					if (hasProp) {
						el.prop('disabled', false);
					} else {
						el.removeAttr('disabled');
					}
				}
			}

			s = $.extend(true, {},
			$.ajaxSettings, options);
			s.context = s.context || s;
			id = 'jqFormIO' + (new Date().getTime());
			if (s.iframeTarget) {
				$io = $(s.iframeTarget);
				n = $io.attr2('name');
				if (!n) {
					$io.attr2('name', id);
				} else {
					id = n;
				}
			} else {
				$io = $('<iframe name="' + id + '" src="' + s.iframeSrc + '" />');
				$io.css({
					position: 'absolute',
					top: '-1000px',
					left: '-1000px'
				});
			}
			io = $io[0];

			xhr = { // mock object
				aborted: 0,
				responseText: null,
				responseXML: null,
				status: 0,
				statusText: 'n/a',
				getAllResponseHeaders: function() {},
				getResponseHeader: function() {},
				setRequestHeader: function() {},
				abort: function(status) {
					var e = (status === 'timeout' ? 'timeout': 'aborted');
					log('aborting upload... ' + e);
					this.aborted = 1;

					try { // #214, #257
						if (io.contentWindow.document.execCommand) {
							io.contentWindow.document.execCommand('Stop');
						}
					} catch(ignore) {}

					$io.attr('src', s.iframeSrc); // abort op in progress
					xhr.error = e;
					if (s.error) {
						s.error.call(s.context, xhr, e, status);
					}
					if (g) {
						$.event.trigger("ajaxError", [xhr, s, e]);
					}
					if (s.complete) {
						s.complete.call(s.context, xhr, e);
					}
				}
			};

			g = s.global;
			// trigger ajax global events so that activity/block indicators work like normal
			if (g && 0 === $.active++) {
				$.event.trigger("ajaxStart");
			}
			if (g) {
				$.event.trigger("ajaxSend", [xhr, s]);
			}

			if (s.beforeSend && s.beforeSend.call(s.context, xhr, s) === false) {
				if (s.global) {
					$.active--;
				}
				deferred.reject();
				return deferred;
			}
			if (xhr.aborted) {
				deferred.reject();
				return deferred;
			}

			// add submitting element to data if we know it
			sub = form.clk;
			if (sub) {
				n = sub.name;
				if (n && !sub.disabled) {
					s.extraData = s.extraData || {};
					s.extraData[n] = sub.value;
					if (sub.type == "image") {
						s.extraData[n + '.x'] = form.clk_x;
						s.extraData[n + '.y'] = form.clk_y;
					}
				}
			}

			var CLIENT_TIMEOUT_ABORT = 1;
			var SERVER_ABORT = 2;

			function getDoc(frame) {
				/* it looks like contentWindow or contentDocument do not
					 * carry the protocol property in ie8, when running under ssl
					 * frame.document is the only valid response document, since
					 * the protocol is know but not on the other two objects. strange?
					 * "Same origin policy" http://en.wikipedia.org/wiki/Same_origin_policy
					 */

				var doc = null;

				// IE8 cascading access check
				try {
					if (frame.contentWindow) {
						doc = frame.contentWindow.document;
					}
				} catch(err) {
					// IE8 access denied under ssl & missing protocol
					log('cannot get iframe.contentWindow document: ' + err);
				}

				if (doc) { // successful getting content
					return doc;
				}

				try { // simply checking may throw in ie8 under ssl or mismatched protocol
					doc = frame.contentDocument ? frame.contentDocument: frame.document;
				} catch(err) {
					// last attempt
					log('cannot get iframe.contentDocument: ' + err);
					doc = frame.document;
				}
				return doc;
			}

			// Rails CSRF hack (thanks to Yvan Barthelemy)
			var csrf_token = $('meta[name=csrf-token]').attr('content');
			var csrf_param = $('meta[name=csrf-param]').attr('content');
			if (csrf_param && csrf_token) {
				s.extraData = s.extraData || {};
				s.extraData[csrf_param] = csrf_token;
			}

			// take a breath so that pending repaints get some cpu time before the upload starts
			function doSubmit() {
				// make sure form attrs are set
				var t = $form.attr2('target'),
				a = $form.attr2('action'),
				mp = 'multipart/form-data',
				et = $form.attr('enctype') || $form.attr('encoding') || mp;

				// update form attrs in IE friendly way
				form.setAttribute('target', id);
				if (!method || /post/i.test(method)) {
					form.setAttribute('method', 'POST');
				}
				if (a != s.url) {
					form.setAttribute('action', s.url);
				}

				// ie borks in some cases when setting encoding
				if (!s.skipEncodingOverride && (!method || /post/i.test(method))) {
					$form.attr({
						encoding: 'multipart/form-data',
						enctype: 'multipart/form-data'
					});
				}

				// support timout
				if (s.timeout) {
					timeoutHandle = setTimeout(function() {
						timedOut = true;
						cb(CLIENT_TIMEOUT_ABORT);
					},
					s.timeout);
				}

				// look for server aborts
				function checkState() {
					try {
						var state = getDoc(io).readyState;
						log('state = ' + state);
						if (state && state.toLowerCase() == 'uninitialized') {
							setTimeout(checkState, 50);
						}
					} catch(e) {
						log('Server abort: ', e, ' (', e.name, ')');
						cb(SERVER_ABORT);
						if (timeoutHandle) {
							clearTimeout(timeoutHandle);
						}
						timeoutHandle = undefined;
					}
				}

				// add "extra" data to form if provided in options
				var extraInputs = [];
				try {
					if (s.extraData) {
						for (var n in s.extraData) {
							if (s.extraData.hasOwnProperty(n)) {
								// if using the $.param format that allows for multiple values with the same name
								if ($.isPlainObject(s.extraData[n]) && s.extraData[n].hasOwnProperty('name') && s.extraData[n].hasOwnProperty('value')) {
									extraInputs.push($('<input type="hidden" name="' + s.extraData[n].name + '">').val(s.extraData[n].value).appendTo(form)[0]);
								} else {
									extraInputs.push($('<input type="hidden" name="' + n + '">').val(s.extraData[n]).appendTo(form)[0]);
								}
							}
						}
					}

					if (!s.iframeTarget) {
						// add iframe to doc and submit the form
						$io.appendTo('body');
					}
					if (io.attachEvent) {
						io.attachEvent('onload', cb);
					} else {
						io.addEventListener('load', cb, false);
					}
					setTimeout(checkState, 15);

					try {
						form.submit();
					} catch(err) {
						// just in case form has element with name/id of 'submit'
						var submitFn = document.createElement('form').submit;
						submitFn.apply(form);
					}
				} finally {
					// reset attrs and remove "extra" input elements
					form.setAttribute('action', a);
					form.setAttribute('enctype', et); // #380
					if (t) {
						form.setAttribute('target', t);
					} else {
						$form.removeAttr('target');
					}
					$(extraInputs).remove();
				}
			}

			if (s.forceSync) {
				doSubmit();
			} else {
				setTimeout(doSubmit, 10); // this lets dom updates render
			}

			var data, doc, domCheckCount = 50,
			callbackProcessed;

			function cb(e) {
				if (xhr.aborted || callbackProcessed) {
					return;
				}

				doc = getDoc(io);
				if (!doc) {
					log('cannot access response document');
					e = SERVER_ABORT;
				}
				if (e === CLIENT_TIMEOUT_ABORT && xhr) {
					xhr.abort('timeout');
					deferred.reject(xhr, 'timeout');
					return;
				} else if (e == SERVER_ABORT && xhr) {
					xhr.abort('server abort');
					deferred.reject(xhr, 'error', 'server abort');
					return;
				}

				if (!doc || doc.location.href == s.iframeSrc) {
					// response not received yet
					if (!timedOut) {
						return;
					}
				}
				if (io.detachEvent) {
					io.detachEvent('onload', cb);
				} else {
					io.removeEventListener('load', cb, false);
				}

				var status = 'success',
				errMsg;
				try {
					if (timedOut) {
						throw 'timeout';
					}

					var isXml = s.dataType == 'xml' || doc.XMLDocument || $.isXMLDoc(doc);
					log('isXml=' + isXml);
					if (!isXml && window.opera && (doc.body === null || !doc.body.innerHTML)) {
						if (--domCheckCount) {
							// in some browsers (Opera) the iframe DOM is not always traversable when
							// the onload callback fires, so we loop a bit to accommodate
							log('requeing onLoad callback, DOM not available');
							setTimeout(cb, 250);
							return;
						}
						// let this fall through because server response could be an empty document
						//log('Could not access iframe DOM after mutiple tries.');
						//throw 'DOMException: not available';
					}

					//log('response detected');
					var docRoot = doc.body ? doc.body: doc.documentElement;
					xhr.responseText = docRoot ? docRoot.innerHTML: null;
					xhr.responseXML = doc.XMLDocument ? doc.XMLDocument: doc;
					if (isXml) {
						s.dataType = 'xml';
					}
					xhr.getResponseHeader = function(header) {
						var headers = {
							'content-type': s.dataType
						};
						return headers[header.toLowerCase()];
					};
					// support for XHR 'status' & 'statusText' emulation :
					if (docRoot) {
						xhr.status = Number(docRoot.getAttribute('status')) || xhr.status;
						xhr.statusText = docRoot.getAttribute('statusText') || xhr.statusText;
					}

					var dt = (s.dataType || '').toLowerCase();
					var scr = /(json|script|text)/.test(dt);
					if (scr || s.textarea) {
						// see if user embedded response in textarea
						var ta = doc.getElementsByTagName('textarea')[0];
						if (ta) {
							xhr.responseText = ta.value;
							// support for XHR 'status' & 'statusText' emulation :
							xhr.status = Number(ta.getAttribute('status')) || xhr.status;
							xhr.statusText = ta.getAttribute('statusText') || xhr.statusText;
						} else if (scr) {
							// account for browsers injecting pre around json response
							var pre = doc.getElementsByTagName('pre')[0];
							var b = doc.getElementsByTagName('body')[0];
							if (pre) {
								xhr.responseText = pre.textContent ? pre.textContent: pre.innerText;
							} else if (b) {
								xhr.responseText = b.textContent ? b.textContent: b.innerText;
							}
						}
					} else if (dt == 'xml' && !xhr.responseXML && xhr.responseText) {
						xhr.responseXML = toXml(xhr.responseText);
					}

					try {
						data = httpData(xhr, dt, s);
					} catch(err) {
						status = 'parsererror';
						xhr.error = errMsg = (err || status);
					}
				} catch(err) {
					log('error caught: ', err);
					status = 'error';
					xhr.error = errMsg = (err || status);
				}

				if (xhr.aborted) {
					log('upload aborted');
					status = null;
				}

				if (xhr.status) { // we've set xhr.status
					status = (xhr.status >= 200 && xhr.status < 300 || xhr.status === 304) ? 'success': 'error';
				}

				// ordering of these callbacks/triggers is odd, but that's how $.ajax does it
				if (status === 'success') {
					if (s.success) {
						s.success.call(s.context, data, 'success', xhr);
					}
					deferred.resolve(xhr.responseText, 'success', xhr);
					if (g) {
						$.event.trigger("ajaxSuccess", [xhr, s]);
					}
				} else if (status) {
					if (errMsg === undefined) {
						errMsg = xhr.statusText;
					}
					if (s.error) {
						s.error.call(s.context, xhr, status, errMsg);
					}
					deferred.reject(xhr, 'error', errMsg);
					if (g) {
						$.event.trigger("ajaxError", [xhr, s, errMsg]);
					}
				}

				if (g) {
					$.event.trigger("ajaxComplete", [xhr, s]);
				}

				if (g && !--$.active) {
					$.event.trigger("ajaxStop");
				}

				if (s.complete) {
					s.complete.call(s.context, xhr, status);
				}

				callbackProcessed = true;
				if (s.timeout) {
					clearTimeout(timeoutHandle);
				}

				// clean up
				setTimeout(function() {
					if (!s.iframeTarget) {
						$io.remove();
					} else { //adding else to clean up existing iframe response.
						$io.attr('src', s.iframeSrc);
					}
					xhr.responseXML = null;
				},
				100);
			}

			var toXml = $.parseXML ||
			function(s, doc) { // use parseXML if available (jQuery 1.5+)
				if (window.ActiveXObject) {
					doc = new ActiveXObject('Microsoft.XMLDOM');
					doc.async = 'false';
					doc.loadXML(s);
				} else {
					doc = (new DOMParser()).parseFromString(s, 'text/xml');
				}
				return (doc && doc.documentElement && doc.documentElement.nodeName != 'parsererror') ? doc: null;
			};
			var parseJSON = $.parseJSON ||
			function(s) {
				/*jslint evil:true */
				return window['eval']('(' + s + ')');
			};

			var httpData = function(xhr, type, s) { // mostly lifted from jq1.4.4
				var ct = xhr.getResponseHeader('content-type') || '',
				xml = type === 'xml' || !type && ct.indexOf('xml') >= 0,
				data = xml ? xhr.responseXML: xhr.responseText;

				if (xml && data.documentElement.nodeName === 'parsererror') {
					if ($.error) {
						$.error('parsererror');
					}
				}
				if (s && s.dataFilter) {
					data = s.dataFilter(data, type);
				}
				if (typeof data === 'string') {
					if (type === 'json' || !type && ct.indexOf('json') >= 0) {
						data = parseJSON(data);
					} else if (type === "script" || !type && ct.indexOf("javascript") >= 0) {
						$.globalEval(data);
					}
				}
				return data;
			};

			return deferred;
		}
	};

	/**
		 * ajaxForm() provides a mechanism for fully automating form submission.
		 *
		 * The advantages of using this method instead of ajaxSubmit() are:
		 *
		 * 1: This method will include coordinates for <input type="image" /> elements (if the element
		 *    is used to submit the form).
		 * 2. This method will include the submit element's name/value data (for the element that was
		 *    used to submit the form).
		 * 3. This method binds the submit() method to the form for you.
		 *
		 * The options argument for ajaxForm works exactly as it does for ajaxSubmit.  ajaxForm merely
		 * passes the options argument along after properly binding events for submit elements and
		 * the form itself.
		 */
	$.fn.ajaxForm = function(options) {
		options = options || {};
		options.delegation = options.delegation && $.isFunction($.fn.on);

		// in jQuery 1.3+ we can fix mistakes with the ready state
		if (!options.delegation && this.length === 0) {
			var o = {
				s: this.selector,
				c: this.context
			};
			if (!$.isReady && o.s) {
				log('DOM not ready, queuing ajaxForm');
				$(function() {
					$(o.s, o.c).ajaxForm(options);
				});
				return this;
			}
			// is your DOM ready?  http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
			log('terminating; zero elements found by selector' + ($.isReady ? '': ' (DOM not ready)'));
			return this;
		}

		if (options.delegation) {
			$(document).off('submit.form-plugin', this.selector, doAjaxSubmit).off('click.form-plugin', this.selector, captureSubmittingElement).on('submit.form-plugin', this.selector, options, doAjaxSubmit).on('click.form-plugin', this.selector, options, captureSubmittingElement);
			return this;
		}

		return this.ajaxFormUnbind().on('submit.form-plugin', options, doAjaxSubmit).on('click.form-plugin', options, captureSubmittingElement);
	};

	// private event handlers
	function doAjaxSubmit(e) {
		/*jshint validthis:true */
		var options = e.data;
		if (!e.isDefaultPrevented()) { // if event has been canceled, don't proceed
			e.preventDefault();
			$(e.target).ajaxSubmit(options); // #365
		}
	}

	function captureSubmittingElement(e) {
		/*jshint validthis:true */
		var target = e.target;
		var $el = $(target);
		if (! ($el.is("[type=submit],[type=image]"))) {
			// is this a child element of the submit el?  (ex: a span within a button)
			var t = $el.closest('[type=submit]');
			if (t.length === 0) {
				return;
			}
			target = t[0];
		}
		var form = this;
		form.clk = target;
		if (target.type == 'image') {
			if (e.offsetX !== undefined) {
				form.clk_x = e.offsetX;
				form.clk_y = e.offsetY;
			} else if (typeof $.fn.offset == 'function') {
				var offset = $el.offset();
				form.clk_x = e.pageX - offset.left;
				form.clk_y = e.pageY - offset.top;
			} else {
				form.clk_x = e.pageX - target.offsetLeft;
				form.clk_y = e.pageY - target.offsetTop;
			}
		}
		// clear form vars
		setTimeout(function() {
			form.clk = form.clk_x = form.clk_y = null;
		},
		100);
	}

	// ajaxFormUnbind unbinds the event handlers that were bound by ajaxForm
	$.fn.ajaxFormUnbind = function() {
		return this.unbind('submit.form-plugin click.form-plugin');
	};

	/**
		 * formToArray() gathers form element data into an array of objects that can
		 * be passed to any of the following ajax functions: $.get, $.post, or load.
		 * Each object in the array has both a 'name' and 'value' property.  An example of
		 * an array for a simple login form might be:
		 *
		 * [ { name: 'username', value: 'jresig' }, { name: 'password', value: 'secret' } ]
		 *
		 * It is this array that is passed to pre-submit callback functions provided to the
		 * ajaxSubmit() and ajaxForm() methods.
		 */
	$.fn.formToArray = function(semantic, elements) {
		var a = [];
		if (this.length === 0) {
			return a;
		}

		var form = this[0];
		var formId = this.attr('id');
		var els = semantic ? form.getElementsByTagName('*') : form.elements;
		var els2;

		if (els && !/MSIE [678]/.test(navigator.userAgent)) { // #390
			els = $(els).get(); // convert to standard array
		}

		// #386; account for inputs outside the form which use the 'form' attribute
		if (formId) {
			els2 = $(':input[form="' + formId + '"]').get(); // hat tip @thet
			if (els2.length) {
				els = (els || []).concat(els2);
			}
		}

		if (!els || !els.length) {
			return a;
		}

		var i, j, n, v, el, max, jmax;
		for (i = 0, max = els.length; i < max; i++) {
			el = els[i];
			n = el.name;
			if (!n || el.disabled) {
				continue;
			}

			if (semantic && form.clk && el.type == "image") {
				// handle image inputs on the fly when semantic == true
				if (form.clk == el) {
					a.push({
						name: n,
						value: $(el).val(),
						type: el.type
					});
					a.push({
						name: n + '.x',
						value: form.clk_x
					},
					{
						name: n + '.y',
						value: form.clk_y
					});
				}
				continue;
			}

			v = $.fieldValue(el, true);
			if (v && v.constructor == Array) {
				if (elements) {
					elements.push(el);
				}
				for (j = 0, jmax = v.length; j < jmax; j++) {
					a.push({
						name: n,
						value: v[j]
					});
				}
			} else if (feature.fileapi && el.type == 'file') {
				if (elements) {
					elements.push(el);
				}
				var files = el.files;
				if (files.length) {
					for (j = 0; j < files.length; j++) {
						a.push({
							name: n,
							value: files[j],
							type: el.type
						});
					}
				} else {
					// #180
					a.push({
						name: n,
						value: '',
						type: el.type
					});
				}
			} else if (v !== null && typeof v != 'undefined') {
				if (elements) {
					elements.push(el);
				}
				a.push({
					name: n,
					value: v,
					type: el.type,
					required: el.required
				});
			}
		}

		if (!semantic && form.clk) {
			// input type=='image' are not found in elements array! handle it here
			var $input = $(form.clk),
			input = $input[0];
			n = input.name;
			if (n && !input.disabled && input.type == 'image') {
				a.push({
					name: n,
					value: $input.val()
				});
				a.push({
					name: n + '.x',
					value: form.clk_x
				},
				{
					name: n + '.y',
					value: form.clk_y
				});
			}
		}
		return a;
	};

	/**
		 * Serializes form data into a 'submittable' string. This method will return a string
		 * in the format: name1=value1&amp;name2=value2
		 */
	$.fn.formSerialize = function(semantic) {
		//hand off to jQuery.param for proper encoding
		return $.param(this.formToArray(semantic));
	};

	/**
		 * Serializes all field elements in the jQuery object into a query string.
		 * This method will return a string in the format: name1=value1&amp;name2=value2
		 */
	$.fn.fieldSerialize = function(successful) {
		var a = [];
		this.each(function() {
			var n = this.name;
			if (!n) {
				return;
			}
			var v = $.fieldValue(this, successful);
			if (v && v.constructor == Array) {
				for (var i = 0,
				max = v.length; i < max; i++) {
					a.push({
						name: n,
						value: v[i]
					});
				}
			} else if (v !== null && typeof v != 'undefined') {
				a.push({
					name: this.name,
					value: v
				});
			}
		});
		//hand off to jQuery.param for proper encoding
		return $.param(a);
	};

	/**
		 * Returns the value(s) of the element in the matched set.  For example, consider the following form:
		 *
		 *  <form><fieldset>
		 *      <input name="A" type="text" />
		 *      <input name="A" type="text" />
		 *      <input name="B" type="checkbox" value="B1" />
		 *      <input name="B" type="checkbox" value="B2"/>
		 *      <input name="C" type="radio" value="C1" />
		 *      <input name="C" type="radio" value="C2" />
		 *  </fieldset></form>
		 *
		 *  var v = $('input[type=text]').fieldValue();
		 *  // if no values are entered into the text inputs
		 *  v == ['','']
		 *  // if values entered into the text inputs are 'foo' and 'bar'
		 *  v == ['foo','bar']
		 *
		 *  var v = $('input[type=checkbox]').fieldValue();
		 *  // if neither checkbox is checked
		 *  v === undefined
		 *  // if both checkboxes are checked
		 *  v == ['B1', 'B2']
		 *
		 *  var v = $('input[type=radio]').fieldValue();
		 *  // if neither radio is checked
		 *  v === undefined
		 *  // if first radio is checked
		 *  v == ['C1']
		 *
		 * The successful argument controls whether or not the field element must be 'successful'
		 * (per http://www.w3.org/TR/html4/interact/forms.html#successful-controls).
		 * The default value of the successful argument is true.  If this value is false the value(s)
		 * for each element is returned.
		 *
		 * Note: This method *always* returns an array.  If no valid value can be determined the
		 *    array will be empty, otherwise it will contain one or more values.
		 */
	$.fn.fieldValue = function(successful) {
		for (var val = [], i = 0, max = this.length; i < max; i++) {
			var el = this[i];
			var v = $.fieldValue(el, successful);
			if (v === null || typeof v == 'undefined' || (v.constructor == Array && !v.length)) {
				continue;
			}
			if (v.constructor == Array) {
				$.merge(val, v);
			} else {
				val.push(v);
			}
		}
		return val;
	};

	/**
		 * Returns the value of the field element.
		 */
	$.fieldValue = function(el, successful) {
		var n = el.name,
		t = el.type,
		tag = el.tagName.toLowerCase();
		if (successful === undefined) {
			successful = true;
		}

		if (successful && (!n || el.disabled || t == 'reset' || t == 'button' || (t == 'checkbox' || t == 'radio') && !el.checked || (t == 'submit' || t == 'image') && el.form && el.form.clk != el || tag == 'select' && el.selectedIndex == -1)) {
			return null;
		}

		if (tag == 'select') {
			var index = el.selectedIndex;
			if (index < 0) {
				return null;
			}
			var a = [],
			ops = el.options;
			var one = (t == 'select-one');
			var max = (one ? index + 1 : ops.length);
			for (var i = (one ? index: 0); i < max; i++) {
				var op = ops[i];
				if (op.selected) {
					var v = op.value;
					if (!v) { // extra pain for IE...
						v = (op.attributes && op.attributes.value && !(op.attributes.value.specified)) ? op.text: op.value;
					}
					if (one) {
						return v;
					}
					a.push(v);
				}
			}
			return a;
		}
		return $(el).val();
	};

	/**
		 * Clears the form data.  Takes the following actions on the form's input fields:
		 *  - input text fields will have their 'value' property set to the empty string
		 *  - select elements will have their 'selectedIndex' property set to -1
		 *  - checkbox and radio inputs will have their 'checked' property set to false
		 *  - inputs of type submit, button, reset, and hidden will *not* be effected
		 *  - button elements will *not* be effected
		 */
	$.fn.clearForm = function(includeHidden) {
		return this.each(function() {
			$('input,select,textarea', this).clearFields(includeHidden);
		});
	};

	/**
		 * Clears the selected form elements.
		 */
	$.fn.clearFields = $.fn.clearInputs = function(includeHidden) {
		var re = /^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i; // 'hidden' is not in this list
		return this.each(function() {
			var t = this.type,
			tag = this.tagName.toLowerCase();
			if (re.test(t) || tag == 'textarea') {
				this.value = '';
			} else if (t == 'checkbox' || t == 'radio') {
				this.checked = false;
			} else if (tag == 'select') {
				this.selectedIndex = -1;
			} else if (t == "file") {
				if (/MSIE/.test(navigator.userAgent)) {
					$(this).replaceWith($(this).clone(true));
				} else {
					$(this).val('');
				}
			} else if (includeHidden) {
				// includeHidden can be the value true, or it can be a selector string
				// indicating a special test; for example:
				//  $('#myForm').clearForm('.special:hidden')
				// the above would clean hidden inputs that have the class of 'special'
				if ((includeHidden === true && /hidden/.test(t)) || (typeof includeHidden == 'string' && $(this).is(includeHidden))) {
					this.value = '';
				}
			}
		});
	};

	/**
		 * Resets the form data.  Causes all form elements to be reset to their original value.
		 */
	$.fn.resetForm = function() {
		return this.each(function() {
			// guard against an input with the name of 'reset'
			// note that IE reports the reset function as an 'object'
			if (typeof this.reset == 'function' || (typeof this.reset == 'object' && !this.reset.nodeType)) {
				this.reset();
			}
		});
	};

	/**
		 * Enables or disables any matching elements.
		 */
	$.fn.enable = function(b) {
		if (b === undefined) {
			b = true;
		}
		return this.each(function() {
			this.disabled = !b;
		});
	};

	/**
		 * Checks/unchecks any matching checkboxes or radio buttons and
		 * selects/deselects and matching option elements.
		 */
	$.fn.selected = function(select) {
		if (select === undefined) {
			select = true;
		}
		return this.each(function() {
			var t = this.type;
			if (t == 'checkbox' || t == 'radio') {
				this.checked = select;
			} else if (this.tagName.toLowerCase() == 'option') {
				var $sel = $(this).parent('select');
				if (select && $sel[0] && $sel[0].type == 'select-one') {
					// deselect all other options
					$sel.find('option').selected(false);
				}
				this.selected = select;
			}
		});
	};

	// expose debug var
	$.fn.ajaxSubmit.debug = false;
	function log() {
		if (!$.fn.ajaxSubmit.debug) {
			return;
		}
		var msg = '[jquery.form] ' + Array.prototype.join.call(arguments, '');
		if (window.console && window.console.log) {
			window.console.log(msg);
		} else if (window.opera && window.opera.postError) {
			window.opera.postError(msg);
		}
	}
}));

/* =======================================================================
 * jQuery.lazyload v1.9.3
 * Lazy Load - jQuery plugin for lazy loading images
 * Copyright (c) 2007-2013 Mika Tuupola
 * Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
 * Project home: http://www.appelsiini.net/projects/lazyload
 * ======================================================================== */
! (function($, window, document, undefined) {
	var $window = $(window);
	$.fn.lazyload = function(options) {
		var elements = this;
		var $container;
		var settings = {
			threshold: 0,
			failure_limit: 0,
			event: "scroll",
			effect: "show",
			container: window,
			data_attribute: "original",
			skip_invisible: true,
			appear: null,
			load: null,
			placeholder: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXYzh8+PB/AAffA0nNPuCLAAAAAElFTkSuQmCC"
		};
		function update() {
			var counter = 0;
			elements.each(function() {
				var $this = $(this);
				if (settings.skip_invisible && !$this.is(":visible")) {
					return;
				}
				if ($.abovethetop(this, settings) || $.leftofbegin(this, settings)) {
					/* Nothing. */
				} else if (!$.belowthefold(this, settings) && !$.rightoffold(this, settings)) {
					$this.trigger("appear");
					/* if we found an image we'll load, reset the counter */
					counter = 0;
				} else {
					if (++counter > settings.failure_limit) {
						return false;
					}
				}
			});
		}
		if (options) {
			/* Maintain BC for a couple of versions. */
			if (undefined !== options.failurelimit) {
				options.failure_limit = options.failurelimit;
				delete options.failurelimit;
			}
			if (undefined !== options.effectspeed) {
				options.effect_speed = options.effectspeed;
				delete options.effectspeed;
			}
			$.extend(settings, options);
		}

		/* Cache container as jQuery as object. */
		$container = (settings.container === undefined || settings.container === window) ? $window: $(settings.container);

		/* Fire one scroll event per scroll. Not one scroll event per image. */
		if (0 === settings.event.indexOf("scroll")) {
			$container.on(settings.event,
			function() {
				return update();
			});
		}
		this.each(function() {
			var self = this;
			var $self = $(self);
			self.loaded = false;

			/* If no src attribute given use data:uri. */
			if ($self.attr("src") === undefined || $self.attr("src") === false) {
				if ($self.is("img")) {
					$self.attr("src", settings.placeholder);
				}
			}

			/* When appear is triggered load original image. */
			$self.one("appear",
			function() {
				if (!this.loaded) {
					if (settings.appear) {
						var elements_left = elements.length;
						settings.appear.call(self, elements_left, settings);
					}
					$("<img />").on("load",
					function() {
						var original = $self.attr("data-" + settings.data_attribute);
						$self.hide();
						if ($self.is("img")) {
							$self.attr("src", original);
						} else {
							$self.css("background-image", "url('" + original + "')");
						}
						$self[settings.effect](settings.effect_speed);
						self.loaded = true;

						/* Remove image from array so it is not looped next time. */
						var temp = $.grep(elements,
						function(element) {
							return ! element.loaded;
						});
						elements = $(temp);
						if (settings.load) {
							var elements_left = elements.length;
							settings.load.call(self, elements_left, settings);
						}
					}).attr("src", $self.attr("data-" + settings.data_attribute));
				}
			});

			/* When wanted event is triggered load original image */
			/* by triggering appear.                              */
			if (0 !== settings.event.indexOf("scroll")) {
				$self.on(settings.event,
				function() {
					if (!self.loaded) {
						$self.trigger("appear");
					}
				});
			}
		});

		/* Check if something appears when window is resized. */
		$window.on("resize",
		function() {
			update();
		});

		/* With IOS5 force loading images when navigating with back button. */
		/* Non optimal workaround. */
		if ((/(?:iphone|ipod|ipad).*os 5/gi).test(navigator.appVersion)) {
			$window.on("pageshow",
			function(event) {
				if (event.originalEvent && event.originalEvent.persisted) {
					elements.each(function() {
						$(this).trigger("appear");
					});
				}
			});
		}

		/* Force initial check if images should appear. */
		$(document).ready(function() {
			update();
		});
		return this;
	};

	/* Convenience methods in jQuery namespace.           */
	/* Use as  $.belowthefold(element, {threshold : 100, container : window}) */
	$.belowthefold = function(element, settings) {
		var fold;
		if (settings.container === undefined || settings.container === window) {
			fold = (window.innerHeight ? window.innerHeight: $window.height()) + $window.scrollTop();
		} else {
			fold = $(settings.container).offset().top + $(settings.container).height();
		}
		return fold <= $(element).offset().top - settings.threshold;
	};

	$.rightoffold = function(element, settings) {
		var fold;
		if (settings.container === undefined || settings.container === window) {
			fold = $window.width() + $window.scrollLeft();
		} else {
			fold = $(settings.container).offset().left + $(settings.container).width();
		}
		return fold <= $(element).offset().left - settings.threshold;
	};

	$.abovethetop = function(element, settings) {
		var fold;
		if (settings.container === undefined || settings.container === window) {
			fold = $window.scrollTop();
		} else {
			fold = $(settings.container).offset().top;
		}
		return fold >= $(element).offset().top + settings.threshold + $(element).height();
	};

	$.leftofbegin = function(element, settings) {
		var fold;
		if (settings.container === undefined || settings.container === window) {
			fold = $window.scrollLeft();
		} else {
			fold = $(settings.container).offset().left;
		}
		return fold >= $(element).offset().left + settings.threshold + $(element).width();
	};

	$.inviewport = function(element, settings) {
		return ! $.rightoffold(element, settings) && !$.leftofbegin(element, settings) && !$.belowthefold(element, settings) && !$.abovethetop(element, settings);
	};

	/* Custom selectors for your convenience.   */
	/* Use as $("img:below-the-fold").something() or */
	/* $("img").filter(":below-the-fold").something() which is faster */
	$.extend($.expr[":"], {
		"below-the-fold": function(a) {
			return $.belowthefold(a, {
				threshold: 0
			});
		},
		"above-the-top": function(a) {
			return ! $.belowthefold(a, {
				threshold: 0
			});
		},
		"right-of-screen": function(a) {
			return $.rightoffold(a, {
				threshold: 0
			});
		},
		"left-of-screen": function(a) {
			return ! $.rightoffold(a, {
				threshold: 0
			});
		},
		"in-viewport": function(a) {
			return $.inviewport(a, {
				threshold: 0
			});
		},
		/* Maintain BC for couple of versions. */
		"above-the-fold": function(a) {
			return ! $.belowthefold(a, {
				threshold: 0
			});
		},
		"right-of-fold": function(a) {
			return $.rightoffold(a, {
				threshold: 0
			});
		},
		"left-of-fold": function(a) {
			return ! $.rightoffold(a, {
				threshold: 0
			});
		}
	});
})(jQuery, window, document);

/* =======================================================================
* jQuery.responsive-nav.js v1.0.39
* https://github.com/viljamis/responsive-nav.js
* http://responsive-nav.com
*
* Copyright (c) 2015 @viljamis
* Available under the MIT license
 * ======================================================================== */
/* global Event */
(function(document, window, index) {
	// Index is used to keep multiple navs on the same page namespaced
	"use strict";
	var responsiveNav = function(el, options) {
		var computed = !!window.getComputedStyle;

		/**
		* getComputedStyle polyfill for old browsers
		*/
		if (!computed) {
			window.getComputedStyle = function(el) {
				this.el = el;
				this.getPropertyValue = function(prop) {
					var re = /(\-([a-z]){1})/g;
					if (prop === "float") {
						prop = "styleFloat";
					}
					if (re.test(prop)) {
						prop = prop.replace(re,
						function() {
							return arguments[2].toUpperCase();
						});
					}
					return el.currentStyle[prop] ? el.currentStyle[prop] : null;
				};
				return this;
			};
		}
		/* exported addEvent, removeEvent, getChildren, setAttributes, addClass, removeClass, forEach */

		/**
		* Add Event
		* fn arg can be an object or a function, thanks to handleEvent
		* read more at: http://www.thecssninja.com/javascript/handleevent
		*
		* @param  {element}  element
		* @param  {event}    event
		* @param  {Function} fn
		* @param  {boolean}  bubbling
		*/
		var addEvent = function(el, evt, fn, bubble) {
			if ("addEventListener" in el) {
				// BBOS6 doesn't support handleEvent, catch and polyfill
				try {
					el.addEventListener(evt, fn, bubble);
				} catch(e) {
					if (typeof fn === "object" && fn.handleEvent) {
						el.addEventListener(evt,
						function(e) {
							// Bind fn as this and set first arg as event object
							fn.handleEvent.call(fn, e);
						},
						bubble);
					} else {
						throw e;
					}
				}
			} else if ("attachEvent" in el) {
				// check if the callback is an object and contains handleEvent
				if (typeof fn === "object" && fn.handleEvent) {
					el.attachEvent("on" + evt,
					function() {
						// Bind fn as this
						fn.handleEvent.call(fn);
					});
				} else {
					el.attachEvent("on" + evt, fn);
				}
			}
		},

		/**
	* Remove Event
	*
	* @param  {element}  element
	* @param  {event}    event
	* @param  {Function} fn
	* @param  {boolean}  bubbling
	*/
		removeEvent = function(el, evt, fn, bubble) {
			if ("removeEventListener" in el) {
				try {
					el.removeEventListener(evt, fn, bubble);
				} catch(e) {
					if (typeof fn === "object" && fn.handleEvent) {
						el.removeEventListener(evt,
						function(e) {
							fn.handleEvent.call(fn, e);
						},
						bubble);
					} else {
						throw e;
					}
				}
			} else if ("detachEvent" in el) {
				if (typeof fn === "object" && fn.handleEvent) {
					el.detachEvent("on" + evt,
					function() {
						fn.handleEvent.call(fn);
					});
				} else {
					el.detachEvent("on" + evt, fn);
				}
			}
		},

		/**
	* Get the children of any element
	*
	* @param  {element}
	* @return {array} Returns matching elements in an array
	*/
		getChildren = function(e) {
			if (e.children.length < 1) {
				throw new Error("The Nav container has no containing elements");
			}
			// Store all children in array
			var children = [];
			// Loop through children and store in array if child != TextNode
			for (var i = 0; i < e.children.length; i++) {
				if (e.children[i].nodeType === 1) {
					children.push(e.children[i]);
				}
			}
			return children;
		},

		/**
	* Sets multiple attributes at once
	*
	* @param {element} element
	* @param {attrs}   attrs
	*/
		setAttributes = function(el, attrs) {
			for (var key in attrs) {
				el.setAttribute(key, attrs[key]);
			}
		},

		/**
	* Adds a class to any element
	*
	* @param {element} element
	* @param {string}  class
	*/
		addClass = function(el, cls) {
			if (el.className.indexOf(cls) !== 0) {
				el.className += " " + cls;
				el.className = el.className.replace(/(^\s*)|(\s*$)/g, "");
			}
		},

		/**
	* Remove a class from any element
	*
	* @param  {element} element
	* @param  {string}  class
	*/
		removeClass = function(el, cls) {
			var reg = new RegExp("(\\s|^)" + cls + "(\\s|$)");
			el.className = el.className.replace(reg, " ").replace(/(^\s*)|(\s*$)/g, "");
		},

		/**
	* forEach method that passes back the stuff we need
	*
	* @param  {array}    array
	* @param  {Function} callback
	* @param  {scope}    scope
	*/
		forEach = function(array, callback, scope) {
			for (var i = 0; i < array.length; i++) {
				callback.call(scope, i, array[i]);
			}
		};

		var nav, opts, navToggle, styleElement = document.createElement("style"),
		htmlEl = document.documentElement,
		hasAnimFinished,
		isMobile,
		navOpen;

		var ResponsiveNav = function(el, options) {
			var i;

			/**
		* Default options
		* @type {Object}
		*/
			this.options = {
				animate: true,
				// Boolean: Use CSS3 transitions, true or false
				transition: 284,
				// Integer: Speed of the transition, in milliseconds
				label: "Menu",
				// String: Label for the navigation toggle
				insert: "before",
				// String: Insert the toggle before or after the navigation
				customToggle: "",
				// Selector: Specify the ID of a custom toggle
				closeOnNavClick: false,
				// Boolean: Close the navigation when one of the links are clicked
				openPos: "relative",
				// String: Position of the opened nav, relative or static
				navClass: "nav-collapse",
				// String: Default CSS class. If changed, you need to edit the CSS too!
				navActiveClass: "js-nav-active",
				// String: Class that is added to <html> element when nav is active
				jsClass: "js",
				// String: 'JS enabled' class which is added to <html> element
				init: function() {},
				// Function: Init callback
				open: function() {},
				// Function: Open callback
				close: function() {} // Function: Close callback
			};

			// User defined options
			for (i in options) {
				this.options[i] = options[i];
			}

			// Adds "js" class for <html>
			addClass(htmlEl, this.options.jsClass);

			// Wrapper
			this.wrapperEl = el.replace("#", "");

			// Try selecting ID first
			if (document.getElementById(this.wrapperEl)) {
				this.wrapper = document.getElementById(this.wrapperEl);

				// If element with an ID doesn't exist, use querySelector
			} else if (document.querySelector(this.wrapperEl)) {
				this.wrapper = document.querySelector(this.wrapperEl);

				// If element doesn't exists, stop here.
			} else {
				throw new Error("The nav element you are trying to select doesn't exist");
			}

			// Inner wrapper
			this.wrapper.inner = getChildren(this.wrapper);

			// For minification
			opts = this.options;
			nav = this.wrapper;

			// Init
			this._init(this);
		};

		ResponsiveNav.prototype = {

			/**
		* Unattaches events and removes any classes that were added
		*/
			destroy: function() {
				this._removeStyles();
				removeClass(nav, "closed");
				removeClass(nav, "opened");
				removeClass(nav, opts.navClass);
				removeClass(nav, opts.navClass + "-" + this.index);
				removeClass(htmlEl, opts.navActiveClass);
				nav.removeAttribute("style");
				nav.removeAttribute("aria-hidden");

				removeEvent(window, "resize", this, false);
				removeEvent(window, "focus", this, false);
				removeEvent(document.body, "touchmove", this, false);
				removeEvent(navToggle, "touchstart", this, false);
				removeEvent(navToggle, "touchend", this, false);
				removeEvent(navToggle, "mouseup", this, false);
				removeEvent(navToggle, "keyup", this, false);
				removeEvent(navToggle, "click", this, false);

				if (!opts.customToggle) {
					navToggle.parentNode.removeChild(navToggle);
				} else {
					navToggle.removeAttribute("aria-hidden");
				}
			},

			/**
		* Toggles the navigation open/close
		*/
			toggle: function() {
				if (hasAnimFinished === true) {
					if (!navOpen) {
						this.open();
					} else {
						this.close();
					}
				}
			},

			/**
		* Opens the navigation
		*/
			open: function() {
				if (!navOpen) {
					removeClass(nav, "closed");
					addClass(nav, "opened");
					addClass(htmlEl, opts.navActiveClass);
					addClass(navToggle, "active");
					nav.style.position = opts.openPos;
					setAttributes(nav, {
						"aria-hidden": "false"
					});
					navOpen = true;
					opts.open();
				}
			},

			/**
		* Closes the navigation
		*/
			close: function() {
				if (navOpen) {
					addClass(nav, "closed");
					removeClass(nav, "opened");
					removeClass(htmlEl, opts.navActiveClass);
					removeClass(navToggle, "active");
					setAttributes(nav, {
						"aria-hidden": "true"
					});

					// If animations are enabled, wait until they finish
					if (opts.animate) {
						hasAnimFinished = false;
						setTimeout(function() {
							nav.style.position = "absolute";
							hasAnimFinished = true;
						},
						opts.transition + 10);

						// Animations aren't enabled, we can do these immediately
					} else {
						nav.style.position = "absolute";
					}

					navOpen = false;
					opts.close();
				}
			},

			/**
		* Resize is called on window resize and orientation change.
		* It initializes the CSS styles and height calculations.
		*/
			resize: function() {

				// Resize watches navigation toggle's display state
				if (window.getComputedStyle(navToggle, null).getPropertyValue("display") !== "none") {

					isMobile = true;
					setAttributes(navToggle, {
						"aria-hidden": "false"
					});

					// If the navigation is hidden
					if (nav.className.match(/(^|\s)closed(\s|$)/)) {
						setAttributes(nav, {
							"aria-hidden": "true"
						});
						nav.style.position = "absolute";
					}

					this._createStyles();
					this._calcHeight();
				} else {
					isMobile = false;
					setAttributes(navToggle, {
						"aria-hidden": "true"
					});
					setAttributes(nav, {
						"aria-hidden": "false"
					});
					nav.style.position = opts.openPos;
					this._removeStyles();
				}
			},

			/**
		* Takes care of all even handling
		*
		* @param  {event} event
		* @return {type} returns the type of event that should be used
		*/
			handleEvent: function(e) {
				var evt = e || window.event;
				switch (evt.type) {
				case "touchstart":
					this._onTouchStart(evt);
					break;
				case "touchmove":
					this._onTouchMove(evt);
					break;
				case "touchend":
				case "mouseup":
					this._onTouchEnd(evt);
					break;
				case "click":
					this._preventDefault(evt);
					break;
				case "keyup":
					this._onKeyUp(evt);
					break;
				case "focus":
				case "resize":
					this.resize(evt);
					break;
				}
			},

			/**
		* Initializes the widget
		*/
			_init: function() {
				this.index = index++;

				addClass(nav, opts.navClass);
				addClass(nav, opts.navClass + "-" + this.index);
				addClass(nav, "closed");
				hasAnimFinished = true;
				navOpen = false;

				this._closeOnNavClick();
				this._createToggle();
				this._transitions();
				this.resize();

				/**
			* On IE8 the resize event triggers too early for some reason
			* so it's called here again on init to make sure all the
			* calculated styles are correct.
			*/
				var self = this;
				setTimeout(function() {
					self.resize();
				},
				20);

				addEvent(window, "resize", this, false);
				addEvent(window, "focus", this, false);
				addEvent(document.body, "touchmove", this, false);
				addEvent(navToggle, "touchstart", this, false);
				addEvent(navToggle, "touchend", this, false);
				addEvent(navToggle, "mouseup", this, false);
				addEvent(navToggle, "keyup", this, false);
				addEvent(navToggle, "click", this, false);

				/**
			* Init callback here
			*/
				opts.init();
			},

			/**
		* Creates Styles to the <head>
		*/
			_createStyles: function() {
				if (!styleElement.parentNode) {
					styleElement.type = "text/css";
					document.getElementsByTagName("head")[0].appendChild(styleElement);
				}
			},

			/**
		* Removes styles from the <head>
		*/
			_removeStyles: function() {
				if (styleElement.parentNode) {
					styleElement.parentNode.removeChild(styleElement);
				}
			},

			/**
		* Creates Navigation Toggle
		*/
			_createToggle: function() {
				// If there's no toggle, let's create one
				if (!opts.customToggle) {
					var toggle = document.createElement("a");
					toggle.innerHTML = opts.label;
					setAttributes(toggle, {
						"href": "#",
						"class": "nav-toggle"
					});

					// Determine where to insert the toggle
					if (opts.insert === "after") {
						nav.parentNode.insertBefore(toggle, nav.nextSibling);
					} else {
						nav.parentNode.insertBefore(toggle, nav);
					}

					navToggle = toggle;

					// There is a toggle already, let's use that one
				} else {
					var toggleEl = opts.customToggle.replace("#", "");

					if (document.getElementById(toggleEl)) {
						navToggle = document.getElementById(toggleEl);
					} else if (document.querySelector(toggleEl)) {
						navToggle = document.querySelector(toggleEl);
					} else {
						throw new Error("The custom nav toggle you are trying to select doesn't exist");
					}
				}
			},

			/**
		* Closes the navigation when a link inside is clicked.
		*/
			_closeOnNavClick: function() {
				if (opts.closeOnNavClick) {
					var links = nav.getElementsByTagName("a"),
					self = this;
					forEach(links,
					function(i, el) {
						addEvent(links[i], "click",
						function() {
							if (isMobile) {
								self.toggle();
							}
						},
						false);
					});
				}
			},

			/**
		* Prevents the default functionality.
		*
		* @param  {event} event
		*/
			_preventDefault: function(e) {
				if (e.preventDefault) {
					if (e.stopImmediatePropagation) {
						e.stopImmediatePropagation();
					}
					e.preventDefault();
					e.stopPropagation();
					return false;

					// This is strictly for old IE
				} else {
					e.returnValue = false;
				}
			},

			/**
		* On touch start we get the location of the touch.
		*
		* @param  {event} event
		*/
			_onTouchStart: function(e) {
				if (!Event.prototype.stopImmediatePropagation) {
					this._preventDefault(e);
				}
				this.startX = e.touches[0].clientX;
				this.startY = e.touches[0].clientY;
				this.touchHasMoved = false;

				/**
			* Remove mouseup event completely here to avoid
			* double triggering the event.
			*/
				removeEvent(navToggle, "mouseup", this, false);
			},

			/**
		* Check if the user is scrolling instead of tapping.
		*
		* @param  {event} event
		*/
			_onTouchMove: function(e) {
				if (Math.abs(e.touches[0].clientX - this.startX) > 10 || Math.abs(e.touches[0].clientY - this.startY) > 10) {
					this.touchHasMoved = true;
				}
			},

			/**
		* On touch end toggle the navigation.
		*
		* @param  {event} event
		*/
			_onTouchEnd: function(e) {
				this._preventDefault(e);
				if (!isMobile) {
					return;
				}

				// If the user isn't scrolling
				if (!this.touchHasMoved) {

					// If the event type is touch
					if (e.type === "touchend") {
						this.toggle();
						return;

						// Event type was click, not touch
					} else {
						var evt = e || window.event;

						// If it isn't a right click, do toggling
						if (! (evt.which === 3 || evt.button === 2)) {
							this.toggle();
						}
					}
				}
			},

			/**
		* For keyboard accessibility, toggle the navigation on Enter
		* keypress too.
		*
		* @param  {event} event
		*/
			_onKeyUp: function(e) {
				var evt = e || window.event;
				if (evt.keyCode === 13) {
					this.toggle();
				}
			},

			/**
		* Adds the needed CSS transitions if animations are enabled
		*/
			_transitions: function() {
				if (opts.animate) {
					var objStyle = nav.style,
					transition = "max-height " + opts.transition + "ms";
					objStyle.WebkitTransition = objStyle.MozTransition = objStyle.OTransition = objStyle.transition = transition;
				}
			},

			/**
		* Calculates the height of the navigation and then creates
		* styles which are later added to the page <head>
		*/
			_calcHeight: function() {
				var savedHeight = 0;
				for (var i = 0; i < nav.inner.length; i++) {
					savedHeight += nav.inner[i].offsetHeight;
				}
				var innerStyles = "." + opts.jsClass + " ." + opts.navClass + "-" + this.index + ".opened{max-height:" + savedHeight + "px !important} ." + opts.jsClass + " ." + opts.navClass + "-" + this.index + ".opened.dropdown-active {max-height:9999px !important}";
				if (styleElement.styleSheet) {
					styleElement.styleSheet.cssText = innerStyles;
				} else {
					styleElement.innerHTML = innerStyles;
				}
				innerStyles = "";
			}
		};
		/**
		* Return new Responsive Nav
		*/
		return new ResponsiveNav(el, options);
	};
	if (typeof module !== "undefined" && module.exports) {
		module.exports = responsiveNav;
	} else {
		window.responsiveNav = responsiveNav;
	}
} (document, window, 0));

/* =======================================================================
 * jQuery.placeholder.js 兼容性处理
 * ======================================================================== */
!function(window, document, $) {
	var isInputSupported = 'placeholder' in document.createElement('input');
	var isTextareaSupported = 'placeholder' in document.createElement('textarea');
	var prototype = $.fn;
	var valHooks = $.valHooks;
	var propHooks = $.propHooks;
	var hooks;
	var placeholder;

	if (isInputSupported && isTextareaSupported) {
		placeholder = prototype.placeholder = function() {
			return this;
		};
		placeholder.input = placeholder.textarea = true;
	} else {
		placeholder = prototype.placeholder = function() {
			var $this = this;
			$this.filter((isInputSupported ? 'textarea': ':input') + '[placeholder]').not('.placeholder').on({
				'focus.placeholder': clearPlaceholder,
				'blur.placeholder': setPlaceholder
			}).data('placeholder-enabled', true).trigger('blur.placeholder');
			return $this;
		};
		placeholder.input = isInputSupported;
		placeholder.textarea = isTextareaSupported;
		hooks = {
			'get': function(element) {
				var $element = $(element);
				var $passwordInput = $element.data('placeholder-password');
				if ($passwordInput) {
					return $passwordInput[0].value;
				}
				return $element.data('placeholder-enabled') && $element.hasClass('placeholder') ? '': element.value;
			},
			'set': function(element, value) {
				var $element = $(element);
				var $passwordInput = $element.data('placeholder-password');
				if ($passwordInput) {
					return $passwordInput[0].value = value;
				}
				if (!$element.data('placeholder-enabled')) {
					return element.value = value;
				}
				if (value == '') {
					element.value = value;
					if (element != safeActiveElement()) {
						setPlaceholder.call(element);
					}
				} else if ($element.hasClass('placeholder')) {
					clearPlaceholder.call(element, true, value) || (element.value = value);
				} else {
					element.value = value;
				}
				return $element;
			}
		};

		if (!isInputSupported) {
			valHooks.input = hooks;
			propHooks.value = hooks;
		}
		if (!isTextareaSupported) {
			valHooks.textarea = hooks;
			propHooks.value = hooks;
		}

		$(function() {
			$(document).delegate('form', 'submit.placeholder',
			function() {
				var $inputs = $('.placeholder', this).each(clearPlaceholder);
				setTimeout(function() {
					$inputs.each(setPlaceholder);
				},
				10);
			});
		});

		$(window).on('beforeunload.placeholder',
		function() {
			$('.placeholder').each(function() {
				this.value = '';
			});
		});
	}

	function args(elem) {
		var newAttrs = {};
		var rinlinejQuery = /^jQuery\d+$/;
		$.each(elem.attributes,
		function(i, attr) {
			if (attr.specified && !rinlinejQuery.test(attr.name)) {
				newAttrs[attr.name] = attr.value;
			}
		});
		return newAttrs;
	}

	function clearPlaceholder(event, value) {
		var input = this;
		var $input = $(input);
		if (input.value == $input.attr('placeholder') && $input.hasClass('placeholder')) {
			if ($input.data('placeholder-password')) {
				$input = $input.hide().next().show().attr('id', $input.removeAttr('id').data('placeholder-id'));
				if (event === true) {
					return $input[0].value = value;
				}
				$input.focus();
			} else {
				input.value = '';
				$input.removeClass('placeholder');
				input == safeActiveElement() && input.select();
			}
		}
	}

	function setPlaceholder() {
		var $replacement;
		var input = this;
		var $input = $(input);
		var id = this.id;
		if (input.value == '') {
			if (input.type == 'password') {
				if (!$input.data('placeholder-textinput')) {
					try {
						$replacement = $input.clone().prop('type', 'text');
					} catch(e) {
						$replacement = $('<input>').prop($.extend(args(this), {
							'type': 'text'
						}));
					}
					$replacement.removeAttr('name').data({
						'placeholder-password': $input,
						'placeholder-id': id
					}).on('focus.placeholder', clearPlaceholder);
					$input.data({
						'placeholder-textinput': $replacement,
						'placeholder-id': id
					}).before($replacement);
				}
				$input = $input.removeAttr('id').hide().prev().attr('id', id).show();
			}
			$input.addClass('placeholder');
			$input[0].value = $input.attr('placeholder');
		} else {
			$input.removeClass('placeholder');
		}
	}
	function safeActiveElement() {
		try {
			return document.activeElement;
		} catch(exception) {}
	}
} (this, document, jQuery);

/* =======================================================================
 * jquery.emailsuggest.js v1.0 邮箱自动提示
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
!function($) {
	var
	// 插件名 
	plugin = 'emailsuggest',

	// 默认参数配置
	defaults = {
		sugClass: 'emailSug',
		domains: ['163.com', '126.com', 'sohu.com', '139.com', 'sina.com', 'qq.com', 'gmail.com']
	};

	function EmailSug(elem, options) {
		this.$field = $(elem);
		this.options = $.extend(true, {},
		defaults, options);
		this._defaults = defaults;
		this._domains = this.options.domains;
		// 当前选中元素下标
		this.selectedIndex = 0;

		this.init();
	}

	EmailSug.prototype = {
		init: function() {
			this.addEvent();
		},

		addEvent: function() {
			var that = this,
			value;

			this.$field.on('keyup.ema',
			function(e) {
				value = $.trim(this.value);

				if (value) {
					that.create(this, value);
					that.doSelect(e.keyCode);
				} else {
					that.hide();
				}
			}).on('blur.ema',
			function() {
				setTimeout(function() {
					that.hide();
				},
				200);
			});
		},
		create: function(elem, value) {
			var that = this,
			arr, len, fragment, ul = [],
			offset,
			left,
			top,
			width,
			height,
			style,
			// 左右边框 
			borderWidth = 2;

			elem = $(elem);
			offset = elem.offset();
			width = elem.outerWidth(true) - borderWidth;
			height = elem.outerHeight(true);
			left = offset.left;
			top = offset.top + height;
			style = 'left: ' + left + 'px; top: ' + top + 'px; width: ' + width + 'px; border: 1px solid #e2e2e2; border-top: 0; display: none';
			fragment = $('<div class="' + this.options.sugClass + '-wrapper" style="' + style + '" />');
			ul.push('<ul class="' + this.options.sugClass + '-list">');

			arr = this.filter(value, this._domains);
			len = arr.length;
			$.each(arr,
			function(i, domain) {
				var _class = that.options.sugClass + '-item';

				if (that.selectedIndex > len - 1) {
					if (i === 0) {
						_class += ' active';
						that.selectedIndex = 0;
					}
				} else {
					if (i === that.selectedIndex) {
						_class += ' active';
					}
				}
				ul.push('<li class="' + _class + '" data-index="' + i + '">' + value.replace(/@.*/, '') + '@' + domain + '</li>');
			});

			ul.push('</ul>');
			ul = ul.join('');
			if (this.$suggest) {
				this.$suggest.empty();
				this.$suggest.append(ul);
			} else {
				fragment.append(ul);
				// 显示到页面
				$('body').append(fragment);
				this.$suggest = fragment;
				this.$suggest.on('mouseenter click', '.' + this.options.sugClass + '-item',
				function(e) {
					var lis, li;
					li = $(this);
					lis = li.parent().children();
					if (e.type === 'mouseenter') {
						li.addClass('active').siblings().removeClass('active');
						that.selectedIndex = $.inArray(this, lis);
					} else {
						// 当前选中
						that.$field.val(lis.eq(that.selectedIndex).text());
						// 隐藏email sug
						that.hide();
					}
				});
			}
			this.show();
		},

		doSelect: function(keyCode) {
			var elems = $('.' + this.options.sugClass + '-item', this.$suggest),
			min = 0,
			max = elems.length - 1;
			switch (keyCode) {
			case 13:
				// 回车选中当前已选项
				$('li.active', this.$suggest).trigger('click');

				// 下标重置
				this.selectedIndex = 0;

				break;
				// 向上
			case 38:
				this.selectedIndex--;

				if (this.selectedIndex < min) {
					this.selectedIndex = max;
				}

				elems.removeClass('active').eq(this.selectedIndex).addClass('active');
				break;
				// 向下 
			case 40:
				this.selectedIndex++;

				if (this.selectedIndex > max) {
					this.selectedIndex = min;
				}

				elems.removeClass('active').eq(this.selectedIndex).addClass('active');
				break;
			default:
				break;
			}
		},
		filter: function(value, arr) {
			var start, suffix, r = [];

			start = value.indexOf('@');
			if (start > -1) {
				suffix = value.substring(start + 1);
				$.each(arr,
				function(i, str) {
					if (str.indexOf(suffix) > -1) {
						r.push(str);
					}
				});
			} else {
				r = arr;
			}
			return r;
		},
		show: function() {
			if (this.$suggest) {
				this.$suggest.show();
			}
		},

		hide: function() {
			if (this.$suggest) {
				this.$suggest.hide();
			}
		}
	}

	$.fn[plugin] = function(options) {
		return this.each(function() {
			if (!$.data(this, plugin)) {
				$.data(this, plugin, new EmailSug(this, options));
			}
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huispinner.js v2.1.2 微调器
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.06.26
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {	
	$.fn.Huispinner = function(options, callback) {
		var defaults = {
			value : 1,
			minValue : 1,
			maxValue : 999,
			dis : 1,
		}
		var options = $.extend(defaults, options);
		var keyCodes = {
			up : 38,
			down : 40
		}

		this.each(function() {
			var that = $(this);
			var str = '<div class="spinner">'
					+ '<a class="subtract" href="javascript:void(0)"><i>-</i></a>'
					+ '<input class="amount input-text" value="'
					+ options.value + '" autocomplete="off">'
					+ '<a class="add" href="javascript:void(0)"><i>+</i></a>'
					+ '</div>';
			that.append(str);

			var input = that.find(".input-text"),
				subtract = that.find(".subtract"),
				add = that.find(".add"),
				value = parseInt(input.val());

			if (value <= options.minValue) {
				subtract.addClass("disabled");
				add.removeClass("disabled");
			}
			if (value >= options.maxValue) {
				subtract.removeClass("disabled");
				add.addClass("disabled");
			}

			// 输入框失去焦点
			input.on('blur', function() {
				var v = $(this).val();
				v = v.replace(/[^\d]/g, "");
				v = v.replace(/\b(0+)/gi, "");

				if (v != "") {
					if (v > options.minValue && v < options.maxValue) {
						input.val(v)
						add.removeClass("disabled");
						subtract.removeClass("disabled");
					} else {
						if (v <= options.minValue) {
							input.val(options.minValue);
							subtract.addClass("disabled");
							add.removeClass("disabled");
						} else {
							input.val(options.maxValue);
							subtract.removeClass("disabled");
							add.addClass("disabled");
						}
					}
				} else {
					$(this).val(options.minValue);
					subtract.addClass("disabled");
					add.removeClass("disabled");
				}
				if (callback) {
					callback(input.val());
				}
			});

			// 上下方向键
			input.on("keydown", function(e) {
				var evt = e || window.event;
				if (evt.keyCode === keyCodes.up) {
					subtract.trigger("click");
					evt.returnValue = false;
				}
				if (evt.keyCode === keyCodes.down) {
					add.trigger("click");
					evt.returnValue = false;
				}
			});

			// 减
			subtract.on('click', function() {
				var goodsCount = parseInt(input.val());
				input.val(goodsCount <= options.minValue
						? options.minValue
						: goodsCount - options.dis);
				add.removeClass("disabled");
				if (input.val() <= options.minValue) {
					input.val(options.minValue)
					subtract.addClass("disabled");
				}
				if (callback) {
					callback(input.val());
				}
			});

			// 加
			add.on('click', function() {
				var goodsCount = parseInt(input.val());
				input.val(goodsCount >= options.maxValue
						? options.maxValue
						: goodsCount + options.dis);
				subtract.removeClass("disabled");

				if (input.val() >= options.maxValue) {
					input.val(options.maxValue);
					add.addClass("disabled");
				}
				if (callback) {
					callback(input.val());
				}
			});
		});
	}
}(window.jQuery);

/* =======================================================================
 * jQuery.format.js 金额格式化
 * ========================================================================*/
!function($) {
	$.extend({
		format: function(str, step, splitor) {
			str = str.toString();
			var len = str.length;

			if (len > step) {
				var l1 = len % step,
				l2 = parseInt(len / step),
				arr = [],
				first = str.substr(0, l1);
				if (first != '') {
					arr.push(first);
				};
				for (var i = 0; i < l2; i++) {
					arr.push(str.substr(l1 + i * step, step));
				};
				str = arr.join(splitor);
			};
			return str;
		}
	});
} (window.jQuery);

/* =======================================================================
 * jquery.togglePassword.js 隐藏显示密码
 * type="password"
 * ========================================================================*/
!function($) {
	$.fn.togglePassword = function(options) {
		var s = $.extend($.fn.togglePassword.defaults, options),
		input = $(this);

		$(s.el).on(s.ev,
		function() {
			"password" == $(input).attr("type") ? $(input).attr("type", "text") : $(input).attr("type", "password");
		});
	};

	$.fn.togglePassword.defaults = {
		ev: "click"
	};
} (window.jQuery);

/* =======================================================================
 * jQuery.iCheck.js v1.0.2, http://git.io/arlzeA
 * Powerful jQuery and Zepto plugin for checkboxes and radio buttons customization
 *
 * (c) 2013 Damir Sultanov, http://fronteed.com
 * MIT Licensed
 * ======================================================================== */
!(function($) {
	// Cached vars
	var _iCheck = 'iCheck',
	_iCheckHelper = _iCheck + '-helper',
	_checkbox = 'checkbox',
	_radio = 'radio',
	_checked = 'checked',
	_unchecked = 'un' + _checked,
	_disabled = 'disabled',
	_determinate = 'determinate',
	_indeterminate = 'in' + _determinate,
	_update = 'update',
	_type = 'type',
	_click = 'click',
	_touch = 'touchbegin.i touchend.i',
	_add = 'addClass',
	_remove = 'removeClass',
	_callback = 'trigger',
	_label = 'label',
	_cursor = 'cursor',
	_mobile = /ipad|iphone|ipod|android|blackberry|windows phone|opera mini|silk/i.test(navigator.userAgent);

	// Plugin init
	$.fn[_iCheck] = function(options, fire) {
		// Walker
		var handle = 'input[type="' + _checkbox + '"], input[type="' + _radio + '"]',
		stack = $(),
		walker = function(object) {
			object.each(function() {
				var self = $(this);

				if (self.is(handle)) {
					stack = stack.add(self);
				} else {
					stack = stack.add(self.find(handle));
				}
			});
		};

		// Check if we should operate with some method
		if (/^(check|uncheck|toggle|indeterminate|determinate|disable|enable|update|destroy)$/i.test(options)) {

			// Normalize method's name
			options = options.toLowerCase();

			// Find checkboxes and radio buttons
			walker(this);

			return stack.each(function() {
				var self = $(this);

				if (options == 'destroy') {
					tidy(self, 'ifDestroyed');
				} else {
					operate(self, true, options);
				}

				// Fire method's callback
				if ($.isFunction(fire)) {
					fire();
				}
			});

			// Customization
		} else if (typeof options == 'object' || !options) {

			// Check if any options were passed
			var settings = $.extend({
				checkedClass: _checked,
				disabledClass: _disabled,
				indeterminateClass: _indeterminate,
				labelHover: true
			},
			options),

			selector = settings.handle,
			hoverClass = settings.hoverClass || 'hover',
			focusClass = settings.focusClass || 'focus',
			activeClass = settings.activeClass || 'active',
			labelHover = !!settings.labelHover,
			labelHoverClass = settings.labelHoverClass || 'hover',

			// Setup clickable area
			area = ('' + settings.increaseArea).replace('%', '') | 0;

			// Selector limit
			if (selector == _checkbox || selector == _radio) {
				handle = 'input[type="' + selector + '"]';
			}

			// Clickable area limit
			if (area < -50) {
				area = -50;
			}

			// Walk around the selector
			walker(this);

			return stack.each(function() {
				var self = $(this);

				// If already customized
				tidy(self);

				var node = this,
				id = node.id,

				// Layer styles
				offset = -area + '%',
				size = 100 + (area * 2) + '%',
				layer = {
					position: 'absolute',
					top: offset,
					left: offset,
					display: 'block',
					width: size,
					height: size,
					margin: 0,
					padding: 0,
					background: '#fff',
					border: 0,
					opacity: 0
				},

				// Choose how to hide input
				hide = _mobile ? {
					position: 'absolute',
					visibility: 'hidden'
				}: area ? layer: {
					position: 'absolute',
					opacity: 0
				},

				// Get proper class
				className = node[_type] == _checkbox ? settings.checkboxClass || 'i' + _checkbox: settings.radioClass || 'i' + _radio,

				// Find assigned labels
				label = $(_label + '[for="' + id + '"]').add(self.closest(_label)),

				// Check ARIA option
				aria = !!settings.aria,

				// Set ARIA placeholder
				ariaID = _iCheck + '-' + Math.random().toString(36).substr(2, 6),

				// Parent & helper
				parent = '<div class="' + className + '" ' + (aria ? 'role="' + node[_type] + '" ': ''),
				helper;

				// Set ARIA "labelledby"
				if (aria) {
					label.each(function() {
						parent += 'aria-labelledby="';

						if (this.id) {
							parent += this.id;
						} else {
							this.id = ariaID;
							parent += ariaID;
						}

						parent += '"';
					});
				}

				// Wrap input
				parent = self.wrap(parent + '/>')[_callback]('ifCreated').parent().append(settings.insert);

				// Layer addition
				helper = $('<ins class="' + _iCheckHelper + '"/>').css(layer).appendTo(parent);

				// Finalize customization
				self.data(_iCheck, {
					o: settings,
					s: self.attr('style')
				}).css(hide); !! settings.inheritClass && parent[_add](node.className || ''); !! settings.inheritID && id && parent.attr('id', _iCheck + '-' + id);
				parent.css('position') == 'static' && parent.css('position', 'relative');
				operate(self, true, _update);

				// Label events
				if (label.length) {
					label.on(_click + '.i mouseover.i mouseout.i ' + _touch,
					function(event) {
						var type = event[_type],
						item = $(this);

						// Do nothing if input is disabled
						if (!node[_disabled]) {

							// Click
							if (type == _click) {
								if ($(event.target).is('a')) {
									return;
								}
								operate(self, false, true);

								// Hover state
							} else if (labelHover) {

								// mouseout|touchend
								if (/ut|nd/.test(type)) {
									parent[_remove](hoverClass);
									item[_remove](labelHoverClass);
								} else {
									parent[_add](hoverClass);
									item[_add](labelHoverClass);
								}
							}

							if (_mobile) {
								event.stopPropagation();
							} else {
								return false;
							}
						}
					});
				}

				// Input events
				self.on(_click + '.i focus.i blur.i keyup.i keydown.i keypress.i',
				function(event) {
					var type = event[_type],
					key = event.keyCode;

					// Click
					if (type == _click) {
						return false;

						// Keydown
					} else if (type == 'keydown' && key == 32) {
						if (! (node[_type] == _radio && node[_checked])) {
							if (node[_checked]) {
								off(self, _checked);
							} else {
								on(self, _checked);
							}
						}

						return false;

						// Keyup
					} else if (type == 'keyup' && node[_type] == _radio) { ! node[_checked] && on(self, _checked);

						// Focus/blur
					} else if (/us|ur/.test(type)) {
						parent[type == 'blur' ? _remove: _add](focusClass);
					}
				});

				// Helper events
				helper.on(_click + ' mousedown mouseup mouseover mouseout ' + _touch,
				function(event) {
					var type = event[_type],

					// mousedown|mouseup
					toggle = /wn|up/.test(type) ? activeClass: hoverClass;

					// Do nothing if input is disabled
					if (!node[_disabled]) {

						// Click
						if (type == _click) {
							operate(self, false, true);

							// Active and hover states
						} else {

							// State is on
							if (/wn|er|in/.test(type)) {

								// mousedown|mouseover|touchbegin
								parent[_add](toggle);

								// State is off
							} else {
								parent[_remove](toggle + ' ' + activeClass);
							}

							// Label hover
							if (label.length && labelHover && toggle == hoverClass) {

								// mouseout|touchend
								label[/ut|nd/.test(type) ? _remove: _add](labelHoverClass);
							}
						}

						if (_mobile) {
							event.stopPropagation();
						} else {
							return false;
						}
					}
				});
			});
		} else {
			return this;
		}
	};

	// Do something with inputs
	function operate(input, direct, method) {
		var node = input[0],
		state = /er/.test(method) ? _indeterminate: /bl/.test(method) ? _disabled: _checked,
		active = method == _update ? {
			checked: node[_checked],
			disabled: node[_disabled],
			indeterminate: input.attr(_indeterminate) == 'true' || input.attr(_determinate) == 'false'
		}: node[state];

		// Check, disable or indeterminate
		if (/^(ch|di|in)/.test(method) && !active) {
			on(input, state);

			// Uncheck, enable or determinate
		} else if (/^(un|en|de)/.test(method) && active) {
			off(input, state);

			// Update
		} else if (method == _update) {

			// Handle states
			for (var each in active) {
				if (active[each]) {
					on(input, each, true);
				} else {
					off(input, each, true);
				}
			}

		} else if (!direct || method == 'toggle') {

			// Helper or label was clicked
			if (!direct) {
				input[_callback]('ifClicked');
			}

			// Toggle checked state
			if (active) {
				if (node[_type] !== _radio) {
					off(input, state);
				}
			} else {
				on(input, state);
			}
		}
	}

	// Add checked, disabled or indeterminate state
	function on(input, state, keep) {
		var node = input[0],
		parent = input.parent(),
		checked = state == _checked,
		indeterminate = state == _indeterminate,
		disabled = state == _disabled,
		callback = indeterminate ? _determinate: checked ? _unchecked: 'enabled',
		regular = option(input, callback + capitalize(node[_type])),
		specific = option(input, state + capitalize(node[_type]));

		// Prevent unnecessary actions
		if (node[state] !== true) {

			// Toggle assigned radio buttons
			if (!keep && state == _checked && node[_type] == _radio && node.name) {
				var form = input.closest('form'),
				inputs = 'input[name="' + node.name + '"]';

				inputs = form.length ? form.find(inputs) : $(inputs);

				inputs.each(function() {
					if (this !== node && $(this).data(_iCheck)) {
						off($(this), state);
					}
				});
			}

			// Indeterminate state
			if (indeterminate) {

				// Add indeterminate state
				node[state] = true;

				// Remove checked state
				if (node[_checked]) {
					off(input, _checked, 'force');
				}

				// Checked or disabled state
			} else {

				// Add checked or disabled state
				if (!keep) {
					node[state] = true;
				}

				// Remove indeterminate state
				if (checked && node[_indeterminate]) {
					off(input, _indeterminate, false);
				}
			}

			// Trigger callbacks
			callbacks(input, checked, state, keep);
		}

		// Add proper cursor
		if (node[_disabled] && !!option(input, _cursor, true)) {
			parent.find('.' + _iCheckHelper).css(_cursor, 'default');
		}

		// Add state class
		parent[_add](specific || option(input, state) || '');

		// Set ARIA attribute
		if ( !! parent.attr('role') && !indeterminate) {
			parent.attr('aria-' + (disabled ? _disabled: _checked), 'true');
		}

		// Remove regular state class
		parent[_remove](regular || option(input, callback) || '');
	}

	// Remove checked, disabled or indeterminate state
	function off(input, state, keep) {
		var node = input[0],
		parent = input.parent(),
		checked = state == _checked,
		indeterminate = state == _indeterminate,
		disabled = state == _disabled,
		callback = indeterminate ? _determinate: checked ? _unchecked: 'enabled',
		regular = option(input, callback + capitalize(node[_type])),
		specific = option(input, state + capitalize(node[_type]));

		// Prevent unnecessary actions
		if (node[state] !== false) {

			// Toggle state
			if (indeterminate || !keep || keep == 'force') {
				node[state] = false;
			}

			// Trigger callbacks
			callbacks(input, checked, callback, keep);
		}

		// Add proper cursor
		if (!node[_disabled] && !!option(input, _cursor, true)) {
			parent.find('.' + _iCheckHelper).css(_cursor, 'pointer');
		}

		// Remove state class
		parent[_remove](specific || option(input, state) || '');

		// Set ARIA attribute
		if ( !! parent.attr('role') && !indeterminate) {
			parent.attr('aria-' + (disabled ? _disabled: _checked), 'false');
		}

		// Add regular state class
		parent[_add](regular || option(input, callback) || '');
	}

	// Remove all traces
	function tidy(input, callback) {
		if (input.data(_iCheck)) {

			// Remove everything except input
			input.parent().html(input.attr('style', input.data(_iCheck).s || ''));

			// Callback
			if (callback) {
				input[_callback](callback);
			}

			// Unbind events
			input.off('.i').unwrap();
			$(_label + '[for="' + input[0].id + '"]').add(input.closest(_label)).off('.i');
		}
	}

	// Get some option
	function option(input, state, regular) {
		if (input.data(_iCheck)) {
			return input.data(_iCheck).o[state + (regular ? '': 'Class')];
		}
	}

	// Capitalize some string
	function capitalize(string) {
		return string.charAt(0).toUpperCase() + string.slice(1);
	}

	// Executable handlers
	function callbacks(input, checked, callback, keep) {
		if (!keep) {
			if (checked) {
				input[_callback]('ifToggled');
			}

			input[_callback]('ifChanged')[_callback]('if' + capitalize(callback));
		}
	}
})(window.jQuery || window.Zepto);

/* =======================================================================
 * jQuery.raty.js v2.4.5- A Star Rating Plugin
 * -------------------------------------------------------------------
 * jQuery Raty is a plugin that generates a customizable star rating.
 * Licensed under The MIT License
 *
 * @version        2.4.5
 * @since          2010.06.11
 * @author         Washington Botelho
 * @documentation  wbotelhos.com/raty
 * @twitter        twitter.com/wbotelhos
 *
 * Usage:
 * -------------------------------------------------------------------
 * $('#star').raty();
 * <div id="star"></div>
 * ======================================================================== */
!(function($) {
	var methods = {
		init: function(settings) {
			return this.each(function() {
				var self = this,
				$this = $(self).empty();
				self.opt = $.extend(true, {},
				$.fn.raty.defaults, settings);
				$this.data('settings', self.opt);
				self.opt.number = methods.between(self.opt.number, 0, 20);
				if (self.opt.path.substring(self.opt.path.length - 1, self.opt.path.length) != '/') {
					self.opt.path += '/';
				}
				if (typeof self.opt.score == 'function') {
					self.opt.score = self.opt.score.call(self);
				}
				if (self.opt.score) {
					self.opt.score = methods.between(self.opt.score, 0, self.opt.number);
				}
				for (var i = 1; i <= self.opt.number; i++) {
					$('<img />', {
						src: self.opt.path + ((!self.opt.score || self.opt.score < i) ? self.opt.starOff: self.opt.starOn),
						alt: i,
						title: (i <= self.opt.hints.length && self.opt.hints[i - 1] !== null) ? self.opt.hints[i - 1] : i
					}).appendTo(self);

					if (self.opt.space) {
						$this.append((i < self.opt.number) ? '': '');
					}
				}

				self.stars = $this.children('img:not(".raty-cancel")');
				self.score = $('<input />', {
					type: 'hidden',
					name: self.opt.scoreName
				}).appendTo(self);
				if (self.opt.score && self.opt.score > 0) {
					self.score.val(self.opt.score);
					methods.roundStar.call(self, self.opt.score);
				}
				if (self.opt.iconRange) {
					methods.fill.call(self, self.opt.score);				}
				methods.setTarget.call(self, self.opt.score, self.opt.targetKeep);
				var space = self.opt.space ? 4 : 0,
				width = self.opt.width || (self.opt.number * self.opt.size + self.opt.number * space);
				if (self.opt.cancel) {
					self.cancel = $('<img />', {
						src: self.opt.path + self.opt.cancelOff,
						alt: 'x',
						title: self.opt.cancelHint,
						'class': 'raty-cancel'
					});
					if (self.opt.cancelPlace == 'left') {
						//$this.prepend('&#160;').prepend(self.cancel);
					} else {
						//$this.append('&#160;').append(self.cancel);
					}
					width += (self.opt.size + space);
				}
				if (self.opt.readOnly) {
					methods.fixHint.call(self);

					if (self.cancel) {
						self.cancel.hide();
					}
				} else {
					$this.css('cursor', 'pointer');
					methods.bindAction.call(self);
				}
				//$this.css('width', width);
			});
		},
		between: function(value, min, max) {
			return Math.min(Math.max(parseFloat(value), min), max);
		},
		bindAction: function() {
			var self = this,
			$this = $(self);
			$this.mouseleave(function() {
				var score = self.score.val() || undefined;

				methods.initialize.call(self, score);
				methods.setTarget.call(self, score, self.opt.targetKeep);

				if (self.opt.mouseover) {
					self.opt.mouseover.call(self, score);
				}
			});
			var action = self.opt.half ? 'mousemove': 'mouseover';
			if (self.opt.cancel) {
				self.cancel.mouseenter(function() {
					$(this).attr('src', self.opt.path + self.opt.cancelOn);

					self.stars.attr('src', self.opt.path + self.opt.starOff);

					methods.setTarget.call(self, null, true);

					if (self.opt.mouseover) {
						self.opt.mouseover.call(self, null);
					}
				}).mouseleave(function() {
					$(this).attr('src', self.opt.path + self.opt.cancelOff);

					if (self.opt.mouseover) {
						self.opt.mouseover.call(self, self.score.val() || null);
					}
				}).click(function(evt) {
					self.score.removeAttr('value');
					if (self.opt.click) {
						self.opt.click.call(self, null, evt);
					}
				});
			}

			self.stars.bind(action,
			function(evt) {
				var value = parseInt(this.alt, 10);
				if (self.opt.half) {
					var position = parseFloat((evt.pageX - $(this).offset().left) / self.opt.size),
					diff = (position > .5) ? 1 : .5;
					value = parseFloat(this.alt) - 1 + diff;
					methods.fill.call(self, value);
					if (self.opt.precision) {
						value = value - diff + position;
					}
					methods.showHalf.call(self, value);
				} else {
					methods.fill.call(self, value);
				}
				$this.data('score', value);
				methods.setTarget.call(self, value, true);
				if (self.opt.mouseover) {
					self.opt.mouseover.call(self, value, evt);
				}
			}).click(function(evt) {
				self.score.val((self.opt.half || self.opt.precision) ? $this.data('score') : this.alt);
				if (self.opt.click) {
					self.opt.click.call(self, self.score.val(), evt);
				}
			});
		},
		cancel: function(isClick) {
			return $(this).each(function() {
				var self = this,
				$this = $(self);

				if ($this.data('readonly') === true) {
					return this;
				}

				if (isClick) {
					methods.click.call(self, null);
				} else {
					methods.score.call(self, null);
				}

				self.score.removeAttr('value');
			});
		},
		click: function(score) {
			return $(this).each(function() {
				if ($(this).data('readonly') === true) {
					return this;
				}

				methods.initialize.call(this, score);

				if (this.opt.click) {
					this.opt.click.call(this, score);
				} else {
					methods.error.call(this, 'you must add the "click: function(score, evt) { }" callback.');
				}
				methods.setTarget.call(this, score, true);
			});
		},
		error: function(message) {
			$(this).html(message);
			$.error(message);
		},
		fill: function(score) {
			var self = this,
			number = self.stars.length,
			count = 0,
			$star, star, icon;
			for (var i = 1; i <= number; i++) {
				$star = self.stars.eq(i - 1);
				if (self.opt.iconRange && self.opt.iconRange.length > count) {
					star = self.opt.iconRange[count];
					if (self.opt.single) {
						icon = (i == score) ? (star.on || self.opt.starOn) : (star.off || self.opt.starOff);
					} else {
						icon = (i <= score) ? (star.on || self.opt.starOn) : (star.off || self.opt.starOff);
					}
					if (i <= star.range) {
						$star.attr('src', self.opt.path + icon);
					}
					if (i == star.range) {
						count++;
					}
				} else {
					if (self.opt.single) {
						icon = (i == score) ? self.opt.starOn: self.opt.starOff;
					} else {
						icon = (i <= score) ? self.opt.starOn: self.opt.starOff;
					}
					$star.attr('src', self.opt.path + icon);
				}
			}
		},
		fixHint: function() {
			var $this = $(this),
			score = parseInt(this.score.val(), 10),
			hint = this.opt.noRatedMsg;

			if (!isNaN(score) && score > 0) {
				hint = (score <= this.opt.hints.length && this.opt.hints[score - 1] !== null) ? this.opt.hints[score - 1] : score;
			}
			$this.data('readonly', true).css('cursor', 'default').attr('title', hint);
			this.score.attr('readonly', 'readonly');
			this.stars.attr('title', hint);
		},
		getScore: function() {
			var score = [],
			value;
			$(this).each(function() {
				value = this.score.val();
				score.push(value ? parseFloat(value) : undefined);
			});
			return (score.length > 1) ? score: score[0];
		},
		readOnly: function(isReadOnly) {
			return this.each(function() {
				var $this = $(this);
				if ($this.data('readonly') === isReadOnly) {
					return this;
				}
				if (this.cancel) {
					if (isReadOnly) {
						this.cancel.hide();
					} else {
						this.cancel.show();
					}
				}
				if (isReadOnly) {
					$this.unbind();
					$this.children('img').unbind();
					methods.fixHint.call(this);
				} else {
					methods.bindAction.call(this);
					methods.unfixHint.call(this);
				}

				$this.data('readonly', isReadOnly);
			});
		},
		reload: function() {
			return methods.set.call(this, {});
		},
		roundStar: function(score) {
			var diff = (score - Math.floor(score)).toFixed(2);

			if (diff > this.opt.round.down) {
				var icon = this.opt.starOn; // Full up: [x.76 .. x.99]
				if (diff < this.opt.round.up && this.opt.halfShow) { // Half: [x.26 .. x.75]
					icon = this.opt.starHalf;
				} else if (diff < this.opt.round.full) { // Full down: [x.00 .. x.5]
					icon = this.opt.starOff;
				}

				this.stars.eq(Math.ceil(score) - 1).attr('src', this.opt.path + icon);
			} // Full down: [x.00 .. x.25]
		},
		score: function() {
			return arguments.length ? methods.setScore.apply(this, arguments) : methods.getScore.call(this);
		},
		set: function(settings) {
			this.each(function() {
				var $this = $(this),
				actual = $this.data('settings'),
				clone = $this.clone().removeAttr('style').insertBefore($this);

				$this.remove();

				clone.raty($.extend(actual, settings));
			});

			return $(this.selector);
		},
		setScore: function(score) {
			return $(this).each(function() {
				if ($(this).data('readonly') === true) {
					return this;
				}

				methods.initialize.call(this, score);
				methods.setTarget.call(this, score, true);
			});
		},
		setTarget: function(value, isKeep) {
			if (this.opt.target) {
				var $target = $(this.opt.target);

				if ($target.length == 0) {
					methods.error.call(this, '目标选择器无效或丢失!');
				}

				var score = value;

				if (!isKeep || score === undefined) {
					score = this.opt.targetText;
				} else {
					if (this.opt.targetType == 'hint') {
						score = (score === null && this.opt.cancel) ? this.opt.cancelHint: this.opt.hints[Math.ceil(score - 1)];
					} else {
						score = this.opt.precision ? parseFloat(score).toFixed(1) : parseInt(score, 10);
					}
				}

				if (this.opt.targetFormat.indexOf('{score}') < 0) {
					methods.error.call(this, '模版 "{score}" 找不到!');
				}

				if (value !== null) {
					score = this.opt.targetFormat.toString().replace('{score}', score);
				}

				if ($target.is(':input')) {
					$target.val(score);
				} else {
					$target.html(score);
				}
			}
		},
		showHalf: function(score) {
			var diff = (score - Math.floor(score)).toFixed(1);

			if (diff > 0 && diff < .6) {
				this.stars.eq(Math.ceil(score) - 1).attr('src', this.opt.path + this.opt.starHalf);
			}
		},
		initialize: function(score) {
			score = !score ? 0 : methods.between(score, 0, this.opt.number);

			methods.fill.call(this, score);

			if (score > 0) {
				if (this.opt.halfShow) {
					methods.roundStar.call(this, score);
				}

				this.score.val(score);
			}
		},
		unfixHint: function() {
			for (var i = 0; i < this.opt.number; i++) {
				this.stars.eq(i).attr('title', (i < this.opt.hints.length && this.opt.hints[i] !== null) ? this.opt.hints[i] : i);
			}

			$(this).data('readonly', false).css('cursor', 'pointer').removeAttr('title');

			this.score.attr('readonly', 'readonly');
		}
	};

	$.fn.raty = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('方法 ' + method + ' 不存在!');
		}
	};

	$.fn.raty.defaults = {
		cancel: false,
		cancelHint: '取消评级!',
		cancelOff: 'cancel-off.png',
		cancelOn: 'cancel-on.png',
		cancelPlace: 'left',
		click: undefined,
		half: false,
		halfShow: true,
		hints: ['10', '20', '30', '40', '50', '60', '70', '80', '90', '100'],
		iconRange: undefined,
		mouseover: undefined,
		noRatedMsg: '没有额定',
		number: 10,
		path: 'images/',
		precision: false,
		round: {
			down: .25,
			full: .6,
			up: .76
		},
		readOnly: false,
		score: undefined,
		scoreName: 'score',
		single: false,
		size: 16,
		space: true,
		starHalf: 'star-half.png',
		starOff: 'star-off.png',
		starOn: 'star-on.png',
		target: undefined,
		targetFormat: '{score}',
		targetKeep: false,
		targetText: '',
		targetType: 'hint',
		width: undefined
	};
})(jQuery);

/* =======================================================================
 * jQuery.onePageNav.js v0.9One Page Nav Plugin
 * http://github.com/davist11/jQuery-One-Page-Nav
 * Copyright (c) 2010 Trevor Davis (http://trevordavis.net)
 * Dual licensed under the MIT and GPL licenses.
 * Uses the same license as jQuery, see:
 * http://jquery.org/license
 * Example usage:
 * $('#nav').onePageNav({
 *   currentClass: 'current',
 *   changeHash: false,
 *   scrollSpeed: 750
 * });
 * ========================================================================*/
!(function($) {
	$.fn.onePageNav = function(options) {
		var opts = $.extend({},
		$.fn.onePageNav.defaults, options),
		onePageNav = {};

		onePageNav.sections = {};

		onePageNav.bindNav = function($el, $this, o) {
			var $par = $el.parent(),
			newLoc = $el.attr('href'),
			$win = $(window);

			if (!$par.hasClass(o.currentClass)) {
				if (o.begin) {
					o.begin();
				}
				onePageNav.adjustNav($this, $par, o.currentClass);
				$win.unbind('.onePageNav');
				$.scrollTo(newLoc, o.scrollSpeed, {
					easing: o.easing,
					offset: {
						top: -o.scrollOffset
					},
					onAfter: function() {
						if (o.changeHash) {
							window.location.hash = newLoc;
						}
						$win.bind('scroll.onePageNav',
						function() {
							onePageNav.scrollChange($this, o);
						});
						if (o.end) {
							o.end();
						}
					}
				});
			}
		};

		onePageNav.adjustNav = function($this, $el, curClass) {
			$this.find('.' + curClass).removeClass(curClass);
			$el.addClass(curClass);
		};

		onePageNav.getPositions = function($this, o) {
			var $nav = $this.find('a');

			if (o.filter !== '') {
				$nav = $nav.filter(o.filter);
			}

			$nav.each(function() {
				var linkHref = $(this).attr('href'),
				divPos = $(linkHref).offset(),
				topPos = divPos.top;

				onePageNav.sections[linkHref.substr(1)] = Math.round(topPos) - o.scrollOffset;
			});
		};

		onePageNav.getSection = function(windowPos, o) {
			var returnValue = '',
			windowHeight = Math.round($(window).height() * o.scrollThreshold);

			for (var section in onePageNav.sections) {
				if ((onePageNav.sections[section] - windowHeight) < windowPos) {
					returnValue = section;
				}
			}
			return returnValue;
		};

		onePageNav.scrollChange = function($this, o) {
			onePageNav.getPositions($this, o);

			var windowTop = $(window).scrollTop(),
			position = onePageNav.getSection(windowTop, o);

			if (position !== '') {
				onePageNav.adjustNav($this, $this.find('a[href=#' + position + ']').parent(), o.currentClass);
			}
		};

		onePageNav.init = function($this, o) {
			var didScroll = false,
			$nav = $this.find('a');

			if (o.filter !== '') {
				$nav = $nav.filter(o.filter);
			}

			$nav.bind('click',
			function(e) {
				onePageNav.bindNav($(this), $this, o);
				e.preventDefault();
			});

			onePageNav.getPositions($this, o);

			$(window).bind('scroll.onePageNav',
			function() {
				didScroll = true;
			});

			setInterval(function() {
				if (didScroll) {
					didScroll = false;
					onePageNav.scrollChange($this, o);
				}
			},
			250);
		};

		return this.each(function() {
			var $this = $(this),
			o = $.meta ? $.extend({},
			opts, $this.data()) : opts;

			onePageNav.init($this, o);

		});
	};

	// default options
	$.fn.onePageNav.defaults = {
		currentClass: 'current',
		changeHash: false,
		easing: 'swing',
		filter: '',
		scrollSpeed: 750,
		scrollOffset: 0,
		scrollThreshold: 0.5,
		begin: false,
		end: false
	};
})(jQuery);

 /* =======================================================================
 * jQuery.ColorPicker.js 颜色控件
 * ========================================================================*/
(function($) {
	'use strict';
	var name = 'Hui.colorPicker'; // modal name
	var TEAMPLATE = '<div class="colorpicker"><button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><span class="cp-title"></span><i class="ic"></i></button><ul class="dropdown-menu clearfix"></ul></div>';
	var LANG = {
		zh_cn: {
			errorTip: "不是有效的颜色值"
		},
		zh_tw: {
			errorTip: "不是有效的顏色值"
		},
		en: {
			errorTip: "Not a valid color value"
		}
	};

	// The ColorPicker modal class
	var ColorPicker = function(element, options) {
		this.name = name;
		this.$ = $(element);

		this.getOptions(options);
		this.init();
	};

	// default options
	ColorPicker.DEFAULTS = {
		colors: ['#00BCD4', '#388E3C', '#3280fc', '#3F51B5', '#9C27B0', '#795548', '#F57C00', '#F44336', '#E91E63'],
		pullMenuRight: true,
		wrapper: 'btn-wrapper',
		tileSize: 30,
		lineCount: 5,
		optional: true,
		tooltip: 'top',
		icon: 'caret-down',
		// btnTip: 'Tool tip in button'
	};

	ColorPicker.prototype.init = function() {
		var options = this.options,
		that = this;

		this.$picker = $(TEAMPLATE).addClass(options.wrapper);
		this.$picker.find('.cp-title').toggle(options.title !== undefined).text(options.title);
		this.$menu = this.$picker.find('.dropdown-menu').toggleClass('pull-right', options.pullMenuRight);
		this.$btn = this.$picker.find('.btn.dropdown-toggle');
		this.$btn.find('.ic').addClass('icon-' + options.icon);
		if (options.btnTip) {
			this.$picker.attr('data-toggle', 'tooltip').tooltip({
				title: options.btnTip,
				placement: options.tooltip,
				container: 'body'
			});
		}
		this.$.attr('data-provide', null).after(this.$picker);

		// init colors
		this.colors = {};
		$.each(this.options.colors,
		function(idx, rawColor) {
			if ($.zui.Color.isColor(rawColor)) {
				var color = new $.zui.Color(rawColor);
				that.colors[color.toCssStr()] = color;
			}
		});

		this.updateColors();
		var that = this;
		this.$picker.on('click', '.cp-tile',
		function() {
			that.setValue($(this).data('color'));
		});
		var $input = this.$;
		var setInputColor = function() {
			var val = $input.val();
			var isColor = $.zui.Color.isColor(val);
			$input.parent().toggleClass('has-error', !isColor && !(options.optional && val === ''));
			if (isColor) {
				that.setValue(val, true);
			} else {
				if (options.optional && val === '') {
					$input.tooltip('hide');
				} else if (!$input.is(':focus')) {
					$input.tooltip('show', options.errorTip);
				}
			}
		}
		if ($input.is('input:not([type=hidden])')) {
			if (options.tooltip) {
				$input.attr('data-toggle', 'tooltip').tooltip({
					trigger: 'manual',
					placement: options.tooltip,
					tipClass: 'tooltip-danger',
					container: 'body'
				});
			}
			$input.on('keyup paste input change', setInputColor);
		} else {
			$input.appendTo(this.$picker);
		}
		setInputColor();
	};

	ColorPicker.prototype.addColor = function(color) {
		var hex = color.toCssStr(),
		options = this.options;

		if (!this.colors[hex]) {
			this.colors[hex] = color;
		}

		var $a = $('<a href="###" class="cp-tile"></a>', {
			titile: color
		}).data('color', color).css({
			'color': color.contrast().toCssStr(),
			'background': hex,
			'border-color': color.luma() > 0.43 ? '#ccc': 'transparent'
		}).attr('data-color', hex);
		this.$menu.append($('<li/>').css({
			width: options.tileSize,
			height: options.tileSize
		}).append($a));
		if (options.optional) {
			this.$menu.find('.cp-tile.empty').parent().detach().appendTo(this.$menu);
		}
	};

	ColorPicker.prototype.updateColors = function(colors) {
		var $picker = this.$picker,
		$menu = this.$menu.empty(),
		options = this.options,
		colors = colors || this.colors,
		that = this;
		var bestLineCount = 0;
		$.each(colors,
		function(idx, color) {
			that.addColor(color);
			bestLineCount++;
		});
		if (options.optional) {
			var $li = $('<li><a class="cp-tile empty" href="###"></a></li>').css({
				width: options.tileSize,
				height: options.tileSize
			});
			this.$menu.append($li);
			bestLineCount++;
		}
		$menu.css('width', Math.min(bestLineCount, options.lineCount) * options.tileSize + 6);
	};

	ColorPicker.prototype.setValue = function(color, notSetInput) {
		var options = this.options;
		this.$menu.find('.cp-tile.active').removeClass('active');
		var hex = '';
		if (color) {
			var c = new $.zui.Color(color);
			hex = c.toCssStr().toLowerCase();
			this.$btn.css({
				background: hex,
				color: c.contrast().toCssStr(),
				borderColor: c.luma() > 0.43 ? '#ccc': hex
			});
			if (!this.colors[hex]) {
				this.addColor(c);
			}
			if (!notSetInput && this.$.val().toLowerCase() !== hex) {
				this.$.val(hex).trigger('change');
			}
			this.$menu.find('.cp-tile[data-color=' + hex + ']').addClass('active');
			this.$.tooltip('hide');
			this.$.trigger('colorchange', c);
		} else {
			this.$btn.attr('style', null);
			if (!notSetInput && this.$.val() !== '') {
				this.$.val(hex).trigger('change');
			}
			if (options.optional) {
				this.$.tooltip('hide');
			}
			this.$menu.find('.cp-tile.empty').addClass('active');
			this.$.trigger('colorchange', null);
		}

		if (options.updateBorder) {
			$(options.updateBorder).css('border-color', hex);
		}
		if (options.updateBackground) {
			$(options.updateBackground).css('background-color', hex);
		}
		if (options.updateColor) {
			$(options.updateText).css('color', hex);
		}
		if (options.updateText) {
			$(options.updateText).text(hex);
		}
	};

	// Get and init options
	ColorPicker.prototype.getOptions = function(options) {
		var thisOptions = $.extend({},
		ColorPicker.DEFAULTS, this.$.data(), options);
		if (typeof thisOptions.colors === 'string') thisOptions.colors = thisOptions.colors.split(',');
		var lang = (thisOptions.lang || $.zui.clientLang()).toLowerCase();
		if (!thisOptions.errorTip) {
			thisOptions.errorTip = LANG[lang].errorTip;
		}
		if (!$.fn.tooltip) thisOptions.btnTip = false;
		this.options = thisOptions;
	};

	// Extense jquery element
	$.fn.colorPicker = function(option) {
		return this.each(function() {
			var $this = $(this);
			var data = $this.data(name);
			var options = typeof option == 'object' && option;

			if (!data) $this.data(name, (data = new ColorPicker(this, options)));

			if (typeof option == 'string') data[option]();
		});
	};

	$.fn.colorPicker.Constructor = ColorPicker;

	// Auto call colorPicker after document load complete
	$(function() {
		$('[data-provide="colorpicker"]').colorPicker();
	});
}(jQuery));

/* =======================================================================
 * jquery.HuiaddFavorite.js 添加收藏
 * <a title="收藏本站" href="javascript:;" onClick="addFavoritepage('H-ui前端框架','http://www.h-ui.net/');">收藏本站</a>
 * function shoucang(name,site){
	$.addFavorite({
		name:name,
		site:site,
	});
 * ========================================================================*/
function HuiaddFavorite(obj) {
	obj.site = obj.site || window.location.href;
	obj.name = obj.name || document.title;
	try {
		window.external.addFavorite(obj.site, obj.name);
	} catch(e) {
		try {
			window.sidebar.addPanel(name, site, "");
		} catch(e) {
			$.Huimodalalert("加入收藏失败，请使用Ctrl+D进行添加", 2000);
		}
	}
}

/* ========================================================================
 * jQuery.Huisethome.js 设为首页
 * ======================================================================== */
function Huisethome(obj){
	try{
		obj.style.behavior="url(#default#homepage)";
		obj.setHomePage(webSite);
	}
	catch(e){
		if(window.netscape){
			try {
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
				}
			catch(e){
				$.Huimodalalert("此操作被浏览器拒绝！\n请在浏览器地址栏输入\"about:config\"并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。",2000);
			}
			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
			prefs.setCharPref('browser.startup.homepage',url);
		}
	}
}

/* =======================================================================
 * jQuery.Huisidenav.js 左侧菜单-隐藏显示
 * ======================================================================== */
function displaynavbar(obj){
	if($(obj).hasClass("open")){
		$(obj).removeClass("open");
		$("body").removeClass("big-page");
	} else {
		$(obj).addClass("open");
		$("body").addClass("big-page");
	}
}

/* =======================================================================
 * jQuery.Huihover.js v2.0 Huihover
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.05.05
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {
	$.fn.Huihover = function(options){
		var defaults = {
			className:"hover",
		}
		var options = $.extend(defaults, options);
		this.each(function(){			
			var that = $(this);
			that.hover(function() {
				that.addClass(options.className);
			},
			function() {
				that.removeClass(options.className);
			});
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huifocusblur.js v2.0 得到失去焦点
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.05.09
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {
	$.fn.Huifocusblur = function(options){
		var defaults = {
			className:"focus",
		}
		var options = $.extend(defaults, options);
		this.each(function(){			
			var that = $(this);
			that.focus(function() {
				that.addClass(options.className).removeClass("inputError");
			});			
			that.blur(function() {
				that.removeClass(options.className);
			});
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huiselect.js 选择
 * ========================================================================*/
!function($) {
	$.Huiselect = function(divselectid, inputselectid) {
		var inputselect = $(inputselectid);
		$(divselectid + " cite").click(function() {
			var ul = $(divselectid + " ul");
			ul.slideToggle();
		});
		$(divselectid + " ul li a").click(function() {
			var txt = $(this).text();
			$(divselectid + " cite").html(txt);
			var value = $(this).attr("selectid");
			inputselect.val(value);
			$(divselectid + " ul").hide();
		});
		$(document).click(function() {
			$(divselectid + " ul").hide();
		});
	};
} (window.jQuery);

/* =======================================================================
 * jQuery.Huitab.js v2.0 选项卡
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.05.05
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {
	$.fn.Huitab = function(options){
		var defaults = {
			tabBar:'.tabBar span',
			tabCon:".tabCon",
			className:"current",
			tabEvent:"click",
			index:0,
		}
		var options = $.extend(defaults, options);
		this.each(function(){
			var that = $(this);
			that.find(options.tabBar).removeClass(options.className);
			that.find(options.tabBar).eq(options.index).addClass(options.className);
			that.find(options.tabCon).hide();
			that.find(options.tabCon).eq(options.index).show();
			
			that.find(options.tabBar).on(options.tabEvent,function(){
				that.find(options.tabBar).removeClass(options.className);
				$(this).addClass(options.className);
				var index = that.find(options.tabBar).index(this);
				that.find(options.tabCon).hide();
				that.find(options.tabCon).eq(index).show();
			});
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huifold.js v2.0 折叠
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.05.05
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {
	$.fn.Huifold = function(options){
		var defaults = {
			titCell:'.item .Huifold-header',
			mainCell:'.item .Huifold-body',
			type:1,//1	只打开一个，可以全部关闭;2	必须有一个打开;3	可打开多个
			trigger:'click',
			className:"selected",
			speed:'first',
		}
		var options = $.extend(defaults, options);
		this.each(function(){	
			var that = $(this);
			that.find(options.titCell).on(options.trigger,function(){
				if ($(this).next().is(":visible")) {
					if (options.type == 2) {
						return false;
					} else {
						$(this).next().slideUp(options.speed).end().removeClass(options.className);
						if ($(this).find("b")) {
							$(this).find("b").html("+");
						}
					}
				}else {
					if (options.type == 3) {
						$(this).next().slideDown(options.speed).end().addClass(options.className);
						if ($(this).find("b")) {
							$(this).find("b").html("-");
						}
					} else {
						that.find(options.mainCell).slideUp(options.speed);
						that.find(options.titCell).removeClass(options.className);
						if (that.find(options.titCell).find("b")) {
							that.find(options.titCell).find("b").html("+");
						}
						$(this).next().slideDown(options.speed).end().addClass(options.className);
						if ($(this).find("b")) {
							$(this).find("b").html("-");
						}
					}
				}
			});
			
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huitags.js v2.0 标签
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.05.10
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {
	$.fn.Huitags = function(options) {
		var defaults = {
			value:'Hui前端框架,H-ui,辉哥',
			maxlength : 20,
			number : 5,
			tagsDefault : ["Html","CSS","JS"],
		}
		var options = $.extend(defaults, options);
		var keyCodes = {
			Enter : 13,
			Enter2 : 108,
			Spacebar:32
		}
		this.each(function(){
			var that = $(this);
			var str = 
			'<div class="Huitags-wraper">'+
				'<div class="Huitags-editor cl"></div>'+
				'<div class="Huitags-input-wraper">'+
					'<input type="text" class="input-text Huitags-input" maxlength="'+options.maxlength+'" value="">'+
				'</div>'+
				'<div class="Huitags-list">'+
					'<div class="Huitags-notag" style="display:none">暂无常用标签</div>'+
					'<div class="Huitags-has"></div>'+
				'</div>'+
				'<input type="hidden" class="Huitags-val" name="" value="'+options.value+'">'+
			'</div>';
			that.append(str);
			var wraper = that.find(".Huitags-wraper");
			var editor = that.find(".Huitags-editor");
			var input =that.find(".Huitags-input");
			var list = that.find(".Huitags-list");
			var has = that.find(".Huitags-has");
			var val = that.find(".Huitags-val");
			

			
			if(options.tagsDefault){
				var tagsDefaultLength = (options.tagsDefault).length;
				for(var i = 0;i< tagsDefaultLength; i++){
					has.append('<span>'+options.tagsDefault[i]+'</span>');
				}
				has.find("span").on('click',function(){
					var taghasV = $(this).text();
					taghasV=taghasV.replace(/(^\s*)|(\s*$)/g,"");
					editor.append('<span class="Huitags-token">'+taghasV+'</span>');
					gettagval(this);
					$(this).remove();
				});
			}
			
			function gettagval(obj) {
				var str = "";
				var token = that.find(".Huitags-token");
				if (token.length < 1) {
					input.val("");
					return false;
				}
				for (var i = 0; i < token.length; i++) {
					str += token.eq(i).text() + ",";
				}
				str = unique(str, 1);
				str=str.join();
				val.val(str);
			}
			/*将字符串逗号分割成数组并去重*/
			function unique(o, type){
				//去掉前后空格
				o=o.replace(/(^\s*)|(\s*$)/g,"");
				if(type == 1) {
					//把所有的空格和中文逗号替换成英文逗号
					o=o.replace(/(\s)|(，)/g, ",");
				} else {
					//把所有的中文逗号替换成英文逗号
					o=o.replace(/(，)/g, ",");
				}
				//去掉前后英文逗号
				o=o.replace(/^,|,$/g, "");
				//去重连续的英文逗号
				o=o.replace(/,+/g,',');
				o=o.split(",");
				var n = [o[0]]; //结果数组
				for(var i = 1; i < o.length; i++){
					if (o.indexOf(o[i]) == i) {
						if(o[i] == "")
							continue;
						n.push(o[i]);
					}
				}
				return n;
			}
			
			input.on("keydown",function(e){
				var evt = e || window.event;
				if (evt.keyCode == keyCodes.Enter || evt.keyCode == keyCodes.Enter2 || evt.keyCode == keyCodes.Spacebar) {
					var v = input.val().replace(/\s+/g, "");
					var reg = /^,|,$/gi;
					v = v.replace(reg, "");
					v = $.trim(v);
					if (v != '') {
						input.change();
					}else{
						return false;
					}
				}
			});
			
			input.on("change",function(){
				var v1 = input.val();
				var v2 = val.val();
				var v = v2+','+v1;
				if(v!=''){
					var str='<i class="Huitags-icon Hui-iconfont">&#xe64b;</i>';
					var result = unique(v, 1);
					if(result.length>0){
						for(var j=0;j<result.length;j++){
							str+='<span class="Huitags-token">'+result[j]+'</span>';
						}
						val.val(result);
						editor.html(str);
						input.val("").blur();
					}
				}
			});
					
			$(document).on("click",".Huitags-token",function(){
				$(this).remove();
				var str ="";
				if(that.find(".Huitags-token").length<1){
					val.val("");
					return false;
				}else{
					for(var i = 0;i< that.find(".Huitags-token").length;i++){
						str += that.find(".Huitags-token").eq(i).text() + ",";
					}
					str = str.substring(0,str.length-1);
					val.val(str);
				}
			});						
			input.change();
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huitagsmixed.js 标签混排效果
 * ========================================================================*/
!function($) {
	$.Huitagsmixed = function(obj) {
		$(obj).each(function() {
			var x = 9;
			var y = 0;
			var rand = parseInt(Math.random() * (x - y + 1) + y);
			$(this).addClass("tags" + rand);
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huitextarealength.js v2.0 字数限制
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.05.12
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {
	$.fn.Huitextarealength = function(options){
		var defaults = {
			minlength:0,
			maxlength:140,
			errorClass:"error",
			exceed:true,			
		}
		var options = $.extend(defaults, options);
		this.each(function(){			
			var that = $(this);
			var v = that.val();
			var l = v.length;
			var str = '<p class="textarea-numberbar"><em class="textarea-length">'+l+'</em>/'+options.maxlength+'</p>';
			that.parent().append(str);
			
			that.on("keyup",function(){
				v = that.val();
				l = v.length;				
				if (l > options.maxlength) {
					if(options.exceed){
						that.addClass(options.errorClass);
					}else{
						v = v.substring(0, options.maxlength);
						that.val(v);
						that.removeClass(options.errorClass);
					}					
				}
				else if(l<options.minlength){
					that.addClass(options.errorClass);
				}else{
					that.removeClass(options.errorClass);
				}
				that.parent().find(".textarea-length").text(v.length);
			});		
			
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huipreview.js v2.0 图片预览
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.05.05
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {
	$.fn.Huipreview = function(options){
		var defaults = {
			className:"active",
			bigImgWidth: 300,
		}
		var options = $.extend(defaults, options);
		this.each(function(){
			var that = $(this);
			var timer;
			that.hover(
				function() {
					clearTimeout(timer);
					timer = setTimeout(function () {
						$("#tooltip-preview").remove();
						var smallImg = that.find("img").attr("src");
						var bigImg = that.attr('data-src');
						var bigImgW = that.attr('data-width');
						var bigImgH = that.attr('data-height');
						var winW = $(window).width();
						var winW5 = winW / 2;
						var imgT = that.parent().offset().top;
						var imgL = that.parent().offset().left;
						var imgW = that.parent().width();
						var imgH = that.parent().height();
						var ww = (imgL + imgW / 2);
						var tooltipLeft = "auto",tooltipRight = "auto";
						if (ww < winW5) {
							tooltipLeft = (imgW + imgL) + "px";
						} else {
							tooltipRight = (winW - imgL) + "px";
						}
						
						that.addClass(options.className);				
						if (bigImg == '') {
							return false;
						} else {						
							var tooltip_keleyi_com = 
							'<div id="preview-wraper" style="position: absolute;width:'+options.bigImgWidth+'px;height:auto;top:' + imgT + 'px;right:' + tooltipRight + ';left:' + tooltipLeft + '">'+
								'<img src="'+smallImg+'" width="'+options.bigImgWidth+'">'+
							'</div>';
							$("body").append(tooltip_keleyi_com);
							/*图片预加载*/
							var image = new Image();
							image.src = bigImg;
							/*创建一个Image对象*/
							image.onload = function() {
								$('#preview-wraper').find("img").attr("src",bigImg).css("width",options.bigImgWidth);
							};
						}
					},500);
				},
				function() {
					clearTimeout(timer);
					that.removeClass(options.className);
					$("#preview-wraper").remove();
				}
			);
		});
	}	
} (window.jQuery);

/* =======================================================================
 * jQuery.Huimodalalert.js alert
 * ========================================================================*/
!function($) {
	$.Huimodalalert = function(info, speed) {
		if ($(".modal-alert").length > 0) {
			$(".modal-alert").remove();
		}
		if (speed == 0 || typeof(speed) == "undefined") {
			$(document.body).append('<div id="modal-alert" class="modal modal-alert radius">' + '<div class="modal-alert-info">' + info + '</div>' + '<div class="modal-footer"> <button class="btn btn-primary radius" onClick="$.Huimodal_alert.hide()">确定</button></div>' + '</div>');
			$("#modal-alert").fadeIn();
		} else {
			$(document.body).append('<div id="modal-alert" class="modal modal-alert radius">' + '<div class="modal-alert-info">' + info + '</div>' + '</div>');
			$("#modal-alert").fadeIn();
			setTimeout($.Huimodalalert.hide, speed);
		}
	}
	$.Huimodalalert.hide = function() {
		$("#modal-alert").fadeOut("normal",
		function() {
			$("#modal-alert").remove();
		});
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huialert.js alert
 * ========================================================================*/
!function($) {
	$.Huialert = function() {
		$(".Huialert i").Huihover();
		$(".Huialert i").on("click",function() {
			var Huialert = $(this).parents(".Huialert");
			Huialert.fadeOut("normal",
			function() {
				Huialert.remove();
			});
		});
	}
	$.Huialert();
} (window.jQuery);

/* =======================================================================
 * jQuery.Huitotop.js v2.0 返回顶部
 * http://www.h-ui.net/
 * Created & Modified by guojunhui
 * Date modified 2017.05.05
 *
 * Copyright 2017 北京颖杰联创科技有限公司 All rights reserved.
 * Licensed under MIT license.
 * http://opensource.org/licenses/MIT
 * ========================================================================*/
!function($) {
	//bottom 距离底部高度
	$.Huitotop = function(bottom){		
		if(!bottom){
			bottom = 60;
		}
		var str ='<a href="javascript:void(0)" class="tools-right toTop Hui-iconfont" title="返回顶部" alt="返回顶部" style="display:none;bottom:'+bottom+'px">&#xe684;</a>';
		$(str).appendTo($('body')).click(function() {
			$("html, body").animate({
				scrollTop: 0
			},
			120);
		});
		var backToTopFun = function(){
			var st = $(document).scrollTop();
			var winh = $(window).height();
			if(st> 0){
				$(".toTop").show();
			}else{
				$(".toTop").hide();
			}
			/*IE6下的定位*/
			if (!window.XMLHttpRequest) {
				$(".toTop").css("top", st + winh - 166);
			}
			
		}		
		$(window).on("scroll",backToTopFun);	
	}
} (window.jQuery);

/* =======================================================================
 * jQuery.Huimarquee.js 滚动
 * ========================================================================*/
!function($) {
	$.Huimarquee = function(height, speed, delay) {
		var scrollT;
		var pause = false;
		var ScrollBox = document.getElementById("marquee");
		if (document.getElementById("holder").offsetHeight <= height) return;
		var _tmp = ScrollBox.innerHTML.replace('holder', 'holder2');
		ScrollBox.innerHTML += _tmp;
		ScrollBox.onmouseover = function() {
			pause = true;
		}
		ScrollBox.onmouseout = function() {
			pause = false;
		}
		ScrollBox.scrollTop = 0;
		var start = function() {
			scrollT = setInterval(scrolling, speed);
			if (!pause) ScrollBox.scrollTop += 2;
		}
		var scrolling = function() {
			if (ScrollBox.scrollTop % height != 0) {
				ScrollBox.scrollTop += 2;
				if (ScrollBox.scrollTop >= ScrollBox.scrollHeight / 2) ScrollBox.scrollTop = 0;
			} else {
				clearInterval(scrollT);
				setTimeout(start, delay);
			}
		}
		setTimeout(start, delay);
	}
} (window.jQuery);

$(function() {
	/*全选*/
	$("table thead th input:checkbox").on("click",function() {
		$(this).closest("table").find("tr > td:first-child input:checkbox").prop("checked", $("table thead th input:checkbox").prop("checked"));
	});

	/*上传*/
	$(document).on("change", ".input-file",function() {
		var uploadVal = $(this).val();
		$(this).parent().find(".upload-url").val(uploadVal).focus().blur();
	});
});

/* ========================================================================
 * Bootstrap.button.js v3.3.0
 * http://getbootstrap.com/javascript/#buttons
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
!function($) {
	'use strict';
	// BUTTON PUBLIC CLASS DEFINITION
	// ==============================
	var Button = function(element, options) {
		this.$element = $(element);
		this.options = $.extend({},Button.DEFAULTS, options);
		this.isLoading = false;
	}
	Button.VERSION = '3.3.0'

	Button.DEFAULTS = {
		loadingText: 'loading...'
	}

	Button.prototype.setState = function(state) {
		var d = 'disabled'
		var $el = this.$element
		var val = $el.is('input') ? 'val': 'html'
		var data = $el.data();
		state = state + 'Text';
		if (data.resetText == null) $el.data('resetText', $el[val]());
		// push to event loop to allow forms to submit
		setTimeout($.proxy(function() {
			$el[val](data[state] == null ? this.options[state] : data[state]);
			if (state == 'loadingText') {
				this.isLoading = true;
				$el.addClass(d).attr(d, d);
			} else if (this.isLoading) {
				this.isLoading = false;
				$el.removeClass(d).removeAttr(d);
			}
		},
		this), 0)
	}

	Button.prototype.toggle = function() {
		var changed = true;
		var $parent = this.$element.closest('[data-toggle="buttons"]');

		if ($parent.length) {
			var $input = this.$element.find('input');
			if ($input.prop('type') == 'radio') {
				if ($input.prop('checked') && this.$element.hasClass('active')) changed = false
				else $parent.find('.active').removeClass('active')
			}
			if (changed) $input.prop('checked', !this.$element.hasClass('active')).trigger('change')
		} else {
			this.$element.attr('aria-pressed', !this.$element.hasClass('active'))
		}

		if (changed) this.$element.toggleClass('active')
	}

	// BUTTON PLUGIN DEFINITION
	// ========================
	function Plugin(option) {
		return this.each(function() {
			var $this = $(this);
			var data = $this.data('bs.button');
			var options = typeof option == 'object' && option;
			if (!data) $this.data('bs.button', (data = new Button(this, options)))

			if (option == 'toggle') data.toggle()
			else if (option) data.setState(option)
		})
	}

	var old = $.fn.button;

	$.fn.button = Plugin;
	$.fn.button.Constructor = Button;
	// BUTTON NO CONFLICT
	// ==================
	$.fn.button.noConflict = function() {
		$.fn.button = old;
		return this;
	}

	// BUTTON DATA-API
	// ===============
	$(document).on('click.bs.button.data-api', '[data-toggle^="button"]',
	function(e) {
		var $btn = $(e.target);
		if (!$btn.hasClass('btn'));
		$btn = $btn.closest('.btn');
		Plugin.call($btn, 'toggle');
		e.preventDefault();
	}).on('focus.bs.button.data-api blur.bs.button.data-api', '[data-toggle^="button"]',
	function(e) {
		$(e.target).closest('.btn').toggleClass('focus', e.type == 'focus');
	})
} (jQuery);

/* =======================================================================
 * jQuery.stickUp.js v0.5.7 BETA  by:LiranCohen
 * https://github.com/LiranCohen/stickUp
 * ======================================================================== */
jQuery(function($) {
	$(document).ready(function(){
		var contentButton = [];
		var contentTop = [];
		var content = [];
		var lastScrollTop = 0;
		var scrollDir = '';
		var itemClass = '';
		var itemHover = '';
		var menuSize = null;
		var stickyHeight = 0;
		var stickyMarginB = 0;
		var currentMarginT = 0;
		var topMargin = 0;
		var vartop = 0;
		$(window).scroll(function(event){
   			var st = $(this).scrollTop();
   			if (st > lastScrollTop){
       			scrollDir = 'down';
   			} else {
      			scrollDir = 'up';
   			}
  			lastScrollTop = st;
		});
		$.fn.stickUp = function( options ) {
			// adding a class to users div
			$(this).addClass('stuckMenu');
        	//getting options
        	var objn = 0;
        	if(options != null) {
	        	for(var o in options.parts) {
	        		if (options.parts.hasOwnProperty(o)){
	        			content[objn] = options.parts[objn];
	        			objn++;
	        		}
	        	}
	  			if(objn == 0) {
	  				console.log('error:needs arguments');
	  			}

	  			itemClass = options.itemClass;
	  			itemHover = options.itemHover;
	  			if(options.topMargin != null) {
	  				if(options.topMargin == 'auto') {
	  					topMargin = parseInt($('.stuckMenu').css('margin-top'));
	  				} else {
	  					if(isNaN(options.topMargin) && options.topMargin.search("px") > 0){
	  						topMargin = parseInt(options.topMargin.replace("px",""));
	  					} else if(!isNaN(parseInt(options.topMargin))) {
	  						topMargin = parseInt(options.topMargin);
	  					} else {
	  						console.log("incorrect argument, ignored.");
	  						topMargin = 0;
	  					}	
	  				}
	  			} else {
	  				topMargin = 0;
	  			}
	  			menuSize = $('.'+itemClass).size();
  			}			
			stickyHeight = parseInt($(this).height());
			stickyMarginB = parseInt($(this).css('margin-bottom'));
			currentMarginT = parseInt($(this).next().closest('div').css('margin-top'));
			vartop = parseInt($(this).offset().top);
			//$(this).find('*').removeClass(itemHover);
		}
		$(document).on('scroll', function() {
			varscroll = parseInt($(document).scrollTop());
			if(menuSize != null){
				for(var i=0;i < menuSize;i++)
				{
					contentTop[i] = $('#'+content[i]+'').offset().top;
					function bottomView(i) {
						contentView = $('#'+content[i]+'').height()*.4;
						testView = contentTop[i] - contentView;
						if(varscroll > testView){
							$('.'+itemClass).removeClass(itemHover);
							$('.'+itemClass+':eq('+i+')').addClass(itemHover);
						} else if(varscroll < 50){
							$('.'+itemClass).removeClass(itemHover);
							$('.'+itemClass+':eq(0)').addClass(itemHover);
						}
					}
					if(scrollDir == 'down' && varscroll > contentTop[i]-50 && varscroll < contentTop[i]+50) {
						$('.'+itemClass).removeClass(itemHover);
						$('.'+itemClass+':eq('+i+')').addClass(itemHover);
					}
					if(scrollDir == 'up') {
						bottomView(i);
					}
				}
			}
			if(vartop < varscroll + topMargin){
				$('.stuckMenu').addClass('isStuck');
				$('.stuckMenu').next().closest('div').css({
					'margin-top': stickyHeight + stickyMarginB + currentMarginT + 'px'
				}, 10);
				$('.stuckMenu').css("position","fixed");
				$('.isStuck').css({
					top: '0px'
				}, 10, function(){

				});
			};

			if(varscroll + topMargin < vartop){
				$('.stuckMenu').removeClass('isStuck');
				$('.stuckMenu').next().closest('div').css({
					'margin-top': currentMarginT + 'px'
				}, 10);
				$('.stuckMenu').css("position","relative");
			};
		});
	});
});

/* =======================================================================
 * Bootstrap.modal.js v3.3.0
 * http://getbootstrap.com/javascript/#modals
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
!function($) {
	'use strict';
	// MODAL CLASS DEFINITION
	// ======================	
	var Modal = function(element, options) {
		this.options = options;
		this.$body = $(document.body);
		this.$element = $(element);
		this.$backdrop = 
		this.isShown = null;
		this.scrollbarWidth = 0;

		if (this.options.remote) {
			this.$element.find('.modal-content').load(this.options.remote, $.proxy(function() {
				this.$element.trigger('loaded.bs.modal');
			},
			this))
		}
	}

	Modal.VERSION = '3.3.0';
	Modal.TRANSITION_DURATION = 300;
	Modal.BACKDROP_TRANSITION_DURATION = 150;

	Modal.DEFAULTS = {
		backdrop: true,
		keyboard: true,
		show: true,
	}

	Modal.prototype.toggle = function(_relatedTarget) {
		return this.isShown ? this.hide() : this.show(_relatedTarget)
	}

	Modal.prototype.show = function(_relatedTarget) {
		var that = this;
		var e = $.Event('show.bs.modal', {
			relatedTarget: _relatedTarget
		});

		this.$element.trigger(e);
		if (this.isShown || e.isDefaultPrevented()) return;
		this.isShown = true;
		this.checkScrollbar();
		this.$body.addClass('modal-open');
		this.setScrollbar();
		this.escape();
		this.$element.on('click.dismiss.bs.modal', '[data-dismiss="modal"]', $.proxy(this.hide, this));

		this.backdrop(function() {
			var transition = $.support.transition && that.$element.hasClass('fade');
			if (!that.$element.parent().length) {
				that.$element.appendTo(that.$body); // don't move modals dom position
			}
			that.$element.show().scrollTop(0);
			if (transition) {
				that.$element[0].offsetWidth; // force reflow
			}
			that.$element.addClass('in').attr('aria-hidden', false);

			that.enforceFocus();

			var e = $.Event('shown.bs.modal', {
				relatedTarget: _relatedTarget
			})

			transition ? that.$element.find('.modal-dialog') // wait for modal to slide in
			.one('bsTransitionEnd',
			function() {
				that.$element.trigger('focus').trigger(e)
			}).emulateTransitionEnd(Modal.TRANSITION_DURATION) : that.$element.trigger('focus').trigger(e)
		})
	}

	Modal.prototype.hide = function(e) {
		if (e) e.preventDefault();
		e = $.Event('hide.bs.modal');
		this.$element.trigger(e);
		if (!this.isShown || e.isDefaultPrevented()) return;
		this.isShown = false;
		this.escape();
		$(document).off('focusin.bs.modal');
		this.$element.removeClass('in').attr('aria-hidden', true).off('click.dismiss.bs.modal');
		$.support.transition && this.$element.hasClass('fade') ? this.$element.one('bsTransitionEnd', $.proxy(this.hideModal, this)).emulateTransitionEnd(Modal.TRANSITION_DURATION) : this.hideModal()
	}

	Modal.prototype.enforceFocus = function() {
		$(document).off('focusin.bs.modal') // guard against infinite focus loop
		.on('focusin.bs.modal', $.proxy(function(e) {
			if (this.$element[0] !== e.target && !this.$element.has(e.target).length) {
				this.$element.trigger('focus')
			}
		},
		this))
	}

	Modal.prototype.escape = function() {
		if (this.isShown && this.options.keyboard) {
			this.$element.on('keydown.dismiss.bs.modal', $.proxy(function(e) {
				e.which == 27 && this.hide()
			},
			this))
		} else if (!this.isShown) {
			this.$element.off('keydown.dismiss.bs.modal')
		}
	}

	Modal.prototype.hideModal = function() {
		var that = this;
		this.$element.hide();
		this.backdrop(function() {
			that.$body.removeClass('modal-open');
			that.resetScrollbar();
			that.$element.trigger('hidden.bs.modal');
		})
	}

	Modal.prototype.removeBackdrop = function() {
		this.$backdrop && this.$backdrop.remove();
		this.$backdrop = null;
	}

	Modal.prototype.backdrop = function(callback) {
		var that = this
		var animate = this.$element.hasClass('fade') ? 'fade': ''

		if (this.isShown && this.options.backdrop) {
			var doAnimate = $.support.transition && animate

			this.$backdrop = $('<div class="modal-backdrop ' + animate + '" />').prependTo(this.$element).on('click.dismiss.bs.modal', $.proxy(function(e) {
				if (e.target !== e.currentTarget) return this.options.backdrop == 'static' ? this.$element[0].focus.call(this.$element[0]) : this.hide.call(this)
			},
			this))

			if (doAnimate) this.$backdrop[0].offsetWidth; // force reflow
			this.$backdrop.addClass('in');
			if (!callback) return;
			doAnimate ? this.$backdrop.one('bsTransitionEnd', callback).emulateTransitionEnd(Modal.BACKDROP_TRANSITION_DURATION) : callback();
		} else if (!this.isShown && this.$backdrop) {
			this.$backdrop.removeClass('in');
			var callbackRemove = function() {
				that.removeBackdrop();
				callback && callback();
			}
			$.support.transition && this.$element.hasClass('fade') ? this.$backdrop.one('bsTransitionEnd', callbackRemove).emulateTransitionEnd(Modal.BACKDROP_TRANSITION_DURATION) : callbackRemove()

		} else if (callback) {
			callback();
		}
	}

	Modal.prototype.checkScrollbar = function() {
		this.scrollbarWidth = this.measureScrollbar();
	}

	Modal.prototype.setScrollbar = function() {
		var bodyPad = parseInt((this.$body.css('padding-right') || 0), 10);
		if (this.scrollbarWidth) this.$body.css('padding-right', bodyPad + this.scrollbarWidth);
	}

	Modal.prototype.resetScrollbar = function() {
		this.$body.css('padding-right', '')
	}

	Modal.prototype.measureScrollbar = function() { // thx walsh
		if (document.body.clientWidth >= window.innerWidth) return 0
		var scrollDiv = document.createElement('div');
		scrollDiv.className = 'modal-scrollbar-measure';
		this.$body.append(scrollDiv);
		var scrollbarWidth = scrollDiv.offsetWidth - scrollDiv.clientWidth;
		this.$body[0].removeChild(scrollDiv);
		return scrollbarWidth;
	}

	// MODAL PLUGIN DEFINITION
	// =======================
	function Plugin(option, _relatedTarget) {
		return this.each(function() {
			var $this = $(this);
			var data = $this.data('bs.modal');
			var options = $.extend({},Modal.DEFAULTS, $this.data(), typeof option == 'object' && option);
			if (!data) $this.data('bs.modal', (data = new Modal(this, options)));
			if (typeof option == 'string') data[option](_relatedTarget);
			else if (options.show) data.show(_relatedTarget);
		})
	}

	var old = $.fn.modal;
	$.fn.modal = Plugin;
	$.fn.modal.Constructor = Modal;

	// MODAL NO CONFLICT
	// =================
	$.fn.modal.noConflict = function() {
		$.fn.modal = old;
		return this;
	}

	// MODAL DATA-API
	// ==============
	$(document).on('click.bs.modal.data-api', '[data-toggle="modal"]',
	function(e) {
		var $this = $(this);
		var href = $this.attr('href');
		var $target = $($this.attr('data-target') || (href && href.replace(/.*(?=#[^\s]+$)/, ''))); // strip for ie7
		var option = $target.data('bs.modal') ? 'toggle': $.extend({remote: !/#/.test(href) && href},$target.data(), $this.data());

		if ($this.is('a')) e.preventDefault();
		$target.one('show.bs.modal',function(showEvent) {
			if (showEvent.isDefaultPrevented()) return // only register focus restorer if modal will actually get shown
			$target.one('hidden.bs.modal',function() {
				$this.is(':visible') && $this.trigger('focus');
			});
		});
		Plugin.call($target, option, this);
	});
} (window.jQuery);

/* =======================================================================
 * Bootstrap.dropdown.js v3.3.0
 * http://getbootstrap.com/javascript/#dropdowns
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
!function($) {
	'use strict';
	var backdrop = '.dropdown-backdrop';
	var toggle = '[data-toggle="dropdown"]';
	var Dropdown = function(element) {
		$(element).on('click.bs.dropdown', this.toggle)
	}
	Dropdown.VERSION = '3.3.5';
	function getParent($this) {
		var selector = $this.attr('data-target');
		if (!selector) {
			selector = $this.attr('href');
			selector = selector && /#[A-Za-z]/.test(selector) && selector.replace(/.*(?=#[^\s]*$)/, ''); // strip for ie7
		}
		var $parent = selector && $(selector);
		return $parent && $parent.length ? $parent: $this.parent();
	}
	function clearMenus(e) {
		if (e && e.which === 3) return $(backdrop).remove();
		$(toggle).each(function() {
			var $this = $(this);
			var $parent = getParent($this);
			var relatedTarget = {
				relatedTarget: this
			}
			if (!$parent.hasClass('open')) return;
			if (e && e.type == 'click' && /input|textarea/i.test(e.target.tagName) && $.contains($parent[0], e.target)) return $parent.trigger(e = $.Event('hide.bs.dropdown', relatedTarget));
			if (e.isDefaultPrevented()) return;
			$this.attr('aria-expanded', 'false');
			$parent.removeClass('open').trigger('hidden.bs.dropdown', relatedTarget);
		});
	}
	Dropdown.prototype.toggle = function(e) {
		var $this = $(this);
		if ($this.is('.disabled, :disabled')) return;
		var $parent = getParent($this);
		var isActive = $parent.hasClass('open');
		clearMenus();
		if (!isActive) {
			if ('ontouchstart' in document.documentElement && !$parent.closest('.navbar-nav').length) {
				// if mobile we use a backdrop because click events don't delegate
				$(document.createElement('div')).addClass('dropdown-backdrop').insertAfter($(this)).on('click', clearMenus);
			}
			var relatedTarget = {
				relatedTarget: this
			}
			$parent.trigger(e = $.Event('show.bs.dropdown', relatedTarget));
			if (e.isDefaultPrevented()) return $this.trigger('focus').attr('aria-expanded', 'true');
			$parent.toggleClass('open').trigger('shown.bs.dropdown', relatedTarget);
		}
		return false;
	}
	Dropdown.prototype.keydown = function(e) {
		if (!/(38|40|27|32)/.test(e.which) || /input|textarea/i.test(e.target.tagName)) return;
		var $this = $(this);
		e.preventDefault();
		e.stopPropagation();
		if ($this.is('.disabled, :disabled')) return;
		var $parent = getParent($this);
		var isActive = $parent.hasClass('open');
		if (!isActive && e.which != 27 || isActive && e.which == 27) {
			if (e.which == 27)
			$parent.find(toggle).trigger('focus');
			return;
			$this.trigger('click');
		}
		var desc = ' li:not(.disabled):visible a';
		var $items = $parent.find('.dropdown-menu' + desc);
		if (!$items.length) return;
		var index = $items.index(e.target);
		if (e.which == 38 && index > 0) index-- // up
		if (e.which == 40 && index < $items.length - 1) index++; // down
		if (!~index) index = 0;
		$items.eq(index).trigger('focus');
	}
	function Plugin(option) {
		return this.each(function() {
			var $this = $(this);
			var data = $this.data('bs.dropdown');
			if (!data) {
				$this.data('bs.dropdown', (data = new Dropdown(this)));
			}
			if (typeof option == 'string') {
				data[option].call($this);
			}
		});
	}
	var old = $.fn.dropdown;
	$.fn.dropdown = Plugin;
	$.fn.dropdown.Constructor = Dropdown;
	$.fn.dropdown.noConflict = function() {
		$.fn.dropdown = old;
		return this;
	}
	$(document).on('click.bs.dropdown.data-api', clearMenus).on('click.bs.dropdown.data-api', '.dropdown form',
	function(e) {
		e.stopPropagation()
	}).on('click.bs.dropdown.data-api', toggle, Dropdown.prototype.toggle).on('keydown.bs.dropdown.data-api', toggle, Dropdown.prototype.keydown).on('keydown.bs.dropdown.data-api', '.dropdown-menu', Dropdown.prototype.keydown);
} (window.jQuery);
$(function() {
	/*下拉菜单*/
	$(document).on("mouseenter", ".dropDown",
	function() {
		$(this).addClass("hover");
	});
	$(document).on("mouseleave", ".dropDown",
	function() {
		$(this).removeClass("hover");
	});
	$(document).on("mouseenter", ".dropDown_hover",
	function() {
		$(this).addClass("open");
	});
	$(document).on("mouseleave", ".dropDown_hover",
	function() {
		$(this).removeClass("open");
	});
	$(document).on("click", ".dropDown-menu li a",
	function() {
		$(".dropDown").removeClass('open');
	});
	$(document).on("mouseenter", ".menu > li",
	function() {
		$(this).addClass("open");
	});
	$(document).on("mouseleave", ".menu > li",
	function() {
		$(this).removeClass("open");
	});
});

/* =======================================================================
 * Bootstrap.transition.js v3.3.0
 * http://getbootstrap.com/javascript/#transitions
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
!function ($) {
	'use strict';	
	function transitionEnd() {
		var el = document.createElement('bootstrap');	
		var transEndEventNames = {
			WebkitTransition : 'webkitTransitionEnd',
			MozTransition    : 'transitionend',
			OTransition      : 'oTransitionEnd otransitionend',
			transition       : 'transitionend'
		}	
		for (var name in transEndEventNames) {
			if (el.style[name] !== undefined) {
				return { end: transEndEventNames[name] }
			}
		}		
		return false // explicit for ie8 (  ._.)
	}	
	// http://blog.alexmaccaw.com/css-transitions
	$.fn.emulateTransitionEnd = function (duration) {
		var called = false;
		var $el = this;
		$(this).one('bsTransitionEnd', function () { called = true })
		var callback = function () {
			if (!called) $($el).trigger($.support.transition.end)
		}
		setTimeout(callback, duration);
		return this;
	}	
	$(function () {
		$.support.transition = transitionEnd();	
		if (!$.support.transition) return;
		$.event.special.bsTransitionEnd = {
			bindType: $.support.transition.end,
			delegateType: $.support.transition.end,
			handle: function (e) {
				if ($(e.target).is(this)) return e.handleObj.handler.apply(this, arguments);
			}
		}
	})	
}(window.jQuery);

/* =======================================================================
 * Bootstrap.tooltip.js v3.3.0
 * http://getbootstrap.com/javascript/#tooltip
 * Inspired by the original jQuery.tipsy by Jason Frame
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
!function($) {
	'use strict';

	// TOOLTIP PUBLIC CLASS DEFINITION
	// ===============================
	var Tooltip = function(element, options) {
		this.type = this.options = this.enabled = this.timeout = this.hoverState = this.$element = null;
		this.init('tooltip', element, options);
	}

	Tooltip.VERSION = '3.3.0';
	Tooltip.TRANSITION_DURATION = 150;

	Tooltip.DEFAULTS = {
		animation: true,
		placement: 'top',
		selector: false,
		template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
		trigger: 'hover focus',
		title: '',
		delay: 0,
		html: false,
		container: false,
		viewport: {
			selector: 'body',
			padding: 0
		}
	}

	Tooltip.prototype.init = function(type, element, options) {
		this.enabled = true;
		this.type = type;
		this.$element = $(element);
		this.options = this.getOptions(options);
		this.$viewport = this.options.viewport && $(this.options.viewport.selector || this.options.viewport);

		var triggers = this.options.trigger.split(' ');
		for (var i = triggers.length; i--;) {
			var trigger = triggers[i];
			if (trigger == 'click') {
				this.$element.on('click.' + this.type, this.options.selector, $.proxy(this.toggle, this));
			} else if (trigger != 'manual') {
				var eventIn = trigger == 'hover' ? 'mouseenter': 'focusin';
				var eventOut = trigger == 'hover' ? 'mouseleave': 'focusout';
				this.$element.on(eventIn + '.' + this.type, this.options.selector, $.proxy(this.enter, this));
				this.$element.on(eventOut + '.' + this.type, this.options.selector, $.proxy(this.leave, this));
			}
		}

		this.options.selector ? (this._options = $.extend({},
		this.options, {
			trigger: 'manual',
			selector: ''
		})) : this.fixTitle()
	}

	Tooltip.prototype.getDefaults = function() {
		return Tooltip.DEFAULTS;
	}

	Tooltip.prototype.getOptions = function(options) {
		options = $.extend({},
		this.getDefaults(), this.$element.data(), options);
		if (options.delay && typeof options.delay == 'number') {
			options.delay = {
				show: options.delay,
				hide: options.delay
			}
		}
		return options;
	}

	Tooltip.prototype.getDelegateOptions = function() {
		var options = {}
		var defaults = this.getDefaults()

		this._options && $.each(this._options,
		function(key, value) {
			if (defaults[key] != value) options[key] = value;
		})

		return options;
	}

	Tooltip.prototype.enter = function(obj) {
		var self = obj instanceof this.constructor ? 
		obj: $(obj.currentTarget).data('bs.' + this.type);

		if (self && self.$tip && self.$tip.is(':visible')) {
			self.hoverState = 'in';
			return;
		}

		if (!self) {
			self = new this.constructor(obj.currentTarget, this.getDelegateOptions());
			$(obj.currentTarget).data('bs.' + this.type, self);
		}

		clearTimeout(self.timeout);
		self.hoverState = 'in';
		if (!self.options.delay || !self.options.delay.show) return self.show()

		self.timeout = setTimeout(function() {
			if (self.hoverState == 'in') self.show();
		},
		self.options.delay.show);
	}

	Tooltip.prototype.leave = function(obj) {
		var self = obj instanceof this.constructor ? obj: $(obj.currentTarget).data('bs.' + this.type);

		if (!self) {
			self = new this.constructor(obj.currentTarget, this.getDelegateOptions());
			$(obj.currentTarget).data('bs.' + this.type, self);
		}
		clearTimeout(self.timeout);
		self.hoverState = 'out';

		if (!self.options.delay || !self.options.delay.hide) return self.hide();
		self.timeout = setTimeout(function() {

			if (self.hoverState == 'out') self.hide();
		},
		self.options.delay.hide);
	}

	Tooltip.prototype.show = function() {
		var e = $.Event('show.bs.' + this.type);
		if (this.hasContent() && this.enabled) {
			this.$element.trigger(e);

			var inDom = $.contains(this.$element[0].ownerDocument.documentElement, this.$element[0]);
			if (e.isDefaultPrevented() || !inDom) return;
			var that = this;
			var $tip = this.tip();
			var tipId = this.getUID(this.type);

			this.setContent();
			$tip.attr('id', tipId);
			this.$element.attr('aria-describedby', tipId);

			if (this.options.animation) $tip.addClass('fade');

			var placement = typeof this.options.placement == 'function' ? this.options.placement.call(this, $tip[0], this.$element[0]) : this.options.placement;

			var autoToken = /\s?auto?\s?/i;
			var autoPlace = autoToken.test(placement);
			if (autoPlace) placement = placement.replace(autoToken, '') || 'top';

			$tip.detach().css({
				top: 0,
				left: 0,
				display: 'block'
			}).addClass(placement).data('bs.' + this.type, this);

			this.options.container ? $tip.appendTo(this.options.container) : $tip.insertAfter(this.$element);
			var pos = this.getPosition();
			var actualWidth = $tip[0].offsetWidth;
			var actualHeight = $tip[0].offsetHeight;

			if (autoPlace) {
				var orgPlacement = placement;
				var $container = this.options.container ? $(this.options.container) : this.$element.parent();
				var containerDim = this.getPosition($container);

				placement = placement == 'bottom' && pos.bottom + actualHeight > containerDim.bottom ? 'top': placement == 'top' && pos.top - actualHeight < containerDim.top ? 'bottom': placement == 'right' && pos.right + actualWidth > containerDim.width ? 'left': placement == 'left' && pos.left - actualWidth < containerDim.left ? 'right': placement
				$tip.removeClass(orgPlacement).addClass(placement);
			}

			var calculatedOffset = this.getCalculatedOffset(placement, pos, actualWidth, actualHeight);
			this.applyPlacement(calculatedOffset, placement);
			var complete = function() {
				var prevHoverState = that.hoverState;
				that.$element.trigger('shown.bs.' + that.type);
				that.hoverState = null;
				if (prevHoverState == 'out') that.leave(that);
			}

			$.support.transition && this.$tip.hasClass('fade') ? $tip.one('bsTransitionEnd', complete).emulateTransitionEnd(Tooltip.TRANSITION_DURATION) : complete()
		}
	}

	Tooltip.prototype.applyPlacement = function(offset, placement) {
		var $tip = this.tip();
		var width = $tip[0].offsetWidth;
		var height = $tip[0].offsetHeight;

		// manually read margins because getBoundingClientRect includes difference
		var marginTop = parseInt($tip.css('margin-top'), 10);
		var marginLeft = parseInt($tip.css('margin-left'), 10);

		// we must check for NaN for ie 8/9
		if (isNaN(marginTop)) marginTop = 0;
		if (isNaN(marginLeft)) marginLeft = 0;

		offset.top = offset.top + marginTop;
		offset.left = offset.left + marginLeft;

		// $.fn.offset doesn't round pixel values
		// so we use setOffset directly with our own function B-0
		$.offset.setOffset($tip[0], $.extend({
			using: function(props) {
				$tip.css({
					top: Math.round(props.top),
					left: Math.round(props.left)
				})
			}
		},
		offset), 0);

		$tip.addClass('in');

		// check to see if placing tip in new offset caused the tip to resize itself
		var actualWidth = $tip[0].offsetWidth;
		var actualHeight = $tip[0].offsetHeight;

		if (placement == 'top' && actualHeight != height) {
			offset.top = offset.top + height - actualHeight;
		}

		var delta = this.getViewportAdjustedDelta(placement, offset, actualWidth, actualHeight);

		if (delta.left) offset.left += delta.left;
		else offset.top += delta.top;

		var isVertical = /top|bottom/.test(placement);
		var arrowDelta = isVertical ? delta.left * 2 - width + actualWidth: delta.top * 2 - height + actualHeight;
		var arrowOffsetPosition = isVertical ? 'offsetWidth': 'offsetHeight';

		$tip.offset(offset);
		this.replaceArrow(arrowDelta, $tip[0][arrowOffsetPosition], isVertical);
	}

	Tooltip.prototype.replaceArrow = function(delta, dimension, isHorizontal) {
		this.arrow().css(isHorizontal ? 'left': 'top', 50 * (1 - delta / dimension) + '%').css(isHorizontal ? 'top': 'left', '');
	}

	Tooltip.prototype.setContent = function() {
		var $tip = this.tip();
		var title = this.getTitle();
		$tip.find('.tooltip-inner')[this.options.html ? 'html': 'text'](title);
		$tip.removeClass('fade in top bottom left right');
	}

	Tooltip.prototype.hide = function(callback) {
		var that = this;
		var $tip = this.tip();
		var e = $.Event('hide.bs.' + this.type);
		function complete() {
			if (that.hoverState != 'in') $tip.detach();
			that.$element.removeAttr('aria-describedby').trigger('hidden.bs.' + that.type);
			callback && callback();
		}
		this.$element.trigger(e);
		if (e.isDefaultPrevented()) return;
		$tip.removeClass('in');

		$.support.transition && this.$tip.hasClass('fade') ? $tip.one('bsTransitionEnd', complete).emulateTransitionEnd(Tooltip.TRANSITION_DURATION) : complete();
		this.hoverState = null;
		return this;
	}

	Tooltip.prototype.fixTitle = function() {
		var $e = this.$element
		if ($e.attr('title') || typeof($e.attr('data-original-title')) != 'string') {
			$e.attr('data-original-title', $e.attr('title') || '').attr('title', '')
		}
	}

	Tooltip.prototype.hasContent = function() {
		return this.getTitle();
	}

	Tooltip.prototype.getPosition = function($element) {
		$element = $element || this.$element;
		var el = $element[0];
		var isBody = el.tagName == 'BODY';
		var elRect = el.getBoundingClientRect();
		if (elRect.width == null) {
			// width and height are missing in IE8, so compute them manually; see https://github.com/twbs/bootstrap/issues/14093
			elRect = $.extend({},
			elRect, {
				width: elRect.right - elRect.left,
				height: elRect.bottom - elRect.top
			});
		}
		var elOffset = isBody ? {
			top: 0,
			left: 0
		}: $element.offset();
		var scroll = {
			scroll: isBody ? document.documentElement.scrollTop || document.body.scrollTop: $element.scrollTop()
		}
		var outerDims = isBody ? {
			width: $(window).width(),
			height: $(window).height()
		}: null
		return $.extend({},
		elRect, scroll, outerDims, elOffset)
	}

	Tooltip.prototype.getCalculatedOffset = function(placement, pos, actualWidth, actualHeight) {
		return placement == 'bottom' ? {
			top: pos.top + pos.height,
			left: pos.left + pos.width / 2 - actualWidth / 2
		}: placement == 'top' ? {
			top: pos.top - actualHeight,
			left: pos.left + pos.width / 2 - actualWidth / 2
		}: placement == 'left' ? {
			top: pos.top + pos.height / 2 - actualHeight / 2,
			left: pos.left - actualWidth
		}:
		/* placement == 'right' */
		{
			top: pos.top + pos.height / 2 - actualHeight / 2,
			left: pos.left + pos.width
		}

	}

	Tooltip.prototype.getViewportAdjustedDelta = function(placement, pos, actualWidth, actualHeight) {
		var delta = {
			top: 0,
			left: 0
		}
		if (!this.$viewport) return delta;

		var viewportPadding = this.options.viewport && this.options.viewport.padding || 0;
		var viewportDimensions = this.getPosition(this.$viewport);

		if (/right|left/.test(placement)) {
			var topEdgeOffset = pos.top - viewportPadding - viewportDimensions.scroll;
			var bottomEdgeOffset = pos.top + viewportPadding - viewportDimensions.scroll + actualHeight;
			if (topEdgeOffset < viewportDimensions.top) { // top overflow
				delta.top = viewportDimensions.top - topEdgeOffset;
			} else if (bottomEdgeOffset > viewportDimensions.top + viewportDimensions.height) { // bottom overflow
				delta.top = viewportDimensions.top + viewportDimensions.height - bottomEdgeOffset;
			}
		} else {
			var leftEdgeOffset = pos.left - viewportPadding;
			var rightEdgeOffset = pos.left + viewportPadding + actualWidth;
			if (leftEdgeOffset < viewportDimensions.left) { // left overflow
				delta.left = viewportDimensions.left - leftEdgeOffset;
			} else if (rightEdgeOffset > viewportDimensions.width) { // right overflow
				delta.left = viewportDimensions.left + viewportDimensions.width - rightEdgeOffset;
			}
		}
		return delta
	}

	Tooltip.prototype.getTitle = function() {
		var title;
		var $e = this.$element;
		var o = this.options;
		title = $e.attr('data-original-title') || (typeof o.title == 'function' ? o.title.call($e[0]) : o.title)
		return title;
	}

	Tooltip.prototype.getUID = function(prefix) {
		do prefix += ~~ (Math.random() * 1000000);
		while (document.getElementById(prefix));
		return prefix;
	}

	Tooltip.prototype.tip = function() {
		return (this.$tip = this.$tip || $(this.options.template));
	}

	Tooltip.prototype.arrow = function() {
		return (this.$arrow = this.$arrow || this.tip().find('.tooltip-arrow'));
	}

	Tooltip.prototype.enable = function() {
		this.enabled = true;
	}

	Tooltip.prototype.disable = function() {
		this.enabled = false;
	}

	Tooltip.prototype.toggleEnabled = function() {
		this.enabled = !this.enabled;
	}

	Tooltip.prototype.toggle = function(e) {
		var self = this;
		if (e) {
			self = $(e.currentTarget).data('bs.' + this.type);
			if (!self) {
				self = new this.constructor(e.currentTarget, this.getDelegateOptions());
				$(e.currentTarget).data('bs.' + this.type, self);
			}
		}
		self.tip().hasClass('in') ? self.leave(self) : self.enter(self)
	}

	Tooltip.prototype.destroy = function() {
		var that = this;
		clearTimeout(this.timeout);
		this.hide(function() {
			that.$element.off('.' + that.type).removeData('bs.' + that.type);
		});
	}

	// TOOLTIP PLUGIN DEFINITION
	// =========================
	function Plugin(option) {
		return this.each(function() {
			var $this = $(this);
			var data = $this.data('bs.tooltip');
			var options = typeof option == 'object' && option;
			var selector = options && options.selector;

			if (!data && option == 'destroy') return;
			if (selector) {
				if (!data) $this.data('bs.tooltip', (data = {}));
				if (!data[selector]) data[selector] = new Tooltip(this, options);
			} else {
				if (!data) $this.data('bs.tooltip', (data = new Tooltip(this, options)));
			}
			if (typeof option == 'string') data[option]()
		})
	}

	var old = $.fn.tooltip;
	$.fn.tooltip = Plugin;
	$.fn.tooltip.Constructor = Tooltip;
	// TOOLTIP NO CONFLICT
	// ===================
	$.fn.tooltip.noConflict = function() {
		$.fn.tooltip = old;
		return this;
	}
} (window.jQuery);
$(function() {
	$("[data-toggle='tooltip']").tooltip();
});

/* =======================================================================
 * Bootstrap.popover.js v3.3.0
 * http://getbootstrap.com/javascript/#popovers
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
!
function($) {
	'use strict';
	// POPOVER PUBLIC CLASS DEFINITION
	// ===============================	
	var Popover = function(element, options) {
		this.init('popover', element, options)
	}

	if (!$.fn.tooltip) throw new Error('Popover requires tooltip.js');
	Popover.VERSION = '3.3.0';
	Popover.DEFAULTS = $.extend({},
	$.fn.tooltip.Constructor.DEFAULTS, {
		placement: 'right',
		trigger: 'click',
		content: '',
		template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
	})

	// NOTE: POPOVER EXTENDS tooltip.js
	// ================================	
	Popover.prototype = $.extend({},$.fn.tooltip.Constructor.prototype);
	Popover.prototype.constructor = Popover;
	Popover.prototype.getDefaults = function() {
		return Popover.DEFAULTS;
	}

	Popover.prototype.setContent = function() {
		var $tip = this.tip();
		var title = this.getTitle();
		var content = this.getContent();

		$tip.find('.popover-title')[this.options.html ? 'html': 'text'](title);
		$tip.find('.popover-content').children().detach().end()[ // we use append for html objects to maintain js events
			this.options.html ? (typeof content == 'string' ? 'html': 'append') : 'text'](content)

		$tip.removeClass('fade top bottom left right in');

		// IE8 doesn't accept hiding via the `:empty` pseudo selector, we have to do
		// this manually by checking the contents.
		if (!$tip.find('.popover-title').html()) $tip.find('.popover-title').hide();
	}

	Popover.prototype.hasContent = function() {
		return this.getTitle() || this.getContent()
	}

	Popover.prototype.getContent = function() {
		var $e = this.$element;
		var o = this.options;

		return $e.attr('data-content') || (typeof o.content == 'function' ? o.content.call($e[0]) : o.content)
	}

	Popover.prototype.arrow = function() {
		return (this.$arrow = this.$arrow || this.tip().find('.arrow'))
	}

	Popover.prototype.tip = function() {
		if (!this.$tip) this.$tip = $(this.options.template);
		return this.$tip;
	}

	// POPOVER PLUGIN DEFINITION
	// =========================	
	function Plugin(option) {
		return this.each(function() {
			var $this = $(this);
			var data = $this.data('bs.popover');
			var options = typeof option == 'object' && option;
			var selector = options && options.selector;

			if (!data && option == 'destroy') return;
			if (selector) {
				if (!data) $this.data('bs.popover', (data = {}));
				if (!data[selector]) data[selector] = new Popover(this, options);
			} else {
				if (!data) $this.data('bs.popover', (data = new Popover(this, options)))
			}
			if (typeof option == 'string') data[option]()
		})
	}

	var old = $.fn.popover

	$.fn.popover = Plugin;
	$.fn.popover.Constructor = Popover;

	// POPOVER NO CONFLICT
	// ===================
	$.fn.popover.noConflict = function() {
		$.fn.popover = old;
		return this;
	}
} (window.jQuery);
$(function() {
	$("[data-toggle='popover']").popover();
});

/* =======================================================================
 * Bootstrap.alert.js v3.3.0
 * http://getbootstrap.com/javascript/#alerts
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
!function($) {
	'use strict';
	// ALERT CLASS DEFINITION
	// ======================
	var dismiss = '[data-dismiss="alert"]'
	var Alert = function(el) {
		$(el).on('click', dismiss, this.close)
	}

	Alert.VERSION = '3.3.0'

	Alert.TRANSITION_DURATION = 150

	Alert.prototype.close = function(e) {
		var $this = $(this);
		var selector = $this.attr('data-target');

		if (!selector) {
			selector = $this.attr('href');
			selector = selector && selector.replace(/.*(?=#[^\s]*$)/, ''); // strip for ie7
		}

		var $parent = $(selector);
		if (e) e.preventDefault();
		if (!$parent.length) {
			$parent = $this.closest('.alert');
		}

		$parent.trigger(e = $.Event('close.bs.alert'))

		if (e.isDefaultPrevented()) return;

		$parent.removeClass('in');
		function removeElement() {
			// detach from parent, fire event then clean up data
			$parent.detach().trigger('closed.bs.alert').remove();
		}

		$.support.transition && $parent.hasClass('fade') ? $parent.one('bsTransitionEnd', removeElement).emulateTransitionEnd(Alert.TRANSITION_DURATION) : removeElement()
	}

	// ALERT PLUGIN DEFINITION
	// =======================
	function Plugin(option) {
		return this.each(function() {
			var $this = $(this);
			var data = $this.data('bs.alert');
			if (!data) $this.data('bs.alert', (data = new Alert(this)));
			if (typeof option == 'string') data[option].call($this);
		})
	}

	var old = $.fn.alert;
	$.fn.alert = Plugin;
	$.fn.alert.Constructor = Alert;

	// ALERT NO CONFLICT
	// =================	
	$.fn.alert.noConflict = function() {
		$.fn.alert = old;
		return this;
	}
	// ALERT DATA-API
	// ==============
	$(document).on('click.bs.alert.data-api', dismiss, Alert.prototype.close)
} (window.jQuery);

/* =========================================================
 * Bootstrap.slider.js v1.0.1
 * Maintainers:
 *		Kyle Kemp
 *			- Twitter: @seiyria
 *			- Github:  seiyria
 *		Rohit Kalkur
 *			- Twitter: @Rovolutionary
 *			- Github:  rovolution
 *
 * =========================================================
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * Bridget makes jQuery widgets
 * MIT license
 * ========================================================= */
(function(root, factory) {
	if (typeof define === "function" && define.amd) {
		define(["jquery"], factory);
	} else if (typeof module === "object" && module.exports) {
		var jQuery;
		try {
			jQuery = require("jquery");
		} catch(err) {
			jQuery = null;
		}
		module.exports = factory(jQuery);
	} else {
		root.Slider = factory(root.jQuery);
	}
} (this,
function($) {
	// Reference to Slider constructor
	var Slider; (function($) {
		'use strict';
		// -------------------------- utils -------------------------- //
		var slice = Array.prototype.slice;
		function noop() {}
		// -------------------------- definition -------------------------- //
		function defineBridget($) {
			// bail if no jQuery
			if (!$) {
				return;
			}
			// -------------------------- addOptionMethod -------------------------- //
			/**
			 * adds option method -> $().plugin('option', {...})
			 * @param {Function} PluginClass - constructor class
			 */
			function addOptionMethod(PluginClass) {
				// don't overwrite original option method
				if (PluginClass.prototype.option) {
					return;
				}
				// option setter
				PluginClass.prototype.option = function(opts) {
					// bail out if not an object
					if (!$.isPlainObject(opts)) {
						return;
					}
					this.options = $.extend(true, this.options, opts);
				};
			}
			// -------------------------- plugin bridge -------------------------- //
			// helper function for logging errors
			// $.error breaks jQuery chaining
			var logError = typeof console === 'undefined' ? noop: function(message) {
				console.error(message);
			};
			/**
			 * jQuery plugin bridge, access methods like $elem.plugin('method')
			 * @param {String} namespace - plugin name
			 * @param {Function} PluginClass - constructor class
			*/
			function bridge(namespace, PluginClass) {
				// add to jQuery fn namespace
				$.fn[namespace] = function(options) {
					if (typeof options === 'string') {
						// call plugin method when first argument is a string
						// get arguments for method
						var args = slice.call(arguments, 1);
						for (var i = 0,
						len = this.length; i < len; i++) {
							var elem = this[i];
							var instance = $.data(elem, namespace);
							if (!instance) {
								logError("cannot call methods on " + namespace + " prior to initialization; " + "attempted to call '" + options + "'");
								continue;
							}
							if (!$.isFunction(instance[options]) || options.charAt(0) === '_') {
								logError("no such method '" + options + "' for " + namespace + " instance");
								continue;
							}
							// trigger method with arguments
							var returnValue = instance[options].apply(instance, args);

							// break look and return first value if provided
							if (returnValue !== undefined && returnValue !== instance) {
								return returnValue;
							}
						}
						// return this if no return value
						return this;
					} else {
						var objects = this.map(function() {
							var instance = $.data(this, namespace);
							if (instance) {
								// apply options & init
								instance.option(options);
								instance._init();
							} else {
								// initialize new instance
								instance = new PluginClass(this, options);
								$.data(this, namespace, instance);
							}
							return $(this);
						});
						if (!objects || objects.length > 1) {
							return objects;
						} else {
							return objects[0];
						}
					}
				};
			}

			// -------------------------- bridget -------------------------- //
			/**
			 * converts a Prototypical class into a proper jQuery plugin
			 *   the class must have a ._init method
			 * @param {String} namespace - plugin name, used in $().pluginName
			 * @param {Function} PluginClass - constructor class
			 */
			$.bridget = function(namespace, PluginClass) {
				addOptionMethod(PluginClass);
				bridge(namespace, PluginClass);
			};
			return $.bridget;
		}

		// get jquery from browser global
		defineBridget($);
	})($);
	/*************************************************
			BOOTSTRAP-SLIDER SOURCE CODE
	**************************************************/
	(function($) {
		var ErrorMsgs = {
			formatInvalidInputErrorMsg: function(input) {
				return "Invalid input value '" + input + "' passed in";
			},
			callingContextNotSliderInstance: "Calling context element does not have instance of Slider bound to it. Check your code to make sure the JQuery object returned from the call to the slider() initializer is calling the method"
		};

		/*************************************************
							CONSTRUCTOR
		**************************************************/
		Slider = function(element, options) {
			createNewSlider.call(this, element, options);
			return this;
		};
		function createNewSlider(element, options) {
			/*************************************************
							Create Markup
			**************************************************/
			if (typeof element === "string") {
				this.element = document.querySelector(element);
			} else if (element instanceof HTMLElement) {
				this.element = element;
			}

			var origWidth = this.element.style.width;
			var updateSlider = false;
			var parent = this.element.parentNode;
			var sliderTrackSelection;
			var sliderMinHandle;
			var sliderMaxHandle;

			if (this.sliderElem) {
				updateSlider = true;
			} else {
				/* Create elements needed for slider */
				this.sliderElem = document.createElement("div");
				this.sliderElem.className = "slider";

				/* Create slider track elements */
				var sliderTrack = document.createElement("div");
				sliderTrack.className = "slider-track";

				sliderTrackSelection = document.createElement("div");
				sliderTrackSelection.className = "slider-selection";

				sliderMinHandle = document.createElement("div");
				sliderMinHandle.className = "slider-handle min-slider-handle";

				sliderMaxHandle = document.createElement("div");
				sliderMaxHandle.className = "slider-handle max-slider-handle";

				sliderTrack.appendChild(sliderTrackSelection);
				sliderTrack.appendChild(sliderMinHandle);
				sliderTrack.appendChild(sliderMaxHandle);

				var createAndAppendTooltipSubElements = function(tooltipElem) {
					var arrow = document.createElement("div");
					arrow.className = "tooltip-arrow";

					var inner = document.createElement("div");
					inner.className = "tooltip-inner";

					tooltipElem.appendChild(arrow);
					tooltipElem.appendChild(inner);
				};

				/* Create tooltip elements */
				var sliderTooltip = document.createElement("div");
				sliderTooltip.className = "tooltip tooltip-main";
				createAndAppendTooltipSubElements(sliderTooltip);

				var sliderTooltipMin = document.createElement("div");
				sliderTooltipMin.className = "tooltip tooltip-min";
				createAndAppendTooltipSubElements(sliderTooltipMin);

				var sliderTooltipMax = document.createElement("div");
				sliderTooltipMax.className = "tooltip tooltip-max";
				createAndAppendTooltipSubElements(sliderTooltipMax);

				/* Append components to sliderElem */
				this.sliderElem.appendChild(sliderTrack);
				this.sliderElem.appendChild(sliderTooltip);
				this.sliderElem.appendChild(sliderTooltipMin);
				this.sliderElem.appendChild(sliderTooltipMax);

				/* Append slider element to parent container, right before the original <input> element */
				parent.insertBefore(this.sliderElem, this.element);

				/* Hide original <input> element */
				this.element.style.display = "none";
			}
			/* If JQuery exists, cache JQ references */
			if ($) {
				this.$element = $(this.element);
				this.$sliderElem = $(this.sliderElem);
			}

			/*************************************************
							Process Options
			**************************************************/
			options = options ? options: {};
			var optionTypes = Object.keys(this.defaultOptions);

			for (var i = 0; i < optionTypes.length; i++) {
				var optName = optionTypes[i];

				// First check if an option was passed in via the constructor
				var val = options[optName];
				// If no data attrib, then check data atrributes
				val = (typeof val !== 'undefined') ? val : getDataAttrib(this.element, optName);
				// Finally, if nothing was specified, use the defaults
				val = (val !== null) ? val : this.defaultOptions[optName];

				// Set all options on the instance of the Slider
				if (!this.options) {
					this.options = {};
				}
				this.options[optName] = val;
			}

			function getDataAttrib(element, optName) {
				var dataName = "data-slider-" + optName;
				var dataValString = element.getAttribute(dataName);

				try {
					return JSON.parse(dataValString);
				} catch(err) {
					return dataValString;
				}
			}
			/*************************************************
								Setup
			**************************************************/
			this.eventToCallbackMap = {};
			this.sliderElem.id = this.options.id;

			this.touchCapable = 'ontouchstart' in window || (window.DocumentTouch && document instanceof window.DocumentTouch);

			this.tooltip = this.sliderElem.querySelector('.tooltip-main');
			this.tooltipInner = this.tooltip.querySelector('.tooltip-inner');

			this.tooltip_min = this.sliderElem.querySelector('.tooltip-min');
			this.tooltipInner_min = this.tooltip_min.querySelector('.tooltip-inner');

			this.tooltip_max = this.sliderElem.querySelector('.tooltip-max');
			this.tooltipInner_max = this.tooltip_max.querySelector('.tooltip-inner');

			if (updateSlider === true) {
				// Reset classes
				this._removeClass(this.sliderElem, 'slider-horizontal');
				this._removeClass(this.sliderElem, 'slider-vertical');
				this._removeClass(this.tooltip, 'hide');
				this._removeClass(this.tooltip_min, 'hide');
				this._removeClass(this.tooltip_max, 'hide');

				// Undo existing inline styles for track
				["left", "top", "width", "height"].forEach(function(prop) {
					this._removeProperty(this.trackSelection, prop);
				},
				this);

				// Undo inline styles on handles
				[this.handle1, this.handle2].forEach(function(handle) {
					this._removeProperty(handle, 'left');
					this._removeProperty(handle, 'top');
				},
				this);

				// Undo inline styles and classes on tooltips
				[this.tooltip, this.tooltip_min, this.tooltip_max].forEach(function(tooltip) {
					this._removeProperty(tooltip, 'left');
					this._removeProperty(tooltip, 'top');
					this._removeProperty(tooltip, 'margin-left');
					this._removeProperty(tooltip, 'margin-top');

					this._removeClass(tooltip, 'right');
					this._removeClass(tooltip, 'top');
				},
				this);
			}

			if (this.options.orientation === 'vertical') {
				this._addClass(this.sliderElem, 'slider-vertical');

				this.stylePos = 'top';
				this.mousePos = 'pageY';
				this.sizePos = 'offsetHeight';

				this._addClass(this.tooltip, 'right');
				this.tooltip.style.left = '100%';

				this._addClass(this.tooltip_min, 'right');
				this.tooltip_min.style.left = '100%';

				this._addClass(this.tooltip_max, 'right');
				this.tooltip_max.style.left = '100%';
			} else {
				this._addClass(this.sliderElem, 'slider-horizontal');
				this.sliderElem.style.width = origWidth;

				this.options.orientation = 'horizontal';
				this.stylePos = 'left';
				this.mousePos = 'pageX';
				this.sizePos = 'offsetWidth';

				this._addClass(this.tooltip, 'top');
				this.tooltip.style.top = -this.tooltip.outerHeight - 14 + 'px';

				this._addClass(this.tooltip_min, 'top');
				this.tooltip_min.style.top = -this.tooltip_min.outerHeight - 14 + 'px';

				this._addClass(this.tooltip_max, 'top');
				this.tooltip_max.style.top = -this.tooltip_max.outerHeight - 14 + 'px';
			}

			if (this.options.value instanceof Array) {
				this.options.range = true;
			} else if (this.options.range) {
				// User wants a range, but value is not an array
				this.options.value = [this.options.value, this.options.max];
			}

			this.trackSelection = sliderTrackSelection || this.trackSelection;
			if (this.options.selection === 'none') {
				this._addClass(this.trackSelection, 'hide');
			}

			this.handle1 = sliderMinHandle || this.handle1;
			this.handle2 = sliderMaxHandle || this.handle2;

			if (updateSlider === true) {
				// Reset classes
				this._removeClass(this.handle1, 'round triangle');
				this._removeClass(this.handle2, 'round triangle hide');
			}

			var availableHandleModifiers = ['round', 'triangle', 'custom'];
			var isValidHandleType = availableHandleModifiers.indexOf(this.options.handle) !== -1;
			if (isValidHandleType) {
				this._addClass(this.handle1, this.options.handle);
				this._addClass(this.handle2, this.options.handle);
			}

			this.offset = this._offset(this.sliderElem);
			this.size = this.sliderElem[this.sizePos];
			this.setValue(this.options.value);

			/******************************************
						Bind Event Listeners
			******************************************/
			// Bind keyboard handlers
			this.handle1Keydown = this._keydown.bind(this, 0);
			this.handle1.addEventListener("keydown", this.handle1Keydown, false);

			this.handle2Keydown = this._keydown.bind(this, 1);
			this.handle2.addEventListener("keydown", this.handle2Keydown, false);

			if (this.touchCapable) {
				// Bind touch handlers
				this.mousedown = this._mousedown.bind(this);
				this.sliderElem.addEventListener("touchstart", this.mousedown, false);
			} else {
				// Bind mouse handlers
				this.mousedown = this._mousedown.bind(this);
				this.sliderElem.addEventListener("mousedown", this.mousedown, false);
			}

			// Bind tooltip-related handlers
			if (this.options.tooltip === 'hide') {
				this._addClass(this.tooltip, 'hide');
				this._addClass(this.tooltip_min, 'hide');
				this._addClass(this.tooltip_max, 'hide');
			} else if (this.options.tooltip === 'always') {
				this._showTooltip();
				this._alwaysShowTooltip = true;
			} else {
				this.showTooltip = this._showTooltip.bind(this);
				this.hideTooltip = this._hideTooltip.bind(this);

				this.sliderElem.addEventListener("mouseenter", this.showTooltip, false);
				this.sliderElem.addEventListener("mouseleave", this.hideTooltip, false);

				this.handle1.addEventListener("focus", this.showTooltip, false);
				this.handle1.addEventListener("blur", this.hideTooltip, false);

				this.handle2.addEventListener("focus", this.showTooltip, false);
				this.handle2.addEventListener("blur", this.hideTooltip, false);
			}

			if (this.options.enabled) {
				this.enable();
			} else {
				this.disable();
			}
		}

		/*************************************************
					INSTANCE PROPERTIES/METHODS
		- Any methods bound to the prototype are considered
		part of the plugin's `public` interface
		**************************************************/
		Slider.prototype = {
			_init: function() {},
			// NOTE: Must exist to support bridget
			constructor: Slider,

			defaultOptions: {
				id: "",
				min: 0,
				max: 10,
				step: 1,
				precision: 0,
				orientation: 'horizontal',
				value: 5,
				range: false,
				selection: 'before',
				tooltip: 'show',
				tooltip_split: false,
				handle: 'round',
				reversed: false,
				enabled: true,
				formatter: function(val) {
					if (val instanceof Array) {
						return val[0] + " : " + val[1];
					} else {
						return val;
					}
				},
				natural_arrow_keys: false
			},

			over: false,

			inDrag: false,

			getValue: function() {
				if (this.options.range) {
					return this.options.value;
				}
				return this.options.value[0];
			},

			setValue: function(val, triggerSlideEvent) {
				if (!val) {
					val = 0;
				}
				var oldValue = this.getValue();
				this.options.value = this._validateInputValue(val);
				var applyPrecision = this._applyPrecision.bind(this);

				if (this.options.range) {
					this.options.value[0] = applyPrecision(this.options.value[0]);
					this.options.value[1] = applyPrecision(this.options.value[1]);

					this.options.value[0] = Math.max(this.options.min, Math.min(this.options.max, this.options.value[0]));
					this.options.value[1] = Math.max(this.options.min, Math.min(this.options.max, this.options.value[1]));
				} else {
					this.options.value = applyPrecision(this.options.value);
					this.options.value = [Math.max(this.options.min, Math.min(this.options.max, this.options.value))];
					this._addClass(this.handle2, 'hide');
					if (this.options.selection === 'after') {
						this.options.value[1] = this.options.max;
					} else {
						this.options.value[1] = this.options.min;
					}
				}

				this.diff = this.options.max - this.options.min;
				if (this.diff > 0) {
					this.percentage = [
						(this.options.value[0] - this.options.min) * 100 / this.diff,
						(this.options.value[1] - this.options.min) * 100 / this.diff,
						this.options.step * 100 / this.diff];
				} else {
					this.percentage = [0, 0, 100];
				}

				this._layout();
				var newValue = this.options.range ? this.options.value : this.options.value[0];

				if (triggerSlideEvent === true) {
					this._trigger('slide', newValue);
				}
				if (oldValue !== newValue) {
					this._trigger('change', {
						oldValue: oldValue,
						newValue: newValue
					});
				}
				this._setDataVal(newValue);

				return this;
			},

			destroy: function() {
				// Remove event handlers on slider elements
				this._removeSliderEventHandlers();

				// Remove the slider from the DOM
				this.sliderElem.parentNode.removeChild(this.sliderElem);
				/* Show original <input> element */
				this.element.style.display = "";

				// Clear out custom event bindings
				this._cleanUpEventCallbacksMap();

				// Remove data values
				this.element.removeAttribute("data");

				// Remove JQuery handlers/data
				if ($) {
					this._unbindJQueryEventHandlers();
					this.$element.removeData('slider');
				}
			},

			disable: function() {
				this.options.enabled = false;
				this.handle1.removeAttribute("tabindex");
				this.handle2.removeAttribute("tabindex");
				this._addClass(this.sliderElem, 'slider-disabled');
				this._trigger('slideDisabled');

				return this;
			},

			enable: function() {
				this.options.enabled = true;
				this.handle1.setAttribute("tabindex", 0);
				this.handle2.setAttribute("tabindex", 0);
				this._removeClass(this.sliderElem, 'slider-disabled');
				this._trigger('slideEnabled');

				return this;
			},

			toggle: function() {
				if (this.options.enabled) {
					this.disable();
				} else {
					this.enable();
				}

				return this;
			},

			isEnabled: function() {
				return this.options.enabled;
			},

			on: function(evt, callback) {
				if ($) {
					this.$element.on(evt, callback);
					this.$sliderElem.on(evt, callback);
				} else {
					this._bindNonQueryEventHandler(evt, callback);
				}
				return this;
			},

			getAttribute: function(attribute) {
				if (attribute) {

					return this.options[attribute];
				} else {
					return this.options;
				}
			},

			setAttribute: function(attribute, value) {
				this.options[attribute] = value;
				return this;
			},

			refresh: function() {
				this._removeSliderEventHandlers();
				createNewSlider.call(this, this.element, this.options);
				if ($) {
					// Bind new instance of slider to the element
					$.data(this.element, 'slider', this);
				}
				return this;
			},

			relayout: function() {
				this._layout();
				return this;
			},

			/******************************+
						HELPERS
			- Any method that is not part of the public interface.
			- Place it underneath this comment block and write its signature like so:
			  					_fnName : function() {...}
			********************************/
			_removeSliderEventHandlers: function() {
				// Remove event listeners from handle1
				this.handle1.removeEventListener("keydown", this.handle1Keydown, false);
				this.handle1.removeEventListener("focus", this.showTooltip, false);
				this.handle1.removeEventListener("blur", this.hideTooltip, false);

				// Remove event listeners from handle2
				this.handle2.removeEventListener("keydown", this.handle2Keydown, false);
				this.handle2.removeEventListener("focus", this.handle2Keydown, false);
				this.handle2.removeEventListener("blur", this.handle2Keydown, false);

				// Remove event listeners from sliderElem
				this.sliderElem.removeEventListener("mouseenter", this.showTooltip, false);
				this.sliderElem.removeEventListener("mouseleave", this.hideTooltip, false);
				this.sliderElem.removeEventListener("touchstart", this.mousedown, false);
				this.sliderElem.removeEventListener("mousedown", this.mousedown, false);
			},
			_bindNonQueryEventHandler: function(evt, callback) {
				if (this.eventToCallbackMap[evt] === undefined) {
					this.eventToCallbackMap[evt] = [];
				}
				this.eventToCallbackMap[evt].push(callback);
			},
			_cleanUpEventCallbacksMap: function() {
				var eventNames = Object.keys(this.eventToCallbackMap);
				for (var i = 0; i < eventNames.length; i++) {
					var eventName = eventNames[i];
					this.eventToCallbackMap[eventName] = null;
				}
			},
			_showTooltip: function() {
				if (this.options.tooltip_split === false) {
					this._addClass(this.tooltip, 'in');
				} else {
					this._addClass(this.tooltip_min, 'in');
					this._addClass(this.tooltip_max, 'in');
				}
				this.over = true;
			},
			_hideTooltip: function() {
				if (this.inDrag === false && this.alwaysShowTooltip !== true) {
					this._removeClass(this.tooltip, 'in');
					this._removeClass(this.tooltip_min, 'in');
					this._removeClass(this.tooltip_max, 'in');
				}
				this.over = false;
			},
			_layout: function() {
				var positionPercentages;

				if (this.options.reversed) {
					positionPercentages = [100 - this.percentage[0], this.percentage[1]];
				} else {
					positionPercentages = [this.percentage[0], this.percentage[1]];
				}

				this.handle1.style[this.stylePos] = positionPercentages[0] + '%';
				this.handle2.style[this.stylePos] = positionPercentages[1] + '%';

				if (this.options.orientation === 'vertical') {
					this.trackSelection.style.top = Math.min(positionPercentages[0], positionPercentages[1]) + '%';
					this.trackSelection.style.height = Math.abs(positionPercentages[0] - positionPercentages[1]) + '%';
				} else {
					this.trackSelection.style.left = Math.min(positionPercentages[0], positionPercentages[1]) + '%';
					this.trackSelection.style.width = Math.abs(positionPercentages[0] - positionPercentages[1]) + '%';

					var offset_min = this.tooltip_min.getBoundingClientRect();
					var offset_max = this.tooltip_max.getBoundingClientRect();

					if (offset_min.right > offset_max.left) {
						this._removeClass(this.tooltip_max, 'top');
						this._addClass(this.tooltip_max, 'bottom');
						this.tooltip_max.style.top = 18 + 'px';
					} else {
						this._removeClass(this.tooltip_max, 'bottom');
						this._addClass(this.tooltip_max, 'top');
						this.tooltip_max.style.top = this.tooltip_min.style.top;
					}
				}

				var formattedTooltipVal;

				if (this.options.range) {
					formattedTooltipVal = this.options.formatter(this.options.value);
					this._setText(this.tooltipInner, formattedTooltipVal);
					this.tooltip.style[this.stylePos] = (positionPercentages[1] + positionPercentages[0]) / 2 + '%';

					if (this.options.orientation === 'vertical') {
						this._css(this.tooltip, 'margin-top', -this.tooltip.offsetHeight / 2 + 'px');
					} else {
						this._css(this.tooltip, 'margin-left', -this.tooltip.offsetWidth / 2 + 'px');
					}

					if (this.options.orientation === 'vertical') {
						this._css(this.tooltip, 'margin-top', -this.tooltip.offsetHeight / 2 + 'px');
					} else {
						this._css(this.tooltip, 'margin-left', -this.tooltip.offsetWidth / 2 + 'px');
					}

					var innerTooltipMinText = this.options.formatter(this.options.value[0]);
					this._setText(this.tooltipInner_min, innerTooltipMinText);

					var innerTooltipMaxText = this.options.formatter(this.options.value[1]);
					this._setText(this.tooltipInner_max, innerTooltipMaxText);

					this.tooltip_min.style[this.stylePos] = positionPercentages[0] + '%';

					if (this.options.orientation === 'vertical') {
						this._css(this.tooltip_min, 'margin-top', -this.tooltip_min.offsetHeight / 2 + 'px');
					} else {
						this._css(this.tooltip_min, 'margin-left', -this.tooltip_min.offsetWidth / 2 + 'px');
					}

					this.tooltip_max.style[this.stylePos] = positionPercentages[1] + '%';

					if (this.options.orientation === 'vertical') {
						this._css(this.tooltip_max, 'margin-top', -this.tooltip_max.offsetHeight / 2 + 'px');
					} else {
						this._css(this.tooltip_max, 'margin-left', -this.tooltip_max.offsetWidth / 2 + 'px');
					}
				} else {
					formattedTooltipVal = this.options.formatter(this.options.value[0]);
					this._setText(this.tooltipInner, formattedTooltipVal);

					this.tooltip.style[this.stylePos] = positionPercentages[0] + '%';
					if (this.options.orientation === 'vertical') {
						this._css(this.tooltip, 'margin-top', -this.tooltip.offsetHeight / 2 + 'px');
					} else {
						this._css(this.tooltip, 'margin-left', -this.tooltip.offsetWidth / 2 + 'px');
					}
				}
			},
			_removeProperty: function(element, prop) {
				if (element.style.removeProperty) {
					element.style.removeProperty(prop);
				} else {
					element.style.removeAttribute(prop);
				}
			},
			_mousedown: function(ev) {
				if (!this.options.enabled) {
					return false;
				}

				this._triggerFocusOnHandle();

				this.offset = this._offset(this.sliderElem);
				this.size = this.sliderElem[this.sizePos];

				var percentage = this._getPercentage(ev);

				if (this.options.range) {
					var diff1 = Math.abs(this.percentage[0] - percentage);
					var diff2 = Math.abs(this.percentage[1] - percentage);
					this.dragged = (diff1 < diff2) ? 0 : 1;
				} else {
					this.dragged = 0;
				}

				this.percentage[this.dragged] = this.options.reversed ? 100 - percentage: percentage;
				this._layout();

				if (this.touchCapable) {
					document.removeEventListener("touchmove", this.mousemove, false);
					document.removeEventListener("touchend", this.mouseup, false);
				}

				if (this.mousemove) {
					document.removeEventListener("mousemove", this.mousemove, false);
				}
				if (this.mouseup) {
					document.removeEventListener("mouseup", this.mouseup, false);
				}

				this.mousemove = this._mousemove.bind(this);
				this.mouseup = this._mouseup.bind(this);

				if (this.touchCapable) {
					// Touch: Bind touch events:
					document.addEventListener("touchmove", this.mousemove, false);
					document.addEventListener("touchend", this.mouseup, false);
				}
				// Bind mouse events:
				document.addEventListener("mousemove", this.mousemove, false);
				document.addEventListener("mouseup", this.mouseup, false);

				this.inDrag = true;
				var newValue = this._calculateValue();

				this._trigger('slideStart', newValue);

				this._setDataVal(newValue);
				this.setValue(newValue);

				this._pauseEvent(ev);

				return true;
			},
			_triggerFocusOnHandle: function(handleIdx) {
				if (handleIdx === 0) {
					this.handle1.focus();
				}
				if (handleIdx === 1) {
					this.handle2.focus();
				}
			},
			_keydown: function(handleIdx, ev) {
				if (!this.options.enabled) {
					return false;
				}

				var dir;
				switch (ev.keyCode) {
				case 37:
					// left
				case 40:
					// down
					dir = -1;
					break;
				case 39:
					// right
				case 38:
					// up
					dir = 1;
					break;
				}
				if (!dir) {
					return;
				}

				// use natural arrow keys instead of from min to max
				if (this.options.natural_arrow_keys) {
					var ifVerticalAndNotReversed = (this.options.orientation === 'vertical' && !this.options.reversed);
					var ifHorizontalAndReversed = (this.options.orientation === 'horizontal' && this.options.reversed);

					if (ifVerticalAndNotReversed || ifHorizontalAndReversed) {
						dir = dir * -1;
					}
				}

				var oneStepValuePercentageChange = dir * this.percentage[2];
				var percentage = this.percentage[handleIdx] + oneStepValuePercentageChange;

				if (percentage > 100) {
					percentage = 100;
				} else if (percentage < 0) {
					percentage = 0;
				}

				this.dragged = handleIdx;
				this._adjustPercentageForRangeSliders(percentage);
				this.percentage[this.dragged] = percentage;
				this._layout();

				var val = this._calculateValue();

				this._trigger('slideStart', val);
				this._setDataVal(val);
				this.setValue(val, true);

				this._trigger('slideStop', val);
				this._setDataVal(val);

				this._pauseEvent(ev);

				return false;
			},
			_pauseEvent: function(ev) {
				if (ev.stopPropagation) {
					ev.stopPropagation();
				}
				if (ev.preventDefault) {
					ev.preventDefault();
				}
				ev.cancelBubble = true;
				ev.returnValue = false;
			},
			_mousemove: function(ev) {
				if (!this.options.enabled) {
					return false;
				}

				var percentage = this._getPercentage(ev);
				this._adjustPercentageForRangeSliders(percentage);
				this.percentage[this.dragged] = this.options.reversed ? 100 - percentage: percentage;
				this._layout();

				var val = this._calculateValue();
				this.setValue(val, true);

				return false;
			},
			_adjustPercentageForRangeSliders: function(percentage) {
				if (this.options.range) {
					if (this.dragged === 0 && this.percentage[1] < percentage) {
						this.percentage[0] = this.percentage[1];
						this.dragged = 1;
					} else if (this.dragged === 1 && this.percentage[0] > percentage) {
						this.percentage[1] = this.percentage[0];
						this.dragged = 0;
					}
				}
			},
			_mouseup: function() {
				if (!this.options.enabled) {
					return false;
				}
				if (this.touchCapable) {
					// Touch: Unbind touch event handlers:
					document.removeEventListener("touchmove", this.mousemove, false);
					document.removeEventListener("touchend", this.mouseup, false);
				}
				// Unbind mouse event handlers:
				document.removeEventListener("mousemove", this.mousemove, false);
				document.removeEventListener("mouseup", this.mouseup, false);

				this.inDrag = false;
				if (this.over === false) {
					this._hideTooltip();
				}
				var val = this._calculateValue();

				this._layout();
				this._trigger('slideStop', val);
				this._setDataVal(val);

				return false;
			},
			_calculateValue: function() {
				var val;
				if (this.options.range) {
					val = [this.options.min, this.options.max];
					if (this.percentage[0] !== 0) {
						val[0] = (Math.max(this.options.min, this.options.min + Math.round((this.diff * this.percentage[0] / 100) / this.options.step) * this.options.step));
						val[0] = this._applyPrecision(val[0]);
					}
					if (this.percentage[1] !== 100) {
						val[1] = (Math.min(this.options.max, this.options.min + Math.round((this.diff * this.percentage[1] / 100) / this.options.step) * this.options.step));
						val[1] = this._applyPrecision(val[1]);
					}
				} else {
					val = (this.options.min + Math.round((this.diff * this.percentage[0] / 100) / this.options.step) * this.options.step);
					if (val < this.options.min) {
						val = this.options.min;
					} else if (val > this.options.max) {
						val = this.options.max;
					}
					val = parseFloat(val);
					val = this._applyPrecision(val);
				}
				return val;
			},
			_applyPrecision: function(val) {
				var precision = this.options.precision || this._getNumDigitsAfterDecimalPlace(this.options.step);
				return this._applyToFixedAndParseFloat(val, precision);
			},
			_getNumDigitsAfterDecimalPlace: function(num) {
				var match = ('' + num).match(/(?:\.(\d+))?(?:[eE]([+-]?\d+))?$/);
				if (!match) {
					return 0;
				}
				return Math.max(0, (match[1] ? match[1].length: 0) - (match[2] ? +match[2] : 0));
			},
			_applyToFixedAndParseFloat: function(num, toFixedInput) {
				var truncatedNum = num.toFixed(toFixedInput);
				return parseFloat(truncatedNum);
			},
			/*
				Credits to Mike Samuel for the following method!
				Source: http://stackoverflow.com/questions/10454518/javascript-how-to-retrieve-the-number-of-decimals-of-a-string-number
			*/
			_getPercentage: function(ev) {
				if (this.touchCapable && (ev.type === 'touchstart' || ev.type === 'touchmove')) {
					ev = ev.touches[0];
				}
				var percentage = (ev[this.mousePos] - this.offset[this.stylePos]) * 100 / this.size;
				percentage = Math.round(percentage / this.percentage[2]) * this.percentage[2];
				return Math.max(0, Math.min(100, percentage));
			},
			_validateInputValue: function(val) {
				if (typeof val === 'number') {
					return val;
				} else if (val instanceof Array) {
					this._validateArray(val);
					return val;
				} else {
					throw new Error(ErrorMsgs.formatInvalidInputErrorMsg(val));
				}
			},
			_validateArray: function(val) {
				for (var i = 0; i < val.length; i++) {
					var input = val[i];
					if (typeof input !== 'number') {
						throw new Error(ErrorMsgs.formatInvalidInputErrorMsg(input));
					}
				}
			},
			_setDataVal: function(val) {
				var value = "value: '" + val + "'";
				this.element.setAttribute('data', value);
				this.element.setAttribute('value', val);
			},
			_trigger: function(evt, val) {
				val = (val || val === 0) ? val: undefined;

				var callbackFnArray = this.eventToCallbackMap[evt];
				if (callbackFnArray && callbackFnArray.length) {
					for (var i = 0; i < callbackFnArray.length; i++) {
						var callbackFn = callbackFnArray[i];
						callbackFn(val);
					}
				}

				/* If JQuery exists, trigger JQuery events */
				if ($) {
					this._triggerJQueryEvent(evt, val);
				}
			},
			_triggerJQueryEvent: function(evt, val) {
				var eventData = {
					type: evt,
					value: val
				};
				this.$element.trigger(eventData);
				this.$sliderElem.trigger(eventData);
			},
			_unbindJQueryEventHandlers: function() {
				this.$element.off();
				this.$sliderElem.off();
			},
			_setText: function(element, text) {
				if (typeof element.innerText !== "undefined") {
					element.innerText = text;
				} else if (typeof element.textContent !== "undefined") {
					element.textContent = text;
				}
			},
			_removeClass: function(element, classString) {
				var classes = classString.split(" ");
				var newClasses = element.className;

				for (var i = 0; i < classes.length; i++) {
					var classTag = classes[i];
					var regex = new RegExp("(?:\\s|^)" + classTag + "(?:\\s|$)");
					newClasses = newClasses.replace(regex, " ");
				}

				element.className = newClasses.trim();
			},
			_addClass: function(element, classString) {
				var classes = classString.split(" ");
				var newClasses = element.className;

				for (var i = 0; i < classes.length; i++) {
					var classTag = classes[i];
					var regex = new RegExp("(?:\\s|^)" + classTag + "(?:\\s|$)");
					var ifClassExists = regex.test(newClasses);

					if (!ifClassExists) {
						newClasses += " " + classTag;
					}
				}

				element.className = newClasses.trim();
			},
			_offset: function(obj) {
				var ol = 0;
				var ot = 0;
				if (obj.offsetParent) {
					do {
						ol += obj.offsetLeft;
						ot += obj.offsetTop;
					} while ( obj = obj . offsetParent );
				}
				return {
					left: ol,
					top: ot
				};
			},
			_css: function(elementRef, styleName, value) {
				if ($) {
					$.style(elementRef, styleName, value);
				} else {
					var style = styleName.replace(/^-ms-/, "ms-").replace(/-([\da-z])/gi,
					function(all, letter) {
						return letter.toUpperCase();
					});
					elementRef.style[style] = value;
				}
			}
		};

		/*********************************
			Attach to global namespace
		*********************************/
		if ($) {
			var namespace = $.fn.slider ? 'bootstrapSlider': 'slider';
			$.bridget(namespace, Slider);
		}
	})($);
	return Slider;
}));

/* =========================================================
* Bootstrap.datetimepicker.js
* =========================================================
* Copyright 2012 Stefan Petre
*
* Improvements by Andrew Rowls
* Improvements by Sébastien Malot
* Improvements by Yun Lai
* Improvements by Kenneth Henderick
* Improvements by CuGBabyBeaR
* Improvements by Christian Vaas <auspex@auspex.eu>
*
* Project URL : http://www.malot.fr/bootstrap-datetimepicker
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
* ========================================================= */
! (function(factory) {
	if (typeof define === 'function' && define.amd) define(['jquery'], factory);
	else if (typeof exports === 'object') factory(require('jquery'));
	else factory(jQuery);
} (function($, undefined) {
	// Add ECMA262-5 Array methods if not supported natively (IE8)
	if (! ('indexOf' in Array.prototype)) {
		Array.prototype.indexOf = function(find, i) {
			if (i === undefined) i = 0;
			if (i < 0) i += this.length;
			if (i < 0) i = 0;
			for (var n = this.length; i < n; i++) {
				if (i in this && this[i] === find) {
					return i;
				}
			}
			return - 1;
		}
	}

	function elementOrParentIsFixed(element) {
		var $element = $(element);
		var $checkElements = $element.add($element.parents());
		var isFixed = false;
		$checkElements.each(function() {
			if ($(this).css('position') === 'fixed') {
				isFixed = true;
				return false;
			}
		});
		return isFixed;
	}

	function UTCDate() {
		return new Date(Date.UTC.apply(Date, arguments));
	}

	function UTCToday() {
		var today = new Date();
		return UTCDate(today.getUTCFullYear(), today.getUTCMonth(), today.getUTCDate(), today.getUTCHours(), today.getUTCMinutes(), today.getUTCSeconds(), 0);
	}

	// Picker object
	var Datetimepicker = function(element, options) {
		var that = this;
		this.element = $(element);

		// add container for single page application
		// when page switch the datetimepicker div will be removed also.
		this.container = options.container || 'body';

		this.language = options.language || this.element.data('date-language') || 'en';
		this.language = this.language in dates ? this.language: this.language.split('-')[0]; // fr-CA fallback to fr
		this.language = this.language in dates ? this.language: 'en';
		this.isRTL = dates[this.language].rtl || false;
		this.formatType = options.formatType || this.element.data('format-type') || 'standard';
		this.format = DPGlobal.parseFormat(options.format || this.element.data('date-format') || dates[this.language].format || DPGlobal.getDefaultFormat(this.formatType, 'input'), this.formatType);
		this.isInline = false;
		this.isVisible = false;
		this.isInput = this.element.is('input');
		this.fontAwesome = options.fontAwesome || this.element.data('font-awesome') || false;

		this.bootcssVer = options.bootcssVer || (this.isInput ? (this.element.is('.form-control') ? 3 : 2) : (this.bootcssVer = this.element.is('.input-group') ? 3 : 2));

		this.component = this.element.is('.date') ? (this.bootcssVer == 3 ? this.element.find('.input-group-addon .glyphicon-th, .input-group-addon .glyphicon-time, .input-group-addon .glyphicon-remove, .input-group-addon .glyphicon-calendar, .input-group-addon .fa-calendar, .input-group-addon .fa-clock-o').parent() : this.element.find('.add-on .icon-th, .add-on .icon-time, .add-on .icon-calendar, .add-on .fa-calendar, .add-on .fa-clock-o').parent()) : false;
		this.componentReset = this.element.is('.date') ? (this.bootcssVer == 3 ? this.element.find('.input-group-addon .glyphicon-remove, .input-group-addon .fa-times').parent() : this.element.find('.add-on .icon-remove, .add-on .fa-times').parent()) : false;
		this.hasInput = this.component && this.element.find('input').length;
		if (this.component && this.component.length === 0) {
			this.component = false;
		}
		this.linkField = options.linkField || this.element.data('link-field') || false;
		this.linkFormat = DPGlobal.parseFormat(options.linkFormat || this.element.data('link-format') || DPGlobal.getDefaultFormat(this.formatType, 'link'), this.formatType);
		this.minuteStep = options.minuteStep || this.element.data('minute-step') || 5;
		this.pickerPosition = options.pickerPosition || this.element.data('picker-position') || 'bottom-right';
		this.showMeridian = options.showMeridian || this.element.data('show-meridian') || false;
		this.initialDate = options.initialDate || new Date();
		this.zIndex = options.zIndex || this.element.data('z-index') || undefined;
		this.title = typeof options.title === 'undefined' ? false: options.title;
		this.defaultTimeZone = (new Date).toString().split('(')[1].slice(0, -1);
		this.timezone = options.timezone || this.defaultTimeZone;

		this.icons = {
			leftArrow: this.fontAwesome ? 'fa-arrow-left': (this.bootcssVer === 3 ? 'glyphicon-arrow-left': 'icon-arrow-left'),
			rightArrow: this.fontAwesome ? 'fa-arrow-right': (this.bootcssVer === 3 ? 'glyphicon-arrow-right': 'icon-arrow-right')
		}
		this.icontype = this.fontAwesome ? 'fa': 'glyphicon';
		this._attachEvents();
		this.clickedOutside = function(e) {
			// Clicked outside the datetimepicker, hide it
			if ($(e.target).closest('.datetimepicker').length === 0) {
				that.hide();
			}
		}

		this.formatViewType = 'datetime';
		if ('formatViewType' in options) {
			this.formatViewType = options.formatViewType;
		} else if ('formatViewType' in this.element.data()) {
			this.formatViewType = this.element.data('formatViewType');
		}

		this.minView = 0;
		if ('minView' in options) {
			this.minView = options.minView;
		} else if ('minView' in this.element.data()) {
			this.minView = this.element.data('min-view');
		}
		this.minView = DPGlobal.convertViewMode(this.minView);

		this.maxView = DPGlobal.modes.length - 1;
		if ('maxView' in options) {
			this.maxView = options.maxView;
		} else if ('maxView' in this.element.data()) {
			this.maxView = this.element.data('max-view');
		}
		this.maxView = DPGlobal.convertViewMode(this.maxView);

		this.wheelViewModeNavigation = false;
		if ('wheelViewModeNavigation' in options) {
			this.wheelViewModeNavigation = options.wheelViewModeNavigation;
		} else if ('wheelViewModeNavigation' in this.element.data()) {
			this.wheelViewModeNavigation = this.element.data('view-mode-wheel-navigation');
		}

		this.wheelViewModeNavigationInverseDirection = false;

		if ('wheelViewModeNavigationInverseDirection' in options) {
			this.wheelViewModeNavigationInverseDirection = options.wheelViewModeNavigationInverseDirection;
		} else if ('wheelViewModeNavigationInverseDirection' in this.element.data()) {
			this.wheelViewModeNavigationInverseDirection = this.element.data('view-mode-wheel-navigation-inverse-dir');
		}

		this.wheelViewModeNavigationDelay = 100;
		if ('wheelViewModeNavigationDelay' in options) {
			this.wheelViewModeNavigationDelay = options.wheelViewModeNavigationDelay;
		} else if ('wheelViewModeNavigationDelay' in this.element.data()) {
			this.wheelViewModeNavigationDelay = this.element.data('view-mode-wheel-navigation-delay');
		}

		this.startViewMode = 2;
		if ('startView' in options) {
			this.startViewMode = options.startView;
		} else if ('startView' in this.element.data()) {
			this.startViewMode = this.element.data('start-view');
		}
		this.startViewMode = DPGlobal.convertViewMode(this.startViewMode);
		this.viewMode = this.startViewMode;

		this.viewSelect = this.minView;
		if ('viewSelect' in options) {
			this.viewSelect = options.viewSelect;
		} else if ('viewSelect' in this.element.data()) {
			this.viewSelect = this.element.data('view-select');
		}
		this.viewSelect = DPGlobal.convertViewMode(this.viewSelect);

		this.forceParse = true;
		if ('forceParse' in options) {
			this.forceParse = options.forceParse;
		} else if ('dateForceParse' in this.element.data()) {
			this.forceParse = this.element.data('date-force-parse');
		}
		var template = this.bootcssVer === 3 ? DPGlobal.templateV3: DPGlobal.template;
		while (template.indexOf('{iconType}') !== -1) {
			template = template.replace('{iconType}', this.icontype);
		}
		while (template.indexOf('{leftArrow}') !== -1) {
			template = template.replace('{leftArrow}', this.icons.leftArrow);
		}
		while (template.indexOf('{rightArrow}') !== -1) {
			template = template.replace('{rightArrow}', this.icons.rightArrow);
		}
		this.picker = $(template).appendTo(this.isInline ? this.element: this.container) // 'body')
		.on({
			click: $.proxy(this.click, this),
			mousedown: $.proxy(this.mousedown, this)
		});

		if (this.wheelViewModeNavigation) {
			if ($.fn.mousewheel) {
				this.picker.on({
					mousewheel: $.proxy(this.mousewheel, this)
				});
			} else {
				console.log('Mouse Wheel event is not supported. Please include the jQuery Mouse Wheel plugin before enabling this option');
			}
		}

		if (this.isInline) {
			this.picker.addClass('datetimepicker-inline');
		} else {
			this.picker.addClass('datetimepicker-dropdown-' + this.pickerPosition + ' dropdown-menu');
		}
		if (this.isRTL) {
			this.picker.addClass('datetimepicker-rtl');
			var selector = this.bootcssVer === 3 ? '.prev span, .next span': '.prev i, .next i';
			this.picker.find(selector).toggleClass(this.icons.leftArrow + ' ' + this.icons.rightArrow);
		}

		$(document).on('mousedown', this.clickedOutside);
		this.autoclose = false;
		if ('autoclose' in options) {
			this.autoclose = options.autoclose;
		} else if ('dateAutoclose' in this.element.data()) {
			this.autoclose = this.element.data('date-autoclose');
		}

		this.keyboardNavigation = true;
		if ('keyboardNavigation' in options) {
			this.keyboardNavigation = options.keyboardNavigation;
		} else if ('dateKeyboardNavigation' in this.element.data()) {
			this.keyboardNavigation = this.element.data('date-keyboard-navigation');
		}

		this.todayBtn = (options.todayBtn || this.element.data('date-today-btn') || false);
		this.clearBtn = (options.clearBtn || this.element.data('date-clear-btn') || false);
		this.todayHighlight = (options.todayHighlight || this.element.data('date-today-highlight') || false);

		this.weekStart = ((options.weekStart || this.element.data('date-weekstart') || dates[this.language].weekStart || 0) % 7);
		this.weekEnd = ((this.weekStart + 6) % 7);
		this.startDate = -Infinity;
		this.endDate = Infinity;
		this.datesDisabled = [];
		this.daysOfWeekDisabled = [];
		this.setStartDate(options.startDate || this.element.data('date-startdate'));
		this.setEndDate(options.endDate || this.element.data('date-enddate'));
		this.setDatesDisabled(options.datesDisabled || this.element.data('date-dates-disabled'));
		this.setDaysOfWeekDisabled(options.daysOfWeekDisabled || this.element.data('date-days-of-week-disabled'));
		this.setMinutesDisabled(options.minutesDisabled || this.element.data('date-minute-disabled'));
		this.setHoursDisabled(options.hoursDisabled || this.element.data('date-hour-disabled'));
		this.fillDow();
		this.fillMonths();
		this.update();
		this.showMode();

		if (this.isInline) {
			this.show();
		}
	};

	Datetimepicker.prototype = {
		constructor: Datetimepicker,
		_events: [],
		_attachEvents: function() {
			this._detachEvents();
			if (this.isInput) { // single input
				this._events = [[this.element, {
					focus: $.proxy(this.show, this),
					keyup: $.proxy(this.update, this),
					keydown: $.proxy(this.keydown, this)
				}]];
			} else if (this.component && this.hasInput) { // component: input + button
				this._events = [
				// For components that are not readonly, allow keyboard nav
				[this.element.find('input'), {
					focus: $.proxy(this.show, this),
					keyup: $.proxy(this.update, this),
					keydown: $.proxy(this.keydown, this)
				}], [this.component, {
					click: $.proxy(this.show, this)
				}]];
				if (this.componentReset) {
					this._events.push([this.componentReset, {
						click: $.proxy(this.reset, this)
					}]);
				}
			} else if (this.element.is('div')) { // inline datetimepicker
				this.isInline = true;
			} else {
				this._events = [[this.element, {
					click: $.proxy(this.show, this)
				}]];
			}
			for (var i = 0,
			el, ev; i < this._events.length; i++) {
				el = this._events[i][0];
				ev = this._events[i][1];
				el.on(ev);
			}
		},

		_detachEvents: function() {
			for (var i = 0,
			el, ev; i < this._events.length; i++) {
				el = this._events[i][0];
				ev = this._events[i][1];
				el.off(ev);
			}
			this._events = [];
		},

		show: function(e) {
			this.picker.show();
			this.height = this.component ? this.component.outerHeight() : this.element.outerHeight();
			if (this.forceParse) {
				this.update();
			}
			this.place();
			$(window).on('resize', $.proxy(this.place, this));
			if (e) {
				e.stopPropagation();
				e.preventDefault();
			}
			this.isVisible = true;
			this.element.trigger({
				type: 'show',
				date: this.date
			});
		},

		hide: function(e) {
			if (!this.isVisible) return;
			if (this.isInline) return;
			this.picker.hide();
			$(window).off('resize', this.place);
			this.viewMode = this.startViewMode;
			this.showMode();
			if (!this.isInput) {
				$(document).off('mousedown', this.hide);
			}
			if (this.forceParse && (this.isInput && this.element.val() || this.hasInput && this.element.find('input').val())) this.setValue();
			this.isVisible = false;
			this.element.trigger({
				type: 'hide',
				date: this.date
			});
		},

		remove: function() {
			this._detachEvents();
			$(document).off('mousedown', this.clickedOutside);
			this.picker.remove();
			delete this.picker;
			delete this.element.data().datetimepicker;
		},

		getDate: function() {
			var d = this.getUTCDate();
			return new Date(d.getTime() + (d.getTimezoneOffset() * 60000));
		},

		getUTCDate: function() {
			return this.date;
		},

		getInitialDate: function() {
			return this.initialDate
		},

		setInitialDate: function(initialDate) {
			this.initialDate = initialDate;
		},

		setDate: function(d) {
			this.setUTCDate(new Date(d.getTime() - (d.getTimezoneOffset() * 60000)));
		},

		setUTCDate: function(d) {
			if (d >= this.startDate && d <= this.endDate) {
				this.date = d;
				this.setValue();
				this.viewDate = this.date;
				this.fill();
			} else {
				this.element.trigger({
					type: 'outOfRange',
					date: d,
					startDate: this.startDate,
					endDate: this.endDate
				});
			}
		},

		setFormat: function(format) {
			this.format = DPGlobal.parseFormat(format, this.formatType);
			var element;
			if (this.isInput) {
				element = this.element;
			} else if (this.component) {
				element = this.element.find('input');
			}
			if (element && element.val()) {
				this.setValue();
			}
		},

		setValue: function() {
			var formatted = this.getFormattedDate();
			if (!this.isInput) {
				if (this.component) {
					this.element.find('input').val(formatted);
				}
				this.element.data('date', formatted);
			} else {
				this.element.val(formatted);
			}
			if (this.linkField) {
				$('#' + this.linkField).val(this.getFormattedDate(this.linkFormat));
			}
		},

		getFormattedDate: function(format) {
			if (format == undefined) format = this.format;
			return DPGlobal.formatDate(this.date, format, this.language, this.formatType, this.timezone);
		},

		setStartDate: function(startDate) {
			this.startDate = startDate || -Infinity;
			if (this.startDate !== -Infinity) {
				this.startDate = DPGlobal.parseDate(this.startDate, this.format, this.language, this.formatType, this.timezone);
			}
			this.update();
			this.updateNavArrows();
		},

		setEndDate: function(endDate) {
			this.endDate = endDate || Infinity;
			if (this.endDate !== Infinity) {
				this.endDate = DPGlobal.parseDate(this.endDate, this.format, this.language, this.formatType, this.timezone);
			}
			this.update();
			this.updateNavArrows();
		},

		setDatesDisabled: function(datesDisabled) {
			this.datesDisabled = datesDisabled || [];
			if (!$.isArray(this.datesDisabled)) {
				this.datesDisabled = this.datesDisabled.split(/,\s*/);
			}
			this.datesDisabled = $.map(this.datesDisabled,
			function(d) {
				return DPGlobal.parseDate(d, this.format, this.language, this.formatType, this.timezone).toDateString();
			});
			this.update();
			this.updateNavArrows();
		},

		setTitle: function(selector, value) {
			return this.picker.find(selector).find('th:eq(1)').text(this.title === false ? value: this.title);
		},

		setDaysOfWeekDisabled: function(daysOfWeekDisabled) {
			this.daysOfWeekDisabled = daysOfWeekDisabled || [];
			if (!$.isArray(this.daysOfWeekDisabled)) {
				this.daysOfWeekDisabled = this.daysOfWeekDisabled.split(/,\s*/);
			}
			this.daysOfWeekDisabled = $.map(this.daysOfWeekDisabled,
			function(d) {
				return parseInt(d, 10);
			});
			this.update();
			this.updateNavArrows();
		},

		setMinutesDisabled: function(minutesDisabled) {
			this.minutesDisabled = minutesDisabled || [];
			if (!$.isArray(this.minutesDisabled)) {
				this.minutesDisabled = this.minutesDisabled.split(/,\s*/);
			}
			this.minutesDisabled = $.map(this.minutesDisabled,
			function(d) {
				return parseInt(d, 10);
			});
			this.update();
			this.updateNavArrows();
		},

		setHoursDisabled: function(hoursDisabled) {
			this.hoursDisabled = hoursDisabled || [];
			if (!$.isArray(this.hoursDisabled)) {
				this.hoursDisabled = this.hoursDisabled.split(/,\s*/);
			}
			this.hoursDisabled = $.map(this.hoursDisabled,
			function(d) {
				return parseInt(d, 10);
			});
			this.update();
			this.updateNavArrows();
		},

		place: function() {
			if (this.isInline) return;
			if (!this.zIndex) {
				var index_highest = 0;
				$('div').each(function() {
					var index_current = parseInt($(this).css('zIndex'), 10);
					if (index_current > index_highest) {
						index_highest = index_current;
					}
				});
				this.zIndex = index_highest + 10;
			}

			var offset, top, left, containerOffset;
			if (this.container instanceof $) {
				containerOffset = this.container.offset();
			} else {
				containerOffset = $(this.container).offset();
			}

			if (this.component) {
				offset = this.component.offset();
				left = offset.left;
				if (this.pickerPosition == 'bottom-left' || this.pickerPosition == 'top-left') {
					left += this.component.outerWidth() - this.picker.outerWidth();
				}
			} else {
				offset = this.element.offset();
				left = offset.left;
				if (this.pickerPosition == 'bottom-left' || this.pickerPosition == 'top-left') {
					left += this.element.outerWidth() - this.picker.outerWidth();
				}
			}

			var bodyWidth = document.body.clientWidth || window.innerWidth;
			if (left + 220 > bodyWidth) {
				left = bodyWidth - 220;
			}

			if (this.pickerPosition == 'top-left' || this.pickerPosition == 'top-right') {
				top = offset.top - this.picker.outerHeight();
			} else {
				top = offset.top + this.height;
			}

			top = top - containerOffset.top;
			left = left - containerOffset.left;

			this.picker.css({
				top: top,
				left: left,
				zIndex: this.zIndex
			});
		},

		update: function() {
			var date, fromArgs = false;
			if (arguments && arguments.length && (typeof arguments[0] === 'string' || arguments[0] instanceof Date)) {
				date = arguments[0];
				fromArgs = true;
			} else {
				date = (this.isInput ? this.element.val() : this.element.find('input').val()) || this.element.data('date') || this.initialDate;
				if (typeof date == 'string' || date instanceof String) {
					date = date.replace(/^\s+|\s+$/g, '');
				}
			}

			if (!date) {
				date = new Date();
				fromArgs = false;
			}

			this.date = DPGlobal.parseDate(date, this.format, this.language, this.formatType, this.timezone);

			if (fromArgs) this.setValue();

			if (this.date < this.startDate) {
				this.viewDate = new Date(this.startDate);
			} else if (this.date > this.endDate) {
				this.viewDate = new Date(this.endDate);
			} else {
				this.viewDate = new Date(this.date);
			}
			this.fill();
		},

		fillDow: function() {
			var dowCnt = this.weekStart,
			html = '<tr>';
			while (dowCnt < this.weekStart + 7) {
				html += '<th class="dow">' + dates[this.language].daysMin[(dowCnt++) % 7] + '</th>';
			}
			html += '</tr>';
			this.picker.find('.datetimepicker-days thead').append(html);
		},

		fillMonths: function() {
			var html = '',
			i = 0;
			while (i < 12) {
				html += '<span class="month">' + dates[this.language].monthsShort[i++] + '</span>';
			}
			this.picker.find('.datetimepicker-months td').html(html);
		},

		fill: function() {
			if (this.date == null || this.viewDate == null) {
				return;
			}
			var d = new Date(this.viewDate),
			year = d.getUTCFullYear(),
			month = d.getUTCMonth(),
			dayMonth = d.getUTCDate(),
			hours = d.getUTCHours(),
			minutes = d.getUTCMinutes(),
			startYear = this.startDate !== -Infinity ? this.startDate.getUTCFullYear() : -Infinity,
			startMonth = this.startDate !== -Infinity ? this.startDate.getUTCMonth() : -Infinity,
			endYear = this.endDate !== Infinity ? this.endDate.getUTCFullYear() : Infinity,
			endMonth = this.endDate !== Infinity ? this.endDate.getUTCMonth() + 1 : Infinity,
			currentDate = (new UTCDate(this.date.getUTCFullYear(), this.date.getUTCMonth(), this.date.getUTCDate())).valueOf(),
			today = new Date();
			this.setTitle('.datetimepicker-days', dates[this.language].months[month] + ' ' + year);
			if (this.formatViewType == 'time') {
				var formatted = this.getFormattedDate();
				this.setTitle('.datetimepicker-hours', formatted);
				this.setTitle('.datetimepicker-minutes', formatted);
			} else {
				this.setTitle('.datetimepicker-hours', dayMonth + ' ' + dates[this.language].months[month] + ' ' + year);
				this.setTitle('.datetimepicker-minutes', dayMonth + ' ' + dates[this.language].months[month] + ' ' + year);
			}
			this.picker.find('tfoot th.today').text(dates[this.language].today || dates['en'].today).toggle(this.todayBtn !== false);
			this.picker.find('tfoot th.clear').text(dates[this.language].clear || dates['en'].clear).toggle(this.clearBtn !== false);
			this.updateNavArrows();
			this.fillMonths();
			/*var prevMonth = UTCDate(year, month, 0,0,0,0,0);
		prevMonth.setUTCDate(prevMonth.getDate() - (prevMonth.getUTCDay() - this.weekStart + 7)%7);*/
			var prevMonth = UTCDate(year, month - 1, 28, 0, 0, 0, 0),
			day = DPGlobal.getDaysInMonth(prevMonth.getUTCFullYear(), prevMonth.getUTCMonth());
			prevMonth.setUTCDate(day);
			prevMonth.setUTCDate(day - (prevMonth.getUTCDay() - this.weekStart + 7) % 7);
			var nextMonth = new Date(prevMonth);
			nextMonth.setUTCDate(nextMonth.getUTCDate() + 42);
			nextMonth = nextMonth.valueOf();
			var html = [];
			var clsName;
			while (prevMonth.valueOf() < nextMonth) {
				if (prevMonth.getUTCDay() == this.weekStart) {
					html.push('<tr>');
				}
				clsName = '';
				if (prevMonth.getUTCFullYear() < year || (prevMonth.getUTCFullYear() == year && prevMonth.getUTCMonth() < month)) {
					clsName += ' old';
				} else if (prevMonth.getUTCFullYear() > year || (prevMonth.getUTCFullYear() == year && prevMonth.getUTCMonth() > month)) {
					clsName += ' new';
				}
				// Compare internal UTC date with local today, not UTC today
				if (this.todayHighlight && prevMonth.getUTCFullYear() == today.getFullYear() && prevMonth.getUTCMonth() == today.getMonth() && prevMonth.getUTCDate() == today.getDate()) {
					clsName += ' today';
				}
				if (prevMonth.valueOf() == currentDate) {
					clsName += ' active';
				}
				if ((prevMonth.valueOf() + 86400000) <= this.startDate || prevMonth.valueOf() > this.endDate || $.inArray(prevMonth.getUTCDay(), this.daysOfWeekDisabled) !== -1 || $.inArray(prevMonth.toDateString(), this.datesDisabled) !== -1) {
					clsName += ' disabled';
				}
				html.push('<td class="day' + clsName + '">' + prevMonth.getUTCDate() + '</td>');
				if (prevMonth.getUTCDay() == this.weekEnd) {
					html.push('</tr>');
				}
				prevMonth.setUTCDate(prevMonth.getUTCDate() + 1);
			}
			this.picker.find('.datetimepicker-days tbody').empty().append(html.join(''));

			html = [];
			var txt = '',
			meridian = '',
			meridianOld = '';
			var hoursDisabled = this.hoursDisabled || [];
			for (var i = 0; i < 24; i++) {
				if (hoursDisabled.indexOf(i) !== -1) continue;
				var actual = UTCDate(year, month, dayMonth, i);
				clsName = '';
				// We want the previous hour for the startDate
				if ((actual.valueOf() + 3600000) <= this.startDate || actual.valueOf() > this.endDate) {
					clsName += ' disabled';
				} else if (hours == i) {
					clsName += ' active';
				}
				if (this.showMeridian && dates[this.language].meridiem.length == 2) {
					meridian = (i < 12 ? dates[this.language].meridiem[0] : dates[this.language].meridiem[1]);
					if (meridian != meridianOld) {
						if (meridianOld != '') {
							html.push('</fieldset>');
						}
						html.push('<fieldset class="hour"><legend>' + meridian.toUpperCase() + '</legend>');
					}
					meridianOld = meridian;
					txt = (i % 12 ? i % 12 : 12);
					html.push('<span class="hour' + clsName + ' hour_' + (i < 12 ? 'am': 'pm') + '">' + txt + '</span>');
					if (i == 23) {
						html.push('</fieldset>');
					}
				} else {
					txt = i + ':00';
					html.push('<span class="hour' + clsName + '">' + txt + '</span>');
				}
			}
			this.picker.find('.datetimepicker-hours td').html(html.join(''));

			html = [];
			txt = '',
			meridian = '',
			meridianOld = '';
			var minutesDisabled = this.minutesDisabled || [];
			for (var i = 0; i < 60; i += this.minuteStep) {
				if (minutesDisabled.indexOf(i) !== -1) continue;
				var actual = UTCDate(year, month, dayMonth, hours, i, 0);
				clsName = '';
				if (actual.valueOf() < this.startDate || actual.valueOf() > this.endDate) {
					clsName += ' disabled';
				} else if (Math.floor(minutes / this.minuteStep) == Math.floor(i / this.minuteStep)) {
					clsName += ' active';
				}
				if (this.showMeridian && dates[this.language].meridiem.length == 2) {
					meridian = (hours < 12 ? dates[this.language].meridiem[0] : dates[this.language].meridiem[1]);
					if (meridian != meridianOld) {
						if (meridianOld != '') {
							html.push('</fieldset>');
						}
						html.push('<fieldset class="minute"><legend>' + meridian.toUpperCase() + '</legend>');
					}
					meridianOld = meridian;
					txt = (hours % 12 ? hours % 12 : 12);
					//html.push('<span class="minute'+clsName+' minute_'+(hours<12?'am':'pm')+'">'+txt+'</span>');
					html.push('<span class="minute' + clsName + '">' + txt + ':' + (i < 10 ? '0' + i: i) + '</span>');
					if (i == 59) {
						html.push('</fieldset>');
					}
				} else {
					txt = i + ':00';
					//html.push('<span class="hour'+clsName+'">'+txt+'</span>');
					html.push('<span class="minute' + clsName + '">' + hours + ':' + (i < 10 ? '0' + i: i) + '</span>');
				}
			}
			this.picker.find('.datetimepicker-minutes td').html(html.join(''));

			var currentYear = this.date.getUTCFullYear();
			var months = this.setTitle('.datetimepicker-months', year).end().find('span').removeClass('active');
			if (currentYear == year) {
				// getUTCMonths() returns 0 based, and we need to select the next one
				// To cater bootstrap 2 we don't need to select the next one
				var offset = months.length - 12;
				months.eq(this.date.getUTCMonth() + offset).addClass('active');
			}
			if (year < startYear || year > endYear) {
				months.addClass('disabled');
			}
			if (year == startYear) {
				months.slice(0, startMonth).addClass('disabled');
			}
			if (year == endYear) {
				months.slice(endMonth).addClass('disabled');
			}

			html = '';
			year = parseInt(year / 10, 10) * 10;
			var yearCont = this.setTitle('.datetimepicker-years', year + '-' + (year + 9)).end().find('td');
			year -= 1;
			for (var i = -1; i < 11; i++) {
				html += '<span class="year' + (i == -1 || i == 10 ? ' old': '') + (currentYear == year ? ' active': '') + (year < startYear || year > endYear ? ' disabled': '') + '">' + year + '</span>';
				year += 1;
			}
			yearCont.html(html);
			this.place();
		},

		updateNavArrows: function() {
			var d = new Date(this.viewDate),
			year = d.getUTCFullYear(),
			month = d.getUTCMonth(),
			day = d.getUTCDate(),
			hour = d.getUTCHours();
			switch (this.viewMode) {
			case 0:
				if (this.startDate !== -Infinity && year <= this.startDate.getUTCFullYear() && month <= this.startDate.getUTCMonth() && day <= this.startDate.getUTCDate() && hour <= this.startDate.getUTCHours()) {
					this.picker.find('.prev').css({
						visibility: 'hidden'
					});
				} else {
					this.picker.find('.prev').css({
						visibility: 'visible'
					});
				}
				if (this.endDate !== Infinity && year >= this.endDate.getUTCFullYear() && month >= this.endDate.getUTCMonth() && day >= this.endDate.getUTCDate() && hour >= this.endDate.getUTCHours()) {
					this.picker.find('.next').css({
						visibility: 'hidden'
					});
				} else {
					this.picker.find('.next').css({
						visibility: 'visible'
					});
				}
				break;
			case 1:
				if (this.startDate !== -Infinity && year <= this.startDate.getUTCFullYear() && month <= this.startDate.getUTCMonth() && day <= this.startDate.getUTCDate()) {
					this.picker.find('.prev').css({
						visibility: 'hidden'
					});
				} else {
					this.picker.find('.prev').css({
						visibility: 'visible'
					});
				}
				if (this.endDate !== Infinity && year >= this.endDate.getUTCFullYear() && month >= this.endDate.getUTCMonth() && day >= this.endDate.getUTCDate()) {
					this.picker.find('.next').css({
						visibility: 'hidden'
					});
				} else {
					this.picker.find('.next').css({
						visibility: 'visible'
					});
				}
				break;
			case 2:
				if (this.startDate !== -Infinity && year <= this.startDate.getUTCFullYear() && month <= this.startDate.getUTCMonth()) {
					this.picker.find('.prev').css({
						visibility: 'hidden'
					});
				} else {
					this.picker.find('.prev').css({
						visibility: 'visible'
					});
				}
				if (this.endDate !== Infinity && year >= this.endDate.getUTCFullYear() && month >= this.endDate.getUTCMonth()) {
					this.picker.find('.next').css({
						visibility: 'hidden'
					});
				} else {
					this.picker.find('.next').css({
						visibility: 'visible'
					});
				}
				break;
			case 3:
			case 4:
				if (this.startDate !== -Infinity && year <= this.startDate.getUTCFullYear()) {
					this.picker.find('.prev').css({
						visibility: 'hidden'
					});
				} else {
					this.picker.find('.prev').css({
						visibility: 'visible'
					});
				}
				if (this.endDate !== Infinity && year >= this.endDate.getUTCFullYear()) {
					this.picker.find('.next').css({
						visibility: 'hidden'
					});
				} else {
					this.picker.find('.next').css({
						visibility: 'visible'
					});
				}
				break;
			}
		},

		mousewheel: function(e) {
			e.preventDefault();
			e.stopPropagation();
			if (this.wheelPause) {
				return;
			}
			this.wheelPause = true;
			var originalEvent = e.originalEvent;
			var delta = originalEvent.wheelDelta;
			var mode = delta > 0 ? 1 : (delta === 0) ? 0 : -1;
			if (this.wheelViewModeNavigationInverseDirection) {
				mode = -mode;
			}

			this.showMode(mode);
			setTimeout($.proxy(function() {
				this.wheelPause = false
			},
			this), this.wheelViewModeNavigationDelay);
		},

		click: function(e) {
			e.stopPropagation();
			e.preventDefault();
			var target = $(e.target).closest('span, td, th, legend');
			if (target.is('.' + this.icontype)) {
				target = $(target).parent().closest('span, td, th, legend');
			}
			if (target.length == 1) {
				if (target.is('.disabled')) {
					this.element.trigger({
						type: 'outOfRange',
						date: this.viewDate,
						startDate: this.startDate,
						endDate: this.endDate
					});
					return;
				}
				switch (target[0].nodeName.toLowerCase()) {
				case 'th':
					switch (target[0].className) {
					case 'switch':
						this.showMode(1);
						break;
					case 'prev':
					case 'next':
						var dir = DPGlobal.modes[this.viewMode].navStep * (target[0].className == 'prev' ? -1 : 1);
						switch (this.viewMode) {
						case 0:
							this.viewDate = this.moveHour(this.viewDate, dir);
							break;
						case 1:
							this.viewDate = this.moveDate(this.viewDate, dir);
							break;
						case 2:
							this.viewDate = this.moveMonth(this.viewDate, dir);
							break;
						case 3:
						case 4:
							this.viewDate = this.moveYear(this.viewDate, dir);
							break;
						}
						this.fill();
						this.element.trigger({
							type: target[0].className + ':' + this.convertViewModeText(this.viewMode),
							date: this.viewDate,
							startDate: this.startDate,
							endDate: this.endDate
						});
						break;
					case 'clear':
						this.reset();
						if (this.autoclose) {
							this.hide();
						}
						break;
					case 'today':
						var date = new Date();
						date = UTCDate(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds(), 0);

						// Respect startDate and endDate.
						if (date < this.startDate) date = this.startDate;
						else if (date > this.endDate) date = this.endDate;

						this.viewMode = this.startViewMode;
						this.showMode(0);
						this._setDate(date);
						this.fill();
						if (this.autoclose) {
							this.hide();
						}
						break;
					}
					break;
				case 'span':
					if (!target.is('.disabled')) {
						var year = this.viewDate.getUTCFullYear(),
						month = this.viewDate.getUTCMonth(),
						day = this.viewDate.getUTCDate(),
						hours = this.viewDate.getUTCHours(),
						minutes = this.viewDate.getUTCMinutes(),
						seconds = this.viewDate.getUTCSeconds();

						if (target.is('.month')) {
							this.viewDate.setUTCDate(1);
							month = target.parent().find('span').index(target);
							day = this.viewDate.getUTCDate();
							this.viewDate.setUTCMonth(month);
							this.element.trigger({
								type: 'changeMonth',
								date: this.viewDate
							});
							if (this.viewSelect >= 3) {
								this._setDate(UTCDate(year, month, day, hours, minutes, seconds, 0));
							}
						} else if (target.is('.year')) {
							this.viewDate.setUTCDate(1);
							year = parseInt(target.text(), 10) || 0;
							this.viewDate.setUTCFullYear(year);
							this.element.trigger({
								type: 'changeYear',
								date: this.viewDate
							});
							if (this.viewSelect >= 4) {
								this._setDate(UTCDate(year, month, day, hours, minutes, seconds, 0));
							}
						} else if (target.is('.hour')) {
							hours = parseInt(target.text(), 10) || 0;
							if (target.hasClass('hour_am') || target.hasClass('hour_pm')) {
								if (hours == 12 && target.hasClass('hour_am')) {
									hours = 0;
								} else if (hours != 12 && target.hasClass('hour_pm')) {
									hours += 12;
								}
							}
							this.viewDate.setUTCHours(hours);
							this.element.trigger({
								type: 'changeHour',
								date: this.viewDate
							});
							if (this.viewSelect >= 1) {
								this._setDate(UTCDate(year, month, day, hours, minutes, seconds, 0));
							}
						} else if (target.is('.minute')) {
							minutes = parseInt(target.text().substr(target.text().indexOf(':') + 1), 10) || 0;
							this.viewDate.setUTCMinutes(minutes);
							this.element.trigger({
								type: 'changeMinute',
								date: this.viewDate
							});
							if (this.viewSelect >= 0) {
								this._setDate(UTCDate(year, month, day, hours, minutes, seconds, 0));
							}
						}
						if (this.viewMode != 0) {
							var oldViewMode = this.viewMode;
							this.showMode( - 1);
							this.fill();
							if (oldViewMode == this.viewMode && this.autoclose) {
								this.hide();
							}
						} else {
							this.fill();
							if (this.autoclose) {
								this.hide();
							}
						}
					}
					break;
				case 'td':
					if (target.is('.day') && !target.is('.disabled')) {
						var day = parseInt(target.text(), 10) || 1;
						var year = this.viewDate.getUTCFullYear(),
						month = this.viewDate.getUTCMonth(),
						hours = this.viewDate.getUTCHours(),
						minutes = this.viewDate.getUTCMinutes(),
						seconds = this.viewDate.getUTCSeconds();
						if (target.is('.old')) {
							if (month === 0) {
								month = 11;
								year -= 1;
							} else {
								month -= 1;
							}
						} else if (target.is('.new')) {
							if (month == 11) {
								month = 0;
								year += 1;
							} else {
								month += 1;
							}
						}
						this.viewDate.setUTCFullYear(year);
						this.viewDate.setUTCMonth(month, day);
						this.element.trigger({
							type: 'changeDay',
							date: this.viewDate
						});
						if (this.viewSelect >= 2) {
							this._setDate(UTCDate(year, month, day, hours, minutes, seconds, 0));
						}
					}
					var oldViewMode = this.viewMode;
					this.showMode( - 1);
					this.fill();
					if (oldViewMode == this.viewMode && this.autoclose) {
						this.hide();
					}
					break;
				}
			}
		},

		_setDate: function(date, which) {
			if (!which || which == 'date') this.date = date;
			if (!which || which == 'view') this.viewDate = date;
			this.fill();
			this.setValue();
			var element;
			if (this.isInput) {
				element = this.element;
			} else if (this.component) {
				element = this.element.find('input');
			}
			if (element) {
				element.change();
				if (this.autoclose && (!which || which == 'date')) {
					//this.hide();
				}
			}
			this.element.trigger({
				type: 'changeDate',
				date: this.getDate()
			});
			if (date == null) this.date = this.viewDate;
		},

		moveMinute: function(date, dir) {
			if (!dir) return date;
			var new_date = new Date(date.valueOf());
			//dir = dir > 0 ? 1 : -1;
			new_date.setUTCMinutes(new_date.getUTCMinutes() + (dir * this.minuteStep));
			return new_date;
		},

		moveHour: function(date, dir) {
			if (!dir) return date;
			var new_date = new Date(date.valueOf());
			//dir = dir > 0 ? 1 : -1;
			new_date.setUTCHours(new_date.getUTCHours() + dir);
			return new_date;
		},

		moveDate: function(date, dir) {
			if (!dir) return date;
			var new_date = new Date(date.valueOf());
			//dir = dir > 0 ? 1 : -1;
			new_date.setUTCDate(new_date.getUTCDate() + dir);
			return new_date;
		},

		moveMonth: function(date, dir) {
			if (!dir) return date;
			var new_date = new Date(date.valueOf()),
			day = new_date.getUTCDate(),
			month = new_date.getUTCMonth(),
			mag = Math.abs(dir),
			new_month,
			test;
			dir = dir > 0 ? 1 : -1;
			if (mag == 1) {
				test = dir == -1
				// If going back one month, make sure month is not current month
				// (eg, Mar 31 -> Feb 31 == Feb 28, not Mar 02)
				?
				function() {
					return new_date.getUTCMonth() == month;
				}
				// If going forward one month, make sure month is as expected
				// (eg, Jan 31 -> Feb 31 == Feb 28, not Mar 02)
				: function() {
					return new_date.getUTCMonth() != new_month;
				};
				new_month = month + dir;
				new_date.setUTCMonth(new_month);
				// Dec -> Jan (12) or Jan -> Dec (-1) -- limit expected date to 0-11
				if (new_month < 0 || new_month > 11) new_month = (new_month + 12) % 12;
			} else {
				// For magnitudes >1, move one month at a time...
				for (var i = 0; i < mag; i++)
				// ...which might decrease the day (eg, Jan 31 to Feb 28, etc)...
				new_date = this.moveMonth(new_date, dir);
				// ...then reset the day, keeping it in the new month
				new_month = new_date.getUTCMonth();
				new_date.setUTCDate(day);
				test = function() {
					return new_month != new_date.getUTCMonth();
				};
			}
			// Common date-resetting loop -- if date is beyond end of month, make it
			// end of month
			while (test()) {
				new_date.setUTCDate(--day);
				new_date.setUTCMonth(new_month);
			}
			return new_date;
		},

		moveYear: function(date, dir) {
			return this.moveMonth(date, dir * 12);
		},

		dateWithinRange: function(date) {
			return date >= this.startDate && date <= this.endDate;
		},

		keydown: function(e) {
			if (this.picker.is(':not(:visible)')) {
				if (e.keyCode == 27) // allow escape to hide and re-show picker
				this.show();
				return;
			}
			var dateChanged = false,
			dir, day, month, newDate, newViewDate;
			switch (e.keyCode) {
			case 27:
				// escape
				this.hide();
				e.preventDefault();
				break;
			case 37:
				// left
			case 39:
				// right
				if (!this.keyboardNavigation) break;
				dir = e.keyCode == 37 ? -1 : 1;
				viewMode = this.viewMode;
				if (e.ctrlKey) {
					viewMode += 2;
				} else if (e.shiftKey) {
					viewMode += 1;
				}
				if (viewMode == 4) {
					newDate = this.moveYear(this.date, dir);
					newViewDate = this.moveYear(this.viewDate, dir);
				} else if (viewMode == 3) {
					newDate = this.moveMonth(this.date, dir);
					newViewDate = this.moveMonth(this.viewDate, dir);
				} else if (viewMode == 2) {
					newDate = this.moveDate(this.date, dir);
					newViewDate = this.moveDate(this.viewDate, dir);
				} else if (viewMode == 1) {
					newDate = this.moveHour(this.date, dir);
					newViewDate = this.moveHour(this.viewDate, dir);
				} else if (viewMode == 0) {
					newDate = this.moveMinute(this.date, dir);
					newViewDate = this.moveMinute(this.viewDate, dir);
				}
				if (this.dateWithinRange(newDate)) {
					this.date = newDate;
					this.viewDate = newViewDate;
					this.setValue();
					this.update();
					e.preventDefault();
					dateChanged = true;
				}
				break;
			case 38:
				// up
			case 40:
				// down
				if (!this.keyboardNavigation) break;
				dir = e.keyCode == 38 ? -1 : 1;
				viewMode = this.viewMode;
				if (e.ctrlKey) {
					viewMode += 2;
				} else if (e.shiftKey) {
					viewMode += 1;
				}
				if (viewMode == 4) {
					newDate = this.moveYear(this.date, dir);
					newViewDate = this.moveYear(this.viewDate, dir);
				} else if (viewMode == 3) {
					newDate = this.moveMonth(this.date, dir);
					newViewDate = this.moveMonth(this.viewDate, dir);
				} else if (viewMode == 2) {
					newDate = this.moveDate(this.date, dir * 7);
					newViewDate = this.moveDate(this.viewDate, dir * 7);
				} else if (viewMode == 1) {
					if (this.showMeridian) {
						newDate = this.moveHour(this.date, dir * 6);
						newViewDate = this.moveHour(this.viewDate, dir * 6);
					} else {
						newDate = this.moveHour(this.date, dir * 4);
						newViewDate = this.moveHour(this.viewDate, dir * 4);
					}
				} else if (viewMode == 0) {
					newDate = this.moveMinute(this.date, dir * 4);
					newViewDate = this.moveMinute(this.viewDate, dir * 4);
				}
				if (this.dateWithinRange(newDate)) {
					this.date = newDate;
					this.viewDate = newViewDate;
					this.setValue();
					this.update();
					e.preventDefault();
					dateChanged = true;
				}
				break;
			case 13:
				// enter
				if (this.viewMode != 0) {
					var oldViewMode = this.viewMode;
					this.showMode( - 1);
					this.fill();
					if (oldViewMode == this.viewMode && this.autoclose) {
						this.hide();
					}
				} else {
					this.fill();
					if (this.autoclose) {
						this.hide();
					}
				}
				e.preventDefault();
				break;
			case 9:
				// tab
				this.hide();
				break;
			}
			if (dateChanged) {
				var element;
				if (this.isInput) {
					element = this.element;
				} else if (this.component) {
					element = this.element.find('input');
				}
				if (element) {
					element.change();
				}
				this.element.trigger({
					type: 'changeDate',
					date: this.getDate()
				});
			}
		},

		showMode: function(dir) {
			if (dir) {
				var newViewMode = Math.max(0, Math.min(DPGlobal.modes.length - 1, this.viewMode + dir));
				if (newViewMode >= this.minView && newViewMode <= this.maxView) {
					this.element.trigger({
						type: 'changeMode',
						date: this.viewDate,
						oldViewMode: this.viewMode,
						newViewMode: newViewMode
					});
					this.viewMode = newViewMode;
				}
			}
			/*
	vitalets: fixing bug of very special conditions:
	jquery 1.7.1 + webkit + show inline datetimepicker in bootstrap popover.
	Method show() does not set display css correctly and datetimepicker is not shown.
	Changed to .css('display', 'block') solve the problem.
	See https://github.com/vitalets/x-editable/issues/37
	
	In jquery 1.7.2+ everything works fine.
	*/
			//this.picker.find('>div').hide().filter('.datetimepicker-'+DPGlobal.modes[this.viewMode].clsName).show();
			this.picker.find('>div').hide().filter('.datetimepicker-' + DPGlobal.modes[this.viewMode].clsName).css('display', 'block');
			this.updateNavArrows();
		},

		reset: function(e) {
			this._setDate(null, 'date');
		},

		convertViewModeText: function(viewMode) {
			switch (viewMode) {
			case 4:
				return 'decade';
			case 3:
				return 'year';
			case 2:
				return 'month';
			case 1:
				return 'day';
			case 0:
				return 'hour';
			}
		}
	};

	var old = $.fn.datetimepicker;
	$.fn.datetimepicker = function(option) {
		var args = Array.apply(null, arguments);
		args.shift();
		var internal_return;
		this.each(function() {
			var $this = $(this),
			data = $this.data('datetimepicker'),
			options = typeof option == 'object' && option;
			if (!data) {
				$this.data('datetimepicker', (data = new Datetimepicker(this, $.extend({},
				$.fn.datetimepicker.defaults, options))));
			}
			if (typeof option == 'string' && typeof data[option] == 'function') {
				internal_return = data[option].apply(data, args);
				if (internal_return !== undefined) {
					return false;
				}
			}
		});
		if (internal_return !== undefined) return internal_return;
		else return this;
	};

	$.fn.datetimepicker.defaults = {};
	$.fn.datetimepicker.Constructor = Datetimepicker;
	var dates = $.fn.datetimepicker.dates = {
		en: {
			days: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'],
			daysShort: ['日', '一', '二', '三', '四', '五', '六', '日'],
			daysMin: ['日', '一', '二', '三', '四', '五', '六', '日'],
			months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
			monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
			meridiem: ['上午', '下午'],
			suffix: ['st', 'nd', 'rd', 'th'],
			today: '今天',
			clear: '清空'
		}
	};

	var DPGlobal = {
		modes: [{
			clsName: 'minutes',
			navFnc: 'Hours',
			navStep: 1
		},
		{
			clsName: 'hours',
			navFnc: 'Date',
			navStep: 1
		},
		{
			clsName: 'days',
			navFnc: 'Month',
			navStep: 1
		},
		{
			clsName: 'months',
			navFnc: 'FullYear',
			navStep: 1
		},
		{
			clsName: 'years',
			navFnc: 'FullYear',
			navStep: 10
		}],
		isLeapYear: function(year) {
			return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0))
		},
		getDaysInMonth: function(year, month) {
			return [31, (DPGlobal.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month]
		},
		getDefaultFormat: function(type, field) {
			if (type == 'standard') {
				if (field == 'input') return 'yyyy-mm-dd hh:ii';
				else return 'yyyy-mm-dd hh:ii:ss';
			} else if (type == 'php') {
				if (field == 'input') return 'Y-m-d H:i';
				else return 'Y-m-d H:i:s';
			} else {
				throw new Error('Invalid format type.');
			}
		},
		validParts: function(type) {
			if (type == 'standard') {
				return /t|hh?|HH?|p|P|z|Z|ii?|ss?|dd?|DD?|mm?|MM?|yy(?:yy)?/g;
			} else if (type == 'php') {
				return /[dDjlNwzFmMnStyYaABgGhHis]/g;
			} else {
				throw new Error('Invalid format type.');
			}
		},
		nonpunctuation: /[^ -\/:-@\[-`{-~\t\n\rTZ]+/g,
		parseFormat: function(format, type) {
			// IE treats \0 as a string end in inputs (truncating the value),
			// so it's a bad format delimiter, anyway
			var separators = format.replace(this.validParts(type), '\0').split('\0'),
			parts = format.match(this.validParts(type));
			if (!separators || !separators.length || !parts || parts.length == 0) {
				throw new Error('Invalid date format.');
			}
			return {
				separators: separators,
				parts: parts
			};
		},
		parseDate: function(date, format, language, type, timezone) {
			if (date instanceof Date) {
				var dateUTC = new Date(date.valueOf() - date.getTimezoneOffset() * 60000);
				dateUTC.setMilliseconds(0);
				return dateUTC;
			}
			if (/^\d{4}\-\d{1,2}\-\d{1,2}$/.test(date)) {
				format = this.parseFormat('yyyy-mm-dd', type);
			}
			if (/^\d{4}\-\d{1,2}\-\d{1,2}[T ]\d{1,2}\:\d{1,2}$/.test(date)) {
				format = this.parseFormat('yyyy-mm-dd hh:ii', type);
			}
			if (/^\d{4}\-\d{1,2}\-\d{1,2}[T ]\d{1,2}\:\d{1,2}\:\d{1,2}[Z]{0,1}$/.test(date)) {
				format = this.parseFormat('yyyy-mm-dd hh:ii:ss', type);
			}
			if (/^[-+]\d+[dmwy]([\s,]+[-+]\d+[dmwy])*$/.test(date)) {
				var part_re = /([-+]\d+)([dmwy])/,
				parts = date.match(/([-+]\d+)([dmwy])/g),
				part,
				dir;
				date = new Date();
				for (var i = 0; i < parts.length; i++) {
					part = part_re.exec(parts[i]);
					dir = parseInt(part[1]);
					switch (part[2]) {
					case 'd':
						date.setUTCDate(date.getUTCDate() + dir);
						break;
					case 'm':
						date = Datetimepicker.prototype.moveMonth.call(Datetimepicker.prototype, date, dir);
						break;
					case 'w':
						date.setUTCDate(date.getUTCDate() + dir * 7);
						break;
					case 'y':
						date = Datetimepicker.prototype.moveYear.call(Datetimepicker.prototype, date, dir);
						break;
					}
				}
				return UTCDate(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds(), 0);
			}
			var parts = date && date.toString().match(this.nonpunctuation) || [],
			date = new Date(0, 0, 0, 0, 0, 0, 0),
			parsed = {},
			setters_order = ['hh', 'h', 'ii', 'i', 'ss', 's', 'yyyy', 'yy', 'M', 'MM', 'm', 'mm', 'D', 'DD', 'd', 'dd', 'H', 'HH', 'p', 'P', 'z', 'Z'],
			setters_map = {
				hh: function(d, v) {
					return d.setUTCHours(v);
				},
				h: function(d, v) {
					return d.setUTCHours(v);
				},
				HH: function(d, v) {
					return d.setUTCHours(v == 12 ? 0 : v);
				},
				H: function(d, v) {
					return d.setUTCHours(v == 12 ? 0 : v);
				},
				ii: function(d, v) {
					return d.setUTCMinutes(v);
				},
				i: function(d, v) {
					return d.setUTCMinutes(v);
				},
				ss: function(d, v) {
					return d.setUTCSeconds(v);
				},
				s: function(d, v) {
					return d.setUTCSeconds(v);
				},
				yyyy: function(d, v) {
					return d.setUTCFullYear(v);
				},
				yy: function(d, v) {
					return d.setUTCFullYear(2000 + v);
				},
				m: function(d, v) {
					v -= 1;
					while (v < 0) v += 12;
					v %= 12;
					d.setUTCMonth(v);
					while (d.getUTCMonth() != v) if (isNaN(d.getUTCMonth())) return d;
					else d.setUTCDate(d.getUTCDate() - 1);
					return d;
				},
				d: function(d, v) {
					return d.setUTCDate(v);
				},
				p: function(d, v) {
					return d.setUTCHours(v == 1 ? d.getUTCHours() + 12 : d.getUTCHours());
				},
				z: function() {
					return timezone
				}
			},
			val,
			filtered,
			part;
			setters_map['M'] = setters_map['MM'] = setters_map['mm'] = setters_map['m'];
			setters_map['dd'] = setters_map['d'];
			setters_map['P'] = setters_map['p'];
			setters_map['Z'] = setters_map['z'];
			date = UTCDate(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds());
			if (parts.length == format.parts.length) {
				for (var i = 0,
				cnt = format.parts.length; i < cnt; i++) {
					val = parseInt(parts[i], 10);
					part = format.parts[i];
					if (isNaN(val)) {
						switch (part) {
						case 'MM':
							filtered = $(dates[language].months).filter(function() {
								var m = this.slice(0, parts[i].length),
								p = parts[i].slice(0, m.length);
								return m == p;
							});
							val = $.inArray(filtered[0], dates[language].months) + 1;
							break;
						case 'M':
							filtered = $(dates[language].monthsShort).filter(function() {
								var m = this.slice(0, parts[i].length),
								p = parts[i].slice(0, m.length);
								return m.toLowerCase() == p.toLowerCase();
							});
							val = $.inArray(filtered[0], dates[language].monthsShort) + 1;
							break;
						case 'p':
						case 'P':
							val = $.inArray(parts[i].toLowerCase(), dates[language].meridiem);
							break;
						case 'z':
						case 'Z':
							timezone;
							break;
						}
					}
					parsed[part] = val;
				}
				for (var i = 0,
				s; i < setters_order.length; i++) {
					s = setters_order[i];
					if (s in parsed && !isNaN(parsed[s])) setters_map[s](date, parsed[s])
				}
			}
			return date;
		},
		formatDate: function(date, format, language, type, timezone) {
			if (date == null) {
				return '';
			}
			var val;
			if (type == 'standard') {
				val = {
					t: date.getTime(),
					// year
					yy: date.getUTCFullYear().toString().substring(2),
					yyyy: date.getUTCFullYear(),
					// month
					m: date.getUTCMonth() + 1,
					M: dates[language].monthsShort[date.getUTCMonth()],
					MM: dates[language].months[date.getUTCMonth()],
					// day
					d: date.getUTCDate(),
					D: dates[language].daysShort[date.getUTCDay()],
					DD: dates[language].days[date.getUTCDay()],
					p: (dates[language].meridiem.length == 2 ? dates[language].meridiem[date.getUTCHours() < 12 ? 0 : 1] : ''),
					// hour
					h: date.getUTCHours(),
					// minute
					i: date.getUTCMinutes(),
					// second
					s: date.getUTCSeconds(),
					// timezone
					z: timezone
				};

				if (dates[language].meridiem.length == 2) {
					val.H = (val.h % 12 == 0 ? 12 : val.h % 12);
				} else {
					val.H = val.h;
				}
				val.HH = (val.H < 10 ? '0': '') + val.H;
				val.P = val.p.toUpperCase();
				val.Z = val.z;
				val.hh = (val.h < 10 ? '0': '') + val.h;
				val.ii = (val.i < 10 ? '0': '') + val.i;
				val.ss = (val.s < 10 ? '0': '') + val.s;
				val.dd = (val.d < 10 ? '0': '') + val.d;
				val.mm = (val.m < 10 ? '0': '') + val.m;
			} else if (type == 'php') {
				// php format
				val = {
					// year
					y: date.getUTCFullYear().toString().substring(2),
					Y: date.getUTCFullYear(),
					// month
					F: dates[language].months[date.getUTCMonth()],
					M: dates[language].monthsShort[date.getUTCMonth()],
					n: date.getUTCMonth() + 1,
					t: DPGlobal.getDaysInMonth(date.getUTCFullYear(), date.getUTCMonth()),
					// day
					j: date.getUTCDate(),
					l: dates[language].days[date.getUTCDay()],
					D: dates[language].daysShort[date.getUTCDay()],
					w: date.getUTCDay(),
					// 0 -> 6
					N: (date.getUTCDay() == 0 ? 7 : date.getUTCDay()),
					// 1 -> 7
					S: (date.getUTCDate() % 10 <= dates[language].suffix.length ? dates[language].suffix[date.getUTCDate() % 10 - 1] : ''),
					// hour
					a: (dates[language].meridiem.length == 2 ? dates[language].meridiem[date.getUTCHours() < 12 ? 0 : 1] : ''),
					g: (date.getUTCHours() % 12 == 0 ? 12 : date.getUTCHours() % 12),
					G: date.getUTCHours(),
					// minute
					i: date.getUTCMinutes(),
					// second
					s: date.getUTCSeconds()
				};
				val.m = (val.n < 10 ? '0': '') + val.n;
				val.d = (val.j < 10 ? '0': '') + val.j;
				val.A = val.a.toString().toUpperCase();
				val.h = (val.g < 10 ? '0': '') + val.g;
				val.H = (val.G < 10 ? '0': '') + val.G;
				val.i = (val.i < 10 ? '0': '') + val.i;
				val.s = (val.s < 10 ? '0': '') + val.s;
			} else {
				throw new Error('Invalid format type.');
			}
			var date = [],
			seps = $.extend([], format.separators);
			for (var i = 0,
			cnt = format.parts.length; i < cnt; i++) {
				if (seps.length) {
					date.push(seps.shift());
				}
				date.push(val[format.parts[i]]);
			}
			if (seps.length) {
				date.push(seps.shift());
			}
			return date.join('');
		},
		convertViewMode: function(viewMode) {
			switch (viewMode) {
			case 4:
			case 'decade':
				viewMode = 4;
				break;
			case 3:
			case 'year':
				viewMode = 3;
				break;
			case 2:
			case 'month':
				viewMode = 2;
				break;
			case 1:
			case 'day':
				viewMode = 1;
				break;
			case 0:
			case 'hour':
				viewMode = 0;
				break;
			}
			return viewMode;
		},
		headTemplate: '<thead>' + '<tr>' + '<th class="prev"><i class="{iconType} {leftArrow}"/></th>' + '<th colspan="5" class="switch"></th>' + '<th class="next"><i class="{iconType} {rightArrow}"/></th>' + '</tr>' + '</thead>',
		headTemplateV3: '<thead>' + '<tr>' + '<th class="prev"><span class="{iconType} {leftArrow}"></span> </th>' + '<th colspan="5" class="switch"></th>' + '<th class="next"><span class="{iconType} {rightArrow}"></span> </th>' + '</tr>' + '</thead>',
		contTemplate: '<tbody><tr><td colspan="7"></td></tr></tbody>',
		footTemplate: '<tfoot>' + '<tr><th colspan="7" class="today"></th></tr>' + '<tr><th colspan="7" class="clear"></th></tr>' + '</tfoot>'
	};
	DPGlobal.template = '<div class="datetimepicker">' + '<div class="datetimepicker-minutes">' + '<table class=" table-condensed">' + DPGlobal.headTemplate + DPGlobal.contTemplate + DPGlobal.footTemplate + '</table>' + '</div>' + '<div class="datetimepicker-hours">' + '<table class=" table-condensed">' + DPGlobal.headTemplate + DPGlobal.contTemplate + DPGlobal.footTemplate + '</table>' + '</div>' + '<div class="datetimepicker-days">' + '<table class=" table-condensed">' + DPGlobal.headTemplate + '<tbody></tbody>' + DPGlobal.footTemplate + '</table>' + '</div>' + '<div class="datetimepicker-months">' + '<table class="table-condensed">' + DPGlobal.headTemplate + DPGlobal.contTemplate + DPGlobal.footTemplate + '</table>' + '</div>' + '<div class="datetimepicker-years">' + '<table class="table-condensed">' + DPGlobal.headTemplate + DPGlobal.contTemplate + DPGlobal.footTemplate + '</table>' + '</div>' + '</div>';
	DPGlobal.templateV3 = '<div class="datetimepicker">' + '<div class="datetimepicker-minutes">' + '<table class=" table-condensed">' + DPGlobal.headTemplateV3 + DPGlobal.contTemplate + DPGlobal.footTemplate + '</table>' + '</div>' + '<div class="datetimepicker-hours">' + '<table class=" table-condensed">' + DPGlobal.headTemplateV3 + DPGlobal.contTemplate + DPGlobal.footTemplate + '</table>' + '</div>' + '<div class="datetimepicker-days">' + '<table class=" table-condensed">' + DPGlobal.headTemplateV3 + '<tbody></tbody>' + DPGlobal.footTemplate + '</table>' + '</div>' + '<div class="datetimepicker-months">' + '<table class="table-condensed">' + DPGlobal.headTemplateV3 + DPGlobal.contTemplate + DPGlobal.footTemplate + '</table>' + '</div>' + '<div class="datetimepicker-years">' + '<table class="table-condensed">' + DPGlobal.headTemplateV3 + DPGlobal.contTemplate + DPGlobal.footTemplate + '</table>' + '</div>' + '</div>';
	$.fn.datetimepicker.DPGlobal = DPGlobal;

	/* DATETIMEPICKER NO CONFLICT
		* =================== */

	$.fn.datetimepicker.noConflict = function() {
		$.fn.datetimepicker = old;
		return this;
	};

	/* DATETIMEPICKER DATA-API
		* ================== */

	$(document).on('focus.datetimepicker.data-api click.datetimepicker.data-api', '[data-provide="datetimepicker"]',
	function(e) {
		var $this = $(this);
		if ($this.data('datetimepicker')) return;
		e.preventDefault();
		// component click requires us to explicitly show it
		$this.datetimepicker('show');
	});
	$(function() {
		$('[data-provide="datetimepicker-inline"]').datetimepicker();
	});
}));

/* ============================================================
 * Bootstrap.Switch v1.3 by Larentis Mattia @spiritualGuru
 * http://www.larentis.eu/switch/
 * ============================================================
 * Licensed under the Apache License, Version 2.0
 * http://www.apache.org/licenses/LICENSE-2.0
 * ============================================================ */
!function($) {
	"use strict";
	$.fn['bootstrapSwitch'] = function(method) {
		var methods = {
			init: function() {
				return this.each(function() {
					var $element = $(this),
					$div,
					$switchLeft,
					$switchRight,
					$label,
					myClasses = "",
					classes = $element.attr('class'),
					color,
					moving,
					onLabel = "ON",
					offLabel = "OFF",
					icon = false;

					$.each(['size-MINI', 'size-S', 'size-L'],
					function(i, el) {
						if (classes.indexOf(el) >= 0) myClasses = el;
					});
					$element.addClass('has-switch');
					if ($element.data('on') !== undefined) color = "switch-" + $element.data('on');
					if ($element.data('on-label') !== undefined) onLabel = $element.data('on-label');
					if ($element.data('off-label') !== undefined) offLabel = $element.data('off-label');
					if ($element.data('icon') !== undefined) icon = $element.data('icon');
					$switchLeft = $('<span>').addClass("switch-left").addClass(myClasses).addClass(color).html(onLabel);
					color = '';
					if ($element.data('off') !== undefined) color = "switch-" + $element.data('off');
					$switchRight = $('<span>').addClass("switch-right").addClass(myClasses).addClass(color).html(offLabel);
					$label = $('<label>').html("&nbsp;").addClass(myClasses).attr('for', $element.find('input').attr('id'));
					if (icon) {
						$label.html('<i class="icon icon-' + icon + '"></i>');
					}

					$div = $element.find(':checkbox').wrap($('<div>')).parent().data('animated', false);
					if ($element.data('animated') !== false) $div.addClass('switch-animate').data('animated', true);
					$div.append($switchLeft).append($label).append($switchRight);
					$element.find('>div').addClass($element.find('input').is(':checked') ? 'switch-on': 'switch-off');
					if ($element.find('input').is(':disabled')) $(this).addClass('deactivate');
					var changeStatus = function($this) {
						$this.siblings('label').trigger('mousedown').trigger('mouseup').trigger('click');
					};
					$element.on('keydown',
					function(e) {
						if (e.keyCode === 32) {
							e.stopImmediatePropagation();
							e.preventDefault();
							changeStatus($(e.target).find('span:first'));
						}
					});
					$switchLeft.on('click',
					function(e) {
						changeStatus($(this));
					});

					$switchRight.on('click',
					function(e) {
						changeStatus($(this));
					});
					$element.find('input').on('change',
					function(e) {
						var $this = $(this),
						$element = $this.parent(),
						thisState = $this.is(':checked'),
						state = $element.is('.switch-off');
						e.preventDefault();
						$element.css('left', '');
						if (state === thisState) {
							if (thisState) $element.removeClass('switch-off').addClass('switch-on');
							else $element.removeClass('switch-on').addClass('switch-off');
							if ($element.data('animated') !== false) $element.addClass("switch-animate");
							$element.parent().trigger('switch-change', {
								'el': $this,
								'value': thisState
							})
						}
					});

					$element.find('label').on('mousedown touchstart',
					function(e) {
						var $this = $(this);
						moving = false;
						e.preventDefault();
						e.stopImmediatePropagation();
						$this.closest('div').removeClass('switch-animate');
						if ($this.closest('.has-switch').is('.deactivate')) $this.unbind('click');
						else {
							$this.on('mousemove touchmove',
							function(e) {
								var $element = $(this).closest('.switch'),
								relativeX = (e.pageX || e.originalEvent.targetTouches[0].pageX) - $element.offset().left,
								percent = (relativeX / $element.width()) * 100,
								left = 25,
								right = 75;
								moving = true;
								if (percent < left) percent = left;
								else if (percent > right) percent = right;
								$element.find('>div').css('left', (percent - right) + "%")
							});

							$this.on('click touchend',
							function(e) {
								var $this = $(this),
								$target = $(e.target),
								$myCheckBox = $target.siblings('input');
								e.stopImmediatePropagation();
								e.preventDefault();
								$this.unbind('mouseleave');
								if (moving) $myCheckBox.prop('checked', !(parseInt($this.parent().css('left')) < -25));
								else $myCheckBox.prop("checked", !$myCheckBox.is(":checked"));
								moving = false;
								$myCheckBox.trigger('change');
							});

							$this.on('mouseleave',
							function(e) {
								var $this = $(this),
								$myCheckBox = $this.siblings('input');
								e.preventDefault();
								e.stopImmediatePropagation();
								$this.unbind('mouseleave');
								$this.trigger('mouseup');
								$myCheckBox.prop('checked', !(parseInt($this.parent().css('left')) < -25)).trigger('change');
							});

							$this.on('mouseup',
							function(e) {
								e.stopImmediatePropagation();
								e.preventDefault();
								$(this).unbind('mousemove');
							});
						}
					});
				});
			},
			toggleActivation: function() {
				$(this).toggleClass('deactivate');
			},
			isActive: function() {
				return ! $(this).hasClass('deactivate');
			},
			setActive: function(active) {
				if (active) $(this).removeClass('deactivate');
				else $(this).addClass('deactivate');
			},
			toggleState: function(skipOnChange) {
				var $input = $(this).find('input:checkbox');
				$input.prop('checked', !$input.is(':checked')).trigger('change', skipOnChange);
			},
			setState: function(value, skipOnChange) {
				$(this).find('input:checkbox').prop('checked', value).trigger('change', skipOnChange);
			},
			status: function() {
				return $(this).find('input:checkbox').is(':checked');
			},
			destroy: function() {
				var $div = $(this).find('div'),
				$checkbox;
				$div.find(':not(input:checkbox)').remove();
				$checkbox = $div.children();
				$checkbox.unwrap().unwrap();
				$checkbox.unbind('change');
				return $checkbox;
			}
		};

		if (methods[method]) return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		else if (typeof method === 'object' || !method) return methods.init.apply(this, arguments);
		else $.error('Method ' + method + ' does not exist!');
	};
} (jQuery);

$(function() {
	$('.switch')['bootstrapSwitch']();
});