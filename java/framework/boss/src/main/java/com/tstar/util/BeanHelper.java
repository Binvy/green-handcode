package com.tstar.util;

import com.tstar.ocs.model.OcsCustomerBill;
import com.tstar.ocs.model.OcsUserBill;
import org.apache.commons.lang3.StringUtils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:20
 */
public class BeanHelper {

	private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public BeanHelper() {
	}

	public static <T> List<T> getList(Class<T> clazz, ResultSet rs) throws Exception {
		Field field = null;
		List<T> lst = new ArrayList();
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCount = rsmd.getColumnCount();
		String[] colNames = new String[colCount];

		for(int i = 0; i < colCount; ++i) {
			colNames[i] = rsmd.getColumnName(i + 1);
		}

		while(rs.next()) {
			T t = clazz.newInstance();

			for(int i = 0; i < colCount; ++i) {
				Object value = rs.getObject(colNames[i]);
				Class<?> dbType = value.getClass();
				field = clazz.getDeclaredField(colNames[i]);
				Class<?> beanType = field.getClass();
				if (dbType != beanType) {
					throw new RuntimeException(dbType.getName() + " cannot be resolved to " + beanType.getName());
				}

				PropertyDescriptor pd = new PropertyDescriptor(colNames[i], clazz);
				Method m = pd.getWriteMethod();
				m.setAccessible(true);
				m.invoke(t, value);
			}

			lst.add(t);
		}

		return lst;
	}

	public static <T> void bean2map(T obj, Map<String, Object> map) throws Exception {
		Class<?> clazz = obj.getClass();
		BeanInfo bi = Introspector.getBeanInfo(clazz);
		PropertyDescriptor[] pds = bi.getPropertyDescriptors();
		PropertyDescriptor[] pdsTmp = pds;
		for(int i = 0; i < pds.length; ++i) {
			PropertyDescriptor pd = pdsTmp[i];
			if (!pd.getPropertyType().isArray()) {
				String name = pd.getName();
				if (map.get(name) == null) {
					Object value = pd.getReadMethod().invoke(obj, (Object[])null);
					map.put(name, value);
				}
			}
		}

	}

	public static <T> void setProperties(T obj, Map<String, String> map) throws Exception {
		Class<?> clazz = obj.getClass();
		Field[] fields = clazz.getDeclaredFields();
		Field[] fieldsTmp = fields;
		for(int i = 0; i < fields.length; ++i) {
			Field field = fieldsTmp[i];
			Class<?> propType = field.getType();
			String fieldName = field.getName();
			String value = (String)map.get(fieldName);
			if (value != null) {
				Object parm = str2object(propType, value);
				PropertyDescriptor pd = new PropertyDescriptor(fieldName, clazz);
				Method m = pd.getWriteMethod();
				m.setAccessible(true);
				m.invoke(obj, parm);
			}
		}

	}

	public static <T> void setProperty(T obj, String name, Object value) throws Exception {
		PropertyDescriptor pd = new PropertyDescriptor(name, obj.getClass());
		Method m = pd.getWriteMethod();
		m.setAccessible(true);
		m.invoke(obj, value);
	}

	public static <T> Object getPropertyValue(T obj, String name) throws Exception {
		PropertyDescriptor pd = new PropertyDescriptor(name, obj.getClass());
		return pd.getReadMethod().invoke(obj, (Object[])null);
	}

	public static <T> void setPropertyFromStr(T obj, String name, String value) throws Exception {
		Class<?> clazz = obj.getClass();
		PropertyDescriptor pd = new PropertyDescriptor(name, clazz);
		Method m = pd.getWriteMethod();
		Class<?> propType = clazz.getDeclaredField(name).getType();
		Object parm = str2object(propType, value);
		m.setAccessible(true);
		m.invoke(obj, parm);
	}

	public static final <T> T str2object(Class<T> type, String s) {
		Object res = null;
		if (type == String.class) {
			res = s;
		} else if (type != Integer.TYPE && type != Integer.class) {
			if (type != Short.TYPE && type != Short.class) {
				if (type != Long.TYPE && type != Long.class) {
					if (type != Byte.TYPE && type != Byte.class) {
						if (type != Float.TYPE && type != Float.class) {
							if (type != Double.TYPE && type != Double.class) {
								if (type == BigDecimal.class) {
									res = new BigDecimal(s);
								} else if (type != Boolean.TYPE && type != Boolean.class) {
									if (!Date.class.isAssignableFrom(type)) {
										throw new IllegalArgumentException(String.format("invalid data type: '%s'", type));
									}

									try {
										res = sdf2.parse(s);
									} catch (Exception var6) {
										try {
											res = sdf1.parse(s);
										} catch (Exception var5) {
										}
									}
								} else {
									res = Boolean.parseBoolean(s);
								}
							} else {
								res = Double.parseDouble(s);
							}
						} else {
							res = Float.parseFloat(s);
						}
					} else {
						res = Byte.parseByte(s);
					}
				} else {
					res = Long.parseLong(s);
				}
			} else {
				res = Short.parseShort(s);
			}
		} else {
			res = Integer.parseInt(s);
		}

		return (T)res;
	}

	public static <T> void addValue(T obj, String name, Object value) {
		if (!StringUtils.isEmpty(name)) {
			try {
				Object propertyValue = getPropertyValue(obj, name);
				if (value.getClass() == Integer.class) {
					propertyValue = (Integer)value + (Integer)propertyValue;
				} else if (value.getClass() == BigDecimal.class) {
					propertyValue = new BigDecimal(((BigDecimal)propertyValue).doubleValue() + ((BigDecimal)value).doubleValue());
				}

				setProperty(obj, name, propertyValue);
			} catch (Exception var4) {
			}
		}

	}

	public static <T1, T2> void addValue(T1 obj1, T2 obj2, boolean isAdd) throws Exception {
		Class<?> clazz2 = obj2.getClass();
		BeanInfo bi = Introspector.getBeanInfo(clazz2);
		PropertyDescriptor[] pds = bi.getPropertyDescriptors();
		PropertyDescriptor[] var9 = pds;
		int var8 = pds.length;

		for(int var7 = 0; var7 < var8; ++var7) {
			PropertyDescriptor pd2 = var9[var7];
			if (pd2.getPropertyType() == Integer.class || pd2.getPropertyType() == BigDecimal.class) {
				String name = pd2.getName();
				if (!"id".equals(name) && !"billId".equals(name)) {
					Object value2 = pd2.getReadMethod().invoke(obj2, (Object[])null);
					if (value2 != null) {
						PropertyDescriptor pd1 = new PropertyDescriptor(name, obj1.getClass());
						Object value1 = pd1.getReadMethod().invoke(obj1, (Object[])null);
						Object value = null;
						if (value1.getClass() == Integer.class) {
							if (isAdd) {
								value = (Integer)value1 + (Integer)value2;
							} else {
								value = (Integer)value1 - (Integer)value2;
							}
						} else if (value1.getClass() == BigDecimal.class) {
							if (isAdd) {
								value = new BigDecimal(((BigDecimal)value1).doubleValue() + ((BigDecimal)value2).doubleValue());
							} else {
								value = new BigDecimal(((BigDecimal)value1).doubleValue() - ((BigDecimal)value2).doubleValue());
							}
						}

						if (value != null) {
							Method m = pd1.getWriteMethod();
							m.setAccessible(true);
							m.invoke(obj1, value);
						}
					}
				}
			}
		}

	}

	public static void main(String[] args) throws Exception {
		OcsCustomerBill customerBill = new OcsCustomerBill();
		OcsUserBill userBill = new OcsUserBill();
		customerBill.setId(10);
		userBill.setId(101);
		userBill.setBillId(10);
		userBill.setHc1(1);
		customerBill.setAmountDue(new BigDecimal(100));
		userBill.setAmountDue(new BigDecimal(20));
		addValue(customerBill, userBill, false);
		System.out.println("id=" + customerBill.getId());
		System.out.println("amountDue=" + customerBill.getAmountDue());
	}

}
