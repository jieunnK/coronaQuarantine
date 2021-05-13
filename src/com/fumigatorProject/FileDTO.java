package com.fumigatorProject;

public class FileDTO {
	int file_idx;
	int eaterynumber;
	String file_path;
	String file_name;
	String file_type;
	long file_size;
	public FileDTO() {
		super();
	}
	
	public FileDTO(int file_idx, int eaterynumber) {
		super();
		this.file_idx = file_idx;
		this.eaterynumber = eaterynumber;
	}

	
	public FileDTO(String file_path, String file_name, String file_type, long file_size) {
		super();
		this.file_path = file_path;
		this.file_name = file_name;
		this.file_type = file_type;
		this.file_size = file_size;
	}


	public FileDTO(int eaterynumber, String file_path, String file_name, String file_type, long file_size) {
		super();
		this.eaterynumber = eaterynumber;
		this.file_path = file_path;
		this.file_name = file_name;
		this.file_type = file_type;
		this.file_size = file_size;
	}

	public FileDTO(int file_idx, int eaterynumber, String file_path, String file_name, String file_type,
			long file_size) {
		super();
		this.file_idx = file_idx;
		this.eaterynumber = eaterynumber;
		this.file_path = file_path;
		this.file_name = file_name;
		this.file_type = file_type;
		this.file_size = file_size;
	}

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public int getEaterynumber() {
		return eaterynumber;
	}

	public void setEaterynumber(int eaterynumber) {
		this.eaterynumber = eaterynumber;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}

	public long getFile_size() {
		return file_size;
	}

	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	
	
	
}
