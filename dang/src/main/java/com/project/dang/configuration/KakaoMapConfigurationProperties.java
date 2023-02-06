package com.project.dang.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
@ConfigurationProperties(prefix = "custom.kakaomap")
public class KakaoMapConfigurationProperties {
	private String key;
}
