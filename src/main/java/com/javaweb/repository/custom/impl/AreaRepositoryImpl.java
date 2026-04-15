package com.javaweb.repository.custom.impl;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.javaweb.entity.AreaEntity;
import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.repository.AreaRepository;

@Repository
public class AreaRepositoryImpl implements AreaRepository{
	@PersistenceContext
	private EntityManager entityManager;
	@Override
	@Transactional
	public void deleteAreaByBuildingId(List<Long> ids) {
		StringBuilder sql1= new StringBuilder();
		String idsStr = ids.stream().map(String::valueOf).collect(Collectors.joining(","));
		sql1.append("delete from rentarea where buildingid IN ( "+idsStr+" )  " );
		Query query=entityManager.createNativeQuery(sql1.toString(),AreaEntity.class);
		query.executeUpdate(); 
		StringBuilder sql2= new StringBuilder();
		sql2.append("delete from assignmentbuilding where buildingid IN ("+idsStr+")");
		Query query2=entityManager.createNativeQuery(sql2.toString(),AssignBuildingEntity.class);
		query2.executeUpdate(); 
	}
}
