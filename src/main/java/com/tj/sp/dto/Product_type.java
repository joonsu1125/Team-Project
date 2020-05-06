package com.tj.sp.dto;

public class Product_type {
	private String typecode   ;
	private String typecoderef;
	private String producttype;
	public Product_type() {}
	public String getTypecode() {
		return typecode;
	}
	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}
	public String getTypecoderef() {
		return typecoderef;
	}
	public void setTypecoderef(String typecoderef) {
		this.typecoderef = typecoderef;
	}
	public String getProducttype() {
		return producttype;
	}
	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}
	@Override
	public String toString() {
		return "Product_type [typecode=" + typecode + ", typecoderef=" + typecoderef + ", producttype=" + producttype
				+ "]";
	}
	

}
