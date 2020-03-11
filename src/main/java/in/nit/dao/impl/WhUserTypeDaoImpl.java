package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IWhUserTypeDao;
import in.nit.model.WhUserType;
@Repository
public class WhUserTypeDaoImpl implements IWhUserTypeDao {

	@Autowired
	private HibernateTemplate ht;
	
	public Integer saveWhUserType(WhUserType ob) {
		return (Integer)ht.save(ob);
	}
	public List<WhUserType> getAllWhUserTypes() {
		return ht.loadAll(WhUserType.class);
	}
	public void deleteWhUserType(Integer id) {
		ht.delete(new WhUserType(id));
	}
	public WhUserType getOneWhUserType(Integer id) {
		return ht.get(WhUserType.class, id);
	}
	public void updateWhUserType(WhUserType ob) {
		ht.update(ob);
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Object[]> getWhUserTypeIdTypeCount() {
		String sql="select userIdType,count(userIdType) from in.nit.model.WhUserType group by userIdType";
		return (List<Object[]>) ht.find(sql);
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Object[]> getWhUserTypeIdAndUserCode(String userType) {
		String hql=" select userId,userCode from "+WhUserType.class.getName()+" where userType=?0";
		return (List<Object[]>) ht.find(hql, userType);
	}
}
