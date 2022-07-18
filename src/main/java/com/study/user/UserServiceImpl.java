package com.study.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.user.UserServiceImpl")
public class UserServiceImpl implements UserService {

  @Autowired
  private UserMapper mapper;

  @Override
  public int create(UserDTO user) {
    // TODO Auto-generated method stub
    return mapper.create(user);
  }

  @Override
  public UserDTO findByUsername(String username) {
    // TODO Auto-generated method stub
    return mapper.findByUsername(username);
  }
  
  @Override
  public int duplicatedUsername(String username) {
    // TODO Auto-generated method stub
    return mapper.duplicatedUsername(username);
  }

  @Override
  public int duplicatedEmail(String email) {
    // TODO Auto-generated method stub
    return mapper.duplicatedEmail(email);
  }


}