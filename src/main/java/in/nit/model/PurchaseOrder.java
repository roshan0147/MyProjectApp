package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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
	private String OrderCode;
	@Column(name="scode")
	private String shipmentCode;
	@Column(name="vendor")
	private String vendor;
	@Column(name="refnumber")
	private String referenceNumber;
	@Column(name="qcheck")
	private String qualityCheck;
	@Column(name="dstatus")
	private String defaultStatus;
	@Column(name="pdesc")
	private String description;
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
		return OrderCode;
	}
	public void setOrderCode(String orderCode) {
		OrderCode = orderCode;
	}
	public String getShipmentCode() {
		return shipmentCode;
	}
	public void setShipmentCode(String shipmentCode) {
		this.shipmentCode = shipmentCode;
	}
	public String getVendor() {
		return vendor;
	}
	public void setVendor(String vendor) {
		this.vendor = vendor;
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
	@Override
	public String toString() {
		return "PurchaseOrder [poId=" + poId + ", OrderCode=" + OrderCode + ", shipmentCode=" + shipmentCode
				+ ", vendor=" + vendor + ", referenceNumber=" + referenceNumber + ", qualityCheck=" + qualityCheck
				+ ", defaultStatus=" + defaultStatus + ", description=" + description + "]";
	}
	
	
	

}
