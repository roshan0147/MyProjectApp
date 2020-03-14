package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IPurchaseOrderDao;
import in.nit.model.PurchaseOrder;
@Repository
public class PurchaseOrderDaoImpl implements IPurchaseOrderDao {

	@Autowired
	private HibernateTemplate ht;
	
	public Integer savePurchaseOrder(PurchaseOrder po) {
		return (Integer) ht.save(po);
	}
	public List<PurchaseOrder> getAllPurchaseOrders() {
		return ht.loadAll(PurchaseOrder.class);
	}
	
	public PurchaseOrder getOnePurchaseOrder(Integer id) {
		return ht.get(PurchaseOrder.class,id);
	}
	@Override
	public void updatePurchaseOrder(PurchaseOrder po) {
		ht.update(po);
	}
	@Override
	public void deletePurchaseOrder(Integer id) {
		ht.delete(new PurchaseOrder(id));
		
	}
}
