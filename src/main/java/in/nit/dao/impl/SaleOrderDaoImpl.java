package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.ISaleOrderDao;
import in.nit.model.SaleOrder;
@Repository
public class SaleOrderDaoImpl implements ISaleOrderDao {

	@Autowired
	private HibernateTemplate ht;
	
	@Override
	public Integer saveSaleOrder(SaleOrder so) {
		return (Integer) ht.save(so);
	}
	@Override
	public List<SaleOrder> getAllSaleOrders() {
		return ht.loadAll(SaleOrder.class);
	}
	@Override
	public void updateSaleOrder(SaleOrder so) {
		ht.update(so);
		
	}
	@Override
	public SaleOrder getOneSaleOrder(Integer id) {
		return ht.get(SaleOrder.class, id);
	}
	@Override
	public void deleteSaleOrder(Integer id) {
		ht.delete(new SaleOrder(id));
		
	}
}
