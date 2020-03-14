package in.nit.dao;

import java.util.List;

import in.nit.model.PurchaseOrder;

public interface IPurchaseOrderDao {
	
	public Integer savePurchaseOrder(PurchaseOrder po);
    public List<PurchaseOrder> getAllPurchaseOrders(); 
    public PurchaseOrder getOnePurchaseOrder(Integer id);
    public void updatePurchaseOrder(PurchaseOrder po);
    public void deletePurchaseOrder(Integer id);
}
