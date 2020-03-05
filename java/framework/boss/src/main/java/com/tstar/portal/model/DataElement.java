package com.tstar.portal.model;

import org.w3c.dom.*;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:18
 */
public class DataElement extends Data implements Map {
	private Element element;

	public DataElement(Element element) {
		this.element = element;
	}

	public String getTagName() {
		return this.element.getTagName();
	}

	public String getAttribute(String name) {
		return this.element.getAttribute(name);
	}

	public void setAttribute(String name, String value) throws DOMException {
		this.element.setAttribute(name, value);
	}

	public void removeAttribute(String name) throws DOMException {
		this.element.removeAttribute(name);
	}

	public Attr getAttributeNode(String name) {
		return this.element.getAttributeNode(name);
	}

	public Attr setAttributeNode(Attr newAttr) throws DOMException {
		return this.element.setAttributeNode(newAttr);
	}

	public Attr removeAttributeNode(Attr oldAttr) throws DOMException {
		return this.element.removeAttributeNode(oldAttr);
	}

	public NodeList getElementsByTagName(String name) {
		return this.element.getElementsByTagName(name);
	}

	public String getAttributeNS(String namespaceURI, String localName) throws DOMException {
		return this.element.getAttributeNS(namespaceURI, localName);
	}

	public void setAttributeNS(String namespaceURI, String qualifiedName, String value) throws DOMException {
		this.element.setAttributeNS(namespaceURI, qualifiedName, value);
	}

	public void removeAttributeNS(String namespaceURI, String localName) throws DOMException {
		this.element.removeAttributeNS(namespaceURI, localName);
	}

	public Attr getAttributeNodeNS(String namespaceURI, String localName) throws DOMException {
		return this.element.getAttributeNodeNS(namespaceURI, localName);
	}

	public Attr setAttributeNodeNS(Attr newAttr) throws DOMException {
		return this.setAttributeNodeNS(newAttr);
	}

	public NodeList getElementsByTagNameNS(String namespaceURI, String localName) throws DOMException {
		return this.element.getElementsByTagNameNS(namespaceURI, localName);
	}

	public boolean hasAttribute(String name) {
		return this.element.hasAttribute(name);
	}

	public boolean hasAttributeNS(String namespaceURI, String localName) throws DOMException {
		return this.element.hasAttributeNS(namespaceURI, localName);
	}

	public String getNodeName() {
		return this.element.getNodeName();
	}

	public String getNodeValue() throws DOMException {
		return this.element.getNodeValue();
	}

	public void setNodeValue(String nodeValue) throws DOMException {
		this.element.setNodeValue(nodeValue);
	}

	public short getNodeType() {
		return this.element.getNodeType();
	}

	public Node getParentNode() {
		return this.element.getParentNode();
	}

	public NodeList getChildNodes() {
		return null;
	}

	public Node getFirstChild() {
		return this.element.getFirstChild();
	}

	public Node getLastChild() {
		return this.element.getLastChild();
	}

	public Node getPreviousSibling() {
		return this.element.getPreviousSibling();
	}

	public Node getNextSibling() {
		return this.element.getNextSibling();
	}

	public NamedNodeMap getAttributes() {
		return this.element.getAttributes();
	}

	public Document getOwnerDocument() {
		return this.element.getOwnerDocument();
	}

	public Node insertBefore(Node newChild, Node refChild) throws DOMException {
		return this.element.insertBefore(newChild, refChild);
	}

	public Node replaceChild(Node newChild, Node oldChild) throws DOMException {
		return this.element.replaceChild(newChild, oldChild);
	}

	public Node removeChild(Node oldChild) throws DOMException {
		return this.element.removeChild(oldChild);
	}

	public Node appendChild(Node newChild) throws DOMException {
		return this.element.appendChild(newChild);
	}

	public boolean hasChildNodes() {
		return this.element.hasChildNodes();
	}

	public Node cloneNode(boolean deep) {
		return this.element.cloneNode(deep);
	}

	public void normalize() {
		this.element.normalize();
	}

	public boolean isSupported(String feature, String version) {
		return this.element.isSupported(feature, version);
	}

	public String getNamespaceURI() {
		return this.element.getNamespaceURI();
	}

	public String getPrefix() {
		return this.element.getPrefix();
	}

	public void setPrefix(String prefix) throws DOMException {
		this.element.setPrefix(prefix);
	}

	public String getLocalName() {
		return this.element.getLocalName();
	}

	public boolean hasAttributes() {
		return this.element.hasAttributes();
	}

	public Object get(Object key) {
		return this.element.getAttribute((String)key);
	}

	public Object put(Object key, Object value) {
		String reslut = this.element.getAttribute((String)key);
		this.element.setAttribute((String)key, (String)value);
		return reslut;
	}

	public Object remove(Object key) {
		String reslut = this.element.getAttribute((String)key);
		this.element.removeAttribute((String)key);
		return reslut;
	}

	public void clear() {
	}

	public boolean containsKey(Object key) {
		return false;
	}

	public boolean containsValue(Object value) {
		return false;
	}

	public Set entrySet() {
		return null;
	}

	public boolean isEmpty() {
		return false;
	}

	public Set keySet() {
		return null;
	}

	public void putAll(Map m) {
	}

	public int size() {
		return 0;
	}

	public Collection values() {
		return null;
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

	public short compareDocumentPosition(Node other) throws DOMException {
		return 0;
	}

	public String getBaseURI() {
		return null;
	}

	public Object getFeature(String feature, String version) {
		return null;
	}

	public String getTextContent() throws DOMException {
		return null;
	}

	public Object getUserData(String key) {
		return null;
	}

	public boolean isDefaultNamespace(String namespaceURI) {
		return false;
	}

	public boolean isEqualNode(Node arg) {
		return false;
	}

	public boolean isSameNode(Node other) {
		return false;
	}

	public String lookupNamespaceURI(String prefix) {
		return null;
	}

	public String lookupPrefix(String namespaceURI) {
		return null;
	}

	public void setTextContent(String textContent) throws DOMException {
	}

	public Object setUserData(String key, Object data, UserDataHandler handler) {
		return null;
	}
}
