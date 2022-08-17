package com.study.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service("com.study.user.UserServiceImpl")
public class UserServiceImpl implements UserService {

  @Autowired
  private UserMapper mapper;
  
  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;

  @Override
  public int create(UserDTO user) {
    return mapper.create(user);
  }

  @Override
  public UserDTO findByUsername(String username) {
    return mapper.findByUsername(username);
  }

  @Override
  public int duplicatedUsername(String username) {
    return mapper.duplicatedUsername(username);
  }

  @Override
  public int duplicatedEmail(String email) {
    return mapper.duplicatedEmail(email);
  }

  @Override
  public boolean userEmailCheck(String email, String username) {
    UserDTO user = findByUsername(username);
    if (user != null && user.getEmail().equals(email)) {
      return true;
    } else {
      return false;
    }
  }

  @Override
  public int updateUserPassword(UserDTO user) {
    // TODO Auto-generated method stub
    return mapper.updateUserPassword(user);
  }

  @Override
  public boolean checkPassword(String username, String password) {
    UserDTO user = findByUsername(username);
    if (user != null && bCryptPasswordEncoder.matches(password, user.getPassword())) {
      return true;
    } else {
      return false;
    }
  }

  @Override
  public int deleteUser(String username) {
    // TODO Auto-generated method stub
    return mapper.deleteUser(username);
  }

  @Override
  public int updatePassword(UserDTO user) {
    // TODO Auto-generated method stub
    return mapper.updatePassword(user);
  }

}