package com.soecode.lyf.entity;

/**
 * @author Administrator 3D模型
 */
public class Mode {

	/**
	 * 模型名称
	 */
	public String name;

	/**
	 * 所属类型
	 */
	public String type;

	/**
	 * 模型上传时间
	 */
	public String Date;

	public String objPath;
 
	public String mtlPath;

	public String getObjPath() {
		return objPath;
	}

	public void setObjPath(String objPath) {
		this.objPath = objPath;
	}

	public String getMtlPath() {
		return mtlPath;
	}

	public void setMtlPath(String mtlPath) {
		this.mtlPath = mtlPath;
	}

	public String getName() {
		return name;
	}

	public Object setName(String name) {
		this.name = name;
		return this;
	}

	public String getType() {
		return type;
	}

	public Object setType(String type) {
		this.type = type;
		return this;
	}

	public String getDate() {
		return String.valueOf(new java.util.Date().getTime());
	}

}
