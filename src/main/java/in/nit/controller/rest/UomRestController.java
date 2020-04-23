package in.nit.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import in.nit.model.Uom;
import in.nit.service.IUomService;

@RestController
@RequestMapping("/rest/uom")
public class UomRestController {
	@Autowired
	private IUomService service;
	@GetMapping("/all")
	public ResponseEntity<?> fetchAllUoms(){
		ResponseEntity<?> resp=null;
		try {
			List<Uom> uoms=service.getAllUoms();
			if(uoms!=null&&!uoms.isEmpty()) {
				resp=new ResponseEntity<List<Uom>>(uoms,HttpStatus.OK);
			}else {
				resp=new ResponseEntity<String>(HttpStatus.NO_CONTENT);
			}

		}catch (Exception e) {
			resp=new ResponseEntity<String>("Unable to fetch data",HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return resp;
	}
	@GetMapping("/one")
	public ResponseEntity<?> fetchOneUom(@RequestParam("uomId")Integer id){
		ResponseEntity<?> resp=null;
		try {
			Uom uom=service.getOneUom(id);
			if(uom!=null) {
				resp=new ResponseEntity<Uom>(uom,HttpStatus.OK);
			}else {
				resp=new ResponseEntity<String>("Uom '"+id+"' does not exist",HttpStatus.BAD_REQUEST);
			}

		}catch (Exception e) {
			resp=new ResponseEntity<String>("Unable to fetch data",HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return resp;
	}
	@DeleteMapping("/remove")
	public ResponseEntity<String> deleteUom(@RequestParam("uomId")Integer id){
		ResponseEntity<String> resp=null;
		try {
			    service.deleteUom(id);
				resp=new ResponseEntity<String>("Uom '"+id+"'deleted",HttpStatus.OK);

		}catch (Exception e) {
			resp=new ResponseEntity<String>("Uom '"+id+"' doesn't exist",HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return resp;
	}
	@PostMapping("/save")
	public ResponseEntity<String> saveUom(@RequestBody Uom uom){
		ResponseEntity<String> resp=null;
		try {
			    Integer id=service.saveUom(uom);
				resp=new ResponseEntity<String>("Uom '"+id+"'Saved",HttpStatus.CREATED);

		}catch (Exception e) {
			resp=new ResponseEntity<String>("Unable to save Uom",HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return resp;
	}
	@PutMapping("/update")
	public ResponseEntity<String> updateUom(@RequestBody Uom uom){
		ResponseEntity<String> resp=null;
		try {
			    service.updateUom(uom);
				resp=new ResponseEntity<String>("Uom '"+uom.getUomId()+"'Updated",HttpStatus.RESET_CONTENT);

		}catch (Exception e) {
			resp=new ResponseEntity<String>("Uom '"+uom.getUomId()+"' Not exist",HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}

		return resp;
	}
}
