package cn.exrick.manager.annotation;

import java.lang.annotation.*;

/**
 * 系统级别Service层自定义注解，拦截Service层
 * @author Exrickx
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})//作用于参数或方法上
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemServiceLog {
    String description() default "";
}

