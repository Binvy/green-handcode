package com.tstar.portal.model;

import com.tstar.util.DateUtil;
import org.w3c.dom.*;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.Set;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:12
 */
public abstract class Data implements Map, Element {

	public Data() {
	}

	public static Data creatData(Object object) {
		if (object instanceof Map) {
			return new ResultMap((Map)object);
		} else if (object instanceof Element) {
			return new DataElement((Element)object);
		} else {
			throw new IllegalArgumentException("不能使用该类型构建，现在暂时只支持Map和Element");
		}
	}

	public Object get(Object key, Object defaultValue) {
		Object result = this.get(key);
		if (result == null || result.equals("")) {
			result = defaultValue;
		}

		return result;
	}

	public String getString(Object key) {
		Object result = this.get(key);
		return result == null ? null : result.toString().trim();
	}

	public String getString(Object key, String defaultValue) {
		Object result = this.get(key, defaultValue);
		return result == null ? null : result.toString().trim();
	}

	public String getDateString(Object key) {
		Date date = (Date)this.get(key);
		return DateUtil.format(date, "yyyy-MM-dd");
	}

	public String getDateString(Object key, String defaultValue) {
		String result = defaultValue;
		Date date = (Date)this.get(key);
		if (date != null) {
			result = DateUtil.format(date, "yyyy-MM-dd");
		}

		return result;
	}

	public int getInt(Object key) {
		return (int)Double.parseDouble(this.getString(key));
	}

	public int getInt(Object key, int defaultValue) {
		String result = this.getString(key, String.valueOf(defaultValue));
		if (result.length() < 1) {
			result = "0";
		}

		return (int)Double.parseDouble(result);
	}

	public long getLong(Object key) {
		return (long)Double.parseDouble(this.getString(key));
	}

	public long getLong(Object key, long defaultValue) {
		String result = this.getString(key, String.valueOf(defaultValue));
		if (result.length() < 1) {
			result = "0";
		}

		return (long)Double.parseDouble(result);
	}

	public double getDouble(Object key) {
		return Double.parseDouble(this.getString(key));
	}

	public double getDouble(Object key, double defaultValue) {
		return Double.parseDouble(this.getString(key, String.valueOf(defaultValue)));
	}

	public int size() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public boolean isEmpty() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public boolean containsKey(Object key) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public boolean containsValue(Object value) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Object get(Object key) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Object put(Object key, Object value) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Object remove(Object key) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void putAll(Map t) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void clear() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Set keySet() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Collection values() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Set entrySet() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public String getTagName() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void removeAttribute(String name) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public boolean hasAttribute(String name) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public String getAttribute(String name) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void removeAttributeNS(String namespaceURI, String localName) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void setAttribute(String name, String value) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public boolean hasAttributeNS(String namespaceURI, String localName) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Attr getAttributeNode(String name) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Attr removeAttributeNode(Attr oldAttr) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Attr setAttributeNode(Attr newAttr) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Attr setAttributeNodeNS(Attr newAttr) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public NodeList getElementsByTagName(String name) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public String getAttributeNS(String namespaceURI, String localName) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void setAttributeNS(String namespaceURI, String qualifiedName, String value) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Attr getAttributeNodeNS(String namespaceURI, String localName) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public NodeList getElementsByTagNameNS(String namespaceURI, String localName) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public short getNodeType() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void normalize() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public boolean hasAttributes() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public boolean hasChildNodes() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public String getLocalName() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public String getNamespaceURI() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public String getNodeName() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public String getNodeValue() throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public String getPrefix() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void setNodeValue(String nodeValue) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public void setPrefix(String prefix) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Document getOwnerDocument() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public NamedNodeMap getAttributes() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node getFirstChild() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node getLastChild() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node getNextSibling() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node getParentNode() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node getPreviousSibling() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node cloneNode(boolean deep) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public NodeList getChildNodes() {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public boolean isSupported(String feature, String version) {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node appendChild(Node newChild) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node removeChild(Node oldChild) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node insertBefore(Node newChild, Node refChild) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public Node replaceChild(Node newChild, Node oldChild) throws DOMException {
		throw new IllegalStateException("该方法未实现，不能使用！");
	}

	public static void dataAdd(Object o1, Object o2, String[] keys) {
		Data data1 = creatData(o1);
		Data data2 = creatData(o2);

		for(int i = 0; i < keys.length; ++i) {
			String str1 = data1.getString(keys[i]);
			if (str1 == null || str1.length() == 0) {
				str1 = "0";
			}

			String str2 = data2.getString(keys[i]);
			if (str1 == null || str2.length() == 0) {
				str2 = "0";
			}

			BigDecimal d1 = new BigDecimal(str1);
			BigDecimal d2 = new BigDecimal(str2);
			d1 = d1.add(d2);
			data1.put(keys[i], d1.toString());
		}

	}

	public TypeInfo getSchemaTypeInfo() {
		return null;
	}

	public void setIdAttribute(String name, boolean isId) throws DOMException {
	}

	public void setIdAttributeNS(String namespaceURI, String localName, boolean isId) throws DOMException {
	}

	public void setIdAttributeNode(Attr idAttr, boolean isId) throws DOMException {
	}

	public String getBaseURI() {
		return null;
	}

	public short compareDocumentPosition(Node other) throws DOMException {
		return 0;
	}

	public String getTextContent() throws DOMException {
		return null;
	}

	public void setTextContent(String textContent) throws DOMException {
	}

	public boolean isSameNode(Node other) {
		return false;
	}

	public String lookupPrefix(String namespaceURI) {
		return null;
	}

	public boolean isDefaultNamespace(String namespaceURI) {
		return false;
	}

	public String lookupNamespaceURI(String prefix) {
		return null;
	}

	public boolean isEqualNode(Node arg) {
		return false;
	}

	public Object getFeature(String feature, String version) {
		return null;
	}

	public Object setUserData(String key, Object data, UserDataHandler handler) {
		return null;
	}

	public Object getUserData(String key) {
		return null;
	}

}
