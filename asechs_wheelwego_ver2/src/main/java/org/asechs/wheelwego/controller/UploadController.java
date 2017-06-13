package org.asechs.wheelwego.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.asechs.wheelwego.model.vo.UploadTestVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	private String uploadPath;
	@RequestMapping(method=RequestMethod.POST,value="multi_fileupload.do")
	public ModelAndView fileUpload(UploadTestVO vo, HttpServletRequest request){
		//실제 운영시에 사용할 서버 업로드 경로
		uploadPath=request.getSession().getServletContext().getRealPath("/upload/"); 
		//개발시에는 워크스페이스 업로드 경로로 준다.
		//uploadPath="C:\\java-kosta\\framework-workspace2\\springmvc21-fileupload\\src\\main\\webapp\\resources\\upload\\";
		List<MultipartFile> list=vo.getFile();
		//결과 응답화면에 파일명 목록을 전달하기 위한 리스트
		ArrayList<String> nameList=new ArrayList<String>();
		for(int i=0; i<list.size();i++){
			String fileName=list.get(i).getOriginalFilename();
			if(fileName.equals("")==false){
				try {
					list.get(i).transferTo(new File(uploadPath+fileName));
					nameList.add(fileName);
					System.out.println("업로드 완료"+fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		ModelAndView mv=new ModelAndView();
		mv.addObject("nameList", nameList);
		mv.setViewName("product/multifileupload_result.tiles");
		return mv;
	}
}
