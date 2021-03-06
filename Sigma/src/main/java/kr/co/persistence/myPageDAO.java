package kr.co.persistence;

import java.util.List;
import java.util.Map;

import kr.co.domain.basketVO;
import kr.co.domain.buyListVO;
import kr.co.domain.favoriteStoreVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;

public interface myPageDAO {

   memberVO getMemberVO(String userId);

   memberVO updateUI(String id);

   void update(memberVO vo);

   void delete(String id, String pw);

   void updateCash(int cash, String id);

   void regiBasket(String obj, int gdnum);

   List<basketVO> getBasket(String id);

   void deleteBasketList(int gdnum, String id);

   void zzim_insert(String id, int gdnum);

   List<basketVO> zzim_list(String id);

   void zzimDelete(int gdnum, String id);

   void insertBuyList(int gdnum, String id, int price);

   List<buyListVO> buyList(String id);

   void buyListdelete(int gdnum, String id);

   List<refundVO> refundList(String id);

   int getrefundgdnum(int buynum, String id);

   List<buyListVO> buyList24(String id);

   void refundInsert(int buynum, String content, String id);

   memberVO getSex(String id);

   void mancount(int gdnum);

   void womancount(int gdnum);

   void totalAge(int age, int gdnum);

   void profit(int gdnum);

   void sellCharge(int gdnum);

   List<gameVO> subComp(String writer);

   void refundDelete(int num, String id);

   void sellInfo(Map<String, Object> map);

   void subCompInsert(int compnum, String id);

   List<favoriteStoreVO> favComp(String id, int compnum);

   void subCompDelete(int compnum, String id);

   List<favoriteStoreVO> favCompList(String id);

   List<favoriteStoreVO> favCompList2(String id);

   int gameCount(String id);

   int writercount(String id);

   int reviewcount(String id);

   int buyCharge();

   void admincashcharge(int cash);

   void seller(int cash, String writer);

   List<gameVO> compname(int gdnum);

}