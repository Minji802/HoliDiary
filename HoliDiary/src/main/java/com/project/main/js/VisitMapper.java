package com.project.main.js;

import java.util.List;
import java.util.Map;

public interface VisitMapper {

	int getVisit(Map<String, Object> visitElement);

	int countVisit(Map<String, String> e);

	List<User> getTodayVisit(Map<String, String> e);

}
