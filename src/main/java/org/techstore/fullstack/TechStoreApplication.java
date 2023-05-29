package org.techstore.fullstack;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "org.techstore.fullstack")
public class TechStoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(TechStoreApplication.class, args);
    }

}
