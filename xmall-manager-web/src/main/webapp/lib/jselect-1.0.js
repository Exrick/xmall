/*!
 * js模拟系统select v1.0
 * http://www.cnblogs.com/typeof/ 
 * 
 * 主流浏览器对html的select元素渲染都不一样，IE系列(6, 7, 8)也不一样，
 * firefox，chrome，safari，opera 渲染和事件处理也稍有差异
 * 该脚本解决了在不同浏览器下渲染和事件响应不一致的问题，对系统select是完全
 * 意义上的替换。v1.0版本只支持单个select选择即不支持二级或者三级联动且不支持系统select的onchange事件。
 * 该版本支持模拟select选择的数据和系统select选中数据的同步，不影响form表单的提交 
 *
 * 如果page上select有的不想通过该脚本替换，只想维持系统select，可以在相应的select元素添加自定义属性data-enabled="true"，
 * 否则可以在想要通过该脚本替换的select元素上添加自定义属性data-enabled="false"或者不加，会默认为这个select需要
 * 通过该脚本进行替换
 *
 * 日期：2012-11-07 15:38
 */
(function(squid) {
    function JSelect() {
        this.init()
    } 

    JSelect.prototype = {
        constructor: JSelect,
        init: function(context) {
            //获取指定上下文所有select元素
            var elems = squid.getElementsByTagName('select', context)
            this.globalEvent()
            this.initView(elems)
        },
        initView: function(elems) {
            var i = 0,
                elem,
                length = elems.length,
                enabled;

            for(; i < length; i++) {
                elem = elems[i]
                enabled = elem.getAttribute('data-enabled')
                //使用系统select
                if(!enabled || enabled === 'true')
                    continue
                if(squid.isVisible(elem))
                    elem.style.display = 'none'
                
                this.create(elem)
            }
        },
        create: function(elem) {
            var data = [],
                i = 0,
                length,
                option,
                options,
                value,
                text,
                obj,
                lis,
                ul,
                _default,
                icon,
                selectedText,
                selectedValue,
                div,
                wrapper,
                position,
                left,
                top,
                cssText; 

            options = elem.getElementsByTagName('option') 
            length = options.length
            for(; i < length; i++) {
                option = options[i]
                value = option.value
                text = option.innerText || option.textContent
                
                obj = {
                    value: value, 
                    text: text
                }
                if(option.selected) {
                   selectedValue = value
                   selectedText = text  
                   obj['selected'] = true 
                }
                data.push(obj)
            }

            lis = this.render(this.tmpl, data)
            ul = '<ul class="select-item">' + lis + '</ul>'
            //
            div = document.createElement('span')
            div.style.display = 'none'
            div.className = 'select-wrapper'
            //已选元素
            _default = document.createElement('span')
            _default.className = 'select-default unselectable'
            _default.unselectable = 'on'
            //让div元素能够获取焦点
            _default.setAttribute('tabindex', '1')
            _default.setAttribute('data-value', selectedValue)
            _default.setAttribute('hidefocus', true)
            _default.innerHTML = selectedText 
            div.appendChild(_default) 
            //选择icon
            icon = document.createElement('i')
            icon.className = 'select-icon' 
            div.appendChild(icon)
            //下拉列表
            wrapper = document.createElement('span')
            wrapper.className = 'select-list hide'
            wrapper.innerHTML = ul
            //生成新的元素
            div.appendChild(wrapper)
            //插入到select元素后面
            elem.parentNode.insertBefore(div, null)
            //获取select元素left top值
            //先设置select显示，取完left, top值后重新隐藏
            elem.style.display = 'block'
            //事件绑定
            this.sysEvent(div)
            position = squid.position(elem)
            elem.style.display = 'none'
            left = position.left
            top = position.top
            cssText = ' display: inline-block;'
            div.style.cssText = cssText
        },
        globalEvent: function() {
            //document 添加click事件，用户处理每个jselect元素展开关闭
            var target,
                className,
                elem,
                wrapper,
                status,
                that = this;


            squid.on(document, 'click', function(event) {
                target = event.target, 
                className = target.className;

                switch(className) {
                    case 'select-icon':
                    case 'select-default unselectable':
                        elem = target.tagName.toLowerCase() === 'span' ? target : target.previousSibling
                        wrapper = elem.nextSibling.nextSibling
                         
                        //firefox 鼠标右键会触发click事件
                        //鼠标左键点击执行
                        if(event.button === 0) {
                            //初始化选中元素
                            that.initSelected(elem)
                            if(squid.isHidden(wrapper)) {
                                status = 'inline-block'
                                //关闭所有展开jselect
                                that.closeSelect() 
                            }else{
                                status = 'none' 
                            }
                            wrapper.style.display = status 
                            elem.focus() 
                        }else if(event.button === 2){
                            wrapper.style.display = 'none' 
                        }
                        that.zIndex(wrapper)
                        break
                    case 'select-option':
                    case 'select-option selected':
                        if(event.button === 0) {
                            that.fireSelected(target, target.parentNode.parentNode.previousSibling.previousSibling)
                            wrapper.style.display = 'none' 
                        }
                        break
                    default:
                        while(target && target.nodeType !== 9) {
                            if(target.nodeType === 1) {
                                if(target.className === 'select-wrapper') {
                                    return
                                } 
                            }
                            target = target.parentNode
                        }
                        that.closeSelect()
                        break
                } 
            })
        },
        sysEvent: function(elem) {
            var stand = elem.firstChild,
                dropdown = elem.lastChild,
                target,
                //firefox = 'MozBinding' in document.documentElement.style,
                chrome = /chrome/i.test(navigator.userAgent),
                keyup = chrome ? 'keypress' : 'keyup',
                that = this;

            squid.on(elem, 'mouseover', function(event) {
                if(!that.doScrolling) {
                    target = event.target
                    that.activate(target)  
                }
            })

            squid.on(elem, 'mouseout', function(event) {
                if(!that.doScrolling) {
                    target = event.target 
                    that.deactivate(target)
                }
            })

            squid.on(stand, 'keydown', function(event) {
               var keyCode = event.keyCode;

               switch(keyCode) {
                   //回车选中
                   case 13:
                        that.enter(dropdown) 
                        break
                   //向上键
                   case 38:
                       that.doScrolling = true
                       that.up(dropdown) 
                       break
                   //向下键
                   case 40:
                       that.doScrolling = true
                       that.down(dropdown) 
                       break
                   default:
                       break
               } 
            })

            squid.on(stand, keyup, function(event) {
               var keyCode = event.keyCode;

               switch(keyCode) {
                   //回车选中
                   case 13:
                        that.doScrolling = false
                        break
                   //向上键
                   case 38:
                        that.doScrolling = false
                        break
                   //向下键
                   case 40:
                       that.doScrolling = false
                       break
                   default:
                       break
               }  
            })
        },
        zIndex: function(elem) {
            var index = 10,
                cur = elem.parentNode.parentNode,
                next = squid.next(cur);
            
            if(next) {
                cur.style.zIndex = index
                next.style.zIndex = --index
            }
        },
        initSelected: function(elem) {
            var curText = elem.innerText || elem.textContent,
                curValue = elem.getAttribute('data-value'),
                wrapper = elem.nextSibling.nextSibling,
                n = wrapper.firstChild.firstChild,
                text,
                value,
                dir,
                min = 0,
                max,
                hidden = false;

            for(; n; n = n.nextSibling) {
                text = n.innerText || n.textContent 
                value = n.getAttribute('data-value')
                if(curText === text && curValue === value) {
                    //显示已选中元素
                    if(squid.isHidden(wrapper)) {
                        wrapper.style.display = 'block'
                        hidden = true
                    }
                    max = wrapper.scrollHeight
                    if(n.offsetTop > (max / 2)) {
                        if(wrapper.clientHeight + wrapper.scrollTop === max) 
                            dir = 'up'
                        else
                            dir = 'down'
                    }else{
                        if(wrapper.scrollTop === min)
                            dir = 'down'
                        else
                            dir = 'up'
                    }
                    this.inView(n, wrapper, dir) 
                    if(hidden)
                        wrapper.style.display = 'none'
                    this.activate(n)
                    break
                }
            } 
        },
        activate: function(elem) {
            var tagName = (elem.tagName || '').toLowerCase(),
                    className = elem.className,
                    parent = elem.parentNode,
                    first = parent.firstChild,
                    last = parent.lastChild;

            switch(tagName) {
                case 'li':
                    //li.select-option 元素
                    if(!~className.indexOf('selected') && (elem !== first || elem !== last)) {
                        this.deactivate(elem)
                        elem.className = className + ' selected'
                    }
                    break
                default:
                    break
            } 
        },
        deactivate: function(elem) {
             var tagName = (elem.tagName || '').toLowerCase(),
                 className = (' ' + elem.className + ' ').replace(/[\n\r\t]/, '');

            switch(tagName) {
                case 'li':
                    //li.select-option 元素
                    var i = 0,
                        lis = squid.siblings(elem),
                        length = lis.length,
                        cur;

                    for(; i < length; i++) {
                        cur = lis[i] 
                        cur.className = squid.trim(className.replace(' selected ', ''))
                    }
                    break
                default:
                    break
            }
        },
        fireSelected: function(elem, s) {
            var text = elem.innerText || elem.textContent,
                value = elem.getAttribute('data-value'),
                r;

            s.setAttribute('data-value', value) 
            if(s.innerText) 
                s.innerText = text
            else
                s.textContent = text

            //触发系统select选中，用于form表单提交
            r = s.parentNode.previousSibling.previousSibling
            r.value = value 
            r.setAttribute('data-text', text)
        },
        closeSelect: function() {
            var elems = squid.getElementsByClassName('select-list'),
                i = 0,
                length = elems.length,
                elem;  

            for(; i < length; i++) {
                elem = elems[i] 
                if(squid.isVisible(elem))
                    elem.style.display = 'none'
            }
        },
        up: function(elem) {
            var ul = elem.firstChild,
                lis = ul.childNodes,
                li = this.getSelectedIndex(lis),
                cur,
                i = li.index;
            
            if(i > 0) {
                i-- 
                cur = lis[i]
                //判断元素是否in view
                this.inView(cur, elem, 'up')
                this.activate(cur) 
                this.fireSelected(cur, elem.previousSibling.previousSibling) 
            }
        },
        down: function(elem) {
            var ul = elem.firstChild,
                lis = ul.childNodes,
                li = this.getSelectedIndex(lis),
                cur,
                i = li.index;

            if(i < lis.length - 1) {
                 i++ 
                 cur = lis[i]
                 //判断元素是否in view
                 this.inView(cur, elem, 'down') 
                 this.activate(cur)
                 this.fireSelected(cur, elem.previousSibling.previousSibling)
            } 
        },
        enter: function(elem) {
            var ul = elem.firstChild,
                lis = ul.childNodes,
                li,
                i,
                cur;

            li = this.getSelectedIndex(lis)
            i = li.index
            cur = lis[i] 
            this.fireSelected(cur, elem.previousSibling.previousSibling) 
            this.closeSelect()
        },
        getSelectedIndex: function(elems) {
            var i = 0,
                length = elems.length,
                elem;
            
            for(; i < length; i++) {
                elem = elems[i]
                if(~elem.className.indexOf('selected')) {
                    return {
                        index: i
                    } 
                }
            }

            return {
                index: -1
            }
        },
        inView: function(elem, wrapper, dir) {
            var scrollTop = wrapper.scrollTop,
                offsetTop = elem.offsetTop,
                top;

            if(dir === 'up') {
                if(offsetTop === 0) {
                    wrapper.scrollTop = offsetTop;
                }else if(offsetTop < scrollTop) {
                    top = offsetTop - scrollTop
                    this.scrollInView(wrapper, top) 
                }
            }else{
                var clientHeight = wrapper.clientHeight;
                
                if(offsetTop + elem.offsetHeight === wrapper.scrollHeight) {
                    wrapper.scrollTop = wrapper.scrollHeight - wrapper.clientHeight 
                }else if(offsetTop + elem.offsetHeight > clientHeight + scrollTop) {
                    top = (offsetTop + elem.offsetHeight) - (scrollTop + clientHeight)
                    this.scrollInView(wrapper, top) 
                }
            }
        },
        scrollInView: function(elem, top) {
            setTimeout(function() {
                elem.scrollTop += top
            }, 10)
        },
        doScrolling: false,
        render: function(tmpl, data) {
            var i = 0,
                cur,
                length = data.length,
                prop,
                value,
                item,
                r = [];

            for(; i < length; i++) {
               cur = data[i]
               item = tmpl.replace(/\{\{\w+\}\}/g, function(a) {
                   prop = a.replace(/[\{\}]+/g, '')
                   value = cur[prop] || ''
                   if(prop === 'class') {
                        value += 'select-option'
                        if(cur.selected) {
                            value += ' selected' 
                        }
                   }
                        
                   return value
               })
               r.push(item)
            }

            return r.join('')
        },
        tmpl: '<li class="{{class}}" data-value="{{value}}">{{text}}</li>'
    }

    squid.swing.jselect = function() {
        return new JSelect() 
    }
})(squid);