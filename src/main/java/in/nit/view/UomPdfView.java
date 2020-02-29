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

import in.nit.model.Uom;

public class UomPdfView extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Paragraph p=new Paragraph("UOM PDF FORMATE");
		document.add(p);
		@SuppressWarnings("unchecked")
		List<Uom> list=(List<Uom>) model.get("list");
		Table t=new Table(4);
		t.setPadding(2);
		t.addCell("ID");t.addCell("TYPE");
		t.addCell("MODEL");t.addCell("NOTE");
		
		for(Uom u:list)
		{
			t.addCell(u.getUomId().toString());
			t.addCell(u.getUomType());
			t.addCell(u.getUomModel());
			t.addCell(u.getUomDesc());
		}
		document.add(t);
		document.add(new Paragraph(new Date().toString()));
		
	}

}
