package com.project.main.js;

import java.util.Map;

public interface SubscribeMapper {

	String[] getMySubscribe(User u);

	SubscribeInfo getSubscribeInfo(String subscribeID);

	SubscribeInfo mysubSearch(Map<String, String> element);

	int mysubCancel(String subscribeNo);


}
