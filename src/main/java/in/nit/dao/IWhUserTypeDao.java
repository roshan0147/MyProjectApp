package in.nit.dao;

import java.util.List;

import in.nit.model.WhUserType;

public interface IWhUserTypeDao {
	
	public Integer saveWhUserType(WhUserType ob);
    public List<WhUserType> getAllWhUserTypes();
    public void deleteWhUserType(Integer id);
    public WhUserType getOneWhUserType(Integer id);
    public void updateWhUserType(WhUserType ob);
    public List<Object[]> getWhUserTypeIdTypeCount();
    public List<Object[]> getWhUserTypeIdAndUserCode(String userType);
    public boolean isUserCodeExist(String userCode);
}
