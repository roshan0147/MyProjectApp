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

import in.nit.model.ShipmentType;

public class ShipmentTypePdfView extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Paragraph p=new Paragraph("SHIPMENTTYPE PDF DATA !");
		document.add(p);
		@SuppressWarnings("unchecked")
		List<ShipmentType> list=(List<ShipmentType>) model.get("list");
		
	   Table t=new Table(6);
	   t.setPadding(2);
	   t.addCell("ID");
	   t.addCell("MODE");
	   t.addCell("CODE");
	   t.addCell("ENABLE");
	   t.addCell("GRADE");
	   t.addCell("NOTE");
	   for(ShipmentType st:list)
	   {
		   t.addCell(st.getShipId().toString());
		   t.addCell(st.getShipMode());
		   t.addCell(st.getShipCode());
		   t.addCell(st.getEnbShip());
		   t.addCell(st.getShipGrade());
		   t.addCell(st.getShipDesc());
		   
	   }
	   document.add(t);
	   document.add(new Paragraph(new Date().toString()));
	   
	}

}
