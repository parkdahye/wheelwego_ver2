package org.asechs.wheelwego.model.vo;

import java.util.List;

public class BookingVO {
   private int bookingNumber;
   private String customerId;
   private String bookingDate;
   private String bookingState;
   private  List<BookingDetailVO> bookingDetail;
public BookingVO() {
	super();
}
public BookingVO(int bookingNumber, String customerId, String bookingDate, String bookingState,
		List<BookingDetailVO> bookingDetail) {
	super();
	this.bookingNumber = bookingNumber;
	this.customerId = customerId;
	this.bookingDate = bookingDate;
	this.bookingState = bookingState;
	this.bookingDetail = bookingDetail;
}
public int getBookingNumber() {
	return bookingNumber;
}
public void setBookingNumber(int bookingNumber) {
	this.bookingNumber = bookingNumber;
}
public String getCustomerId() {
	return customerId;
}
public void setCustomerId(String customerId) {
	this.customerId = customerId;
}
public String getBookingDate() {
	return bookingDate;
}
public void setBookingDate(String bookingDate) {
	this.bookingDate = bookingDate;
}
public String getBookingState() {
	return bookingState;
}
public void setBookingState(String bookingState) {
	this.bookingState = bookingState;
}
public List<BookingDetailVO> getBookingDetail() {
	return bookingDetail;
}
public void setBookingDetail(List<BookingDetailVO> bookingDetail) {
	this.bookingDetail = bookingDetail;
}
@Override
public String toString() {
	return "BookingVO [bookingNumber=" + bookingNumber + ", customerId=" + customerId + ", bookingDate=" + bookingDate
			+ ", bookingState=" + bookingState + ", bookingDetail=" + bookingDetail + "]";
}
   	

}

/*package org.asechs.wheelwego.model.vo;

import java.util.List;

public class BookingVO {
	private int bookingNumber;
	private String customerId;
	private String menuId;
	private int menuQuantity;
	private String bookingDate;
	private String bookingState;
	private int menuPrice;
	private String menuName;
	private List<BookingVO> bookingMenuList;
	public BookingVO() {
		super();
	}
	public BookingVO(int bookingNumber, String customerId, String menuId, int menuQuantity, String bookingDate,
			String bookingState, int menuPrice, String menuName, List<BookingVO> bookingMenuList) {
		super();
		this.bookingNumber = bookingNumber;
		this.customerId = customerId;
		this.menuId = menuId;
		this.menuQuantity = menuQuantity;
		this.bookingDate = bookingDate;
		this.bookingState = bookingState;
		this.menuPrice = menuPrice;
		this.menuName = menuName;
		this.bookingMenuList = bookingMenuList;
	}
	public int getBookingNumber() {
		return bookingNumber;
	}
	public void setBookingNumber(int bookingNumber) {
		this.bookingNumber = bookingNumber;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public int getMenuQuantity() {
		return menuQuantity;
	}
	public void setMenuQuantity(int menuQuantity) {
		this.menuQuantity = menuQuantity;
	}
	public String getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}
	public String getBookingState() {
		return bookingState;
	}
	public void setBookingState(String bookingState) {
		this.bookingState = bookingState;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public List<BookingVO> getBookingMenuList() {
		return bookingMenuList;
	}
	public void setBookingMenuList(List<BookingVO> bookingMenuList) {
		this.bookingMenuList = bookingMenuList;
	}
	@Override
	public String toString() {
		return "BookingVO [bookingNumber=" + bookingNumber + ", customerId=" + customerId + ", menuId=" + menuId
				+ ", menuQuantity=" + menuQuantity + ", bookingDate=" + bookingDate + ", bookingState=" + bookingState
				+ ", menuPrice=" + menuPrice + ", menuName=" + menuName + ", bookingMenuList=" + bookingMenuList + "]";
	}
	
	
}*/