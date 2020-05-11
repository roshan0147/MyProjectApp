package in.nit.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.nit.model.WhUserType;
import in.nit.service.IWhUserTypeService;

@RestController
@RequestMapping("/rest/whusertype")
public class WhUserTypeRestController {
	@Autowired
	private IWhUserTypeService service;
	@GetMapping("/all")
	public ResponseEntity<?> fetchAllWhUserTypes(){
		ResponseEntity<?> resp=null;
		try {
		List<WhUserType> lists=service.getAllWhUserTypes();
		if(lists!=null&&!lists.isEmpty()) {
			resp=new ResponseEntity<List<WhUserType>>(lists,HttpStatus.OK);
		}else {
			resp=new ResponseEntity<String>(HttpStatus.NO_CONTENT);
		}
		}catch (Exception e) {
			resp=new ResponseEntity<String>("Unable to etch WhUserType",HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return resp;
	}

}
