/*!
 * Squid 总结、积累、收集的一些基础方法
 * http://www.cnblogs.com/typeof/
 *
 * 所有plugins、swing所做的扩展都是基于Squid对象
 */
(function(window) {
    //定义squid
    var Squid = function() {},
        slice = Array.prototype.slice,
        splice = Array.prototype.splice,
        trim = String.prototype.trim;

    //浅度拷贝
    Squid.extend = function() {
        var target = arguments[0],
            i = 1,
            length = arguments.length,
            options,
            prop;

        if(typeof target !== 'object') {
            target = {};
        }

        if(length === i) {
            target = this;
            --i;
        }

        for(; i < length; i++) {
            if((options = arguments[i]) != null) {
                for(prop in options) {
                    target[prop] = options[prop];
                }
            }
        }

        return target;
    };

    //DOM 方法
    Squid.extend({
        getElementById: function(id) {
            var elem = document.getElementById(id);
            
            if(elem && elem.parentNode) {
                if(elem.id !== id) {
                    elem = null;
                    var elems = document.getElementsByTagName(id),
                        i = 0,
                        length = elems.length,
                        cur;

                    for(; i < length; i++) {
                        cur = elems[i];
                        if(cur.id === id) {
                            elem = cur;
                            break;
                        }
                    }
                }
                
                return elem;
            } 
        },
        getElementsByTagName: function(tagName, context) {
            context = context || document;

            var elems = context.getElementsByTagName(tagName),
                r = [];
            
            try {
                r = slice.call(elems, 0);
            }catch(e) {
                var i = 0,
                    length = elems.length,
                    elem;

                for(; i < length; i++) {
                    elem = elems[i];
                    r.push(elem);
                }
            }

            return r;
        },
        getElementsByClassName: function(className, context) {
            //执行上下文，默认为document
            context = context || document; 

            var r = [];

            if(context.getElementsByClassName) {
                var elems = context.getElementsByClassName(className);				
                r = slice.call(elems, 0);
            }else{
                var elems,
                    elem,
                    i = 0,
                    length;

                elems = context.getElementsByTagName('*');		
                length = elems.length;
                for(; i < length; i++) {
                    elem = elems[i];
                    if(elem.className && (" " + elem.className + " ").replace(/[\t\n\r]/g, " ").indexOf(className) >= 0) {
                        r.push(elem);	
                    }
                }
            }

            return r;    
        },
        children: function(elem) {

        },
        first: function(elem) {
            return this.sibling(elem.firstChild)[0];	
        },
        next: function(elem) {
            return this.nth(elem, 2, 'nextSibling');
        },
        siblings: function(elem) {
            return this.sibling(elem.parentNode.firstChild, elem); 
        },
        nth: function(cur, r, dir) {
            r = r || 1;
            var i = 0;

            for(; cur; cur = cur[dir]) {
                if(cur.nodeType === 1 && ++i === r) {
                    break; 
                }
            }

            return cur;
        },
        sibling: function(n, elem) {
            var r = [];

            for(; n; n = n.nextSibling) {
                if(n.nodeType === 1 && n !== elem) {
                    r.push(n);	
                }	
            }

            return r;
        },
        isVisible: function(elem) {
            return !this.isHidden(elem); 
        },
        isHidden: function(elem) {
            if(elem) {
                var width = elem.offsetWidth,
                    height = elem.offsetHeight;

                return (width === 0 && height === 0) || elem.style.display === 'none'
            } 
        },
        getOffset: function(elem) {
            var body = document.body,
                docElem = document.documentElement;

            if('getBoundingClientRect' in document.documentElement) {
                var box;

                try {
                    box = elem.getBoundingClientRect()
                }catch(e) {}

                if(!box || !elem.parentNode) {
                    return box ? {top: box.top, left: box.left} : {top: 0, left: 0}
                }

                var win = window,
                    clientTop = docElem.clientTop || body.clientTop || 0,
                    clientLeft = docElem.clientLeft || body.clientLeft || 0,
                    scrollTop = win.pageYOffset || docElem.scrollTop || body.scrollTop,
                    scrollLeft = win.pageXOffset || docElem.scrollLeft || body.scrollLeft,
                    top = box.top + scrollTop - clientTop,
                    left = box.left + scrollLeft - clientLeft; 

                return {top: top, left: left}
            }else{
                var offsetParent = elem.offsetParent,
                    top = elem.offsetTop,
                    left = elem.offsetLeft;

                while((elem = elem.parentNode) && elem !== body && elem !== docElem) {
                    if(elem === offsetParent) {
                        top = elem.offsetTop
                        left = elem.offsetLeft

                        offsetParent = elem.offsetParent
                    }
                }

                return {top: top, left: left}
            }
        },
        position: function(elem) {
            if(!elem) {
                return null; 
            }

            var offsetParent = elem.offsetParent,
                offset = this.getOffset(elem),
                parentOffset = this.getOffset(offsetParent);

            return {
                top: offset.top - parentOffset.top,
                left: offset.left - parentOffset.left
            };
        }
    });
    
    //全局缓存对象
    var cache = {};

    Squid.extend({
        guid: 1,
        uuid: 0,
        expando: 'squid' + (Math.random() + '').replace(/\D/g, ''),
        data: function(elem, name) {
            var internalKey = squid.expando,
                id,
                thisCache,
                r;

            id = elem[squid.expando];
            if(!id) {
                elem[squid.expando] = id = ++squid.uuid;
            }
            if(!cache[id]) {
                cache[id] = {};
            }

            if(typeof name === 'object' || typeof name === 'function') {
                cache[id][internalKey] = name;
            }

            thisCache = cache[id];

            if(!thisCache[internalKey]) {
                thisCache[internalKey] = {};
            }
            thisCache = thisCache[internalKey];

            if(name === 'events' && !thisCache[name]) {
                return thisCache[internalKey] && thisCache[internalKey].events;
            }

            if(typeof name === 'string') {
                r = thisCache[name];
            }else{
                r = thisCache;
            }

            return r;			
        },
        removeData: function(elem, name) {
            var internalKey = squid.expando,
                id = elem[squid.expando],
                internalCache;

            if(!cache[id]) {
                return;
            }
            try{
                delete cache[id];
            }catch(e) {
                cache[id] = null;
            }
            if(elem.removeAttribute) {
                elem.removeAttribute(squid.expando);
            }else{
                elem[squid.expando] = null;
            }
        }
    });

    //事件处理
    Squid.event = {
        add: function(elem, type, handler) {
            var elemData,
            events,
            eventHandler,
            handleObj,
            handlers;

            if(elem.nodeType === 3 || elem.nodeType === 8) {
                return;
            }
            if(!handler) {
                return;
            }
            if(!handler.guid) {
                handler.guid = squid.guid++;
            }

            elemData = squid.data(elem);
            if(!elemData) {
                return;
            }

            events = elemData.events;
            eventHandler = elemData.handle;
            if(!events) {
                elemData.events = events = {};
            }

            if(!eventHandler) {
                elemData.handle = eventHandler = function(event) {
                    return squid.event.handle.apply(eventHandler.elem, arguments); 
                };
                eventHandler.elem = elem;
            }
            
            handleObj = {
                handler: handler
            };
            handleObj.type = type;
            if(!handleObj.guid) {
                handleObj.guid = handler.guid;
            }
            handlers = events[type];
            if(!handlers) {
                handlers = events[type] = [];
                if(elem.addEventListener) {
                    elem.addEventListener(type, eventHandler, false);
                }else if(elem.attachEvent){
                    elem.attachEvent('on' + type, eventHandler);
                }
            }

            handlers.push(handleObj);
        },
        remove: function(elem, type, handler) {
            var elemData,
                events,
                eventType,
                i = 0,
                handleObj;
                
            if(elem.nodeType === 3 || elem.nodeType === 8) {
                return;
            }	
            
            elemData = squid.data(elem);
            events = elemData.events;
            if(!events) {
                return;
            }
            eventType = events[type] || [];
            if(!handler) {
                for(; i < eventType.length; i++) {
                    handleObj = eventType[i];
                    squid.event.remove(elem, type, handleObj.handler);
                    eventType.splice(i--, 1);
                }
            }
        
            if(eventType.length === 0) {
                if(elem.removeEventListener) {
                    elem.removeEventListener(type, elemData.handle, false);
                }else if(elem.detachEvent) {
                    elem.detachEvent('on' + type, elemData.handle);
                }
            }
            
            squid.removeData(elem);
        },
        handle: function(event) {
            var i = 0,
                length,
                handlers,
                handleObj,
                args = Array.prototype.slice.call(arguments, 0);

            event = squid.event.fix(event);
            handlers = ((squid.data(this, 'events') || {})[event.type] || []).slice(0);

            args[0] = event;

            length = handlers.length;
            for(; i < length; i++) {
                handleObj = handlers[i];
                event.handler = handleObj.handler;
                event.handleObj = handleObj;

                handleObj.handler.apply(this, args);
            }
        },
        fix: function(event) {
            if(!event.target) {
                event.target = event.srcElement || document;
            }

            if(event.target.nodeType === 3) {
                event.target = event.target.parentNode;
            }
            
            if(!event.relateTarget && event.fromElement) {
                event.relateTarget = event.fromElement === event.target ? event.toElement : event.fromElement;
            }

            if(!event.preventDefault) {
                event.preventDefault = function() {
                    event.returnValue = false;
                };
            }

            if(!event.stopPropagation) {
                event.stopPropagation = function() {
                    event.cancelBubble = true;
                };
            }
            
            if(event.pageX == null) {
                var eventDoc = event.target.ownerDocument || document,
                    doc = eventDoc.documentElment,
                    body = eventDoc.body;
                
                event.pageX = event.clientX + (doc && document.scrollLeft || body && body.scrollLeft || 0) - (doc && doc.clientLeft || body && body.clientLeft || 0);
                event.pageY = event.clientY + (doc && document.scrollTop || body && body.scrollTop || 0) - (doc && doc.clientTop || body && body.clientTop || 0);
            }

            return event;
        }
    };

    //事件处理
    Squid.extend({
        on: function(elem, type, handler) {
            return this.event.add(elem, type, handler);	
        },
        off: function(elem, type, handler) {
            return this.event.remove(elem, type, handler);
        },
        //把函数放到特定上下文执行
        proxy: function(fn, context) {
            var slice = Array.prototype.slice,
                args = slice.call(arguments, 2),
            proxy = function() {
                return fn.apply(context, args.concat(slice.call(arguments))); 
            };

            proxy.guid = fn.guid = fn.guid || proxy.guid || squid.guid++;

            return proxy;
        }
    });

    var fnThrottleId = 0;
    //工具函数
    Squid.extend({
        trim: trim ? function(text) {
            return trim.call(text);
        } : function(text) {
            return text.toString().replace(/^\s+/, '').replace(/\s+$/, '');
        },
        throttle: function(fn, delay, context) {
            delay = delay || 100;
            context  = context || null;  
            
            return function() {
                var args = arguments;
                
                clearTimeout(fnThrottleId);
                fnThrottleId = setTimeout(function() {
                    fn.apply(context, args);
                }, delay);
            };
        },
        isEmpty: function(obj) {
            for(var prop in obj) {
                return false; 
            }
            
            return true;
        }
    });

    //基于Squid扩展的插件
    Squid.plugin = function() {};
    //解决浏览器对默认组件渲染不一样
    Squid.swing = function() {};    
    window.squid = Squid;
})(window);