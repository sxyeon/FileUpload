package co.soyeon.prj.notice.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int no;
	private String id; // 사용자아이디
	private String name; // 사용자명
	private Date wdate;
	private String title;
	private String subject;
	private String fileName; // 원본파일명
	private String pfileName; // 물리파일명

}
