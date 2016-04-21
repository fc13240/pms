package com.lotut.pms.domain;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class ContactAddress {
	private int id;
	
	@NotBlank
	private String receiver;
	
	@NotNull
	private Integer province;
	
	private String provinceName;
	
	@NotNull
	private Long city;
	
	private String cityName;
	
	@NotNull
	private Long district;
	
	private String districtName;
	
	@NotNull
	private Long street;
	
	private String streetName;
	
	@NotBlank
	private String detailAddress;
	
	@NotBlank
	private String phone;
	
	@Email
	private String email;
	
	private boolean defaultAddress;
	
	private int userId;
	
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Integer getProvince() {
		return province;
	}
	public void setProvince(Integer province) {
		this.province = province;
	}
	public Long getCity() {
		return city;
	}
	public void setCity(Long city) {
		this.city = city;
	}
	public Long getDistrict() {
		return district;
	}
	public void setDistrict(Long district) {
		this.district = district;
	}
	public Long getStreet() {
		return street;
	}
	public void setStreet(Long street) {
		this.street = street;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public boolean isDefaultAddress() {
		return defaultAddress;
	}
	public void setDefault(boolean defaultAddress) {
		this.defaultAddress = defaultAddress;
	}
}
