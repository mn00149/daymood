package com.study.letter;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LetterDAO {

  @Autowired
  private SqlSession sqlSession;
  
  //메세지 리스트
  public ArrayList<LetterDTO> letterlist(LetterDTO to){
    
    String username = to.getUsername();

    
    //메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진 , 보낸사람 name
    ArrayList<LetterDTO> list = (ArrayList) sqlSession.selectList("letter_list",to);
    
    for (LetterDTO lto : list) {
      lto.setUsername(username);
      //현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
      int unread = sqlSession.selectOne("count_unread", lto);
      //현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
//      String profile = sqlSession.selectOne("get_other_profile",lto);
      //안읽은 메세지 갯수를 lto에 set한다.
      lto.setUnread(unread);
      //메세지 상대의 프로필사진을 lto에 set한다.
//      lto.setProfile(profile);
      //메세지 상대 name을 세팅한다. other_name
      if(username.equals(lto.getSend_name())) {
        lto.setOther_name(lto.getRecv_name());
      }else {
        lto.setOther_name(lto.getSend_name());
      }
    }
    return list;
  }
  
  //room 별 메세지 내용을 가져온다.
  public ArrayList<LetterDTO> roomContentList(LetterDTO to){

    //메세지 내역을 가져온다
    ArrayList<LetterDTO> clist = (ArrayList) sqlSession.selectList("room_content_list",to);
    
    //해당 방의 메세지들 중 받는 사람이 현재사용자의 name인 메세지를 모두 읽음 처리한다
    sqlSession.update("read_chk",to);
    
    return clist;
  }
  //메세지 list에서 메세지를 보낸다.
  public int letterSendInlist(LetterDTO to) {
    //메세지 리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
    if(to.getRoom() == 0) {//room이 0이라면 프로필에서 보낸거다
      int exist_chat = sqlSession.selectOne("exist_chat",to);
      //프로필에서 보낸것중 메세지 내역이 없어서 첫메세지가 될경우를 구분하기 위함
      if(exist_chat == 0) {
        int max_room = sqlSession.selectOne("max_room",to);
        to.setRoom(max_room+1);
      }else {
        int room = Integer.parseInt(sqlSession.selectOne("select_room",to));
        to.setRoom(room);
      }
    }
    int flag = sqlSession.insert("letterSendInlist",to);
    return flag;
  }
}

