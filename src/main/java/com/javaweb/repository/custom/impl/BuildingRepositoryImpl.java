package com.javaweb.repository.custom.impl;

import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;

@Repository
public  class BuildingRepositoryImpl implements BuildingRepositoryCustom{
	@PersistenceContext
	private EntityManager entityManager;
	public static void joinTable(BuildingSearchRequest buildingList,StringBuilder sql) {
		if(buildingList.getAreaFrom()!=null||buildingList.getAreaTo()!=null) {
			sql.append("inner join rentarea on b.id =rentarea.buildingid ");
		}
	}
	public static void queryNormal(BuildingSearchRequest buildingList,StringBuilder where) {
		try {
			Field[] fields =BuildingSearchRequest.class.getDeclaredFields();
			for(Field item:fields) {
				item.setAccessible(true);
				String fieldName =item.getName();
				if(!fieldName.equals("typeCode")&&!fieldName.equals("district")&&!fieldName.startsWith("area")&&!fieldName.startsWith("rentPrice")) {
					Object value =item.get(buildingList);
					if(value!=null&&!value.equals("")) {
						if(item.getType().getName().equals("java.lang.Long")) {
							where.append(" and b."+fieldName+" = "+value);
						}
						else if(item.getType().getName().equals("java.lang.String")) {
							where.append(" and b." + fieldName + " like '%" + value + "%'");
						}
					}
					
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void querySpecial(BuildingSearchRequest buildingList,StringBuilder where) {
		Long rentAreaFrom=buildingList.getAreaFrom();
		Long rentAreaTo=buildingList.getAreaTo();
		if( rentAreaFrom!=null||rentAreaTo!=null) {
			if(  rentAreaFrom!=null) {
				where.append( " and rentarea.value >= "+rentAreaFrom);
			}
			if(rentAreaTo!=null ) {
				where.append(" and rentarea.value <= "+rentAreaTo);
			}
		}
		if(  buildingList.getRentPriceTo()!=null||buildingList.getRentPriceFrom() !=null) {
			where.append(" and exists (select * from rentarea where b.id = rentarea.buildingid ");
			if(buildingList.getRentPriceFrom() !=null) {
				where.append(" and b.rentprice >="+buildingList.getRentPriceFrom() );
			}
			if(buildingList.getRentPriceTo()!=null ) {
				where.append( " and b.rentprice <="+buildingList.getRentPriceTo() );
			}
			where.append(" ) ");
		}
		List<String> TypeCode=buildingList.getTypeCode();
		if(TypeCode!=null&&TypeCode.size()!=0) {
			where.append("and ( ");
			String sql=TypeCode.stream().map(it ->" b.type like '%"+it+"%' ").collect(Collectors.joining(" and "));
			where.append(sql);
			where.append(" ) ");
		}
	}
	@Override
	public List<BuildingEntity> searchBuildings(BuildingSearchRequest buildingList){
		StringBuilder sql=new StringBuilder("Select b.* from building b ");
		joinTable(buildingList,sql);
		StringBuilder where=new StringBuilder(" where 1=1 ");
		queryNormal(buildingList,where);
		querySpecial(buildingList,where);
		where.append(" group by b.id ");
		sql.append(where);
		Query query=entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
		return query.getResultList();
	}
}
