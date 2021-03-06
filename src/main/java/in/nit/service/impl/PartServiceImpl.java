package in.nit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.nit.dao.IPartDao;
import in.nit.model.Part;
import in.nit.service.IPartService;
@Service
public class PartServiceImpl implements IPartService {

	@Autowired
	private IPartDao dao;
	
	@Transactional
	public Integer savePart(Part p) {
		return dao.savePart(p);
	}
	@Transactional(readOnly = true)
	public List<Part> getAllParts() {
		return dao.getAllParts();
	}
	@Transactional
	public void deletePart(Integer id) {
		dao.deletePart(id);
	}
	@Transactional(readOnly = true)
	public Part getOnePart(Integer id) {
		return dao.getOnePart(id);
	}
	@Transactional
	public void updatePart(Part p) {
		dao.updatePart(p);
	}
	@Transactional(readOnly = true)
	public List<Object[]> getPartIdAndCodes() {
		return dao.getPartIdAndCodes();
	}
}
