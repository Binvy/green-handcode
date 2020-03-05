package com.tstar.portal.model;

import java.io.Serializable;
import java.util.*;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:12
 */
public class ResultMap extends Data implements Map, Serializable {

	private Map map;

	public ResultMap() {
		this.map = new HashMap();
	}

	public ResultMap(Map map) {
		this.map = map;
	}

	public int size() {
		return this.map.size();
	}

	public boolean isEmpty() {
		return this.map.isEmpty();
	}

	public boolean containsKey(Object key) {
		return this.map.containsKey(this.toLowerCase(key));
	}

	private Object toLowerCase(Object key) {
		if (key != null && key instanceof String) {
			key = ((String)key).toLowerCase();
		}

		return key;
	}

	public boolean containsValue(Object value) {
		return this.map.containsValue(value);
	}

	public Object get(Object key) {
		return this.map.get(this.toLowerCase(key));
	}

	public Object put(Object key, Object value) {
		return this.map.put(this.toLowerCase(key), value);
	}

	public Object putnoCase(Object key, Object value) {
		return this.map.put(key, value);
	}

	public Object remove(Object key) {
		return this.map.remove(this.toLowerCase(key));
	}

	public void putAll(Map m) {
		Iterator i = m.entrySet().iterator();

		while(i.hasNext()) {
			Entry e = (Entry)i.next();
			this.put(e.getKey(), e.getValue());
		}

	}

	public void clear() {
		this.map.clear();
	}

	public Set keySet() {
		return this.map.keySet();
	}

	public Collection values() {
		return this.map.values();
	}

	public Set entrySet() {
		return this.map.entrySet();
	}

	public String toString() {
		return this.map.toString();
	}

	public String getAttribute(String name) {
		return this.getString(name);
	}

	public void setAttribute(String name, String value) {
		this.put(name, value);
	}

	public Map getMap() {
		return this.map;
	}

	public void setMap(Map map) {
		this.map = map;
	}

}
