package com.study.utility;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

//import com.study.reply.ReplyService;


public class Utility {
  public static String paging2(int total, int nowPage, int recordPerPage, String col, String word, int cateno) {
    int pagePerBlock = 5; // 블럭당 페이지 수
    int totalPage = (int) (Math.ceil((double) total / recordPerPage)); // 전체 페이지
    int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
    int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
    int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

    StringBuffer str = new StringBuffer();
    str.append("<div style='text-align:center'>");
    str.append("<ul class='pagination'> ");
    int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
    if (nowGrp >= 2) {
      str.append("<li><a href='/contents/mainlist/" + cateno + "?col=" + col + "&word=" + word + "&nowPage=" + _nowPage
          + "'>이전</A></li>");
    }

    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) {
        break;
      }

      if (nowPage == i) {
        str.append("<li class='active'><a href=#>" + i + "</a></li>");
      } else {
        str.append("<li><a href='/contents/mainlist/" + cateno + "?col=" + col + "&word=" + word + "&nowPage=" + i
            + "'>" + i + "</A></li>");
      }
    }

    _nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
    if (nowGrp < totalGrp) {
      str.append("<li><A href='/contents/mainlist/" + cateno + "?col=" + col + "&word=" + word + "&nowPage=" + _nowPage
          + "'>다음</A></li>");
    }
    str.append("</ul>");
    str.append("</div>");

    return str.toString();
  }

  public static String getCodeValue(String code) {
    String jobname = null;
    Map<String, String> codes = new HashMap<String, String>();

    codes.put("A01", "회사원");
    codes.put("A02", "전산관련직");
    codes.put("A03", "연구전문직");
    codes.put("A04", "각종학교학생");
    codes.put("A05", "일반자영업");
    codes.put("A06", "공무원");
    codes.put("A07", "의료인");
    codes.put("A08", "법조인");
    codes.put("A09", "종교/언론/예술인");
    codes.put("A10", "기타");

    jobname = codes.get(code);
    return jobname;

  }

  /**
   * 오늘,어제,그제 날짜 가져오기
   * 
   * @return List- 날짜들 저장 SimpleDateFormat("yyyy-MM-dd")
   */
  public static List<String> getDay() {
    List<String> list = new ArrayList<String>();

    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    for (int j = 0; j < 3; j++) {// 3일동안 new띄우기 위해서 3으로.
      list.add(sd.format(cal.getTime()));
      cal.add(Calendar.DATE, -1);
    }

    return list;
  }

  /**
   * 등록날짜와 오늘,어제,그제날짜와 비교
   * 
   * @param wdate - 등록날짜
   * @return - true:오늘,어제,그제중 등록날짜와 같음 false:오늘,어제,그제 날짜가 등록날짜와 다 다름
   */
  public static boolean compareDay(String wdate) {
    boolean flag = false;
    List<String> list = getDay();
    if (wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) {
      flag = true;
    }

    return flag;
  }

  // static은 객체생성없이 사용가능하니까static으로
  public static String checkNull(String str) {
    if (str == null) {
      str = "";
    } // nullpointerexception을 방지하기위해서 null일경우 빈문자열 넣어줌

    return str;
  }

  /**
   * @param totalRecord   전체 레코드수
   * @param nowPage       현재 페이지
   * @param recordPerPage 페이지당 레코드 수
   * @param col           검색 컬럼
   * @param word          검색어
   * @return 페이징 생성 문자열
   */
  public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word) {
    int pagePerBlock = 5; // 블럭당 페이지 수
    int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지, ceil: 올림
    int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
    int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
    int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

    StringBuffer str = new StringBuffer();
    str.append("<div style='text-align:center'>");
    str.append("<ul class='pagination'> ");
    int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
    if (nowGrp >= 2) {
      str.append("<li><a href='./list?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>이전</A></li>");
    }

    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) {
        break;
      }

      if (nowPage == i) {
        str.append("<li class='active'><a href=#>" + i + "</a></li>");// 선택한페이지 색깔입히는거?
      } else {
        str.append("<li><a href='./list?col=" + col + "&word=" + word + "&nowPage=" + i + "'>" + i + "</A></li>");
      }
    }

    _nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
    if (nowGrp < totalGrp) {
      str.append("<li><A href='./list?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>다음</A></li>");
    }
    str.append("</ul>");
    str.append("</div>");

    return str.toString();
  }

  public static String saveFileSpring(MultipartFile mf, String basePath) {
    InputStream inputStream = null;
    OutputStream outputStream = null;
    String filename = "";
    long filesize = mf.getSize();
    String originalFilename = mf.getOriginalFilename();
    try {
      if (filesize > 0) { // 파일이 존재한다면
        // 인풋 스트림을 얻는다.
        inputStream = mf.getInputStream();

        File oldfile = new File(basePath, originalFilename);

        if (oldfile.exists()) {
          for (int k = 0; true; k++) {// 동일한 파일명은 RENAME
            // 파일명 중복을 피하기 위한 일련 번호를 생성하여
            // 파일명으로 조합
            oldfile = new File(basePath, "(" + k + ")" + originalFilename);

            // 조합된 파일명이 존재하지 않는다면, 일련번호가
            // 붙은 파일명 다시 생성
            if (!oldfile.exists()) { // 존재하지 않는 경우
              filename = "(" + k + ")" + originalFilename;
              break;
            }
          }
        } else {
          filename = originalFilename;
        }
        String os = System.getProperty("os.name").toLowerCase();
        System.out.println("os: " + os); // windows 10, linux, mac os x
        String serverFullPath = null;
        if (os.equals("mac os x")) { // Mac
          System.out.println("맥");
          serverFullPath = basePath + "/" + filename;
        } else if (os.equals("windows 10")) {
          System.out.println("os: " + os);
          serverFullPath = basePath + "\\" + filename;
        }else if (os.equals("windows 11")) {
          System.out.println("os: " + os);
          serverFullPath = basePath + "\\" + filename;
        } 
        else if (os.equals("linux")) {
          System.out.println("리눅스");
          serverFullPath = basePath + "/" + filename;
        }

        System.out.println("fileName: " + filename);
        System.out.println("serverFullPath: " + serverFullPath);

        outputStream = new FileOutputStream(serverFullPath);// serverFullPath:내가 원하는 경로

        // 버퍼를 만든다.
        int readBytes = 0;
        byte[] buffer = new byte[8192];

        while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {// -1:EOF
          outputStream.write(buffer, 0, readBytes);
        }
        outputStream.close();
        inputStream.close();

      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {

    }

    return filename;
  }

  public static void deleteFile(String upDir, String oldfile) {
    File file = new File(upDir, oldfile);
    if (file.exists())
      file.delete();

  }
  
  public static String rpaging(int total,  int recordPerPage, String url,
      int nPage) {
    int pagePerBlock = 5; // 블럭당 페이지 수
    int totalPage = (int) (Math.ceil((double) total / recordPerPage)); // 전체 페이지
    int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
    int nowGrp = (int) (Math.ceil((double) nPage / pagePerBlock)); // 현재 그룹
    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
    int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료
 
    StringBuffer str = new StringBuffer();
    str.append("<div style='text-align:center'>");
    str.append("<ul class='pagination'> ");
    int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
 
    if (nowGrp >= 2) {
      str.append("<li><a href='" + url + "?nPage=" + _nowPage + "'>이전</A></li>");
    }
 
    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) {
        break;
      }
 
      if (nPage == i) {
        str.append("<li class='active'><a href=#>" + i + "</a></li>");
      } else {
        str.append("<li><a href='" + url + "?nPage=" + i + "'>" + i + "</A></li>");
      }
    }
 
    _nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
    if (nowGrp < totalGrp) {
      str.append("<li><A href='" + url + "?nPage=" + _nowPage + "'>다음</A></li>");
    }
    str.append("</ul>");
    str.append("</div>");
 
    return str.toString();
 
  }
  /*
   * public static int rcount(int contentsno,ReplyService rservice){ return
   * rservice.total(contentsno); }
   */


  

}
