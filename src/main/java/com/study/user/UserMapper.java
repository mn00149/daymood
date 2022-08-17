package com.study.user;

import java.util.List;
import java.util.Map;

public interface UserMapper {

  int create(UserDTO user);

  UserDTO findByUsername(String username);
  
  int duplicatedUsername(String username);

  int duplicatedEmail(String email);

  boolean userEmailCheck(String email, String username);
  
  int updateUserPassword(UserDTO user);

  int checkPassword(String username, String password);

  int deleteUser(String username);

  int updatePassword(UserDTO user);

}