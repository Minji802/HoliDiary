package com.project.main.sm;


import java.util.Map;

public interface ScheduleMapper {

	int insertSchedule(Schedule s);

	Schedule getSchedule(Schedule s);

	String[] getAllSchedule(Map<String, String> vals);

	int deleteSchedule(Schedule s);

	int updateSchedule(Schedule s);

}
