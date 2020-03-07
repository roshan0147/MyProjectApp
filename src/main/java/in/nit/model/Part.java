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
@Table(name="parttab")
public final class Part {
	@Id
	@GeneratedValue(generator = "partId")
	@GenericGenerator(name="partId",strategy = "increment")
	@Column(name="pid")
	private Integer partId;
	
	private String partCode;
	private Double partLenght;
	private Double partWidth;
	private Double partHeight;
	private Double baseCost;
	private String baseCurrency;
	private String note;
	
	@ManyToOne
	@JoinColumn(name="uomIdFK")
	private Uom uomOb;

	public Part() {
		super();
	}
     
	public Part(Integer partId) {
		super();
		this.partId = partId;
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

	public Double getPartLenght() {
		return partLenght;
	}

	public void setPartLenght(Double partLenght) {
		this.partLenght = partLenght;
	}

	public Double getPartWidth() {
		return partWidth;
	}

	public void setPartWidth(Double partWidth) {
		this.partWidth = partWidth;
	}

	public Double getPartHeight() {
		return partHeight;
	}

	public void setPartHeight(Double partHeight) {
		this.partHeight = partHeight;
	}

	public Double getBaseCost() {
		return baseCost;
	}

	public void setBaseCost(Double baseCost) {
		this.baseCost = baseCost;
	}

	public String getBaseCurrency() {
		return baseCurrency;
	}

	public void setBaseCurrency(String baseCurrency) {
		this.baseCurrency = baseCurrency;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Uom getUomOb() {
		return uomOb;
	}

	public void setUomOb(Uom uomOb) {
		this.uomOb = uomOb;
	}

	@Override
	public String toString() {
		return "Part [partId=" + partId + ", partCode=" + partCode + ", partLenght=" + partLenght + ", partWidth="
				+ partWidth + ", partHeight=" + partHeight + ", baseCost=" + baseCost + ", baseCurrency=" + baseCurrency
				+ ", note=" + note + ", uomOb=" + uomOb + "]";
	}
    
	
	
}
