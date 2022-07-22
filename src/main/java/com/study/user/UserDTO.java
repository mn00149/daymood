package com.study.user;

import lombok.Data;

@Data
public class UserDTO {
  private int user_no;       
  private String username;      
  private String email;         
  private String password;      
  private String nation;        
  private String createDate;    
  private String role;          
}
