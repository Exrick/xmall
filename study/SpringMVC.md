# SpringMVC总结
**@Controller**

通过@controller标注即可将class定义为一个controller类

**@RestController**

组合注解@Controller和@ResponseBody

**@RequestMapping**

- **value** 	表示需要匹配的url的格式

- **method**    表示所需处理请求的http 协议(如get,post,put,delete等)


```
@RequestMapping(value = "/member/add",method = RequestMethod.POST)
```
- **params**	格式为”paramname=paramvalue” 或 “paramname!=paramvalue”。 表示参数必须等于某值，或者不等于才进入此映射方法。不填写的时候表明不限制。所以当请求/testParams.do?param1=value1&param2=value2 的时候能够正确访问到该testParams 方法：


```
@RequestMapping (value= "testParams" , params={ "param1=value1" , "param2" , "!param3" })
    public String testParams() {
       System. out .println( "test Params..........." );
       return "testParams" ;
    }
```


- **headers**	用来限定对应的reqeust请求的headers中必须包括的内容，例如headers={"Connection=keep-alive"}, 表示请求头中的connection的值必须为keep-alive。当请求/testHeaders.do 的时候只有当请求头包含Accept 信息，且请求的host 为localhost 的时候才能正确的访问到testHeaders 方法：

```
@RequestMapping (value= "testHeaders" , headers={ "host=localhost" , "Accept" })
    public String testHeaders() {
       return "headers" ;
    }
```

- **produces**
指定返回的内容类型，仅当request请求头中的(Accept)类型中包含该指定类型才返回
```
@RequestMapping (value= "testProduces" , produces="text/plain;charset=utf-8")
@RequestMapping (value= "testProduces" , produces="application/json;charset=utf-8")
@RequestMapping (value= "testProduces" , produces="application/xml;charset=utf-8")

```

**@DeleteMapping**

映射HTTP的delete请求，等同于`@RequestMapping(value = "/member/add",method = RequestMethod.DELETE)`，以下同理

**@GetMapping**

**@PostMapping**

**@PutMapping**


**@RequestParam**

- **value** 对应表单name空间的值
- **required**	是否允许为空
- **defaultValue**	默认值

```
@RequestMapping ( "requestParam" )
   public String testRequestParam( @RequestParam(required=false) String name, @RequestParam ( "age" ) int age) {
       return "requestParam" ;
}
```

**@PathVariable**

获得地址栏中传的参数 例如：

```
@RequestMapping(value="/{groupId}.do")
public void detail(@PathVariable long groupId){
    groupRepository.selectOne(groupId);
}
```

**@RequestBody**

用来将指定的客户端发送过来的请求参数的数据格式转换成Java实体


```
@RequestMapping(value = "/xxxxx.do")
public void create(@RequestBody() String host){
    System.out.println("-----------" + host);
}
```

**@ResponseStatus**
返回一个指定的http response状态码。


```
@ResponseStatus(reason="no reason",value=HttpStatus.BAD_REQUEST)
@RequestMapping("/responsestatus")
public void responseStatusTest(){
    
}
```

**@CookieValue** 
可以把Requestheader中关于cookie的值绑定到方法的参数上。

例如有如下Cookie值：

　　JSESSIONID=415A4AC178C59DACE0B2C9CA727CDD84，即把JSESSIONID的值绑定到参数cookie上。

 
```
@RequestMapping("/displayHeaderInfo.do")  
 public void displayHeaderInfo(@CookieValue("JSESSIONID") String cookie)  {  
 }
```

**@ExceptionHandler**


```
@RequestMapping("/exception")
 public void ExceptionTest() throws Exception{
    throw new Exception("i don't know");
 }    
 @ExceptionHandler
 public String handleException(Exception e,HttpServletRequest request){  
    System.out.println(e.getMessage());  
    return "helloworld";  
 }
```





