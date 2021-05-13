package com.fumigatorProject;

public class EateryfumigatorDTO {
	int eaterynumber;
	String eateryName;
	String eateryAddr;
	String eateryTime;
	String eateryTel;
	String untact;
	String packing;
	String deliver;
	String eaterydate;
	String eaterycategory;
	
	public EateryfumigatorDTO() {
		super();
	}

	
	public EateryfumigatorDTO(String eateryName, String eateryAddr,  String eateryTime,String eateryTel, String untact,
			String packing, String deliver) {
		super();
		this.eateryName = eateryName;
		this.eateryAddr = eateryAddr;
		this.eateryTel = eateryTel;
		this.eateryTime = eateryTime;
		this.untact = untact;
		this.packing = packing;
		this.deliver = deliver;
	}
	
	
	
	public EateryfumigatorDTO(int eaterynumber, String eateryName, String eateryAddr, String eateryTime,
			String eateryTel) {
		super();
		this.eaterynumber = eaterynumber;
		this.eateryName = eateryName;
		this.eateryAddr = eateryAddr;
		this.eateryTime = eateryTime;
		this.eateryTel = eateryTel;
	}


	public EateryfumigatorDTO(String eateryName, String eateryAddr, String eateryTime, String eateryTel, String untact,
			String packing, String deliver, String eaterydate) {
		super();
		this.eateryName = eateryName;
		this.eateryAddr = eateryAddr;
		this.eateryTime = eateryTime;
		this.eateryTel = eateryTel;
		this.untact = untact;
		this.packing = packing;
		this.deliver = deliver;
		this.eaterydate = eaterydate;
	}
	

	public EateryfumigatorDTO(int eaterynumber, String eateryName, String eateryAddr, String eateryTime,
			String eateryTel, String untact, String packing, String deliver, String eaterydate, String eaterycategory) {
		super();
		this.eaterynumber = eaterynumber;
		this.eateryName = eateryName;
		this.eateryAddr = eateryAddr;
		this.eateryTime = eateryTime;
		this.eateryTel = eateryTel;
		this.untact = untact;
		this.packing = packing;
		this.deliver = deliver;
		this.eaterydate = eaterydate;
		this.eaterycategory = eaterycategory;
	}

	public EateryfumigatorDTO(int eaterynumber, String eateryName, String eateryAddr, String eateryTime,
			String eateryTel, String untact, String packing, String deliver) {
		super();
		this.eaterynumber = eaterynumber;
		this.eateryName = eateryName;
		this.eateryAddr = eateryAddr;
		this.eateryTime = eateryTime;
		this.eateryTel = eateryTel;
		this.untact = untact;
		this.packing = packing;
		this.deliver = deliver;
	}

	public EateryfumigatorDTO(int eaterynumber, String eateryName, String eateryAddr, String eateryTime,
			String eateryTel, String untact, String packing, String deliver, String eaterydate) {
		super();
		this.eaterynumber = eaterynumber;
		this.eateryName = eateryName;
		this.eateryAddr = eateryAddr;
		this.eateryTime = eateryTime;
		this.eateryTel = eateryTel;
		this.untact = untact;
		this.packing = packing;
		this.deliver = deliver;
		this.eaterydate = eaterydate;
	}
	
	

	public EateryfumigatorDTO(String eateryName, String eateryAddr, String eateryTime, String eateryTel, String untact,
			String packing, String deliver, String eaterydate, String eaterycategory) {
		super();
		this.eateryName = eateryName;
		this.eateryAddr = eateryAddr;
		this.eateryTime = eateryTime;
		this.eateryTel = eateryTel;
		this.untact = untact;
		this.packing = packing;
		this.deliver = deliver;
		this.eaterydate = eaterydate;
		this.eaterycategory = eaterycategory;
	}

	
	public String getEaterycategory() {
		return eaterycategory;
	}

	public void setEaterycategory(String eaterycategory) {
		this.eaterycategory = eaterycategory;
	}

	public int getEaterynumber() {
		return eaterynumber;
	}

	public void setEaterynumber(int eaterynumber) {
		this.eaterynumber = eaterynumber;
	}

	
	public String getEateryName() {
		return eateryName;
	}

	public void setEateryName(String eateryName) {
		this.eateryName = eateryName;
	}

	public String getEateryAddr() {
		return eateryAddr;
	}

	public void setEateryAddr(String eateryAddr) {
		this.eateryAddr = eateryAddr;
	}

	public String getEateryTel() {
		return eateryTel;
	}

	public void setEateryTel(String eateryTel) {
		this.eateryTel = eateryTel;
	}

	public String getEateryTime() {
		return eateryTime;
	}

	public void setEateryTime(String eateryTime) {
		this.eateryTime = eateryTime;
	}

	
	public String getEaterydate() {
		return eaterydate;
	}

	public void setEaterydate(String eaterydate) {
		this.eaterydate = eaterydate;
	}

	public String getUntact() {
		return untact;
	}

	public void setUntact(String untact) {
		this.untact = untact;
	}

	public String getPacking() {
		return packing;
	}

	public void setPacking(String packing) {
		this.packing = packing;
	}

	public String getDeliver() {
		return deliver;
	}

	public void setDeliver(String deliver) {
		this.deliver = deliver;
	}


	@Override
	public String toString() {
		return "EateryfumigatorDTO [eateryName=" + eateryName + ", eateryAddr=" + eateryAddr + ", eateryTel="
				+ eateryTel + ", eateryTime=" + eateryTime + ", untact=" + untact + ", packing=" + packing
				+ ", deliver=" + deliver+"]";
	}
	
	
	
	
}
