package com.javaweb.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IBuildingService buildingService;
	
	@RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
	public ModelAndView BuildingList(@ModelAttribute BuildingSearchRequest buildingList, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/building/list");
		mav.addObject("modelSearch", buildingList);
		List<BuildingSearchResponse> buildings =buildingService.searchBuilding(buildingList);
		mav.addObject("modelBuildingList", buildings);
		mav.addObject("ListStaffs",userService.getStaffs());
		mav.addObject("districts",districtCode.type());
		mav.addObject("typeCodes",buildingType.type());
		return mav;
	}

	@RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
	public ModelAndView BuildingEdit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/building/edit");
		BuildingDTO building =new BuildingDTO();
		mav.addObject("buildingEdit",building);
		mav.addObject("districts",districtCode.type());
		mav.addObject("typeCodes",buildingType.type());
		return mav;
	}
	@RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
	public ModelAndView BuildingEdit(@PathVariable("id") Long Id,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/building/edit");
		BuildingDTO building =new BuildingDTO();
		building.setId(Id);
		building.setName("garden building");
		mav.addObject("buildingEdit",building);
		mav.addObject("districts",districtCode.type());
		mav.addObject("typeCodes",buildingType.type());
		return mav;
	}
}
