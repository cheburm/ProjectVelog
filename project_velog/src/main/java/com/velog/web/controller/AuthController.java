package com.velog.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.velog.config.auth.PrincipalDetails;
import com.velog.web.model.dto.auth.SignUpDto;
import com.velog.web.model.dto.auth.SignUpRespDto;
import com.velog.web.service.AuthService;
import com.velog.web.service.ConfirmationTokenService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AuthController {
	
	private final AuthService authService;
	
	private final ConfirmationTokenService confirmationTokenService;
	
//	@ResponseBody
//	@PostMapping("/auth/signup")
//	public Object signup(@Valid SignUpDto signUpDto, BindingResult bindingResult) {
//		if(bindingResult.hasErrors()) {
//			//유효성 검사 Error
//			Map<String, String> errorMap = new HashMap<String, String>();
//			for(FieldError error : bindingResult.getFieldErrors()) {
//				errorMap.put(error.getField(), error.getDefaultMessage());
//			}
//			SignUpRespDto<Map<String, String>> signUpRespDto = new SignUpRespDto<Map<String,String>>();
//			signUpRespDto.setCode(400);
//			signUpRespDto.setMsg(errorMap);
//			return signUpRespDto;
//		}else {
//			// 회원가입 진행
//			SignUpRespDto<String> signUpRespDto = new SignUpRespDto<String>();
//			int signUpResult = authService.signUp(signUpDto);
//			if(signUpResult == 1) {
//				//회원가입 성공
//				signUpRespDto.setCode(200);
//				signUpRespDto.setMsg("회원가입 성공");
//			}else if(signUpResult == 2) {
//				// 이미 가입된 사용자
//				signUpRespDto.setCode(410);
//				signUpRespDto.setMsg("이미 가입된 회원 입니다.");
//			}else {
//				// 회원가입 실패
//				signUpRespDto.setCode(500);
//				signUpRespDto.setMsg("회원가입 실패. 관리자에게 문의하세요.");
//			}
//			return signUpRespDto;
//		}
//	}
	
	@GetMapping("/email/send")
	public String sendEmail(@RequestParam String email) {
		confirmationTokenService.createEmailConfirmationToken(email);
		return "index";
	}
	
	@GetMapping("/confirm-email")
	public String viewConfirmEmail(@RequestParam String token) {
		System.out.println(token);
		authService.confirmEmail(token);
		return "";
		
	}


}