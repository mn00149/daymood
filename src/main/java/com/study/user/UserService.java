package com.study.user;

import java.util.List;
import java.util.Map;

public interface UserService {


  int create(UserDTO user);

  UserDTO findByUsername(String username);
  
  int duplicatedUsername(String username);

  int duplicatedEmail(String email);


}