package com.study.reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("com.study.reply.ReplyServiceImpl")
public class ReplyServiceImpl implements ReplyService {

  @Autowired
  private ReplyMapper mapper;
  
  @Override
  public int create(ReplyDTO ReplyDTO) {
    // TODO Auto-generated method stub
    return mapper.create(ReplyDTO);
  }

  @Override
  public List<ReplyDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public ReplyDTO read(int reply_no) {
    // TODO Auto-generated method stub
    return mapper.read(reply_no);
  }

  @Override
  public int update(ReplyDTO ReplyDTO) {
    // TODO Auto-generated method stub
    return mapper.update(ReplyDTO);
  }

  @Override
  public int delete(int reply_no) {
    // TODO Auto-generated method stub
    return mapper.delete(reply_no);
  }

  @Override
  public int total(int board_no) {
    // TODO Auto-generated method stub
    return mapper.total(board_no);
  }

  @Override
  public int rcount(int board_no) {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int re_create(ReplyDTO ReplyDTO) {
    // TODO Auto-generated method stub
    return mapper.re_create(ReplyDTO);
  }

}
