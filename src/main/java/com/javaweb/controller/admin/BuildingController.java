package com.javaweb.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;


@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IBuildingService buildingService;
	@Autowired
	private BuildingRepository buildingRepoditory;
	
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
	@RequestMapping(value ="/admin/building-edit", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public void BuildingGet(@RequestBody BuildingDTO building){
		BuildingEntity buildEntity =new BuildingEntity();
		buildEntity.setName(building.getName());
		buildEntity.setDistrict(building.getDistrict());
		buildEntity.setWard(building.getWard());
		buildEntity.setStreet(building.getStreet());
		buildEntity.setFloorArea(building.getFloorArea());
		buildEntity.setLevel(building.getLevel());
		buildEntity.setManagerPhone(building.getManagerPhone());
		buildEntity.setManagerName(building.getManagerName());
		String type = String.join(",",building.getTypeCode());
		buildEntity.setTypeCode(type);
		buildingRepoditory.save(buildEntity);
		try {
		    buildingRepoditory.save(buildEntity);
		    System.out.println("SAVE OK");
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}
}
