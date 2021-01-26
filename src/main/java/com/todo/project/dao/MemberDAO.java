package com.todo.project.dao;

import java.util.HashMap;

public interface MemberDAO {

	int join(HashMap<String, Object> params); //회원가입

	int dbchk(String id);//아이디 중복확인


}
