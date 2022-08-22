package com.project.main.js;

public interface UserMapper {

	int join(User u);

	User getUserByID(User u);

	User getUserByKakaoID(User kakaoUser);

	User getUserByNaverID(User u);

	int naver(User u);

	int fileUpdate(User u);

	int idCheck(User u);

	int idCheckWithKakao(User u);
	
	int idCheckWithNaver(User u);

	int nickCheck(User u);

	int joinWithKakao(User kakaoUser);

	int joinWithNaver(User u);

	User findID(User u);

	User findPW(User u);

	int deleteUser(User u);

	int updatePW(User u);

	int pwCheck(User u);

	int updateUser(User u);








}
