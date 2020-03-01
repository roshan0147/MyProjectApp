package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import in.nit.dao.IPartDao;
import in.nit.model.Part;
@Repository
public class PartDaoImpl implements IPartDao {

	@Autowired
	private HibernateTemplate ht;

	public Integer savePart(Part p) {
		return (Integer) ht.save(p);
	}
	public List<Part> getAllParts() {
		return ht.loadAll(Part.class);
	}
	public void deletePart(Integer id) {
		ht.delete(new Part(id));
	}
	public Part getOnePart(Integer id) {
		return ht.get(Part.class, id);
	}
	public void updatePart(Part p) {
		ht.update(p);
	}
}
