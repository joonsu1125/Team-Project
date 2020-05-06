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

import com.tj.sp.dao.ProductDao;
import com.tj.sp.dto.Product;
import com.tj.sp.dto.Product_Product_option;
import com.tj.sp.util.Paging;

@Service
public class ProductServiceimpl implements ProductService{
	@Autowired
	private ProductDao productDao;
	String backupPath = "C:/dsd/SP_Project/src/main/webapp/product_img/";
	@Override
	public List<Product> getProductList(Product product) {
		return productDao.getProductList(product);
	}

	@Override
	public int totalproduct() {
		return productDao.totalproduct(); 
	}

	@Override
	public Product detailProduct(String pcode) {
		return productDao.detailProduct(pcode);
	}

	@Override
	public List<Product_Product_option> product_Product_optionList(String pagenum, Product_Product_option ppo) {
		String typecode = ppo.getTypecode();
		if(typecode == null) {
			ppo.setTypecode("");
		}
		Paging paging = new Paging(productDao.cntProduct_Product_optionList(ppo), pagenum, 6, 3);
		ppo.setStartrow(paging.getStartrow());
		ppo.setEndrow(paging.getEndrow());
		return productDao.product_Product_optionList(ppo);
	}

	@Override
	public List<Product> marketList(Product product) {
		return productDao.marketList(product);
	}

	@Override
	public Product getProduct(String pcode) {
		return productDao.getProduct(pcode);
	}
	@Override
	public int registerProduct(MultipartHttpServletRequest mRequest, Product_Product_option ppo) {
		String uploadPath = mRequest.getRealPath("product_img/");
		Iterator<String> params = mRequest.getFileNames();
		System.out.println(params.toString());
		String[] pimage = { "", "", "" };
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next().trim();
			if(param.equals("files")) {
				continue;
			}
			MultipartFile mFile = mRequest.getFile(param);
			pimage[idx] = mFile.getOriginalFilename();
			System.out.println("파라미터 이름은 "+param+"이고 파일이름은 "+pimage[idx]);
			if (pimage[idx] != null && !pimage[idx].equals("")) {
				if (new File(uploadPath + pimage[idx]).exists()) {
					pimage[idx] = System.currentTimeMillis() + "_" + pimage[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + pimage[idx]));
					System.out.println("서버파일 : " + uploadPath + pimage[idx]);
					System.out.println("백업파일 : " + backupPath + pimage[idx]);
					int result = fileCopy(uploadPath + pimage[idx], backupPath + pimage[idx]);
					System.out.println(result == 1 ? idx + "번째 복사성공" : idx + "번째 복사 실패");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
			}
			idx++;
		}
		ppo.setPcode(mRequest.getParameter("pcode"));
		ppo.setPtitle(mRequest.getParameter("ptitle"));
		ppo.setPcontent(mRequest.getParameter("pcontent"));
		ppo.setPimage1(pimage[0]);// 첫번째 첨부한 파일이름
		ppo.setPimage2(pimage[1]);// 두번째 첨부한 파일이름
		ppo.setPimage3(pimage[2]);// 두번째 첨부한 파일이름
		ppo.setMid(mRequest.getParameter("mid"));
		System.out.println("서비스에서 DAO 호출 바로 전 ppo : "+ppo);
		return productDao.registerProduct(ppo);
	}

	@Override
	public int modifyProduct(MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("product_img/");
		Iterator<String> params = mRequest.getFileNames();
		String[] pimage = { "", "", "" };
		int idx = 0;
		while (params.hasNext()) {
			String param = params.next().trim();
			if(param.equals("files")) {
				continue;
			}
			MultipartFile mFile = mRequest.getFile(param);
			pimage[idx] = mFile.getOriginalFilename();
			if (pimage[idx] != null && !pimage[idx].equals("")) {
				if (new File(uploadPath + pimage[idx]).exists()) {
					pimage[idx] = System.currentTimeMillis() + "_" + pimage[idx];
				} // if
				try {
					mFile.transferTo(new File(uploadPath + pimage[idx]));
					System.out.println("서버파일 : " + uploadPath + pimage[idx]);
					System.out.println("백업파일 : " + backupPath + pimage[idx]);
					int result = fileCopy(uploadPath + pimage[idx], backupPath + pimage[idx]);
					System.out.println(result == 1 ? idx + "번째 복사성공" : idx + "번째 복사 실패");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
			}// if
			idx++;
		}
		Product product = new Product();
		product.setPcode(mRequest.getParameter("pcode"));
		product.setPtitle(mRequest.getParameter("ptitle"));
		product.setPcontent(mRequest.getParameter("pcontent"));
		product.setPimage1(pimage[0]);// 첫번째 첨부한 파일이름
		product.setPimage2(pimage[1]);// 두번째 첨부한 파일이름
		product.setPimage3(pimage[2]);// 두번째 첨부한 파일이름
		product.setMid(mRequest.getParameter("mid"));
		return productDao.modifyProduct(product);
	}

	@Override
	public int deleteProduct(Product product) {
		return productDao.deleteProduct(product);
	}

	@Override
	public int cntProduct() {
		return productDao.cntProduct();
	}

	private int fileCopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int) sFile.length()];
			while (true) {
				int nRead = is.read(buff);
				if (nRead == -1)
					break;
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (os != null) os.close();
				if (is != null) is.close();
			} catch (Exception e) {
			}
		}
		return isCopy;
	}

	@Override
	public List<Product_Product_option> marketMain(Product product, String pagenum, String schword) {
		if(schword==null) {
			schword="";
		}
		Paging paging = new Paging(productDao.cntMarketMain(product), pagenum, 6, 3);
		product.setStartrow(paging.getStartrow());
		product.setEndrow(paging.getEndrow());
		return productDao.marketMain(product, schword);
	}

	@Override
	public int cntMarketMain(Product product) {
		return productDao.cntMarketMain(product);
	}

	@Override
	public int cntProduct_Product_optionList(Product_Product_option ppo) {
		String typecode = ppo.getTypecode();
		if(typecode == null) {
			ppo.setTypecode("");
		}
		return productDao.cntProduct_Product_optionList(ppo);
	}
	
}
