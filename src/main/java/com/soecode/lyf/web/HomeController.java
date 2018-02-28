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
	private String addmodel(Model model) {
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		return "addmodel";
	}

	@RequestMapping(value = "/loadMode")
	private String loadMode(Model model) {
		return "mode";
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
		String id = (String) request.getParameter("_id");
		try {
			List res = modeSevice.getAllModeparts(id);
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}
	
	@RequestMapping(value = "/getInfoOfPart", method = RequestMethod.POST)
	private void getInfoOfPart(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String id = (String) request.getParameter("_id");
		try {
			List res = modeSevice.getInfoOfPart(id);
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}
	
	
	@RequestMapping(value = "/update_part", method = RequestMethod.POST)
	private void update_part(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String id = (String) request.getParameter("_id");
		String name = (String) request.getParameter("name");
		String textArea = (String) request.getParameter("textArea");
		try {
			modeSevice.update_part(id,name,textArea);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}
	
	@RequestMapping(value = "/delete_part", method = RequestMethod.POST)
	private void delete_part(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String id = (String) request.getParameter("_id");
		try {
			modeSevice.delete_part(id);
			response.getWriter().write("1000");
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
	
	
	@RequestMapping(value = "/upload_img", method = RequestMethod.POST)
	public void upload_img(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {
		String resMsg = "";
		String model_id = (String) request.getParameter("model_id");
		
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
			modeSevice.upload_img(model_id,allName);
			response.getWriter().write(allName);

		} catch (IllegalStateException e) {
			e.printStackTrace();
			resMsg = "0";
		}
		response.getWriter().write(resMsg);
	}
	
	
	@RequestMapping(value = "/allsave_mode", method = RequestMethod.POST)
	private void allsave_mode(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String _glmc = (String) request.getParameter("_glmc");
		String _glfl = (String) request.getParameter("_glfl");
		String _textarea = (String) request.getParameter("_textarea");
		String id = (String) request.getParameter("mode_id");
		try {
			modeSevice.allsave_mode(id,_glmc,_glfl,_textarea);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}
	
	
	
	

}
