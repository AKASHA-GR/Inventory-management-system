package com.xworks.inventoryManagement.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@EnableWebMvc
@ComponentScan("com.xworks.inventoryManagemant.config")
public class ApplicationConfiguration {

    public ApplicationConfiguration(){
        System.out.println("The ApplicationConfiguration is created");
    }

}
