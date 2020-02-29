package in.nit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="usertab")
public class WhUserType {
	@Id
	@GeneratedValue(generator = "whid")
	@GenericGenerator(name = "whid",strategy = "increment")
	private Integer userId;
	@Column(name="whtype",length = 15)
	private String userType;
	@Column(name="whcode",length = 15)
	private String userCode;
	@Column(name="whfor",length = 15)
	private String userFor;
	@Column(name="whmail",length = 25)
	private String userMail;
	@Column(name="whcon",length = 15)
	private String userContact;
	@Column(name="whidtype",length = 15)
	private String userIdType;
	@Column(name="whidnum",length = 15)
	private String userIdNumber;
	public WhUserType() {
		super();
	}
	public WhUserType(Integer userId) {
		super();
		this.userId = userId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getUserFor() {
		return userFor;
	}
	public void setUserFor(String userFor) {
		this.userFor = userFor;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserContact() {
		return userContact;
	}
	public void setUserContact(String userContact) {
		this.userContact = userContact;
	}
	public String getUserIdType() {
		return userIdType;
	}
	public void setUserIdType(String userIdType) {
		this.userIdType = userIdType;
	}
	public String getUserIdNumber() {
		return userIdNumber;
	}
	public void setUserIdNumber(String userIdNumber) {
		this.userIdNumber = userIdNumber;
	}
	@Override
	public String toString() {
		return "WhUserType [userId=" + userId + ", userType=" + userType + ", userCode=" + userCode + ", userFor="
				+ userFor + ", userMail=" + userMail + ", userContact=" + userContact + ", userIdType=" + userIdType
				+ ", userIdNumber=" + userIdNumber + "]";
	}
	
	

}
