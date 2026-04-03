package com.javaweb.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="assignmentbuilding")
public class AssignBuildingEntity extends BaseEntity{
	@ManyToOne
	@JoinColumn(name="buildingid")
	private BuildingEntity buildingEntity;
	
	@ManyToOne
	@JoinColumn(name="staffid")
	private UserEntity staffs;

	public BuildingEntity getBuildingEntity() {
		return buildingEntity;
	}

	public void setBuildingEntity(BuildingEntity buildingEntity) {
		this.buildingEntity = buildingEntity;
	}

	public UserEntity getStaffs() {
		return staffs;
	}

	public void setStaffs(UserEntity staffs) {
		this.staffs = staffs;
	}
	
}
