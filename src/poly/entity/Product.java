package poly.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Products")
public class Product {
	@Id
	private String id;
	private String name;
	private float price;
	private float oldPrice;
	private String photo;
	private int amount;
	@ManyToOne
	@JoinColumn(name="roomId")
	private Room Room;
	
	@ManyToOne
	@JoinColumn(name="producerId")
	private Producer Producer;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String id, String name, float price, float oldPrice, String photo, int amount,poly.entity.Room room,
			poly.entity.Producer producer) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.oldPrice = oldPrice;
		this.photo = photo;
		this.amount = amount;
		Room = room;
		Producer = producer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(float oldPrice) {
		this.oldPrice = oldPrice;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public Room getRoom() {
		return Room;
	}

	public void setRoom(Room room) {
		Room = room;
	}

	public Producer getProducer() {
		return Producer;
	}

	public void setProducer(Producer producer) {
		Producer = producer;
	}
}
