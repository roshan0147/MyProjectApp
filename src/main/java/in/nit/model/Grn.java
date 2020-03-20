package in.nit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="grntab")
public class Grn {
	@Id
	@GeneratedValue(generator = "grnid")
	@GenericGenerator(name = "grnid",strategy = "increment")
	private Integer id;
	private String grnCode;
	private String grnType;
	private String grnOrderCode;
	private String note;
	public Grn() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGrnCode() {
		return grnCode;
	}
	public void setGrnCode(String grnCode) {
		this.grnCode = grnCode;
	}
	public String getGrnType() {
		return grnType;
	}
	public void setGrnType(String grnType) {
		this.grnType = grnType;
	}
	public String getGrnOrderCode() {
		return grnOrderCode;
	}
	public void setGrnOrderCode(String grnOrderCode) {
		this.grnOrderCode = grnOrderCode;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@Override
	public String toString() {
		return "Grn [id=" + id + ", grnCode=" + grnCode + ", grnType=" + grnType + ", grnOrderCode=" + grnOrderCode
				+ ", note=" + note + "]";
	}

	
}
