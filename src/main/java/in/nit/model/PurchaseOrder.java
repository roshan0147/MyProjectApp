package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="potab")
public class PurchaseOrder {
	
	@Id
	@GeneratedValue(generator = "poid")
	@GenericGenerator(name="poid",strategy = "increment")
	@Column(name="poid")
	private Integer poId;
	@Column(name="ocode")
	private String orderCode;
	@Column(name="refnumber")
	private String referenceNumber;
	@Column(name="qcheck")
	private String qualityCheck;
	@Column(name="dstatus")
	private String defaultStatus;
	@Column(name="pdesc")
	private String description;
	
	@ManyToOne
	@JoinColumn(name="shipIdFK")
	private ShipmentType shipOb;
	
	@ManyToOne
	@JoinColumn(name="whIdFk")
	private WhUserType whOb;
	
	public PurchaseOrder() {
		super();
	}
	public Integer getPoId() {
		return poId;
	}
	public void setPoId(Integer poId) {
		this.poId = poId;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getReferenceNumber() {
		return referenceNumber;
	}
	public void setReferenceNumber(String referenceNumber) {
		this.referenceNumber = referenceNumber;
	}
	public String getQualityCheck() {
		return qualityCheck;
	}
	public void setQualityCheck(String qualityCheck) {
		this.qualityCheck = qualityCheck;
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
	public ShipmentType getShipOb() {
		return shipOb;
	}
	public void setShipOb(ShipmentType shipOb) {
		this.shipOb = shipOb;
	}
	public WhUserType getWhOb() {
		return whOb;
	}
	public void setWhOb(WhUserType whOb) {
		this.whOb = whOb;
	}
	@Override
	public String toString() {
		return "PurchaseOrder [poId=" + poId + ", orderCode=" + orderCode + ", referenceNumber=" + referenceNumber
				+ ", qualityCheck=" + qualityCheck + ", defaultStatus=" + defaultStatus + ", description=" + description
				+ ", shipOb=" + shipOb + ", whOb=" + whOb + "]";
	}
	
}
