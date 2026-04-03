package com.javaweb.service;

import java.util.List;

import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

public interface IBuildingService {
	public ResponseDTO listStaffs(Long id);
	public List<BuildingSearchResponse> searchBuilding(BuildingSearchRequest buildingList);
}
