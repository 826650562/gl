package com.soecode.lyf.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mysql.jdbc.StringUtils;
import com.soecode.lyf.entity.Mode;
import com.soecode.lyf.service.ModeSevice;

import net.sf.json.JSONArray;

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/home")
public class HomeController {

	@Resource(name = "ModeSevice")
	private ModeSevice modeSevice;

	private Mode mode;

	private String ObjPath;

	private String MtlPath;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	private String list(Model model) {
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		return "index";
	}

	@RequestMapping(value = "/modejsp", method = RequestMethod.GET)
	private String modejsp(Model model) {
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		return "mode1";
	}

	@RequestMapping(value = "/addmodel", method = RequestMethod.GET)
	private String addmodel(Model model, HttpServletRequest request) {
		String tag_id = (String) request.getParameter("tag_id");
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		if(!StringUtils.isNullOrEmpty(tag_id)){
			model.addAttribute("is_show_Create", "_1001");
		} 
		return "addmodel";	
	}

	@RequestMapping(value = "/loadMode")
	private String loadMode(Model model) {
		return "mode";
	}
	
	//gsm 跳转编辑案例界面
	@RequestMapping(value = "/case", method = RequestMethod.GET)
	private String addcase(Model model) {
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		return "case";
	}

	// 这里需要修改
	@RequestMapping(value = "/getModePath")
	private void getModePath(HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		String _name = (String) request.getParameter("_name");
		String _type = (String) request.getParameter("_type");
		String resString = modeSevice.getModePath(_name, _type);
		response.getWriter().write(resString);
	}

	/**
	 * @param model
	 * @return 保存锅炉类型
	 * @throws IOException
	 */
	@RequestMapping(value = "/saveModeType", method = RequestMethod.POST)
	private void saveModeType(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String _type = (String) request.getParameter("_type");
		try {
			String resString = modeSevice.saveModeType(_type);
			response.getWriter().write(resString);
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	/**
	 * @param model
	 * @return 删除锅炉类型
	 * @throws IOException
	 */
	@RequestMapping(value = "/deleteModeType", method = RequestMethod.POST)
	private void deleteModeType(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String _type = (String) request.getParameter("_type");
		try {
			modeSevice.deleteModeType(_type);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/saveModeParts", method = RequestMethod.POST)
	private void saveModeParts(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String bj_name = (String) request.getParameter("bj_name");
		String bj_parts = (String) request.getParameter("bj_parts");
		String brief = (String) request.getParameter("brief");
		String id = (String) request.getParameter("id");
		try {
			String resString = modeSevice.saveModeParts(bj_name, bj_parts, brief, id);
			response.getWriter().write(resString);
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/getAllModeparts", method = RequestMethod.POST)
	private void getAllModeparts(HttpServletResponse response, HttpServletRequest request) throws IOException {
		try {
			List res = modeSevice.getAllModeparts();
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}
	
	
	

	@RequestMapping(value = "/saveModeInfo", method = RequestMethod.POST)
	public void upload(HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		String _glmc = (String) request.getParameter("_glmc");
		String _glfl = (String) request.getParameter("_glfl");
		if (!StringUtils.isNullOrEmpty(_glmc) && !StringUtils.isNullOrEmpty(_glfl)) {
			mode = new Mode();
			mode.setName(_glmc);
			mode.setType(_glfl);

			String mtlPath = (String) session.getAttribute("mtl");
			String objPath = (String) session.getAttribute("obj");

			if (!StringUtils.isNullOrEmpty(mtlPath) && !StringUtils.isNullOrEmpty(objPath)) {
				mode.setObjPath(objPath);
				mode.setMtlPath(mtlPath);
				modeSevice.saveModeInfo(mode);
				response.getWriter().write("1000");
			} else {
				response.getWriter().write("1001");
			}
		}
	}

	@RequestMapping(value = "/saveHeaderPic", method = RequestMethod.POST)
	public void saveHeaderPic(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {
		String resMsg = "";
		try {
			long startTime = System.currentTimeMillis();
			String leftPath = session.getServletContext().getRealPath("/uploadFiles");
			String allName = new Date().getTime() + "-" + file.getOriginalFilename();
			String path = leftPath + "\\" + allName;
			File newFile = new File(path);
			if (!newFile.getParentFile().exists()) {
				newFile.getParentFile().mkdirs();
			}
			file.transferTo(newFile);
			long endTime = System.currentTimeMillis();
			System.out.println("运行时间：" + String.valueOf(endTime - startTime) + "ms");
			// 写入session
			String name = file.getOriginalFilename();
			System.out.println(name);
			String[] types = name.split("\\.");
			if (types.length > 0) {
				String type = types[types.length - 1];
				if (!StringUtils.isNullOrEmpty(type)) {
					session.setAttribute(type, allName);
				}
				resMsg = "1";
			} else {
				resMsg = "0";
			}

		} catch (IllegalStateException e) {
			e.printStackTrace();
			resMsg = "0";
		}
		response.getWriter().write(resMsg);
	}

	
	
	
	//gsm 上传案例数据到数据库
	@RequestMapping(value = "/subCase", method = RequestMethod.POST)
	private void subCase(HttpServletResponse response, HttpServletRequest request) throws IOException {
		try {
			String caseName = (String) request.getParameter("caseName");
			String caseType = (String) request.getParameter("caseType");
			String caseBrief = (String) request.getParameter("caseBrief");
			String caseTips = (String) request.getParameter("caseTips");
			
			modeSevice.subCase(caseName,caseType,caseBrief, caseTips);
			//JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}
	
	
	//gsm 加载首页数据
	@RequestMapping(value = "/loadModel", method = RequestMethod.POST)
	private void loadModel(HttpServletResponse response, HttpServletRequest request) throws IOException {
		try {
			List res = modeSevice.loadModel();
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}
	
	
	
}
