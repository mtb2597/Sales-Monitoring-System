package com.atmcasestudyapi.atmcasestudy.model;

import org.springframework.stereotype.Component;

@Component
public class ResponseModel {

	private int responseCode;
	private Object data;
	private String message;

	public int getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(int responseCode) {
		this.responseCode = responseCode;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ResponseModel() {
		super();
	}

	public ResponseModel response(int responseCode, Object data, String message) {
		this.data = data;
		this.message = message;
		this.responseCode = responseCode;
		return this;
	}

}
