(function() {
    if (window.changyan !== undefined || window.cyan !== undefined) {
        return;
    }
    var createNs = function() {
        if (window.changyan !== undefined) {
            return;
        } else {
            window.changyan = {};
            window.changyan.api = {};
            window.changyan.api.config = function(conf) {
                window.changyan.api.tmpIsvPageConfig = conf;
            };
            window.changyan.api.ready = function(fn) {
                window.changyan.api.tmpHandles = window.changyan.api.tmpHandles || [];
                window.changyan.api.tmpHandles.push(fn);
            };
            window.changyan.ready = function(fn) {
                if (window.changyan.rendered) {
                    fn && fn();
                } else {
                    window.changyan.tmpHandles = window.changyan.tmpHandles || [];
                    window.changyan.tmpHandles.push(fn);
                }
            }
        }
    };

    var createMobileNs = function() {
        if (window.cyan) {
            return;
        }
        window.cyan = {};
        window.cyan.api = {};
        window.cyan.api.ready = function(fn) {
            window.cyan.api.tmpHandles = window.cyan.api.tmpHandles || [];
            window.cyan.api.tmpHandles.push(fn);
        };
    };
    var loadVersionJs = function() {
        var loadJs = function(src, fun) {
            var head = document.getElementsByTagName('head')[0] || document.head || document.documentElement;

            var script = document.createElement('script');
            script.setAttribute('type', 'text/javascript');
            script.setAttribute('charset', 'UTF-8');
            script.setAttribute('src', src);

            if (typeof fun === 'function') {
                if (window.attachEvent) {
                    script.onreadystatechange = function() {
                        var r = script.readyState;
                        if (r === 'loaded' || r === 'complete') {
                            script.onreadystatechange = null;
                            fun();
                        }
                    };
                } else {
                    script.onload = fun;
                }
            }

            head.appendChild(script);
        };

        var ver = + new Date() + window.Math.random().toFixed(16);
        var url = 'https://changyan.itc.cn/upload/version-v4.js?' + ver;
        loadJs(url);
    };
    createNs();
    createMobileNs();
    loadVersionJs();
}());