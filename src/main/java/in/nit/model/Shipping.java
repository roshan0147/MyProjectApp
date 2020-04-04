package in.nit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="shippingtab")
public class Shipping {
	
	@Id
	@GeneratedValue(generator = "shippingid")
	@GenericGenerator(name = "shippingid",strategy = "increment")
	private Integer shippingId;
	private String shippingCode;
	private String shipRefNum;
	private String courierRefNum;
	private String contactDetail;
	private String saleOrderCode;
	private String note;
	private String billToAddress;
	private String shipToAddress;
	public Shipping() {
		super();
	}
	public Integer getShippingId() {
		return shippingId;
	}
	public void setShippingId(Integer shippingId) {
		this.shippingId = shippingId;
	}
	public String getShippingCode() {
		return shippingCode;
	}
	public void setShippingCode(String shippingCode) {
		this.shippingCode = shippingCode;
	}
	public String getShipRefNum() {
		return shipRefNum;
	}
	public void setShipRefNum(String shipRefNum) {
		this.shipRefNum = shipRefNum;
	}
	public String getCourierRefNum() {
		return courierRefNum;
	}
	public void setCourierRefNum(String courierRefNum) {
		this.courierRefNum = courierRefNum;
	}
	public String getContactDetail() {
		return contactDetail;
	}
	public void setContactDetail(String contactDetail) {
		this.contactDetail = contactDetail;
	}
	public String getSaleOrderCode() {
		return saleOrderCode;
	}
	public void setSaleOrderCode(String saleOrderCode) {
		this.saleOrderCode = saleOrderCode;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getBillToAddress() {
		return billToAddress;
	}
	public void setBillToAddress(String billToAddress) {
		this.billToAddress = billToAddress;
	}
	public String getShipToAddress() {
		return shipToAddress;
	}
	public void setShipToAddress(String shipToAddress) {
		this.shipToAddress = shipToAddress;
	}
	@Override
	public String toString() {
		return "Shipping [shippingId=" + shippingId + ", shippingCode=" + shippingCode + ", shipRefNum=" + shipRefNum
				+ ", courierRefNum=" + courierRefNum + ", contactDetail=" + contactDetail + ", saleOrderCode="
				+ saleOrderCode + ", note=" + note + ", billToAddress=" + billToAddress + ", shipToAddress="
				+ shipToAddress + "]";
	}
	

}
