package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IOrderMethodDao;
import in.nit.model.OrderMethod;
@Repository
public class OrderMethodDaoImpl implements IOrderMethodDao {

	@Autowired
	private HibernateTemplate ht;
	
	public Integer saveOrderMethod(OrderMethod ob) {
		return (Integer)ht.save(ob);
	}
	public List<OrderMethod> getAllOrderMethods() {
		List<OrderMethod> list=ht.loadAll(OrderMethod.class);
		return list;
	}
	public void deleteOrderMethod(Integer id) {
		ht.delete(new OrderMethod(id));	
	}
	public OrderMethod getOneOrderMethod(Integer id) {
		return ht.get(OrderMethod.class, id);
	}
    public void updateOrderMethod(OrderMethod ob) {
    	ht.update(ob);
    }
    @SuppressWarnings({ "unchecked", "deprecation" })
    public List<Object[]> getOrderMethodTypeCount() {
    	String sql="select orderType,count(orderType) from in.nit.model.OrderMethod group by orderType";
    	return (List<Object[]>) ht.find(sql);
    }
}
