package com.lotut.pms.domain;

public class PatentDocAppPerson {
	private long personId;
	private long patent_doc_id;
	private String name;
	private String id_number;
	private String postcode_address;
	private String other_information;
	private int user_id;
	public long getPersonId() {
		return personId;
	}
	public void setPersonId(long personId) {
		this.personId = personId;
	}
	public long getPatent_doc_id() {
		return patent_doc_id;
	}
	public void setPatent_doc_id(long patent_doc_id) {
		this.patent_doc_id = patent_doc_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId_number() {
		return id_number;
	}
	public void setId_number(String id_number) {
		this.id_number = id_number;
	}
	public String getPostcode_address() {
		return postcode_address;
	}
	public void setPostcode_address(String postcode_address) {
		this.postcode_address = postcode_address;
	}
	public String getOther_information() {
		return other_information;
	}
	public void setOther_information(String other_information) {
		this.other_information = other_information;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
}
