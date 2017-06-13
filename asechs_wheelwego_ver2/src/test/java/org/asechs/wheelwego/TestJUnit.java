package org.asechs.wheelwego;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.BoardDAO;
import org.asechs.wheelwego.model.FoodTruckDAO;
import org.asechs.wheelwego.model.FoodTruckService;
import org.asechs.wheelwego.model.MemberService;
import org.asechs.wheelwego.model.MypageDAO;
import org.asechs.wheelwego.model.MypageService;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
public class TestJUnit {
   @Resource
   private MemberService service;
   @Resource
   private FoodTruckService foodtruckService;
   @Resource
   private BoardDAO boardDAO;
   @Resource
   private FoodTruckDAO foodTruckDAO;
   @Resource
   private MypageDAO mypageDAO;
   @Resource
   private MypageService mypageService;
   
   public void registerSeller(){
      String id;
      String _id = "seller";
      String password = "1234";
      String member_name;
      String _member_name = "판매자";
      String postcode = "13494";
      String address = "경기 성남시 분당구 삼평동 682";
      String addressdetail = "유스페이스2";
      String phonenumber = "01012345678";
      String member_type = "seller";
      String businessNumber = "1111111111";
      
      MemberVO memberVO;
      
      for (int i = 1; i <= 56; i++)
      {
         if (i >=1 && i <= 9)
         {
            id = String.format("%s", _id + 0 + i);
            member_name = String.format("%s", _member_name + 0 + i);
         }
         else
         {
            id = String.format("%s", _id + i);
            member_name = String.format("%s", _member_name + i);            
         }
         memberVO = new MemberVO(id, password, member_name, postcode, address, addressdetail, phonenumber, member_type);
         service.registerMember(memberVO, businessNumber);
      }   
   }
   
   public void registerCustomer(){
      String id;
      String _id = "customer";
      String password = "1234";
      String member_name;
      String _member_name = "일반회원";
      String postcode = "13494";
      String address = "경기 성남시 분당구 삼평동 682";
      String addressdetail = "유스페이스2";
      String phonenumber = "01012345678";
      String member_type = "customer";
      String businessNumber = null;
      
      MemberVO memberVO;
      
      for (int i = 1; i <= 50; i++)
      {
         if (i >=1 && i <= 9)
         {
            id = String.format("%s", _id + 0 + i);
            member_name = String.format("%s", _member_name + 0 + i);
         }
         else
         {
            id = String.format("%s", _id + i);
            member_name = String.format("%s", _member_name + i);            
         }
         memberVO = new MemberVO(id, password, member_name, postcode, address, addressdetail, phonenumber, member_type);
         service.registerMember(memberVO, businessNumber);
      }   
   }
   
   @Test
   public void test(){
      registerCustomer();
   }
}