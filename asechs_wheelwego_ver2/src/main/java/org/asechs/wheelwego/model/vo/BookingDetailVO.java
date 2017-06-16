package org.asechs.wheelwego.model.vo;

public class BookingDetailVO {
	 private int bookingNumber;
	   private String menuId;
	   private String menuName;
	   private int menuPrice;
	   private int bookingQuantity;
	public BookingDetailVO() {
		super();
	}
	public BookingDetailVO(int bookingNumber, String menuId, String menuName, int menuPrice, int bookingQuantity) {
		super();
		this.bookingNumber = bookingNumber;
		this.menuId = menuId;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.bookingQuantity = bookingQuantity;
	}
	public int getBookingNumber() {
		return bookingNumber;
	}
	public void setBookingNumber(int bookingNumber) {
		this.bookingNumber = bookingNumber;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public int getBookingQuantity() {
		return bookingQuantity;
	}
	public void setBookingQuantity(int bookingQuantity) {
		this.bookingQuantity = bookingQuantity;
	}
	@Override
	public String toString() {
		return "BookingDetailVO [bookingNumber=" + bookingNumber + ", menuId=" + menuId + ", menuName=" + menuName
				+ ", menuPrice=" + menuPrice + ", bookingQuantity=" + bookingQuantity + "]";
	}
	
	   
	   
}
