package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="parttab")
public class Part {
	@Id
	@GeneratedValue(generator = "partId")
	@GenericGenerator(name="partId",strategy = "increment")
	@Column(name="pid")
	private Integer partId;
	@Column(name="pcode")
	private String partCode;
	@Column(name="pwidth")
	private String partWidth;
	@Column(name="plenght")
	private String partLenght;
	@Column(name="pheight")
	private String partHeight;
	@Column(name="pcost")
	private Double partBaseCost;
	@Column(name="pcurrency")
	private String partBaseCurrency;
	@Column(name="pdesc")
	private String partDesc;
	public Part() {
		super();
	}
	public Integer getPartId() {
		return partId;
	}
	public void setPartId(Integer partId) {
		this.partId = partId;
	}
	public String getPartCode() {
		return partCode;
	}
	public void setPartCode(String partCode) {
		this.partCode = partCode;
	}
	public String getPartWidth() {
		return partWidth;
	}
	public void setPartWidth(String partWidth) {
		this.partWidth = partWidth;
	}
	public String getPartLenght() {
		return partLenght;
	}
	public void setPartLenght(String partLenght) {
		this.partLenght = partLenght;
	}
	public String getPartHeight() {
		return partHeight;
	}
	public void setPartHeight(String partHeight) {
		this.partHeight = partHeight;
	}
	public Double getPartBaseCost() {
		return partBaseCost;
	}
	public void setPartBaseCost(Double partBaseCost) {
		this.partBaseCost = partBaseCost;
	}
	public String getPartBaseCurrency() {
		return partBaseCurrency;
	}
	public void setPartBaseCurrency(String partBaseCurrency) {
		this.partBaseCurrency = partBaseCurrency;
	}
	public String getPartDesc() {
		return partDesc;
	}
	public void setPartDesc(String partDesc) {
		this.partDesc = partDesc;
	}
	@Override
	public String toString() {
		return "Part [partId=" + partId + ", partCode=" + partCode + ", partWidth=" + partWidth + ", partLenght="
				+ partLenght + ", partHeight=" + partHeight + ", partBaseCost=" + partBaseCost + ", partBaseCurrency="
				+ partBaseCurrency + ", partDesc=" + partDesc + "]";
	}

	
}
