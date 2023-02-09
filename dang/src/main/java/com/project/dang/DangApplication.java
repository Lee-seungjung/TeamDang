package com.project.dang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling //스케쥴러 사용
@SpringBootApplication
public class DangApplication {

	public static void main(String[] args) {
		SpringApplication.run(DangApplication.class, args);
	}

}
