package com.study.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


@Service("com.study.user.SendEmailServiceImpl")
public class SendEmailServiceImpl implements SendEmailService {
  @Autowired
  @Qualifier("com.study.user.UserServiceImpl")
  private UserService service;
  
  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;
  @Autowired
  private MailSender mailSender;
  
  private static final String FROM_ADDRESS = "ohinung@gmail.com";

  public MailDTO createMailAndChangePassword(String email, String username) {
    String tempPassword = getTempPassword();
    MailDTO dto = new MailDTO();
    dto.setAddress(email);
    dto.setTitle(username + "님의 daymood 임시비밀번호 안내 이메일 입니다.");
    dto.setMessage("안녕하세요. daymood 임시비밀번호 안내 관련 이메일 입니다." + "[" + username + "]" + "님의 임시 비밀번호는 " + tempPassword + " 입니다.");
    updatePassword(tempPassword, username);
    return dto;
  }

  public void updatePassword(String tempPassword, String username) {
    String encPassword = bCryptPasswordEncoder.encode(tempPassword);
    UserDTO user = service.findByUsername(username);
    user.setPassword(encPassword);
    int cnt = service.updateUserPassword(user);
    if(cnt>0) {
      System.out.println("임시 비번 발급");
    }
  }

  public String getTempPassword() {
    char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
        'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

    String tempPassword = "";

    int idx = 0;
    for (int i = 0; i < 10; i++) {
      idx = (int) (charSet.length * Math.random());
      tempPassword += charSet[idx];
    }
    return tempPassword;
  }

  @Override
  public void mailSend(MailDTO dto) {
    
    System.out.println(dto);
    SimpleMailMessage message = new SimpleMailMessage();
    message.setTo(dto.getAddress());
    message.setFrom(SendEmailServiceImpl.FROM_ADDRESS);
    message.setSubject(dto.getTitle());
    message.setText(dto.getMessage());
    

    mailSender.send(message);
    
  }

}
