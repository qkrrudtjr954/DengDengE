package dto;

import java.io.Serializable;

public class AnimalBbsDto implements Serializable {
/*
	-- 분양글 table
	create SEQUENCE animalbbs_seq start with 1 increment by 1;
	create table animalbbs(
	    seq number(8) primary key,
	    title varchar2(100),
	    name varchar2(50),
	    age number(2),
	    kinds varchar2(100),
	    location varchar2(200),
	    medicine number(1),
	    neutralization number(1),
	    gender number(1),
	    descripttion varchar2(3000),
	    pic1 varchar2(200),
	    content varchar2(4000),
	    
	    TARGET_USER_SEQ NUMBER(8),
	    TARGET_CONTACT varchar2(20),
	    TARGET_DESCRIPTION	varchar2(3000),
	    REG_DATE DATE,
	    LAST_UPDATE DATE,
	    DEL NUMBER(1),
	    FOREIGN KEY (TARGET_USER_SEQ) REFERENCES denguser(seq)
	);
*/
	private int seq;
	private String title;
	private String name;
	private int age;
	private String kinds;
	private String location;
	private int medicine;
	private int neutralization;
	private int gender;
	private String descripttion;
	private String pic1;
	private String cotent;
	
	public AnimalBbsDto() {
	}

	public AnimalBbsDto(int seq, String title, String name, int age, String kinds, String location, int medicine,
			int neutralization, int gender, String descripttion, String pic1, String cotent) {
		super();
		this.seq = seq;
		this.title = title;
		this.name = name;
		this.age = age;
		this.kinds = kinds;
		this.location = location;
		this.medicine = medicine;
		this.neutralization = neutralization;
		this.gender = gender;
		this.descripttion = descripttion;
		this.pic1 = pic1;
		this.cotent = cotent;
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

	@Override
	public String toString() {
		return "AnimalBbsDto [seq=" + seq + ", title=" + title + ", name=" + name + ", age=" + age + ", kinds=" + kinds
				+ ", location=" + location + ", medicine=" + medicine + ", neutralization=" + neutralization
				+ ", gender=" + gender + ", descripttion=" + descripttion + ", pic1=" + pic1 + ", cotent=" + cotent
				+ "]";
	}
	
	
	
}









