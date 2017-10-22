package cn.exrick.manager.annotation;

import java.lang.annotation.*;

/**
 * 系统级别Controller层自定义注解，拦截Controller
 * @author Exrickx
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})//作用于参数或方法上
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemControllerLog {
        String description() default "";
}
