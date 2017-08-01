package com.ikkong.core.jfinal.ext.kit.excel;

import java.util.LinkedHashMap;
import java.util.Set;

@SuppressWarnings("serial")
public class CellableMap extends LinkedHashMap<String, Object> implements Cellable {

	public String[] getHeaderCellValue() {
		return keySet().toArray(new String[] {});
	}

	public String[] getCellValues() {

		String[] cellValues = new String[size()];
		Set<String> keys = keySet();
		int index = 0;
		for (String key : keys) {
			cellValues[index++] = get(key).toString();
		}
		return cellValues;
	}

}
