package in.nit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.nit.dao.IOrderMethodDao;
import in.nit.model.OrderMethod;
import in.nit.service.IOrderMethodService;
@Service
public class OrderMethodServiceImpl implements IOrderMethodService {

	@Autowired
	private IOrderMethodDao dao;
	
	@Transactional
	public Integer saveOrderMethod(OrderMethod ob) {
		return dao.saveOrderMethod(ob);
	}
	@Transactional(readOnly = true)
	public List<OrderMethod> getAllOrderMethods() {
		return dao.getAllOrderMethods();
	}
    @Transactional
    public void deleteOrderMethod(Integer id) {
    	dao.deleteOrderMethod(id);
    }
    @Transactional(readOnly = true)
    public OrderMethod getOneOrderMethod(Integer id) {
    	return dao.getOneOrderMethod(id);
    }
    @Transactional
    public void updateOrderMethod(OrderMethod ob) {
    	dao.updateOrderMethod(ob);
    }
    @Transactional(readOnly = true)
    public List<Object[]> getOrderMethodTypeCount() {
    	return dao.getOrderMethodTypeCount();
    }
    @Transactional(readOnly = true)
    public List<Object[]> getOrderMethodIdAndMode(String mode) {
    	return dao.getOrderMethodIdAndMode(mode);
    }
}
