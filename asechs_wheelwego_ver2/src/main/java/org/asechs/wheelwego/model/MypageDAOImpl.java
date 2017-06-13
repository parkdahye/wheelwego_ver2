package org.asechs.wheelwego.model;

import java.util.List;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.FileVO;
import org.asechs.wheelwego.model.vo.FoodVO;
import org.asechs.wheelwego.model.vo.PagingBean;
import org.asechs.wheelwego.model.vo.ReviewVO;
import org.asechs.wheelwego.model.vo.TruckVO;
import org.asechs.wheelwego.model.vo.WishlistVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<WishlistVO> heartWishList(String id){
		return sqlSessionTemplate.selectList("mypage.heartWishList", id);
	}
	@Override
	public List<TruckVO> myWishList(String id) {
		return sqlSessionTemplate.selectList("mypage.myWishList", id);
	}

	@Override
	public void deleteWishList(WishlistVO wishlistVO) {
		sqlSessionTemplate.delete("mypage.deleteWishList", wishlistVO);
	}

	public void registerFoodtruck(TruckVO tvo) {
		sqlSessionTemplate.insert("mypage.registerFoodtruck", tvo);
	}

	@Override
	public TruckVO findtruckInfoByTruckNumber(String truckNumber) {
		return sqlSessionTemplate.selectOne("mypage.findtruckInfoByTruckNumber", truckNumber);
	}

	@Override
	public void saveFilePath(FileVO fileVO) {
		sqlSessionTemplate.insert("mypage.saveFilePath", fileVO);
	}

	@Override
	public void updateMyfoodtruck(TruckVO truckVO) {
		sqlSessionTemplate.update("mypage.updateMyfoodtruck", truckVO);
	}

	@Override
	public void updateFilePath(FileVO fileVO) {
		sqlSessionTemplate.update("mypage.updateFilePath", fileVO);
	}

	@Override
	public String findtruckNumberBySellerId(String sellerId) {
		return sqlSessionTemplate.selectOne("mypage.findtruckNumberBySellerId", sellerId);
	}

	@Override
	public List<FoodVO> showMenuList(String truckNumber) {
		return sqlSessionTemplate.selectList("mypage.showMenuList", truckNumber);
	}

	@Override
	public void deleteAllMenu(String truckNumber) {
		sqlSessionTemplate.delete("mypage.deleteAllMenu", truckNumber);
	}

	@Override
	public void registerMenu(FoodVO foodVO) {
		sqlSessionTemplate.insert("mypage.registerMenu", foodVO);
	}

	@Override
	public void deleteMenu(String menuId) {
		sqlSessionTemplate.delete("mypage.deleteMenu", menuId);
	}

	@Override
	public void updateMenu(FoodVO foodVO) {
		sqlSessionTemplate.update("mypage.updateMenu", foodVO);
	}

	@Override
	public FoodVO findMenuByMenuId(String menuId) {
		return sqlSessionTemplate.selectOne("mypage.findMenuByMenuId", menuId);
	}

	@Override
	public void updateMenuFilepath(FileVO fileVO) {
		sqlSessionTemplate.update("mypage.updateMenuFilepath", fileVO);

	}

	@Override
	public void deleteMyTruck(String foodtruckNumber) {
		sqlSessionTemplate.delete("mypage.deleteMyTruck", foodtruckNumber);
	}

	@Override
	public List<ReviewVO> showMyReviewList(PagingBean pagingBean) {
		return sqlSessionTemplate.selectList("mypage.showMyReview", pagingBean);
	}

	@Override
	public void updateMyReview(ReviewVO reviewVO) {
		sqlSessionTemplate.update("mypage.updateMyReview", reviewVO);
	}

	@Override
	public void deleteMyReview(String reviewNo) {
		sqlSessionTemplate.delete("mypage.deleteMyReview", reviewNo);
	}

	@Override
	public ReviewVO findReviewInfoByReviewNo(String reviewNo) {
		return sqlSessionTemplate.selectOne("mypage.findReviewInfoByReviewNo", reviewNo);
	}

	@Override
	public TruckVO getGPSInfo(String sellerId) {
		System.out.println(sellerId);
		return sqlSessionTemplate.selectOne("mypage.getGPSInfo", sellerId);
	}

	@Override
	public void stayFoodtruck(TruckVO gpsInfo) {
		System.out.println("stay 실행 " + gpsInfo);
		sqlSessionTemplate.update("mypage.stayFoodtruck", gpsInfo);
	}

	@Override
	public void leaveFoodtruck(TruckVO gpsInfo) {
		System.out.println("leave 실행 " + gpsInfo);
		sqlSessionTemplate.update("mypage.leaveFoodtruck", gpsInfo);
	}

	@Override
	public int getWishListTotalContentCount(String id) {
		return sqlSessionTemplate.selectOne("mypage.getWishListTotalContentCount", id);
	}

	@Override
	public List<TruckVO> getWishList(PagingBean pagingBean) {
		System.out.println("dao: "+sqlSessionTemplate.selectList("mypage.getWishList", pagingBean));
		return sqlSessionTemplate.selectList("mypage.getWishList", pagingBean);
	}
	@Override
	public int getTotalReviewCount(String customerId) {
		return sqlSessionTemplate.selectOne("mypage.getTotalReviewCount", customerId);
	}
	
	@Override
	public int getWishListFlag(WishlistVO wishlistVO) {
		return sqlSessionTemplate.selectOne("mypage.getWishListFlag", wishlistVO);
	}
}
