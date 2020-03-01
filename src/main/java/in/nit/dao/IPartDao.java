package in.nit.dao;

import java.util.List;

import in.nit.model.Part;

public interface IPartDao {
	
	public Integer savePart(Part p);
    public List<Part> getAllParts();
}
