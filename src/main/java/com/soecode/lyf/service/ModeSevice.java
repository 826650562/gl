package com.soecode.lyf.service;

import java.util.List;

import com.soecode.lyf.entity.Mode;

/**
 * @author Administrator 3D模型管理服务
 */

public interface ModeSevice {

	/**
	 * 将上传的模型保存到数据库 return null
	 */
	void saveModeInfo(Mode m);

	/**
	 * 查询所有的模型
	 */
	void selectAllMode();

	String[] getTypes();

	String saveModeType(String t);

	Boolean selectModeType(String t);

	void deleteModeType(String t);

	String getModePath(String t1, String t2);

	String saveModeParts(String bj_name, String bj_parts, String brief, String id);

	List getAllModeparts(String id);

	List getInfoOfPart(String id);

	void update_part(String id, String name, String textArea);

	void delete_part(String id);

	void upload_img(String model_id, String imgPath);

	void allsave_mode(String id, String _glmc, String _glfl, String _textarea);

}
