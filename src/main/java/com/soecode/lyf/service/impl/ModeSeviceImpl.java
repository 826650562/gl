package com.soecode.lyf.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.soecode.lyf.entity.Mode;
import com.soecode.lyf.service.ModeSevice;

public class ModeSeviceImpl implements ModeSevice {

	@Autowired
	private JdbcTemplate _jd;
	private String sql;

	public void saveModeInfo(Mode m) {
		// TODO Auto-generated method stub
		String sql = "insert into mode (name,type,obj,mtl) values" + "('" + m.getName() + "','" + m.getType() + "','"
				+ m.getObjPath() + "','" + m.getMtlPath() + "'); ";
		_jd.execute(sql);
	}

	/**
	 * @param m
	 *            保存模型类型
	 */
	public String saveModeType(String type) {
		// TODO Auto-generated method stub
		if (!selectModeType(type)) {
			String sql = "insert into mode_type (type) values" + "('" + type + "'); ";
			_jd.execute(sql);
			return "_1000";
		} else {
			return "_10001";
		}

	}

	public Boolean selectModeType(String type) {
		// TODO Auto-generated method stub
		String sql = "select * from mode_type where type='" + type + "'";
		List list = _jd.queryForList(sql);
		if (list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	public void selectAllMode() {
		// TODO Auto-generated method stub
	}

	/**
	 * 检查是否已经存在
	 */
	public Boolean checkisExistByName() {
		return null;
	}

	public ModeSeviceImpl setSql(String sql) {
		this.sql = sql;
		return this;
	}

	public String[] getTypes() {
		String sql = "select * from mode_type";
		List res = _jd.queryForList(sql);

		if (res.size() > 0) {
			String[] types = new String[res.size()];
			for (int i = 0; i < res.size(); i++) {
				HashMap map = (HashMap) res.get(i);
				types[i] = (String) map.get("type");
			}
			return types;
		}
		return null;
	}

	public void deleteModeType(String t) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM mode_type WHERE type='" + t + "';";
		_jd.execute(sql);
	}

	public String getModePath(String t1, String t2) {
		// TODO Auto-generated method stub
		String sql = "select * from mode where name='"+t1+"' and type='"+t2+"'" ;
		List res = _jd.queryForList(sql);
		HashMap map = (HashMap) res.get(0);
		String obj = (String) map.get("obj");
		String mtl = (String) map.get("mtl");
		String id =  String.valueOf(map.get("id")) ;

		return obj+"@"+mtl+"@"+id;
	}

	public String saveModeParts(String bj_name, String bj_parts, String brief, String id) {
		// TODO Auto-generated method stub
		String sql = "insert into mode_part (modeId,part_ids,part_info,part_name) values" + 
		"('" + id + "','"+bj_parts+"','"+brief+"','"+bj_name+"'); ";
		_jd.execute(sql);
		return "1000";
	}

	public List getAllModeparts() {
		// TODO Auto-generated method stub
		List res=_jd.queryForList("select * from mode_part");
		return res;
	}
	//gsm 插入数据库case表
	public void subCase(String caseName, String caseType, String caseBrief, String caseTips) {
		// TODO Auto-generated method stub
		//
		String sql = "insert into `case` (name, type, tips, brief) values" + 
				"('" + caseName + "','"+caseType+"','"+caseTips+"','"+caseBrief+"'); ";
		_jd.execute(sql);
		
	}

	public List loadModel() {
		// TODO Auto-generated method stub
		List res=_jd.queryForList("select * from mode");
		return res;
	}
}
