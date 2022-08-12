
package com.study.user;


import java.util.List;

import com.study.member.requestDTO;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserDTO {
  
  private String provider;

  private String username; 
  private String email   ; 
  private String password; 
  private String nation  ; 
  private String role    ; 
  private String user_image;
  private String createDate;
  private List<requestDTO> rlist;
  private int user_no;
  
  
  @Builder  
  public UserDTO(String provider, String username, String email, String password, String nation, String role, String user_image) {
    this.provider = provider;
    this.username = username;
    this.email = email;
    this.password = password;
    this.nation = nation;
    this.role = role;
    this.user_image = user_image;
    }
  }
