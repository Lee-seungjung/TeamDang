package com.project.dang.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix = "custom.email") // application.properties에서 custom.email이라는 접두사가 붙은 요소에 대한 설정
public class EmailProperties {

	private String host;
	private int port;
	private String username;
	private String password;
}
