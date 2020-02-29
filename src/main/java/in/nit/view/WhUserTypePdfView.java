package in.nit.view;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

import in.nit.model.WhUserType;

public class WhUserTypePdfView extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Paragraph p=new Paragraph("WHUSERTYPE DATA PDF !");
		document.add(p);
		
		@SuppressWarnings("unchecked")
		List<WhUserType> list=(List<WhUserType>) model.get("list");
		
		Table t=new Table(8);
		t.setPadding(2);
		t.addCell("ID");t.addCell("TYPE");
		t.addCell("CODE");t.addCell("FOR");
		t.addCell("MAIL");t.addCell("CONTACT");
		t.addCell("IDTYPE");t.addCell("IDNUMBER");
		
		for(WhUserType wh:list)
		{
			t.addCell(wh.getUserId().toString());
			t.addCell(wh.getUserType());
			t.addCell(wh.getUserCode());
			t.addCell(wh.getUserFor());
			t.addCell(wh.getUserMail());
			t.addCell(wh.getUserContact());
			t.addCell(wh.getUserIdType());
			t.addCell(wh.getUserIdNumber());
		}
		document.add(t);
		document.add(new Paragraph(new Date().toString()));
	}

}
