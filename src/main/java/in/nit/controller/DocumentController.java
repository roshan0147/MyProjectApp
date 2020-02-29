package in.nit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import in.nit.model.Document;
import in.nit.service.IDocumentService;

@Controller
@RequestMapping("/document")
public class DocumentController {
	@Autowired
	private IDocumentService service;
	@RequestMapping("/show")
	public String showUploadPage(Model model)
	{
		List<Object[]> list=service.getFileIdAndNames();
		model.addAttribute("list",list);
		return "Documents";
	}
	@RequestMapping("/upload")
	public String doUpload(
			@RequestParam Integer fileId,
			@RequestParam CommonsMultipartFile fileOb,
			Model model
			)
	{
		if(fileOb!=null)
		{
		Document d=new Document();
		d.setFileId(fileId);
		d.setFileName(fileOb.getOriginalFilename());
		d.setFileData(fileOb.getBytes());
		service.saveDocument(d);
		}
		return "redirect:show";
	}
	@RequestMapping("/download")
	public void doDownload(
			@RequestParam Integer fid,
			HttpServletResponse res
			)
	{
		Document doc=service.getOneDocument(fid);
		res.addHeader("Content-Disposition","attachement;filename="+doc.getFileName());
	    try {
			FileCopyUtils.copy(doc.getFileData(),res.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
