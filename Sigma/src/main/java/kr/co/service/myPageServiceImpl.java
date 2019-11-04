package kr.co.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.basketVO;
import kr.co.domain.buyListVO;
import kr.co.domain.favoriteStoreVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;
import kr.co.persistence.myPageDAO;

@Service
@Transactional
public class myPageServiceImpl implements myPageService{
   @Inject
   private myPageDAO mpdao;

   @Override
   public memberVO getMemberVO(String userId) {
      
      return mpdao.getMemberVO(userId);
      
   }

   @Override
   public memberVO updateUI(String id) {
      return mpdao.updateUI(id);
   }

   @Override
   public void update(memberVO vo) {
      mpdao.update(vo);
      
   }

   @Override
   public void delete(String id, String pw) {
      mpdao.delete(id, pw);
      
   }

   @Override
   public void updateCash(int cash, String id) {
      mpdao.updateCash(cash, id);
      
   }

   @Override
   public void regiBasket(String obj, int gdnum) {
      mpdao.regiBasket(obj, gdnum);
      
   }

   @Override
   public List<basketVO> getBasket(String id) {
      return mpdao.getBasket(id);
   }

   @Override
   public void deleteBasketList(int gdnum, String id) {
      mpdao.deleteBasketList(gdnum, id);
      
   }

   @Override
   public void zzim_insert(String id, int gdnum) {
      mpdao.zzim_insert(id,gdnum);
      
   }

   @Override
   public List<basketVO> zzim_list(String id) {
      return mpdao.zzim_list(id);
   }

   @Override
   public void zzimDelete(int gdnum, String id) {
      mpdao.zzimDelete(gdnum,id);
      
   }

   @Override
   public void insertBuyList(int gdnum, String id, int price) {
      mpdao.insertBuyList(gdnum, id, price);
   }

   @Override
   public List<buyListVO> buyList(String id) {
      return mpdao.buyList(id);
   }

   @Override
   public void buyListdelete(int gdnum, String id) {
      mpdao.buyListdelete(gdnum, id);
      
   }

   @Override
   public List<refundVO> refundList(String id) {
      return mpdao.refundList(id);
   }

   @Override
   public int getrefundgdnum(int buynum, String id) {
      
      return mpdao.getrefundgdnum(buynum,id);
   }

   @Override
   public List<buyListVO> buyList24(String id) {
      return mpdao.buyList24(id);
   }

   @Override
   public void refundInsert(int buynum, String content, String id) {
      mpdao.refundInsert(buynum, content,id);
      
   }

   @Override
   public memberVO getSex(String id) {
      
      return mpdao.getSex(id);
      
   }

   @Override
   public void mancount(int gdnum) {
      mpdao.mancount(gdnum);
   }

   @Override
   public void womancount(int gdnum) {
      mpdao.womancount(gdnum);
   }

   @Override
   public void totalAge(int age, int gdnum) {
      mpdao.totalAge(age, gdnum);
      
   }

   @Override
   public void profit(int gdnum) {
      mpdao.profit(gdnum);
      
   }

   @Override
   public void sellCharge(int gdnum) {
      mpdao.sellCharge(gdnum);
      
   }

   @Override
   public List<gameVO> subComp(String writer) {
      return mpdao.subComp(writer);
      
   }

   @Override
   public void refundDelete(int num, String id) {
      mpdao.refundDelete(num, id);
      
   }

   @Override
   public void sellInfo(Map<String, Object> map) {
      mpdao.sellInfo(map);
      
   }

   @Override
   public void subCompInsert(String writer, String id) {
      List<gameVO> list = mpdao.subComp(writer);
      int compnum = list.get(0).getCompnum();
      mpdao.subCompInsert(compnum, id);
      
   }

   @Override
   public List<favoriteStoreVO> favComp(String id, String writer) {
      List<gameVO> list = mpdao.subComp(writer);
      int compnum = list.get(0).getCompnum();
      return mpdao.favComp(id,compnum);
   }

   @Override
   public void subCompDelete(String writer, String id) {
      List<gameVO> list = mpdao.subComp(writer);
      int compnum = list.get(0).getCompnum();
      mpdao.subCompDelete(compnum, id);
      
   }

   @Override
   public List<favoriteStoreVO> favCompList(String id) {
      return mpdao.favCompList(id);
   }

   @Override
   public List<favoriteStoreVO> favCompList2(String id) {
      // TODO Auto-generated method stub
      return mpdao.favCompList2(id);
   }

   @Override
   public int gameCount(String id) {
      // TODO Auto-generated method stub
      return mpdao.gameCount(id);
   }

   @Override
   public int writercount(String id) {
      // TODO Auto-generated method stub
      return mpdao.writercount(id);
   }

   @Override
   public int reviewcount(String id) {
      // TODO Auto-generated method stub
      return mpdao.reviewcount(id);
   }

   @Override
   public void alldelete(String id) {
      
   }

   @Override
   public void admin(int gameprice) {
      int buyCharge = mpdao.buyCharge();
      int cash = gameprice - (gameprice * (100-buyCharge)/100);
      mpdao.admincashcharge(cash);
      
   }

   @Override
   public void seller(int gameprice, int gdnum) {
      List<gameVO> list = mpdao.compname(gdnum);
      String writer = list.get(0).getWriter();
      int buyCharge = mpdao.buyCharge();
      int cash = gameprice * (100-buyCharge)/100;
      mpdao.seller(cash, writer);
   }

}