package dto;

import java.util.Date;

public class CelebRecommendedBooks {
	private int celeb_rec_book_id;
	private int celeb_rec_id;
	private int book_id;
	private int order_in_rec;
	public int getCeleb_rec_book_id() {
		return celeb_rec_book_id;
	}
	public void setCeleb_rec_book_id(int celeb_rec_book_id) {
		this.celeb_rec_book_id = celeb_rec_book_id;
	}
	public int getCeleb_rec_id() {
		return celeb_rec_id;
	}
	public void setCeleb_rec_id(int celeb_rec_id) {
		this.celeb_rec_id = celeb_rec_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getOrder_in_rec() {
		return order_in_rec;
	}
	public void setOrder_in_rec(int order_in_rec) {
		this.order_in_rec = order_in_rec;
	}
	public CelebRecommendedBooks(int celeb_rec_book_id, int celeb_rec_id, int book_id, int order_in_rec) {
		super();
		this.celeb_rec_book_id = celeb_rec_book_id;
		this.celeb_rec_id = celeb_rec_id;
		this.book_id = book_id;
		this.order_in_rec = order_in_rec;
	}
	public CelebRecommendedBooks() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CelebRecommendedBooks [celeb_rec_book_id=" + celeb_rec_book_id + ", celeb_rec_id=" + celeb_rec_id
				+ ", book_id=" + book_id + ", order_in_rec=" + order_in_rec + "]";
	}
	
	
}
