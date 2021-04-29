package poly.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Orders")
public class Order {
	@Id
	private int id;
	private int amount;
	private int bought;
	@ManyToOne
	@JoinColumn(name="userId")
	private User User;
	
	@ManyToOne
	@JoinColumn(name="productId")
	private Product Product;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int id,int bought, int amount, poly.entity.User user, poly.entity.Product product) {
		super();
		this.id = id;
		this.amount = amount;
		this.bought = bought;
		User = user;
		Product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public int getBought() {
		return id;
	}

	public void setBought(int bought) {
		this.bought = bought;
	}
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public User getUser() {
		return User;
	}

	public void setUser(User user) {
		User = user;
	}

	public Product getProduct() {
		return Product;
	}

	public void setProduct(Product product) {
		Product = product;
	}
}
