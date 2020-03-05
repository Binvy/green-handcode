package com.tstar.callcenter.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:09
 */
public class UserEmplInfoExample {

	protected String orderByClause;
	protected boolean distinct;
	protected List<UserEmplInfoExample.Criteria> oredCriteria = new ArrayList();

	public UserEmplInfoExample() {
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public String getOrderByClause() {
		return this.orderByClause;
	}

	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	public boolean isDistinct() {
		return this.distinct;
	}

	public List<UserEmplInfoExample.Criteria> getOredCriteria() {
		return this.oredCriteria;
	}

	public void or(UserEmplInfoExample.Criteria criteria) {
		this.oredCriteria.add(criteria);
	}

	public UserEmplInfoExample.Criteria or() {
		UserEmplInfoExample.Criteria criteria = this.createCriteriaInternal();
		this.oredCriteria.add(criteria);
		return criteria;
	}

	public UserEmplInfoExample.Criteria createCriteria() {
		UserEmplInfoExample.Criteria criteria = this.createCriteriaInternal();
		if (this.oredCriteria.size() == 0) {
			this.oredCriteria.add(criteria);
		}

		return criteria;
	}

	protected UserEmplInfoExample.Criteria createCriteriaInternal() {
		UserEmplInfoExample.Criteria criteria = new UserEmplInfoExample.Criteria();
		return criteria;
	}

	public void clear() {
		this.oredCriteria.clear();
		this.orderByClause = null;
		this.distinct = false;
	}

	public static class Criteria extends UserEmplInfoExample.GeneratedCriteria {
		protected Criteria() {
		}
	}

	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return this.condition;
		}

		public Object getValue() {
			return this.value;
		}

		public Object getSecondValue() {
			return this.secondValue;
		}

		public boolean isNoValue() {
			return this.noValue;
		}

		public boolean isSingleValue() {
			return this.singleValue;
		}

		public boolean isBetweenValue() {
			return this.betweenValue;
		}

		public boolean isListValue() {
			return this.listValue;
		}

		public String getTypeHandler() {
			return this.typeHandler;
		}

		protected Criterion(String condition) {
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}

		}

		protected Criterion(String condition, Object value) {
			this(condition, value, (String)null);
		}

		protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, (String)null);
		}
	}

	protected abstract static class GeneratedCriteria {
		protected List<UserEmplInfoExample.Criterion> criteria = new ArrayList();

		protected GeneratedCriteria() {
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<UserEmplInfoExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<UserEmplInfoExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			} else {
				this.criteria.add(new UserEmplInfoExample.Criterion(condition));
			}
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			} else {
				this.criteria.add(new UserEmplInfoExample.Criterion(condition, value));
			}
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if (value1 != null && value2 != null) {
				this.criteria.add(new UserEmplInfoExample.Criterion(condition, value1, value2));
			} else {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
		}

		public UserEmplInfoExample.Criteria andUserIdIsNull() {
			this.addCriterion("user_id is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdIsNotNull() {
			this.addCriterion("user_id is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdEqualTo(long value) {
			this.addCriterion("user_id =", new Long(value), "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdNotEqualTo(long value) {
			this.addCriterion("user_id <>", new Long(value), "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdGreaterThan(long value) {
			this.addCriterion("user_id >", new Long(value), "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdGreaterThanOrEqualTo(long value) {
			this.addCriterion("user_id >=", new Long(value), "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdLessThan(long value) {
			this.addCriterion("user_id <", new Long(value), "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdLessThanOrEqualTo(long value) {
			this.addCriterion("user_id <=", new Long(value), "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdIn(List<Long> values) {
			this.addCriterion("user_id in", values, "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdNotIn(List<Long> values) {
			this.addCriterion("user_id not in", values, "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdBetween(long value1, long value2) {
			this.addCriterion("user_id between", new Long(value1), new Long(value2), "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserIdNotBetween(long value1, long value2) {
			this.addCriterion("user_id not between", new Long(value1), new Long(value2), "userId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameIsNull() {
			this.addCriterion("user_name is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameIsNotNull() {
			this.addCriterion("user_name is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameEqualTo(String value) {
			this.addCriterion("user_name =", value, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameNotEqualTo(String value) {
			this.addCriterion("user_name <>", value, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameGreaterThan(String value) {
			this.addCriterion("user_name >", value, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameGreaterThanOrEqualTo(String value) {
			this.addCriterion("user_name >=", value, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameLessThan(String value) {
			this.addCriterion("user_name <", value, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameLessThanOrEqualTo(String value) {
			this.addCriterion("user_name <=", value, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameLike(String value) {
			this.addCriterion("user_name like", value, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameNotLike(String value) {
			this.addCriterion("user_name not like", value, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameIn(List<String> values) {
			this.addCriterion("user_name in", values, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameNotIn(List<String> values) {
			this.addCriterion("user_name not in", values, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameBetween(String value1, String value2) {
			this.addCriterion("user_name between", value1, value2, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUserNameNotBetween(String value1, String value2) {
			this.addCriterion("user_name not between", value1, value2, "userName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordIsNull() {
			this.addCriterion("password is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordIsNotNull() {
			this.addCriterion("password is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordEqualTo(String value) {
			this.addCriterion("password =", value, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordNotEqualTo(String value) {
			this.addCriterion("password <>", value, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordGreaterThan(String value) {
			this.addCriterion("password >", value, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordGreaterThanOrEqualTo(String value) {
			this.addCriterion("password >=", value, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordLessThan(String value) {
			this.addCriterion("password <", value, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordLessThanOrEqualTo(String value) {
			this.addCriterion("password <=", value, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordLike(String value) {
			this.addCriterion("password like", value, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordNotLike(String value) {
			this.addCriterion("password not like", value, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordIn(List<String> values) {
			this.addCriterion("password in", values, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordNotIn(List<String> values) {
			this.addCriterion("password not in", values, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordBetween(String value1, String value2) {
			this.addCriterion("password between", value1, value2, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andPasswordNotBetween(String value1, String value2) {
			this.addCriterion("password not between", value1, value2, "password");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdIsNull() {
			this.addCriterion("role_id is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdIsNotNull() {
			this.addCriterion("role_id is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdEqualTo(long value) {
			this.addCriterion("role_id =", new Long(value), "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdNotEqualTo(long value) {
			this.addCriterion("role_id <>", new Long(value), "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdGreaterThan(long value) {
			this.addCriterion("role_id >", new Long(value), "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdGreaterThanOrEqualTo(long value) {
			this.addCriterion("role_id >=", new Long(value), "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdLessThan(long value) {
			this.addCriterion("role_id <", new Long(value), "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdLessThanOrEqualTo(long value) {
			this.addCriterion("role_id <=", new Long(value), "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdIn(List<Long> values) {
			this.addCriterion("role_id in", values, "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdNotIn(List<Long> values) {
			this.addCriterion("role_id not in", values, "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdBetween(long value1, long value2) {
			this.addCriterion("role_id between", new Long(value1), new Long(value2), "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRoleIdNotBetween(long value1, long value2) {
			this.addCriterion("role_id not between", new Long(value1), new Long(value2), "roleId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeIsNull() {
			this.addCriterion("create_time is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeIsNotNull() {
			this.addCriterion("create_time is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeEqualTo(Date value) {
			this.addCriterion("create_time =", value, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeNotEqualTo(Date value) {
			this.addCriterion("create_time <>", value, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeGreaterThan(Date value) {
			this.addCriterion("create_time >", value, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
			this.addCriterion("create_time >=", value, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeLessThan(Date value) {
			this.addCriterion("create_time <", value, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeLessThanOrEqualTo(Date value) {
			this.addCriterion("create_time <=", value, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeIn(List<Date> values) {
			this.addCriterion("create_time in", values, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeNotIn(List<Date> values) {
			this.addCriterion("create_time not in", values, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeBetween(Date value1, Date value2) {
			this.addCriterion("create_time between", value1, value2, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCreateTimeNotBetween(Date value1, Date value2) {
			this.addCriterion("create_time not between", value1, value2, "createTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeIsNull() {
			this.addCriterion("update_time is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeIsNotNull() {
			this.addCriterion("update_time is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeEqualTo(Date value) {
			this.addCriterion("update_time =", value, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeNotEqualTo(Date value) {
			this.addCriterion("update_time <>", value, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeGreaterThan(Date value) {
			this.addCriterion("update_time >", value, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
			this.addCriterion("update_time >=", value, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeLessThan(Date value) {
			this.addCriterion("update_time <", value, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
			this.addCriterion("update_time <=", value, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeIn(List<Date> values) {
			this.addCriterion("update_time in", values, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeNotIn(List<Date> values) {
			this.addCriterion("update_time not in", values, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeBetween(Date value1, Date value2) {
			this.addCriterion("update_time between", value1, value2, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
			this.addCriterion("update_time not between", value1, value2, "updateTime");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkIsNull() {
			this.addCriterion("remark is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkIsNotNull() {
			this.addCriterion("remark is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkEqualTo(String value) {
			this.addCriterion("remark =", value, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkNotEqualTo(String value) {
			this.addCriterion("remark <>", value, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkGreaterThan(String value) {
			this.addCriterion("remark >", value, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkGreaterThanOrEqualTo(String value) {
			this.addCriterion("remark >=", value, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkLessThan(String value) {
			this.addCriterion("remark <", value, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkLessThanOrEqualTo(String value) {
			this.addCriterion("remark <=", value, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkLike(String value) {
			this.addCriterion("remark like", value, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkNotLike(String value) {
			this.addCriterion("remark not like", value, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkIn(List<String> values) {
			this.addCriterion("remark in", values, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkNotIn(List<String> values) {
			this.addCriterion("remark not in", values, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkBetween(String value1, String value2) {
			this.addCriterion("remark between", value1, value2, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andRemarkNotBetween(String value1, String value2) {
			this.addCriterion("remark not between", value1, value2, "remark");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1IsNull() {
			this.addCriterion("s1 is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1IsNotNull() {
			this.addCriterion("s1 is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1EqualTo(String value) {
			this.addCriterion("s1 =", value, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1NotEqualTo(String value) {
			this.addCriterion("s1 <>", value, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1GreaterThan(String value) {
			this.addCriterion("s1 >", value, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1GreaterThanOrEqualTo(String value) {
			this.addCriterion("s1 >=", value, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1LessThan(String value) {
			this.addCriterion("s1 <", value, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1LessThanOrEqualTo(String value) {
			this.addCriterion("s1 <=", value, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1Like(String value) {
			this.addCriterion("s1 like", value, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1NotLike(String value) {
			this.addCriterion("s1 not like", value, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1In(List<String> values) {
			this.addCriterion("s1 in", values, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1NotIn(List<String> values) {
			this.addCriterion("s1 not in", values, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1Between(String value1, String value2) {
			this.addCriterion("s1 between", value1, value2, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS1NotBetween(String value1, String value2) {
			this.addCriterion("s1 not between", value1, value2, "s1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2IsNull() {
			this.addCriterion("s2 is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2IsNotNull() {
			this.addCriterion("s2 is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2EqualTo(String value) {
			this.addCriterion("s2 =", value, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2NotEqualTo(String value) {
			this.addCriterion("s2 <>", value, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2GreaterThan(String value) {
			this.addCriterion("s2 >", value, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2GreaterThanOrEqualTo(String value) {
			this.addCriterion("s2 >=", value, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2LessThan(String value) {
			this.addCriterion("s2 <", value, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2LessThanOrEqualTo(String value) {
			this.addCriterion("s2 <=", value, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2Like(String value) {
			this.addCriterion("s2 like", value, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2NotLike(String value) {
			this.addCriterion("s2 not like", value, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2In(List<String> values) {
			this.addCriterion("s2 in", values, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2NotIn(List<String> values) {
			this.addCriterion("s2 not in", values, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2Between(String value1, String value2) {
			this.addCriterion("s2 between", value1, value2, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS2NotBetween(String value1, String value2) {
			this.addCriterion("s2 not between", value1, value2, "s2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3IsNull() {
			this.addCriterion("s3 is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3IsNotNull() {
			this.addCriterion("s3 is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3EqualTo(String value) {
			this.addCriterion("s3 =", value, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3NotEqualTo(String value) {
			this.addCriterion("s3 <>", value, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3GreaterThan(String value) {
			this.addCriterion("s3 >", value, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3GreaterThanOrEqualTo(String value) {
			this.addCriterion("s3 >=", value, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3LessThan(String value) {
			this.addCriterion("s3 <", value, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3LessThanOrEqualTo(String value) {
			this.addCriterion("s3 <=", value, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3Like(String value) {
			this.addCriterion("s3 like", value, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3NotLike(String value) {
			this.addCriterion("s3 not like", value, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3In(List<String> values) {
			this.addCriterion("s3 in", values, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3NotIn(List<String> values) {
			this.addCriterion("s3 not in", values, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3Between(String value1, String value2) {
			this.addCriterion("s3 between", value1, value2, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andS3NotBetween(String value1, String value2) {
			this.addCriterion("s3 not between", value1, value2, "s3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1IsNull() {
			this.addCriterion("num1 is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1IsNotNull() {
			this.addCriterion("num1 is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1EqualTo(long value) {
			this.addCriterion("num1 =", new Long(value), "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1NotEqualTo(long value) {
			this.addCriterion("num1 <>", new Long(value), "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1GreaterThan(long value) {
			this.addCriterion("num1 >", new Long(value), "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1GreaterThanOrEqualTo(long value) {
			this.addCriterion("num1 >=", new Long(value), "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1LessThan(long value) {
			this.addCriterion("num1 <", new Long(value), "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1LessThanOrEqualTo(long value) {
			this.addCriterion("num1 <=", new Long(value), "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1In(List<Long> values) {
			this.addCriterion("num1 in", values, "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1NotIn(List<Long> values) {
			this.addCriterion("num1 not in", values, "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1Between(long value1, long value2) {
			this.addCriterion("num1 between", new Long(value1), new Long(value2), "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum1NotBetween(long value1, long value2) {
			this.addCriterion("num1 not between", new Long(value1), new Long(value2), "num1");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2IsNull() {
			this.addCriterion("num2 is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2IsNotNull() {
			this.addCriterion("num2 is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2EqualTo(long value) {
			this.addCriterion("num2 =", new Long(value), "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2NotEqualTo(long value) {
			this.addCriterion("num2 <>", new Long(value), "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2GreaterThan(long value) {
			this.addCriterion("num2 >", new Long(value), "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2GreaterThanOrEqualTo(long value) {
			this.addCriterion("num2 >=", new Long(value), "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2LessThan(long value) {
			this.addCriterion("num2 <", new Long(value), "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2LessThanOrEqualTo(long value) {
			this.addCriterion("num2 <=", new Long(value), "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2In(List<Long> values) {
			this.addCriterion("num2 in", values, "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2NotIn(List<Long> values) {
			this.addCriterion("num2 not in", values, "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2Between(long value1, long value2) {
			this.addCriterion("num2 between", new Long(value1), new Long(value2), "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum2NotBetween(long value1, long value2) {
			this.addCriterion("num2 not between", new Long(value1), new Long(value2), "num2");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3IsNull() {
			this.addCriterion("num3 is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3IsNotNull() {
			this.addCriterion("num3 is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3EqualTo(long value) {
			this.addCriterion("num3 =", new Long(value), "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3NotEqualTo(long value) {
			this.addCriterion("num3 <>", new Long(value), "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3GreaterThan(long value) {
			this.addCriterion("num3 >", new Long(value), "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3GreaterThanOrEqualTo(long value) {
			this.addCriterion("num3 >=", new Long(value), "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3LessThan(long value) {
			this.addCriterion("num3 <", new Long(value), "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3LessThanOrEqualTo(long value) {
			this.addCriterion("num3 <=", new Long(value), "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3In(List<Long> values) {
			this.addCriterion("num3 in", values, "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3NotIn(List<Long> values) {
			this.addCriterion("num3 not in", values, "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3Between(long value1, long value2) {
			this.addCriterion("num3 between", new Long(value1), new Long(value2), "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNum3NotBetween(long value1, long value2) {
			this.addCriterion("num3 not between", new Long(value1), new Long(value2), "num3");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminIsNull() {
			this.addCriterion("is_admin is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminIsNotNull() {
			this.addCriterion("is_admin is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminEqualTo(long value) {
			this.addCriterion("is_admin =", new Long(value), "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminNotEqualTo(long value) {
			this.addCriterion("is_admin <>", new Long(value), "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminGreaterThan(long value) {
			this.addCriterion("is_admin >", new Long(value), "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminGreaterThanOrEqualTo(long value) {
			this.addCriterion("is_admin >=", new Long(value), "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminLessThan(long value) {
			this.addCriterion("is_admin <", new Long(value), "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminLessThanOrEqualTo(long value) {
			this.addCriterion("is_admin <=", new Long(value), "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminIn(List<Long> values) {
			this.addCriterion("is_admin in", values, "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminNotIn(List<Long> values) {
			this.addCriterion("is_admin not in", values, "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminBetween(long value1, long value2) {
			this.addCriterion("is_admin between", new Long(value1), new Long(value2), "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAdminNotBetween(long value1, long value2) {
			this.addCriterion("is_admin not between", new Long(value1), new Long(value2), "isAdmin");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeIsNull() {
			this.addCriterion("type is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeIsNotNull() {
			this.addCriterion("type is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeEqualTo(String value) {
			this.addCriterion("type =", value, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeNotEqualTo(String value) {
			this.addCriterion("type <>", value, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeGreaterThan(String value) {
			this.addCriterion("type >", value, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeGreaterThanOrEqualTo(String value) {
			this.addCriterion("type >=", value, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeLessThan(String value) {
			this.addCriterion("type <", value, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeLessThanOrEqualTo(String value) {
			this.addCriterion("type <=", value, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeLike(String value) {
			this.addCriterion("type like", value, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeNotLike(String value) {
			this.addCriterion("type not like", value, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeIn(List<String> values) {
			this.addCriterion("type in", values, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeNotIn(List<String> values) {
			this.addCriterion("type not in", values, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeBetween(String value1, String value2) {
			this.addCriterion("type between", value1, value2, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTypeNotBetween(String value1, String value2) {
			this.addCriterion("type not between", value1, value2, "type");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdIsNull() {
			this.addCriterion("dept_id is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdIsNotNull() {
			this.addCriterion("dept_id is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdEqualTo(long value) {
			this.addCriterion("dept_id =", new Long(value), "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdNotEqualTo(long value) {
			this.addCriterion("dept_id <>", new Long(value), "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdGreaterThan(long value) {
			this.addCriterion("dept_id >", new Long(value), "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdGreaterThanOrEqualTo(long value) {
			this.addCriterion("dept_id >=", new Long(value), "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdLessThan(long value) {
			this.addCriterion("dept_id <", new Long(value), "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdLessThanOrEqualTo(long value) {
			this.addCriterion("dept_id <=", new Long(value), "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdIn(List<Long> values) {
			this.addCriterion("dept_id in", values, "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdNotIn(List<Long> values) {
			this.addCriterion("dept_id not in", values, "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdBetween(long value1, long value2) {
			this.addCriterion("dept_id between", new Long(value1), new Long(value2), "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptIdNotBetween(long value1, long value2) {
			this.addCriterion("dept_id not between", new Long(value1), new Long(value2), "deptId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameIsNull() {
			this.addCriterion("name is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameIsNotNull() {
			this.addCriterion("name is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameEqualTo(String value) {
			this.addCriterion("name =", value, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameNotEqualTo(String value) {
			this.addCriterion("name <>", value, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameGreaterThan(String value) {
			this.addCriterion("name >", value, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameGreaterThanOrEqualTo(String value) {
			this.addCriterion("name >=", value, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameLessThan(String value) {
			this.addCriterion("name <", value, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameLessThanOrEqualTo(String value) {
			this.addCriterion("name <=", value, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameLike(String value) {
			this.addCriterion("name like", value, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameNotLike(String value) {
			this.addCriterion("name not like", value, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameIn(List<String> values) {
			this.addCriterion("name in", values, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameNotIn(List<String> values) {
			this.addCriterion("name not in", values, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameBetween(String value1, String value2) {
			this.addCriterion("name between", value1, value2, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andNameNotBetween(String value1, String value2) {
			this.addCriterion("name not between", value1, value2, "name");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderIsNull() {
			this.addCriterion("gender is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderIsNotNull() {
			this.addCriterion("gender is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderEqualTo(String value) {
			this.addCriterion("gender =", value, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderNotEqualTo(String value) {
			this.addCriterion("gender <>", value, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderGreaterThan(String value) {
			this.addCriterion("gender >", value, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderGreaterThanOrEqualTo(String value) {
			this.addCriterion("gender >=", value, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderLessThan(String value) {
			this.addCriterion("gender <", value, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderLessThanOrEqualTo(String value) {
			this.addCriterion("gender <=", value, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderLike(String value) {
			this.addCriterion("gender like", value, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderNotLike(String value) {
			this.addCriterion("gender not like", value, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderIn(List<String> values) {
			this.addCriterion("gender in", values, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderNotIn(List<String> values) {
			this.addCriterion("gender not in", values, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderBetween(String value1, String value2) {
			this.addCriterion("gender between", value1, value2, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andGenderNotBetween(String value1, String value2) {
			this.addCriterion("gender not between", value1, value2, "gender");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeIsNull() {
			this.addCriterion("age is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeIsNotNull() {
			this.addCriterion("age is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeEqualTo(long value) {
			this.addCriterion("age =", new Long(value), "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeNotEqualTo(long value) {
			this.addCriterion("age <>", new Long(value), "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeGreaterThan(long value) {
			this.addCriterion("age >", new Long(value), "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeGreaterThanOrEqualTo(long value) {
			this.addCriterion("age >=", new Long(value), "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeLessThan(long value) {
			this.addCriterion("age <", new Long(value), "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeLessThanOrEqualTo(long value) {
			this.addCriterion("age <=", new Long(value), "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeIn(List<Long> values) {
			this.addCriterion("age in", values, "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeNotIn(List<Long> values) {
			this.addCriterion("age not in", values, "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeBetween(long value1, long value2) {
			this.addCriterion("age between", new Long(value1), new Long(value2), "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andAgeNotBetween(long value1, long value2) {
			this.addCriterion("age not between", new Long(value1), new Long(value2), "age");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayIsNull() {
			this.addCriterion("birthday is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayIsNotNull() {
			this.addCriterion("birthday is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayEqualTo(Date value) {
			this.addCriterion("birthday =", value, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayNotEqualTo(Date value) {
			this.addCriterion("birthday <>", value, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayGreaterThan(Date value) {
			this.addCriterion("birthday >", value, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayGreaterThanOrEqualTo(Date value) {
			this.addCriterion("birthday >=", value, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayLessThan(Date value) {
			this.addCriterion("birthday <", value, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayLessThanOrEqualTo(Date value) {
			this.addCriterion("birthday <=", value, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayIn(List<Date> values) {
			this.addCriterion("birthday in", values, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayNotIn(List<Date> values) {
			this.addCriterion("birthday not in", values, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayBetween(Date value1, Date value2) {
			this.addCriterion("birthday between", value1, value2, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andBirthdayNotBetween(Date value1, Date value2) {
			this.addCriterion("birthday not between", value1, value2, "birthday");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateIsNull() {
			this.addCriterion("join_date is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateIsNotNull() {
			this.addCriterion("join_date is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateEqualTo(Date value) {
			this.addCriterion("join_date =", value, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateNotEqualTo(Date value) {
			this.addCriterion("join_date <>", value, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateGreaterThan(Date value) {
			this.addCriterion("join_date >", value, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateGreaterThanOrEqualTo(Date value) {
			this.addCriterion("join_date >=", value, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateLessThan(Date value) {
			this.addCriterion("join_date <", value, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateLessThanOrEqualTo(Date value) {
			this.addCriterion("join_date <=", value, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateIn(List<Date> values) {
			this.addCriterion("join_date in", values, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateNotIn(List<Date> values) {
			this.addCriterion("join_date not in", values, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateBetween(Date value1, Date value2) {
			this.addCriterion("join_date between", value1, value2, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andJoinDateNotBetween(Date value1, Date value2) {
			this.addCriterion("join_date not between", value1, value2, "joinDate");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelIsNull() {
			this.addCriterion("tel is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelIsNotNull() {
			this.addCriterion("tel is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelEqualTo(String value) {
			this.addCriterion("tel =", value, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelNotEqualTo(String value) {
			this.addCriterion("tel <>", value, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelGreaterThan(String value) {
			this.addCriterion("tel >", value, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelGreaterThanOrEqualTo(String value) {
			this.addCriterion("tel >=", value, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelLessThan(String value) {
			this.addCriterion("tel <", value, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelLessThanOrEqualTo(String value) {
			this.addCriterion("tel <=", value, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelLike(String value) {
			this.addCriterion("tel like", value, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelNotLike(String value) {
			this.addCriterion("tel not like", value, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelIn(List<String> values) {
			this.addCriterion("tel in", values, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelNotIn(List<String> values) {
			this.addCriterion("tel not in", values, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelBetween(String value1, String value2) {
			this.addCriterion("tel between", value1, value2, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andTelNotBetween(String value1, String value2) {
			this.addCriterion("tel not between", value1, value2, "tel");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileIsNull() {
			this.addCriterion("mobile is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileIsNotNull() {
			this.addCriterion("mobile is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileEqualTo(String value) {
			this.addCriterion("mobile =", value, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileNotEqualTo(String value) {
			this.addCriterion("mobile <>", value, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileGreaterThan(String value) {
			this.addCriterion("mobile >", value, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileGreaterThanOrEqualTo(String value) {
			this.addCriterion("mobile >=", value, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileLessThan(String value) {
			this.addCriterion("mobile <", value, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileLessThanOrEqualTo(String value) {
			this.addCriterion("mobile <=", value, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileLike(String value) {
			this.addCriterion("mobile like", value, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileNotLike(String value) {
			this.addCriterion("mobile not like", value, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileIn(List<String> values) {
			this.addCriterion("mobile in", values, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileNotIn(List<String> values) {
			this.addCriterion("mobile not in", values, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileBetween(String value1, String value2) {
			this.addCriterion("mobile between", value1, value2, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMobileNotBetween(String value1, String value2) {
			this.addCriterion("mobile not between", value1, value2, "mobile");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailIsNull() {
			this.addCriterion("email is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailIsNotNull() {
			this.addCriterion("email is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailEqualTo(String value) {
			this.addCriterion("email =", value, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailNotEqualTo(String value) {
			this.addCriterion("email <>", value, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailGreaterThan(String value) {
			this.addCriterion("email >", value, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailGreaterThanOrEqualTo(String value) {
			this.addCriterion("email >=", value, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailLessThan(String value) {
			this.addCriterion("email <", value, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailLessThanOrEqualTo(String value) {
			this.addCriterion("email <=", value, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailLike(String value) {
			this.addCriterion("email like", value, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailNotLike(String value) {
			this.addCriterion("email not like", value, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailIn(List<String> values) {
			this.addCriterion("email in", values, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailNotIn(List<String> values) {
			this.addCriterion("email not in", values, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailBetween(String value1, String value2) {
			this.addCriterion("email between", value1, value2, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andEmailNotBetween(String value1, String value2) {
			this.addCriterion("email not between", value1, value2, "email");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdIsNull() {
			this.addCriterion("certificate_id is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdIsNotNull() {
			this.addCriterion("certificate_id is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdEqualTo(String value) {
			this.addCriterion("certificate_id =", value, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdNotEqualTo(String value) {
			this.addCriterion("certificate_id <>", value, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdGreaterThan(String value) {
			this.addCriterion("certificate_id >", value, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdGreaterThanOrEqualTo(String value) {
			this.addCriterion("certificate_id >=", value, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdLessThan(String value) {
			this.addCriterion("certificate_id <", value, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdLessThanOrEqualTo(String value) {
			this.addCriterion("certificate_id <=", value, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdLike(String value) {
			this.addCriterion("certificate_id like", value, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdNotLike(String value) {
			this.addCriterion("certificate_id not like", value, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdIn(List<String> values) {
			this.addCriterion("certificate_id in", values, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdNotIn(List<String> values) {
			this.addCriterion("certificate_id not in", values, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdBetween(String value1, String value2) {
			this.addCriterion("certificate_id between", value1, value2, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andCertificateIdNotBetween(String value1, String value2) {
			this.addCriterion("certificate_id not between", value1, value2, "certificateId");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentIsNull() {
			this.addCriterion("is_agent is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentIsNotNull() {
			this.addCriterion("is_agent is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentEqualTo(long value) {
			this.addCriterion("is_agent =", new Long(value), "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentNotEqualTo(long value) {
			this.addCriterion("is_agent <>", new Long(value), "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentGreaterThan(long value) {
			this.addCriterion("is_agent >", new Long(value), "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentGreaterThanOrEqualTo(long value) {
			this.addCriterion("is_agent >=", new Long(value), "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentLessThan(long value) {
			this.addCriterion("is_agent <", new Long(value), "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentLessThanOrEqualTo(long value) {
			this.addCriterion("is_agent <=", new Long(value), "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentIn(List<Long> values) {
			this.addCriterion("is_agent in", values, "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentNotIn(List<Long> values) {
			this.addCriterion("is_agent not in", values, "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentBetween(long value1, long value2) {
			this.addCriterion("is_agent between", new Long(value1), new Long(value2), "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andIsAgentNotBetween(long value1, long value2) {
			this.addCriterion("is_agent not between", new Long(value1), new Long(value2), "isAgent");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptIsNull() {
			this.addCriterion("monitor_dept is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptIsNotNull() {
			this.addCriterion("monitor_dept is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptEqualTo(String value) {
			this.addCriterion("monitor_dept =", value, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptNotEqualTo(String value) {
			this.addCriterion("monitor_dept <>", value, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptGreaterThan(String value) {
			this.addCriterion("monitor_dept >", value, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptGreaterThanOrEqualTo(String value) {
			this.addCriterion("monitor_dept >=", value, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptLessThan(String value) {
			this.addCriterion("monitor_dept <", value, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptLessThanOrEqualTo(String value) {
			this.addCriterion("monitor_dept <=", value, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptLike(String value) {
			this.addCriterion("monitor_dept like", value, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptNotLike(String value) {
			this.addCriterion("monitor_dept not like", value, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptIn(List<String> values) {
			this.addCriterion("monitor_dept in", values, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptNotIn(List<String> values) {
			this.addCriterion("monitor_dept not in", values, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptBetween(String value1, String value2) {
			this.addCriterion("monitor_dept between", value1, value2, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andMonitorDeptNotBetween(String value1, String value2) {
			this.addCriterion("monitor_dept not between", value1, value2, "monitorDept");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameIsNull() {
			this.addCriterion("dept_name is null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameIsNotNull() {
			this.addCriterion("dept_name is not null");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameEqualTo(String value) {
			this.addCriterion("dept_name =", value, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameNotEqualTo(String value) {
			this.addCriterion("dept_name <>", value, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameGreaterThan(String value) {
			this.addCriterion("dept_name >", value, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameGreaterThanOrEqualTo(String value) {
			this.addCriterion("dept_name >=", value, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameLessThan(String value) {
			this.addCriterion("dept_name <", value, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameLessThanOrEqualTo(String value) {
			this.addCriterion("dept_name <=", value, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameLike(String value) {
			this.addCriterion("dept_name like", value, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameNotLike(String value) {
			this.addCriterion("dept_name not like", value, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameIn(List<String> values) {
			this.addCriterion("dept_name in", values, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameNotIn(List<String> values) {
			this.addCriterion("dept_name not in", values, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameBetween(String value1, String value2) {
			this.addCriterion("dept_name between", value1, value2, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}

		public UserEmplInfoExample.Criteria andDeptNameNotBetween(String value1, String value2) {
			this.addCriterion("dept_name not between", value1, value2, "deptName");
			return (UserEmplInfoExample.Criteria)this;
		}
	}

}
