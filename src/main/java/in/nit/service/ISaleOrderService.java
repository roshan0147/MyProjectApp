package in.nit.service;

import java.util.List;

import in.nit.model.SaleOrder;

public interface ISaleOrderService {

	public Integer saveSaleOrder(SaleOrder so);
	public List<SaleOrder> getAllSaleOrders();
	public SaleOrder getOneSaleOrder(Integer id);
	public void updateSaleOrder(SaleOrder so);
	public void deleteSaleOrder(Integer id);
}
