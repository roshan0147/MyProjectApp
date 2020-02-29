package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IShipmentTypeDao;
import in.nit.model.ShipmentType;
@Repository
public class ShipmentTypeDaoImpl implements IShipmentTypeDao {

	@Autowired
	private HibernateTemplate ht;
	public Integer saveShipmentType(ShipmentType ob) {
        return (Integer)ht.save(ob);
	}
	public List<ShipmentType> getAllShipmentTypes() {
		List<ShipmentType> list=ht.loadAll(ShipmentType.class);
		return list;
	}
	public void deleteShipmentType(Integer id) {
		ht.delete(new ShipmentType(id));
	}
	public ShipmentType getOneShipmentType(Integer id) {
		return ht.get(ShipmentType.class, id);
	}
	public void updateShipmentType(ShipmentType ob) {
		ht.update(ob);
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Object[]> getShipmentModeCount() {
		String sql="select shipMode,count(shipMode) from in.nit.model.ShipmentType group by shipMode";
		return (List<Object[]>) ht.find(sql);
	}

}
