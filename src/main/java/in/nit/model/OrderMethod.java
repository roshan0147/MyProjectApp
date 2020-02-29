package in.nit.model;

import java.util.List;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OrderColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="omtab")
public class OrderMethod {
	@Id
	@GeneratedValue(generator = "omidgen")
	@GenericGenerator(name = "omidgen",strategy = "increment")
	@Column(name="omid")
	private Integer orderId;
	@Column(name="ommode",length = 10)
	private String orderMode;
	@Column(name="omcode",length = 10)
	private String orderCode;
	@Column(name="omtype",length = 15)
	private String orderType;
	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name="orderaccept",joinColumns = @JoinColumn(name="omid"))
	@OrderColumn(name="pos")
	@Column(name="omaccept",length = 30)
	private List<String> orderAccept;
	@Column(name="omdesc",length = 15)
	private String orderDesc;
	public OrderMethod() {
		super();
	}
	public OrderMethod(Integer orderId) {
		super();
		this.orderId = orderId;
	}

	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderMode() {
		return orderMode;
	}
	public void setOrderMode(String orderMode) {
		this.orderMode = orderMode;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public List<String> getOrderAccept() {
		return orderAccept;
	}
	public void setOrderAccept(List<String> orderAccept) {
		this.orderAccept = orderAccept;
	}
	public String getOrderDesc() {
		return orderDesc;
	}
	public void setOrderDesc(String orderDesc) {
		this.orderDesc = orderDesc;
	}
	@Override
	public String toString() {
		return "OrderMethod [ordeId=" + orderId + ", orderMode=" + orderMode + ", orderCode=" + orderCode
				+ ", orderType=" + orderType + ", orderAccept=" + orderAccept + ", orderDesc=" + orderDesc + "]";
	}
	
	

}
