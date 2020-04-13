package in.nit.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import in.nit.model.WhUserType;
import in.nit.service.IWhUserTypeService;
@Component
public class WhUserTypeValidator implements Validator{

	@Autowired
	private IWhUserTypeService service;
	@Override
	public boolean supports(Class<?> clazz) {
		return WhUserType.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        WhUserType wh=(WhUserType)target;
        if(service.isUserCodeExist(wh.getUserCode())) {
        	errors.rejectValue("userCode",null,"User Code '"+wh.getUserCode()+"' alredy exist");
        }
	}

}
