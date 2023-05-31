package com.superai;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author superai
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class SuperAiApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SuperAiApplication.class, args);
        System.out.println("SuperAI启动成功");
    }
}
