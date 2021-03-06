package com.velog.config.oauth2.provider;

import javax.validation.constraints.NotBlank;

import com.velog.domain.user.User;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Oauth2UserDto {
	
	private int id;
	private String email;
	@NotBlank
	private String username;
	@NotBlank
	private String name;
	@NotBlank
	private String comment;
	private String password;
	private String provider;
	
	public User toEntity() {
		return User.builder()
				.email(email)
				.username(username)
				.name(name)
				.comment(comment)
				.password(password)
				.provider(provider)
				.build();
	}
	
}
