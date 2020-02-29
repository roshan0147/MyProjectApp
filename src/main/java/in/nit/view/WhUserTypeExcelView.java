package in.nit.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import in.nit.model.WhUserType;

public class WhUserTypeExcelView extends AbstractXlsxView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Sheet s=workbook.createSheet("WHUSERTYPE");
		setHeader(s);
		
		@SuppressWarnings("unchecked")
		List<WhUserType> list=(List<WhUserType>) model.get("list");
		setBody(s,list);
	}

	private void setBody(Sheet s, List<WhUserType> list) {
		int count=1;
		for(WhUserType wh:list)
		{
			Row r=s.createRow(count++);
			r.createCell(0).setCellValue(wh.getUserId());
			r.createCell(1).setCellValue(wh.getUserType());
			r.createCell(2).setCellValue(wh.getUserCode());
			r.createCell(3).setCellValue(wh.getUserFor());
			r.createCell(4).setCellValue(wh.getUserMail());
			r.createCell(5).setCellValue(wh.getUserContact());
			r.createCell(6).setCellValue(wh.getUserIdType());
			r.createCell(7).setCellValue(wh.getUserIdNumber());
		}
	}

	private void setHeader(Sheet s) {
		Row r=s.createRow(0);
		r.createCell(0).setCellValue("ID");
		r.createCell(1).setCellValue("TYPE");
		r.createCell(2).setCellValue("CODE");
		r.createCell(3).setCellValue("FOR");
		r.createCell(4).setCellValue("MAIL");
		r.createCell(5).setCellValue("CONTACT");
		r.createCell(6).setCellValue("IDTYPE");
		r.createCell(7).setCellValue("IDNUMBEr");
		
	}

}
