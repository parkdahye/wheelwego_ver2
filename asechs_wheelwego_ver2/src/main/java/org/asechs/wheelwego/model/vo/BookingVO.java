package org.asechs.wheelwego.model.vo;

public class BookingVO {
	public int bookingNumber;
	public String customerId;
	public String menuId;
	public int bookingQuantity;
	public String bookingDate;
	public String bookingState;
	
	public BookingVO() {
		super();
	}
	
	public BookingVO(int bookingNumber, String customerId, String menuId, int bookingQuantity, String bookingDate,
			String bookingState) {
		super();
		this.bookingNumber = bookingNumber;
		this.customerId = customerId;
		this.menuId = menuId;
		this.bookingQuantity = bookingQuantity;
		this.bookingDate = bookingDate;
		this.bookingState = bookingState;
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
	public int getBookingQuantity() {
		return bookingQuantity;
	}
	public void setBookingQuantity(int bookingQuantity) {
		this.bookingQuantity = bookingQuantity;
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

	@Override
	public String toString() {
		return "BookingVO [bookingNumber=" + bookingNumber + ", customerId=" + customerId + ", menuId=" + menuId
				+ ", bookingQuantity=" + bookingQuantity + ", bookingDate=" + bookingDate + ", bookingState="
				+ bookingState + "]";
	}
	
}
