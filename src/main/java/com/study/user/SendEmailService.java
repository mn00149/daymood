package com.study.user;

public interface SendEmailService {
  
  public MailDTO createMailAndChangePassword(String email, String username);

  public void updatePassword(String str,String email);
  
  public String getTempPassword();

  public void mailSend(MailDTO dto);
}
