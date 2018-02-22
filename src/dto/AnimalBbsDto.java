package dto;

import java.io.Serializable;

public class AnimalBbsDto implements Serializable {

	private int seq;
	private String title;
	private String name;
	private int age;
	private String kinds;
	private String type;
	private String location;
	private int medicine;
	private int neutralization;
	private int gender;
	private String descripttion;
	private String pic1;
	private String cotent;
	private int userSeq;
	private String contact;
	private String description;
 	private String Rdate;
	private String LUpdate;
	private int del;
	
	public AnimalBbsDto() {
	}

	public AnimalBbsDto(int seq, String title, String name, int age, String kinds, String type, String location,
			int medicine, int neutralization, int gender, String descripttion, String pic1, String cotent, int userSeq,
			String contact, String description, String rdate, String lUpdate, int del) {
		super();
		this.seq = seq;
		this.title = title;
		this.name = name;
		this.age = age;
		this.kinds = kinds;
		this.type = type;
		this.location = location;
		this.medicine = medicine;
		this.neutralization = neutralization;
		this.gender = gender;
		this.descripttion = descripttion;
		this.pic1 = pic1;
		this.cotent = cotent;
		this.userSeq = userSeq;
		this.contact = contact;
		this.description = description;
		Rdate = rdate;
		LUpdate = lUpdate;
		this.del = del;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getKinds() {
		return kinds;
	}

	public void setKinds(String kinds) {
		this.kinds = kinds;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getMedicine() {
		return medicine;
	}

	public void setMedicine(int medicine) {
		this.medicine = medicine;
	}

	public int getNeutralization() {
		return neutralization;
	}

	public void setNeutralization(int neutralization) {
		this.neutralization = neutralization;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getDescripttion() {
		return descripttion;
	}

	public void setDescripttion(String descripttion) {
		this.descripttion = descripttion;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getCotent() {
		return cotent;
	}

	public void setCotent(String cotent) {
		this.cotent = cotent;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRdate() {
		return Rdate;
	}

	public void setRdate(String rdate) {
		Rdate = rdate;
	}

	public String getLUpdate() {
		return LUpdate;
	}

	public void setLUpdate(String lUpdate) {
		LUpdate = lUpdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "AnimalBbsDto [seq=" + seq + ", title=" + title + ", name=" + name + ", age=" + age + ", kinds=" + kinds
				+ ", type=" + type + ", location=" + location + ", medicine=" + medicine + ", neutralization="
				+ neutralization + ", gender=" + gender + ", descripttion=" + descripttion + ", pic1=" + pic1
				+ ", cotent=" + cotent + ", userSeq=" + userSeq + ", contact=" + contact + ", description="
				+ description + ", Rdate=" + Rdate + ", LUpdate=" + LUpdate + ", del=" + del + "]";
	}

		
	
	
}









