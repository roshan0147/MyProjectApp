package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="saletab")
public class SaleOrder {
	@Id
	@GeneratedValue(generator = "saleid")
	@GenericGenerator(name="saleid",strategy = "increment")
	@Column(name="soid")
	private Integer soId;
	@Column(name="scode")
	private String orderCode;
	@Column(name="shipcode")
	private String shipmentCode;
	@Column(name="scust")
	private String customer;
	@Column(name="srenumber")
	private String refNumber;
	@Column(name="smode")
	private String stockMode;
	@Column(name="ssource")
	private String stockSource;
	@Column(name="sstatus")
	private String defaultStatus;
	@Column(name="sdesc")
	private String description;
	public SaleOrder() {
		super();
	}
	public Integer getSoId() {
		return soId;
	}
	public void setSoId(Integer soId) {
		this.soId = soId;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getShipmentCode() {
		return shipmentCode;
	}
	public void setShipmentCode(String shipmentCode) {
		this.shipmentCode = shipmentCode;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getRefNumber() {
		return refNumber;
	}
	public void setRefNumber(String refNumber) {
		this.refNumber = refNumber;
	}
	public String getStockMode() {
		return stockMode;
	}
	public void setStockMode(String stockMode) {
		this.stockMode = stockMode;
	}
	public String getStockSource() {
		return stockSource;
	}
	public void setStockSource(String stockSource) {
		this.stockSource = stockSource;
	}
	public String getDefaultStatus() {
		return defaultStatus;
	}
	public void setDefaultStatus(String defaultStatus) {
		this.defaultStatus = defaultStatus;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "SaleOrder [soId=" + soId + ", orderCode=" + orderCode + ", shipmentCode=" + shipmentCode + ", customer="
				+ customer + ", refNumber=" + refNumber + ", stockMode=" + stockMode + ", stockSource=" + stockSource
				+ ", defaultStatus=" + defaultStatus + ", description=" + description + "]";
	}
	
	

}
