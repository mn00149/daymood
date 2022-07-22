package com.study.utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.study.reply.ReplyService;

public class Utility {

  private static class TIME_MAXIMUM {
    public static final int SEC = 60;
    public static final int MIN = 60;
    public static final int HOUR = 24;
    public static final int DAY = 30;
    public static final int MONTH = 12;
  }

  public static List<String> calculateTime(@RequestParam Map<String, ArrayList> map2) {

    map2.get("date_list");
    List<String> msg = new ArrayList<>();

    for (int i = 0; i < map2.get("date_list").size(); i++) {

      try {
        // 작성일자가 24시간 이내인 글은 몇 시간 전 포맷으로 출력
        String from = (String) map2.get("date_list").get(i);
        ;
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date to = transFormat.parse(from);

        // 작성일자가 하루가 24시간이 지나면 yyyy-MM-dd 포맷으로 출력
        SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        Date to2 = transFormat2.parse(from);
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateToStr = dateFormat.format(to2);

        long curTime = System.currentTimeMillis();
        long regTime = to.getTime();
        long diffTime = (curTime - regTime) / 1000;

        if (diffTime < TIME_MAXIMUM.SEC) {
          msg.add(Long.toString(diffTime) + "초 전");
        } else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
          msg.add(Long.toString(diffTime) + "분 전");
        } else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
          msg.add(Long.toString(diffTime) + "시간 전");
        } else {
          msg.add(dateToStr);
        }

      } catch (ParseException e) {
        e.printStackTrace();
      }

    } // for end
    return msg;
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
    int pagePerBlock = 3; // 블럭당 페이지 수
    int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지, ceil: 올림
    int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
    int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
    int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

    StringBuffer str = new StringBuffer();
    // str.append("<div class='paging' style='text-align:center'>");
    str.append("<div class='pagination'>");
    int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
    if (nowGrp >= 2) {
      str.append("<li><a href='./list?col=" + col + "&word=" + word + "&nowPage=" + _nowPage
          + "'><i class=\"fa-solid fa-angle-left\"></i></a></li>");
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
      str.append("<li><a href='./list?col=" + col + "&word=" + word + "&nowPage=" + _nowPage
          + "'><i class=\"fa-solid fa-angle-right\"></i></a></li>");
    }
    str.append("</div>");
    // str.append("</div>");

    return str.toString();
  }

  public static String rpaging(int total, int nowPage, int recordPerPage, String col, String word, String url,
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
      str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage
          + "&nPage=" + _nowPage + "'>이전</A></li>");
    }

    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) {
        break;
      }

      if (nPage == i) {
        str.append("<li class='active'><a href=#>" + i + "</a></li>");
      } else {
        str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage
            + "&nPage=" + i + "'>" + i + "</A></li>");
      }
    }

    _nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
    if (nowGrp < totalGrp) {
      str.append("<li><A href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage
          + "&nPage=" + _nowPage + "'>다음</A></li>");
    }
    str.append("</ul>");
    // str.append("</div>");

    return str.toString();

  }

  public static int rcount(int board_no, ReplyService rservice) {
    return rservice.total(board_no);
  }

}