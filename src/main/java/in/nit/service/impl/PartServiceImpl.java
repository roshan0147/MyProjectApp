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
}
