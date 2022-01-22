package co.soyeon.prj.notice.web;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.soyeon.prj.notice.service.NoticeService;
import co.soyeon.prj.notice.service.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeDao; // Model(DAO) 자동주입
	
	@Autowired
	String saveDirectory; // 파일 저장 위치
	
	@RequestMapping("/noticeSelectList.do")
	public String noticeSelectList(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		return "notice/noticeSelectList";
	}
	
	@RequestMapping("/noticeInputForm.do")
	public String noticeInputForm() {
		return "notice/noticeInputForm";
	}
	
	@PostMapping("/noticeInsert.do")
//	@ResponseBody // ajax 호출 시 호출된 곳으로 돌려주려고 할 때
	public String noticeInsert(NoticeVO vo, MultipartFile file) {
		// 일반적인 데이터는 VO에 담고 파일은 MultipartFile에 담기
		
		// 원본 이름 지정
		String fileName = file.getOriginalFilename(); // 원본 파일명 가져오기
		String pfileName = UUID.randomUUID().toString(); // 물리 파일명 가져오기
		pfileName = pfileName + fileName.substring(fileName.lastIndexOf("."));
		File target = new File(saveDirectory, pfileName);
		vo.setFileName(fileName); // 원본 파일명 DB 저장을 위해
		vo.setPfileName(pfileName); // 물리 파일명
		
		// 경로 생성, 파일 저장
		if(! new File(saveDirectory).exists()) { // 존재하지 않으면 true, 그 외는 false 
			new File(saveDirectory).mkdir();
		}
		
		// 파일 복사
		try {
			FileCopyUtils.copy(file.getBytes(), target); // 파일 저장
			noticeDao.noticeInsert(vo); // 데이터 저장
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:noticeSelectList.do"; // view Resolve없이 컨트롤러로 바로 감
	}

}
