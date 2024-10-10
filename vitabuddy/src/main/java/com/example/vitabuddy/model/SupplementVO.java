package com.example.vitabuddy.model;

public class SupplementVO {
	
	private int supId;
	private String supName;
	private int supPrice;
	private String supBrand;
	private String supDosage;
	private String supNutri;
	private String supNutriinfo;
	private String supPrecautions;
	private String supDetail;
	//supImg;  
	
	
	public int getSupId() {
		return supId;
	}
	public void setSupId(int supId) {
		this.supId = supId;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public int getSupPrice() {
		return supPrice;
	}
	public void setSupPrice(int supPrice) {
		this.supPrice = supPrice;
	}
	public String getSupBrand() {
		return supBrand;
	}
	public void setSupBrand(String supBrand) {
		this.supBrand = supBrand;
	}
	public String getSupDosage() {
		return supDosage;
	}
	public void setSupDosage(String supDosage) {
		this.supDosage = supDosage;
	}
	public String getSupNutri() {
		return supNutri;
	}
	public void setSupNutri(String supNutri) {
		this.supNutri = supNutri;
	}
	public String getSupNutriinfo() {
		return supNutriinfo;
	}
	public void setSupNutriinfo(String supNutriinfo) {
		this.supNutriinfo = supNutriinfo;
	}
	public String getSupPrecautions() {
		return supPrecautions;
	}
	public void setSupPrecautions(String supPrecautions) {
		this.supPrecautions = supPrecautions;
	}
	public String getSupDetail() {
		return supDetail;
	}
	public void setSupDetail(String supDetail) {
		this.supDetail = supDetail;
	}
	
	
    private String function;  // SupplementsMapper.xml에서 function 데이터를 받을 필드

    // Getter and Setter for function
    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }
	
	
    private String ingredient;  // SupplementsMapper.xml에서 function 데이터를 받을 필드


	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

    
	
	
	
	
	

}
