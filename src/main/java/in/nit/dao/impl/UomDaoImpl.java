package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IUomDao;
import in.nit.model.Uom;
@Repository
public class UomDaoImpl implements IUomDao {

	@Autowired
	private HibernateTemplate ht;

	public Integer saveUom(Uom u) {
		return (Integer)ht.save(u);
	}
	public List<Uom> getAllUoms() {
		List<Uom> list=ht.loadAll(Uom.class);
		return list;
	}
	public void deleteUom(Integer id) {
		ht.delete(new Uom(id));
    }
	public Uom getOneUom(Integer id) {
		return ht.get(Uom.class, id);
	}
	public void updateUom(Uom u) {
		ht.update(u);
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Object[]> getUomTyoeCount() {
		String sql="select uomType,count(uomType) from in.nit.model.Uom group by uomType";
		return (List<Object[]>) ht.find(sql);
	}
	@Override
	public List<Object[]> getUomIdAndUomModel() {
		String sql=" select uomId,uomModel from in.nit.model.Uom";
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Object[]> list=(List<Object[]>) ht.find(sql);
		return list;
	}
	@Override
	public boolean isUomModelExist(String uomModel) {
		boolean flag=false;
		String sql="SELECT COUNT(uomModel) FROM in.nit.model.Uom WHERE uomModel=?0";
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Long> list=(List<Long>) ht.find(sql, uomModel);
		if(list!=null && !list.isEmpty()) {
			long count=list.get(0);
			if(count==0)
				    flag=false;
				else
					flag=true;
		}
		return flag;
	}
}
