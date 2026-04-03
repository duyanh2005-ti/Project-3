package com.javaweb.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;

@RestController(value="BuildingApiOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
	@Autowired
	private IBuildingService buildingService;
	@PostMapping
	public BuildingDTO AddOrUpdateBuilding(@RequestBody BuildingDTO buidlingDto) {
		return buidlingDto;
	}
	@DeleteMapping("/{ids}")
	public void deleteBuilding(@PathVariable List<Long> ids) {
		System.out.print("ok");
	}
	@GetMapping("/{id}/staffs")
	public ResponseDTO loadStaff(@PathVariable Long id){
		ResponseDTO result =buildingService.listStaffs(id);
		return result;
	}
	@PostMapping("/assignment")
	public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
		
	}
}
