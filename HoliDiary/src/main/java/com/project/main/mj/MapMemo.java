package com.project.main.mj;

public class MapMemo {
	private int map_num;
	private String map_placeName;
	private String map_infoMemo;
	
	public MapMemo() {
		// TODO Auto-generated constructor stub
	}

	public MapMemo(int map_num, String map_placeName, String map_infoMemo) {
		super();
		this.map_num = map_num;
		this.map_placeName = map_placeName;
		this.map_infoMemo = map_infoMemo;
	}

	public int getMap_num() {
		return map_num;
	}

	public void setMap_num(int map_num) {
		this.map_num = map_num;
	}

	public String getMap_placeName() {
		return map_placeName;
	}

	public void setMap_placeName(String map_placeName) {
		this.map_placeName = map_placeName;
	}

	public String getMap_infoMemo() {
		return map_infoMemo;
	}

	public void setMap_infoMemo(String map_infoMemo) {
		this.map_infoMemo = map_infoMemo;
	}
	
	
	
}
