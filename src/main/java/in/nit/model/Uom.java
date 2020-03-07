package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="uomtab")
public final class Uom {
	@Id
	@GeneratedValue(generator = "uomid")
	@GenericGenerator(name = "uomid",strategy = "increment")
	private Integer uomId;
	@Column(name="utype",length = 15)
	private String uomType;
	@Column(name="umodel",length = 15)
	private String uomModel;
	@Column(name="udesc",length = 15)
	private String uomDesc;
	public Uom() {
		super();
	}
	
	public Uom(Integer uomId) {
		super();
		this.uomId = uomId;
	}

	public Integer getUomId() {
		return uomId;
	}
	public void setUomId(Integer uomId) {
		this.uomId = uomId;
	}
	public String getUomType() {
		return uomType;
	}
	public void setUomType(String uomType) {
		this.uomType = uomType;
	}
	public String getUomModel() {
		return uomModel;
	}
	public void setUomModel(String uomModel) {
		this.uomModel = uomModel;
	}
	public String getUomDesc() {
		return uomDesc;
	}
	public void setUomDesc(String uomDesc) {
		this.uomDesc = uomDesc;
	}
	@Override
	public String toString() {
		return "Uom [uomId=" + uomId + ", uomType=" + uomType + ", uomModel=" + uomModel + ", uomDescription="
				+ uomDesc + "]";
	}
	
	

}
