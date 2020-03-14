package in.nit.dao;

import java.util.List;

import in.nit.model.SaleOrder;

public interface ISaleOrderDao {

	public Integer saveSaleOrder(SaleOrder so);
	public List<SaleOrder> getAllSaleOrders();
	public SaleOrder getOneSaleOrder(Integer id);
	public void updateSaleOrder(SaleOrder so);
	public void deleteSaleOrder(Integer id);
}
