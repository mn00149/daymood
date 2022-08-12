package com.study.user;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MailDTO {
  private String address;
  private String title;
  private String message;
}
