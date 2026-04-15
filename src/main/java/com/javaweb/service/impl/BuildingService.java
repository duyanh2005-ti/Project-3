package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.AreaEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;

@Service
public class BuildingService implements IBuildingService {

	@Autowired
	private IBuildingService buildingService;
	@Autowired
	private BuildingRepository buildingRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private BuildingConverter buildingConverter;

	@Override
	public ResponseDTO listStaffs(Long id) {
		BuildingEntity building = buildingRepository.findById(id).get();
		List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
		List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
		List<UserEntity> staffAssign = building.getUserEntities();
		ResponseDTO responseDTO = new ResponseDTO();
		for (UserEntity it : staffs) {
			StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
			staffResponseDTO.setFullName(it.getFullName());
			staffResponseDTO.setStaffId(it.getId());
			if (staffAssign.contains(it)) {
				staffResponseDTO.setChecked("checked");
			} else {
				staffResponseDTO.setChecked("");
			}
			staffResponseDTOs.add(staffResponseDTO);
		}
		responseDTO.setData(staffResponseDTOs);
		return responseDTO;
	}

	@Override
	public List<BuildingSearchResponse> searchBuilding(BuildingSearchRequest buildingSearchRequest) {
		List<BuildingEntity> buildings = buildingRepository.searchBuildings(buildingSearchRequest);
		List<BuildingSearchResponse> buildingList = new ArrayList<>();
		for (BuildingEntity item : buildings) {
			BuildingSearchResponse building = new BuildingSearchResponse();
			building.setName(item.getName());
			building.setAddress(item.getStreet() + ',' + item.getWard() + ',' + item.getDistrict());
			building.setNumberOfBasement(item.getNumberOfBasement());
			building.setManagerName(item.getManagerName());
			building.setManagerPhone(item.getManagerPhone());
			building.setFloorArea(item.getFloorArea());
			List<AreaEntity> rentAreas = item.getAreaEntites();
			String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
			building.setRentArea(areaResult);
			building.setBrokerageFee(item.getBrokerageFee());
			building.setId(item.getId());
			buildingList.add(building);

		}
		return buildingList;
	}
	@Override
	public void updatebuilding(BuildingDTO buildingDTO) {
		BuildingEntity buildingEntity=buildingRepository.findById(buildingDTO.getId()).get();
		buildingEntity.setName(buildingDTO.getName());
		buildingEntity.setDistrict(buildingDTO.getDistrict());
		buildingEntity.setServiceFee(buildingDTO.getServiceFee());
		buildingEntity.setStreet(buildingDTO.getStreet());
		buildingEntity.setCarFee(buildingDTO.getCarFee());
		buildingEntity.setBrokerageFee(buildingDTO.getBrokerageFee());
		buildingEntity.setDeposit(buildingDTO.getDeposit());
		buildingEntity.setDirection(buildingDTO.getDirection());  
		buildingEntity.setDecorationTime(buildingDTO.getDecorationTime());
		buildingEntity.setElectricityFee(buildingDTO.getElectricityFee());
		buildingEntity.setFloorArea(buildingDTO.getFloorArea());
		buildingEntity.setWard(buildingDTO.getWard());
		buildingEntity.setLevel(buildingDTO.getLevel());
		buildingEntity.setManagerName(buildingDTO.getManagerName());
		buildingEntity.setManagerPhone(buildingDTO.getManagerPhone());
		buildingEntity.setMotoFee(buildingDTO.getMotoFee());
		buildingEntity.setWaterFee(buildingDTO.getWaterFee());
//		buildingEntity.setAreaEntites(null);
		System.out.print("ok");
		buildingRepository.save(buildingEntity);
	}
}
