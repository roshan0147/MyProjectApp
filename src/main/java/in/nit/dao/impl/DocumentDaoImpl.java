package in.nit.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;


import in.nit.dao.IDocumentDao;
import in.nit.model.Document;
@Repository
public class DocumentDaoImpl implements IDocumentDao {

	@Autowired
	private HibernateTemplate ht;
	public Integer saveDocument(Document d) {
		return (Integer) ht.save(d);
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Object[]> getFileIdAndNames() {
		String sql="select fileId,fileName from Document";
		return (List<Object[]>) ht.find(sql);
	}
	public Document getOneDocument(Integer id) {
		return ht.get(Document.class, id);
	}
}
