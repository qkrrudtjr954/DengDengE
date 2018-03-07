package dto;

import java.io.Serializable;

public class CategoryDto implements Serializable {
	private String title;
	private String description;
	private String reg_date;
	private int seq;
	
	public CategoryDto() {
	}
	
	public CategoryDto(String title, String description, String reg_date, int seq) {
		super();
		this.title = title;
		this.description = description;
		this.reg_date = reg_date;
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "CategoryDto [title=" + title + ", description=" + description + ", reg_date=" + reg_date + ", seq="
				+ seq + "]";
	}
	
	
	
}
