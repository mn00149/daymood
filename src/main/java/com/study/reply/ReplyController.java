package com.study.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.study.utility.Utility;

@RestController
public class ReplyController {
  private static final Logger log = LoggerFactory.getLogger(ReplyController.class);

  @Autowired
  @Qualifier("com.study.reply.ReplyServiceImpl")
  private ReplyService service;
  
  
  
  @GetMapping("/reply/list/{board_no}/{sno}/{eno}")
  public ResponseEntity<List<ReplyDTO>> getList(
      @PathVariable("board_no") int board_no, 
      @PathVariable("sno") int sno,
      @PathVariable("eno") int eno) {

    Map map = new HashMap();
    map.put("sno", sno);
    map.put("eno", eno);
    map.put("board_no", board_no);
    
    log.info("list:"+service.list(map));

    return new ResponseEntity<List<ReplyDTO>>(service.list(map), HttpStatus.OK);
  }

  @GetMapping("/reply/page")
  public ResponseEntity<String> getPage(
      int nPage, int nowPage,int board_no, String col, String word) {

    int total = service.total(board_no);
    String url = "/board/read/"+board_no;

    int recordPerPage = 10; // 한페이지당 출력할 레코드 갯수

    String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage);

    return new ResponseEntity<>(paging, HttpStatus.OK);

  }
  
  @PostMapping("/reply/create")
  public ResponseEntity<String> create(@RequestBody ReplyDTO vo) {

    log.info("ReplyDTO1:content " + vo.getContent());
    log.info("ReplyDTO1:username " + vo.getUsername());
    log.info("ReplyDTO1:board_no " + vo.getBoard_no());
    log.info("ReplyDTO1:user_no " + vo.getUser_no());
    
    vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));
 
    int flag = service.create(vo);
 
    log.info("Reply INSERT flag: " + flag);
 
    return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }
 
  @GetMapping("/reply/{reply_no}")
  public ResponseEntity<ReplyDTO> get(@PathVariable("reply_no") int reply_no) {
 
    log.info("get: " + reply_no);
 
    return new ResponseEntity<>(service.read(reply_no), HttpStatus.OK);
  }
  
  @PutMapping("/reply/")
  public ResponseEntity<String> modify(@RequestBody ReplyDTO vo) {

    log.info("modify: " + vo);
 
    return service.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
  
  @DeleteMapping("/reply/{reply_no}")
  public ResponseEntity<String> remove(@PathVariable("reply_no") int reply_no) {
 
    log.info("remove: " + reply_no);
 
    return service.delete(reply_no) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
}
