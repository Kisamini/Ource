package com.spring.ourvoice.cmmn;

import java.util.LinkedHashMap;

@SuppressWarnings("rawtypes")
public class CamelMap extends LinkedHashMap {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Override
	public Object put(Object key, Object value) {
		return super.put(CamelUtil.convert2CamelCase(key.toString()), value);
	}
}
