package com.sn.entity;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Organize  {
	 
	
		private String fuid;
		private String parentid;
		private Integer code;
		private String fullname;
		private Integer layer;
		private Integer deletemark;
		private Integer enabled;
		private Integer sortcode;
		private String description;
		private String contact;
		private java.util.Date createdate;
		private java.util.Date modifydate;
		private String zysy;
		private String phone;
		private String bqsy;
		private String pingyin;
		private String otype;

	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public Boolean getHasChild() {
		return hasChild;
	}

	public void setHasChild(Boolean hasChild) {
		this.hasChild = hasChild;
	}

	public Map<String, Boolean> getState() {
		return state;
	}

	public void setState(Map<String, Boolean> state) {
		this.state = state;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<Object> getChildren() {
		return children;
	}

	public void setChildren(List<Object> children) {
		this.children = children;
	}

	private String text;
	private Boolean checked;
	private Boolean hasChild;
	private Map<String,Boolean> state;
	private String url;
	private List<Object> children=new ArrayList<Object>();

		public void setFuid(String value) {
			this.fuid = value;
		}
		
		public String getFuid() {
			return this.fuid;
		}
		public void setParentid(String value) {
			this.parentid = value;
		}
		
		public String getParentid() {
			return this.parentid;
		}
		public void setCode(Integer value) {
			this.code = value;
		}
		
		public Integer getCode() {
			return this.code;
		}
		public void setFullname(String value) {
			this.fullname = value;
		}
		
		public String getFullname() {
			return this.fullname;
		}
		public void setLayer(Integer value) {
			this.layer = value;
		}
		
		public Integer getLayer() {
			return this.layer;
		}
		public void setDeletemark(Integer value) {
			this.deletemark = value;
		}
		
		public Integer getDeletemark() {
			return this.deletemark;
		}
		public void setEnabled(Integer value) {
			this.enabled = value;
		}
		
		public Integer getEnabled() {
			return this.enabled;
		}
		public void setSortcode(Integer value) {
			this.sortcode = value;
		}
		
		public Integer getSortcode() {
			return this.sortcode;
		}
		public void setDescription(String value) {
			this.description = value;
		}
		
		public String getDescription() {
			return this.description;
		}
		public void setContact(String value) {
			this.contact = value;
		}
		
		public String getContact() {
			return this.contact;
		}
		public void setCreatedate(java.util.Date value) {
			this.createdate = value;
		}
		
		public java.util.Date getCreatedate() {
			return this.createdate;
		}
		public void setModifydate(java.util.Date value) {
			this.modifydate = value;
		}
		
		public java.util.Date getModifydate() {
			return this.modifydate;
		}
		public void setZysy(String value) {
			this.zysy = value;
		}
		
		public String getZysy() {
			return this.zysy;
		}
		public void setPhone(String value) {
			this.phone = value;
		}
		
		public String getPhone() {
			return this.phone;
		}
		public void setBqsy(String value) {
			this.bqsy = value;
		}
		
		public String getBqsy() {
			return this.bqsy;
		}
		public void setPingyin(String value) {
			this.pingyin = value;
		}
		
		public String getPingyin() {
			return this.pingyin;
		}
		public void setOtype(String value) {
			this.otype = value;
		}
		
		public String getOtype() {
			return this.otype;
		}
	

}	 

