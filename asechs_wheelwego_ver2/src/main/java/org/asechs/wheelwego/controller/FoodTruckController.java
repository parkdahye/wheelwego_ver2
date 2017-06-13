package org.asechs.wheelwego.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asechs.wheelwego.model.FoodTruckService;
import org.asechs.wheelwego.model.MypageService;
import org.asechs.wheelwego.model.vo.ListVO;
import org.asechs.wheelwego.model.vo.MemberVO;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.asechs.wheelwego.model.vo.WishlistVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodTruckController {
	@Resource
	private FoodTruckService foodTruckService;
	@Resource
	private MypageService mypageService; 

	/* 현지 검색결과 테스트 */
	@RequestMapping("searchFoodTruckList.do")
	public ModelAndView searchFoodTruckList(String searchFoodtruckName){
		List<TruckVO> searchList = foodTruckService.searchFoodTruckList(searchFoodtruckName);
		return new ModelAndView("foodtruck/foodtruck_location_select_list.tiles", "pagingList", searchList);
	}
	
	
	/* 검색 결과 푸드트럭 리스트 */
	@RequestMapping("searchFoodTruckByName.do")

	public ModelAndView searchFoodTruckByName(String name, String pageNo, String latitude, String longitude,HttpServletRequest request,String option) {
		if(option==null)
			option="ByDate";

		ModelAndView modelAndView = new ModelAndView("foodtruck/foodtruck_location_select_list.tiles");		
		ListVO listVO =foodTruckService.filtering(option, name, pageNo, latitude, longitude,null);
		//ListVO listVO = foodTruckService.getFoodTruckListByName(pageNo, name);	
		modelAndView.addObject("pagingList", listVO);
		modelAndView.addObject("name", name);
		HttpSession session=request.getSession(false);
		String id=null;
		List<WishlistVO> heartWishList=null;
		if(session != null){
			MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
			if(memberVO != null){
				id = memberVO.getId();
				heartWishList = mypageService.heartWishList(id);
				modelAndView.addObject("heartWishlist",heartWishList);
				System.out.println(heartWishList);
			}
		}
		//System.out.println(name);
		//System.out.println(listVO);
		modelAndView.addObject("option", option);		
		modelAndView.addObject("flag", "false");	
		return modelAndView;
	}
	/**
	 * 황윤상 GPS 기반 푸드트럭수동검색
	 * @param name
	 * @return
	 */
	@RequestMapping("searchFoodTruckByGPS.do")
	public ModelAndView searchFoodTruckByGPS(String latitude, String longitude, String pageNo,String option,HttpServletRequest request) {
		if(option==null)
			option="ByDate";
		TruckVO gpsInfo = new TruckVO();
		
		gpsInfo.setLatitude(Double.parseDouble(latitude));
		gpsInfo.setLongitude(Double.parseDouble(longitude));
		
		ModelAndView modelAndView = new ModelAndView("foodtruck/foodtruck_location_select_list.tiles");
		//ListVO listVO1 = foodTruckService.getFoodTruckListByGPS(pageNo, gpsInfo);
		//System.out.println(listVO1);
		ListVO listVO =foodTruckService.filtering(option,null, pageNo, latitude, longitude,gpsInfo);
		HttpSession session=request.getSession(false);
		String id=null;
		List<WishlistVO> heartWishList=null;
		if(session != null){
			MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
			if(memberVO != null){
				id = memberVO.getId();
				heartWishList = mypageService.heartWishList(id);
				modelAndView.addObject("heartWishlist",heartWishList);
			}
		}
		modelAndView.addObject("pagingList", listVO);
		modelAndView.addObject("gpsInfo", gpsInfo);
		modelAndView.addObject("option", option);	
		modelAndView.addObject("flag", "true");	
		return modelAndView;
	}
	/**
	 * 정현지 푸드트럭 상세보기
	 * @param foodtruck_number
	 * @return TruckVO
	 */
	@RequestMapping("foodtruck/foodTruckAndMenuDetail.do")
	
	public ModelAndView foodTruckAndMenuDetail(String foodtruckNo,String reviewPageNo,HttpServletRequest request){
		System.out.println(foodtruckNo);
		
		TruckVO truckDetail = foodTruckService.foodTruckAndMenuDetail(foodtruckNo);
		ModelAndView mv= new ModelAndView();
		mv.setViewName("foodtruck/foodtruck_detail.tiles");
		HttpSession session=request.getSession(false);
		String id=null;
		List<WishlistVO> heartWishList=null;
		if(session != null){
			MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
			if(memberVO != null){
				id = memberVO.getId();
				int wishlistFlag=mypageService.getWishListFlag(id, foodtruckNo);
				mv.addObject("wishlistFlag",wishlistFlag);
			}
		}
		System.out.println(heartWishList);
		mv.addObject("truckDetailInfo", truckDetail);
		ListVO reviewList = foodTruckService.getReviewListByTruckNumber(reviewPageNo, foodtruckNo);
		mv.addObject("reviewlist", reviewList);
		//mv.addObject("avgGrade",foodTruckService.getAvgGradeByTruckNumber(foodtruckNo));
		return mv;
	}
	@RequestMapping(value = "afterLogin_foodtruck/registerReview.do", method = RequestMethod.POST)
	@ResponseBody
	public String registerReview(ReviewVO reviewVO){
		System.out.println(reviewVO);
		foodTruckService.registerReview(reviewVO); // 푸드 트럭 등록
		return "foodtruck/foodtruck_detail.tiles";
	}

	@RequestMapping(value = "afterLogin_foodtruck/registerBookMark.do", method = RequestMethod.POST)
	@ResponseBody
	public String registerBookMark(String id, String foodtruckNumber){
		String result = null;

		WishlistVO wishlistVO = new WishlistVO(foodtruckNumber, id);
		int count = foodTruckService.getBookMarkCount(wishlistVO);

		if(count != 0){
			result = "off";
			mypageService.deleteWishList(wishlistVO);
		}else{
			foodTruckService.registerBookMark(wishlistVO);
			result = "on";
		}
		return result;
}

	@RequestMapping("afterLogin_foodtruck/getBookMarkCount.do")
	@ResponseBody
	public String getBookMarkCount(WishlistVO wishlistVO){
		String result = null;
		int count = foodTruckService.getBookMarkCount(wishlistVO);
		if(count != 0){
			result = "off";			
		}else{
			result = "on";
		}
		System.out.println(result);
		return result;
	
	}
	
	
}
