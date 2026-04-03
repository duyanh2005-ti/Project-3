package com.javaweb.repository.custom;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;

public interface BuildingRepositoryCustom {
	public List<BuildingEntity> searchBuildings(BuildingSearchRequest buildingList);
}
