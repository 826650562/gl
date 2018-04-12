package com.soecode.lyf.web;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private ModeSevice modeSevice;

	private Mode mode;

	private String ObjPath;

	private String MtlPath;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	private String list(Model model) {
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);

		return "home";
	}

	@RequestMapping(value = "/modejsp", method = RequestMethod.GET)
	private String modejsp(Model model) {
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		return "mode1";
	}

	// 规范管理
	@RequestMapping(value = "/gfgl", method = RequestMethod.GET)
	private String gfgl(Model model) {
		return "gfgl";
	}

	@RequestMapping(value = "/addmodel", method = RequestMethod.GET)
	private String addmodel(Model model, HttpServletRequest request) {
		String tag_id = (String) request.getParameter("tag_id");
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		if (!StringUtils.isNullOrEmpty(tag_id)) {
			model.addAttribute("is_show_Create", tag_id);
		}
		return "addmodel";
	}

	// 添加案例中的标记
	@RequestMapping(value = "/add_tagename", method = RequestMethod.POST)
	private void add_tagename(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String tage_name = (String) request.getParameter("_tage_name");
		try {
			List res = modeSevice.addTageName(tage_name);
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/get_GFinfo", method = RequestMethod.POST)
	private void get_GFinfo(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		try {
			List res = modeSevice.getAllGFPars();
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/get_guifanInfo", method = RequestMethod.POST)
	private void get_guifanInfo(Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
		String _id = (String) request.getParameter("_id");
		try {
			List res = modeSevice.getAllGFParsNode(_id);
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/add_guifan", method = RequestMethod.POST)
	private void add_guifan(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String _pid = (String) request.getParameter("_pid");
		String _parId = (String) request.getParameter("_parId");

		try {
			String resString = modeSevice.add_guifan(_pid, _parId);
			response.getWriter().write(resString);
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/delete_guifan", method = RequestMethod.POST)
	private void delete_guifan(Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
		String _pid = (String) request.getParameter("_pid");
		String _parId = (String) request.getParameter("_parId");

		try {
			String resString = modeSevice.delete_guifan(_pid, _parId);
			response.getWriter().write(resString);
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/save_info", method = RequestMethod.POST)
	private void save_info(Model model, HttpServletRequest request, HttpServletResponse response) {
		String _gfmc = (String) request.getParameter("_gfmc");
		String _gfbb = (String) request.getParameter("_gfbb");
		String _gfjj = (String) request.getParameter("_gfjj");
		String youxianji = (String) request.getParameter("youxianji");
		String type = (String) request.getParameter("type");

		String res = modeSevice.saveGF(_gfmc, _gfbb, _gfjj, youxianji, type);
		try {
			response.getWriter().write(res);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/search_guifanPar", method = RequestMethod.POST)
	private void search_guifanPar(Model model, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String _gjz = (String) request.getParameter("_gjz");
		List res = modeSevice.search_guifanPar(_gjz);
		try {
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/search_guifanParPlus", method = RequestMethod.POST)
	private void search_guifanParPlus(Model model, HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String _gjz = (String) request.getParameter("_gjz");
		List res = modeSevice.search_guifanParPlus(_gjz);
		try {
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loadMode")
	private String loadMode(Model model) {
		return "mode";
	}

	@RequestMapping(value = "/loadCase")
	private void loadCase(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String _id = (String) request.getParameter("_id");
		List _cases=null;
		try {
			if( null !=_id ){
			 _cases= modeSevice.getCases(_id);
			}else{
			 _cases= modeSevice.getCases("");
			}
			JSONArray json = JSONArray.fromObject(_cases);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	// gsm 跳转编辑案例界面
	@RequestMapping(value = "/case", method = RequestMethod.GET)
	private String addcase(Model model) {
		String[] types = modeSevice.getTypes();
		String[] tages = modeSevice.getTages();
		model.addAttribute("_types", types);
		model.addAttribute("_tages", tages);

		return "case";
	}

	// 这里需要修改
	@RequestMapping(value = "/getModePath")
	private void getModePath(HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
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
		response.setCharacterEncoding("UTF-8");
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
		response.setCharacterEncoding("UTF-8");
		String _type = (String) request.getParameter("_type");
		try {
			modeSevice.deleteModeType(_type);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	/**
	 * @param model
	 * @return 删除锅炉
	 * @throws IOException
	 */
	@RequestMapping(value = "/deleteMode", method = RequestMethod.POST)
	private void deleteMode(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String _id = (String) request.getParameter("_id");
		try {
			modeSevice.deleteMode(_id);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/deleteCase", method = RequestMethod.POST)
	private void deleteCase(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String _id = (String) request.getParameter("_id");
		try {
			modeSevice.deleteMode(_id);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/saveModeParts", method = RequestMethod.POST)
	private void saveModeParts(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
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
		response.setCharacterEncoding("UTF-8");
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

	@RequestMapping(value = "/getguifanByid", method = RequestMethod.POST)
	private void getguifanByid(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String id = (String) request.getParameter("_id");
		try {
			List res = modeSevice.getguifanByid(id);
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/add_guifan_update", method = RequestMethod.POST)
	private void add_guifan(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String id = (String) request.getParameter("_id");
		String title = (String) request.getParameter("_title");
		String area = (String) request.getParameter("_area");

		try {
			String res = modeSevice.add_guifan(id, title, area);
			response.getWriter().write(res);
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/delete_guifan_All", method = RequestMethod.POST)
	private void delete_guifan_All(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String parid = (String) request.getParameter("parid");

		try {
			String res = modeSevice.delete_guifanAll(parid);
			response.getWriter().write(res);
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/getInfoOfPart", method = RequestMethod.POST)
	private void getInfoOfPart(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
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

	@RequestMapping(value = "/getModeById", method = RequestMethod.POST)
	private void getModeById(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String id = (String) request.getParameter("_id");
		try {
			List res = modeSevice.getModeById(id);
			JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write(json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/update_part", method = RequestMethod.POST)
	private void update_part(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String id = (String) request.getParameter("_id");
		String name = (String) request.getParameter("name");
		String textArea = (String) request.getParameter("textArea");
		try {
			modeSevice.update_part(id, name, textArea);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	@RequestMapping(value = "/delete_part", method = RequestMethod.POST)
	private void delete_part(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
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
		response.setCharacterEncoding("UTF-8");
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
		response.setCharacterEncoding("UTF-8");
		try {
			long startTime = System.currentTimeMillis();
			String leftPath = session.getServletContext().getRealPath("/uploadFiles");
			String allName = modeSevice.MD5(new Date().getTime() + "-" + file.getOriginalFilename());
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
		response.setCharacterEncoding("UTF-8");
		String resMsg = "";
		String _id = (String) request.getParameter("_id");
		String _type = (String) request.getParameter("type");
		try {
			long startTime = System.currentTimeMillis();
			String leftPath = session.getServletContext().getRealPath("/uploadFiles");
			String allName = modeSevice.MD5(new Date().getTime() + "-" + file.getOriginalFilename());
			String path = leftPath + "\\" + allName;
			File newFile = new File(path);
			if (!newFile.getParentFile().exists()) {
				newFile.getParentFile().mkdirs();
			}
			file.transferTo(newFile);
			if (_type.equals("case")) {
				session.setAttribute("case_fengmian", allName);
			} else {
				modeSevice.upload_img(_id, allName);
			}

			response.getWriter().write(allName);

		} catch (IllegalStateException e) {
			e.printStackTrace();
			resMsg = "0";
		}
		response.getWriter().write(resMsg);
	}

	@RequestMapping(value = "/allsave_mode", method = RequestMethod.POST)
	private void allsave_mode(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		String _glmc = (String) request.getParameter("_glmc");
		String _glfl = (String) request.getParameter("_glfl");
		String _textarea = (String) request.getParameter("_textarea");
		String id = (String) request.getParameter("mode_id");
		try {
			modeSevice.allsave_mode(id, _glmc, _glfl, _textarea);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	// gsm 上传案例数据到数据库
	@RequestMapping(value = "/subCase", method = RequestMethod.POST)
	private void subCase(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException {
		response.setCharacterEncoding("UTF-8");
		try {
			String caseName = (String) request.getParameter("caseName");
			String caseType = (String) request.getParameter("caseType");
			String caseBrief = (String) request.getParameter("caseBrief");
			String caseTips = (String) request.getParameter("caseTips");

			String img = (String) session.getAttribute("case_fengmian");
			if ("".equals(img)) {
				modeSevice.subCase(caseName, caseType, caseBrief, caseTips, "");
			} else {
				modeSevice.subCase(caseName, caseType, caseBrief, caseTips, img);
				session.setAttribute("case_fengmian", "");
			}

			// JSONArray json = JSONArray.fromObject(res);
			response.getWriter().write("1000");
		} catch (Exception e) {
			// TODO: handle exception
			response.getWriter().write("1001");
		}
	}

	// gsm 加载首页数据
	@RequestMapping(value = "/loadModel", method = RequestMethod.POST)
	private void loadModel(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
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
