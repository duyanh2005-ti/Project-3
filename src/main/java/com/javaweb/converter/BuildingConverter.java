package com.javaweb.converter;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.BuildingRepository;
@Component
public class BuildingConverter {
	@Autowired
	private BuildingRepository buildingRepository;
	public BuildingDTO BuildingEntityToDto(Long Id) {
		BuildingEntity buildingEntity=buildingRepository.findById(Id).get();
		List<String> type =Arrays.asList(buildingEntity.getTypeCode().split(","));
		BuildingDTO buildingDTO =new BuildingDTO();
		buildingDTO.setId(buildingEntity.getId());	
		buildingDTO.setBrokerageFee(buildingEntity.getBrokerageFee());	
		buildingDTO.setCarFee(buildingEntity.getCarFee());	
		buildingDTO.setDecorationTime(buildingEntity.getDecorationTime());	
		buildingDTO.setDeposit(buildingEntity.getDeposit());	
		buildingDTO.setDirection(buildingEntity.getDirection());	
		buildingDTO.setDistrict(buildingEntity.getDistrict());	
		buildingDTO.setElectricityFee(buildingEntity.getElectricityFee());	
		buildingDTO.setFloorArea(buildingEntity.getFloorArea());	
		buildingDTO.setLevel(buildingEntity.getLevel());	
		buildingDTO.setManagerName(buildingEntity.getManagerName());	
		buildingDTO.setManagerPhone(buildingEntity.getManagerPhone());	
		buildingDTO.setMotoFee(buildingEntity.getMotoFee());	
		buildingDTO.setName(buildingEntity.getName());	
		buildingDTO.setNote(buildingEntity.getNote());	
		buildingDTO.setNumberOfBasement(buildingEntity.getNumberOfBasement());	
		buildingDTO.setOvertimeFee(buildingEntity.getOvertimeFee());	
		buildingDTO.setPayment(buildingEntity.getPayment());	
		buildingDTO.setTypeCode(type);	
		return buildingDTO;
	}
}
