package com.velog.web.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.velog.domain.user.User;
import com.velog.domain.user.UserRepository;
import com.velog.web.model.dto.mypage.MypageDto;

@Service
public class ImgServiceImpl implements ImgService {

	@Value("${file.path}")
	private String filePath;
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public String updateProfileImg(MypageDto mypageDto, User user) {
		String originFileName = mypageDto.getFile().getOriginalFilename();
		String originFileExtension = originFileName.substring(originFileName.lastIndexOf("."));
		String tempfilename = UUID.randomUUID().toString().replaceAll("-", "") + originFileExtension;
		String userFolder = "profile/" + user.getId() + "/";
		String imageFilePath = filePath + userFolder + tempfilename;
		String oldFileName = filePath + userFolder + user.getProfile_img_url();
		File oldFile = new File(oldFileName);
		File file = new File(imageFilePath);
		
		if (!file.exists()) {
			file.mkdirs(); // 폴더경로 생성
		}
		
		try {
			if (mypageDto.getFile() != null) {
				oldFile.delete();
			}
			mypageDto.getFile().transferTo(file); // 파일을 복붙느낌
			User userntt = mypageDto.toUEntity(mypageDto.getId());
			userntt.setProfile_img_url(tempfilename);
			userRepository.updateProfileImg(userntt);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return tempfilename;
	}

	@Override
	public int deleteProfileImg(User user) {
		String userFolder = "profile/" + user.getId() + "/";
		String oldFilename = user.getProfile_img_url();
		String imageFilePath = filePath + userFolder + oldFilename;
		int result = 0;
		result += userRepository.deleteProfileImg(user.getId());
		if (result == 1) {
			File file = new File(imageFilePath);
			file.delete();
		}
		return result;
	}

}
