package com.tj.sp.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.sp.dao.ReviewDao;
import com.tj.sp.dto.Review;
import com.tj.sp.util.Paging;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	String backupPath = "C:/dsd/SP_Project/src/main/webapp/review_img/";
	@Override
	public List<Review> listReview(Review review, String pagenum) {
		String pcode = review.getPcode();
		Paging paging = new Paging(reviewDao.cntReview(pcode),pagenum, 5, 10);
		review.setStartrow(paging.getStartrow());
		review.setEndrow(paging.getEndrow());
		return reviewDao.listReview(review);
	}
	@Override
	public int insertReview(MultipartHttpServletRequest mRequest, Review review) {
		String uploadPath = mRequest.getRealPath("review_img/");
		Iterator<String> params = mRequest.getFileNames(); 
		String rimage = null;
		int idx = 0;
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param); // 파라미터에 연결된 파일 객체
			rimage = mFile.getOriginalFilename(); 
			if(rimage!=null && !rimage.equals("")) {
				//파일첨부 했다
				if(new File(uploadPath+rimage).exists()) {
					//서버에 같은 파일이름의 있을 때 첨부한 파일이름을 교체
					rimage = System.currentTimeMillis()+"_"+rimage;
				}//if
				try {
					mFile.transferTo(new File(uploadPath+rimage)); //서버에 저장
					System.out.println("서버파일 : "+uploadPath+rimage);
					System.out.println("백업파일 : "+backupPath+rimage);
					int result = 
					  fileCopy(uploadPath+rimage, backupPath+rimage); //파일 카피
					System.out.println(result == 1? idx+"번째 복사성공":idx+"번째 복사 실패");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				//파일첨부 안 하면 bimg는 ""가 됨
				//bimg = "";
			}//if
			idx++;
		}//while
		review.setRimage(rimage);
		return reviewDao.insertReview(review);
	}
	private int fileCopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead== -1) break;
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (Exception e) { }
		}
		return isCopy;
	}
	@Override
	public int deleteReview(String rcode) {
		return reviewDao.deleteReview(rcode);
	}
	@Override
	public int cntReview(String pcode) {
		return reviewDao.cntReview(pcode);
	}

}
