package com.tstar.callcenter.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:06
 */
public class UserInfoExample {

	protected String orderByClause;
	protected boolean distinct;
	protected List<UserInfoExample.Criteria> oredCriteria = new ArrayList();

	public UserInfoExample() {
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

	public List<UserInfoExample.Criteria> getOredCriteria() {
		return this.oredCriteria;
	}

	public void or(UserInfoExample.Criteria criteria) {
		this.oredCriteria.add(criteria);
	}

	public UserInfoExample.Criteria or() {
		UserInfoExample.Criteria criteria = this.createCriteriaInternal();
		this.oredCriteria.add(criteria);
		return criteria;
	}

	public UserInfoExample.Criteria createCriteria() {
		UserInfoExample.Criteria criteria = this.createCriteriaInternal();
		if (this.oredCriteria.size() == 0) {
			this.oredCriteria.add(criteria);
		}

		return criteria;
	}

	protected UserInfoExample.Criteria createCriteriaInternal() {
		UserInfoExample.Criteria criteria = new UserInfoExample.Criteria();
		return criteria;
	}

	public void clear() {
		this.oredCriteria.clear();
		this.orderByClause = null;
		this.distinct = false;
	}

	public static class Criteria extends UserInfoExample.GeneratedCriteria {
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
		protected List<UserInfoExample.Criterion> criteria = new ArrayList();

		protected GeneratedCriteria() {
		}

		public boolean isValid() {
			return this.criteria.size() > 0;
		}

		public List<UserInfoExample.Criterion> getAllCriteria() {
			return this.criteria;
		}

		public List<UserInfoExample.Criterion> getCriteria() {
			return this.criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			} else {
				this.criteria.add(new UserInfoExample.Criterion(condition));
			}
		}

		protected void addCriterion(String condition, Object value, String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property + " cannot be null");
			} else {
				this.criteria.add(new UserInfoExample.Criterion(condition, value));
			}
		}

		protected void addCriterion(String condition, Object value1, Object value2, String property) {
			if (value1 != null && value2 != null) {
				this.criteria.add(new UserInfoExample.Criterion(condition, value1, value2));
			} else {
				throw new RuntimeException("Between values for " + property + " cannot be null");
			}
		}

		public UserInfoExample.Criteria andUserIdIsNull() {
			this.addCriterion("USER_ID is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdIsNotNull() {
			this.addCriterion("USER_ID is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdEqualTo(long value) {
			this.addCriterion("USER_ID =", new Long(value), "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdNotEqualTo(long value) {
			this.addCriterion("USER_ID <>", new Long(value), "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdGreaterThan(long value) {
			this.addCriterion("USER_ID >", new Long(value), "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdGreaterThanOrEqualTo(long value) {
			this.addCriterion("USER_ID >=", new Long(value), "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdLessThan(long value) {
			this.addCriterion("USER_ID <", new Long(value), "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdLessThanOrEqualTo(long value) {
			this.addCriterion("USER_ID <=", new Long(value), "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdIn(List<Long> values) {
			this.addCriterion("USER_ID in", values, "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdNotIn(List<Long> values) {
			this.addCriterion("USER_ID not in", values, "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdBetween(long value1, long value2) {
			this.addCriterion("USER_ID between", new Long(value1), new Long(value2), "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserIdNotBetween(long value1, long value2) {
			this.addCriterion("USER_ID not between", new Long(value1), new Long(value2), "userId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameIsNull() {
			this.addCriterion("USER_NAME is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameIsNotNull() {
			this.addCriterion("USER_NAME is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameEqualTo(String value) {
			this.addCriterion("USER_NAME =", value, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameNotEqualTo(String value) {
			this.addCriterion("USER_NAME <>", value, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameGreaterThan(String value) {
			this.addCriterion("USER_NAME >", value, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameGreaterThanOrEqualTo(String value) {
			this.addCriterion("USER_NAME >=", value, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameLessThan(String value) {
			this.addCriterion("USER_NAME <", value, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameLessThanOrEqualTo(String value) {
			this.addCriterion("USER_NAME <=", value, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameLike(String value) {
			this.addCriterion("USER_NAME like", value, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameNotLike(String value) {
			this.addCriterion("USER_NAME not like", value, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameIn(List<String> values) {
			this.addCriterion("USER_NAME in", values, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameNotIn(List<String> values) {
			this.addCriterion("USER_NAME not in", values, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameBetween(String value1, String value2) {
			this.addCriterion("USER_NAME between", value1, value2, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUserNameNotBetween(String value1, String value2) {
			this.addCriterion("USER_NAME not between", value1, value2, "userName");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordIsNull() {
			this.addCriterion("PASSWORD is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordIsNotNull() {
			this.addCriterion("PASSWORD is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordEqualTo(String value) {
			this.addCriterion("PASSWORD =", value, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordNotEqualTo(String value) {
			this.addCriterion("PASSWORD <>", value, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordGreaterThan(String value) {
			this.addCriterion("PASSWORD >", value, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordGreaterThanOrEqualTo(String value) {
			this.addCriterion("PASSWORD >=", value, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordLessThan(String value) {
			this.addCriterion("PASSWORD <", value, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordLessThanOrEqualTo(String value) {
			this.addCriterion("PASSWORD <=", value, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordLike(String value) {
			this.addCriterion("PASSWORD like", value, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordNotLike(String value) {
			this.addCriterion("PASSWORD not like", value, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordIn(List<String> values) {
			this.addCriterion("PASSWORD in", values, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordNotIn(List<String> values) {
			this.addCriterion("PASSWORD not in", values, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordBetween(String value1, String value2) {
			this.addCriterion("PASSWORD between", value1, value2, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andPasswordNotBetween(String value1, String value2) {
			this.addCriterion("PASSWORD not between", value1, value2, "password");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdIsNull() {
			this.addCriterion("ROLE_ID is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdIsNotNull() {
			this.addCriterion("ROLE_ID is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdEqualTo(long value) {
			this.addCriterion("ROLE_ID =", new Long(value), "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdNotEqualTo(long value) {
			this.addCriterion("ROLE_ID <>", new Long(value), "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdGreaterThan(long value) {
			this.addCriterion("ROLE_ID >", new Long(value), "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdGreaterThanOrEqualTo(long value) {
			this.addCriterion("ROLE_ID >=", new Long(value), "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdLessThan(long value) {
			this.addCriterion("ROLE_ID <", new Long(value), "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdLessThanOrEqualTo(long value) {
			this.addCriterion("ROLE_ID <=", new Long(value), "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdIn(List<Long> values) {
			this.addCriterion("ROLE_ID in", values, "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdNotIn(List<Long> values) {
			this.addCriterion("ROLE_ID not in", values, "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdBetween(long value1, long value2) {
			this.addCriterion("ROLE_ID between", new Long(value1), new Long(value2), "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRoleIdNotBetween(long value1, long value2) {
			this.addCriterion("ROLE_ID not between", new Long(value1), new Long(value2), "roleId");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeIsNull() {
			this.addCriterion("CREATE_TIME is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeIsNotNull() {
			this.addCriterion("CREATE_TIME is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeEqualTo(Date value) {
			this.addCriterion("CREATE_TIME =", value, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeNotEqualTo(Date value) {
			this.addCriterion("CREATE_TIME <>", value, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeGreaterThan(Date value) {
			this.addCriterion("CREATE_TIME >", value, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
			this.addCriterion("CREATE_TIME >=", value, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeLessThan(Date value) {
			this.addCriterion("CREATE_TIME <", value, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeLessThanOrEqualTo(Date value) {
			this.addCriterion("CREATE_TIME <=", value, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeIn(List<Date> values) {
			this.addCriterion("CREATE_TIME in", values, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeNotIn(List<Date> values) {
			this.addCriterion("CREATE_TIME not in", values, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeBetween(Date value1, Date value2) {
			this.addCriterion("CREATE_TIME between", value1, value2, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andCreateTimeNotBetween(Date value1, Date value2) {
			this.addCriterion("CREATE_TIME not between", value1, value2, "createTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeIsNull() {
			this.addCriterion("UPDATE_TIME is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeIsNotNull() {
			this.addCriterion("UPDATE_TIME is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeEqualTo(Date value) {
			this.addCriterion("UPDATE_TIME =", value, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeNotEqualTo(Date value) {
			this.addCriterion("UPDATE_TIME <>", value, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeGreaterThan(Date value) {
			this.addCriterion("UPDATE_TIME >", value, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
			this.addCriterion("UPDATE_TIME >=", value, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeLessThan(Date value) {
			this.addCriterion("UPDATE_TIME <", value, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
			this.addCriterion("UPDATE_TIME <=", value, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeIn(List<Date> values) {
			this.addCriterion("UPDATE_TIME in", values, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeNotIn(List<Date> values) {
			this.addCriterion("UPDATE_TIME not in", values, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeBetween(Date value1, Date value2) {
			this.addCriterion("UPDATE_TIME between", value1, value2, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
			this.addCriterion("UPDATE_TIME not between", value1, value2, "updateTime");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkIsNull() {
			this.addCriterion("REMARK is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkIsNotNull() {
			this.addCriterion("REMARK is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkEqualTo(String value) {
			this.addCriterion("REMARK =", value, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkNotEqualTo(String value) {
			this.addCriterion("REMARK <>", value, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkGreaterThan(String value) {
			this.addCriterion("REMARK >", value, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkGreaterThanOrEqualTo(String value) {
			this.addCriterion("REMARK >=", value, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkLessThan(String value) {
			this.addCriterion("REMARK <", value, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkLessThanOrEqualTo(String value) {
			this.addCriterion("REMARK <=", value, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkLike(String value) {
			this.addCriterion("REMARK like", value, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkNotLike(String value) {
			this.addCriterion("REMARK not like", value, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkIn(List<String> values) {
			this.addCriterion("REMARK in", values, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkNotIn(List<String> values) {
			this.addCriterion("REMARK not in", values, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkBetween(String value1, String value2) {
			this.addCriterion("REMARK between", value1, value2, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andRemarkNotBetween(String value1, String value2) {
			this.addCriterion("REMARK not between", value1, value2, "remark");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1IsNull() {
			this.addCriterion("S1 is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1IsNotNull() {
			this.addCriterion("S1 is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1EqualTo(String value) {
			this.addCriterion("S1 =", value, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1NotEqualTo(String value) {
			this.addCriterion("S1 <>", value, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1GreaterThan(String value) {
			this.addCriterion("S1 >", value, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1GreaterThanOrEqualTo(String value) {
			this.addCriterion("S1 >=", value, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1LessThan(String value) {
			this.addCriterion("S1 <", value, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1LessThanOrEqualTo(String value) {
			this.addCriterion("S1 <=", value, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1Like(String value) {
			this.addCriterion("S1 like", value, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1NotLike(String value) {
			this.addCriterion("S1 not like", value, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1In(List<String> values) {
			this.addCriterion("S1 in", values, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1NotIn(List<String> values) {
			this.addCriterion("S1 not in", values, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1Between(String value1, String value2) {
			this.addCriterion("S1 between", value1, value2, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS1NotBetween(String value1, String value2) {
			this.addCriterion("S1 not between", value1, value2, "s1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2IsNull() {
			this.addCriterion("S2 is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2IsNotNull() {
			this.addCriterion("S2 is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2EqualTo(String value) {
			this.addCriterion("S2 =", value, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2NotEqualTo(String value) {
			this.addCriterion("S2 <>", value, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2GreaterThan(String value) {
			this.addCriterion("S2 >", value, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2GreaterThanOrEqualTo(String value) {
			this.addCriterion("S2 >=", value, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2LessThan(String value) {
			this.addCriterion("S2 <", value, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2LessThanOrEqualTo(String value) {
			this.addCriterion("S2 <=", value, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2Like(String value) {
			this.addCriterion("S2 like", value, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2NotLike(String value) {
			this.addCriterion("S2 not like", value, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2In(List<String> values) {
			this.addCriterion("S2 in", values, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2NotIn(List<String> values) {
			this.addCriterion("S2 not in", values, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2Between(String value1, String value2) {
			this.addCriterion("S2 between", value1, value2, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS2NotBetween(String value1, String value2) {
			this.addCriterion("S2 not between", value1, value2, "s2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3IsNull() {
			this.addCriterion("S3 is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3IsNotNull() {
			this.addCriterion("S3 is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3EqualTo(String value) {
			this.addCriterion("S3 =", value, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3NotEqualTo(String value) {
			this.addCriterion("S3 <>", value, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3GreaterThan(String value) {
			this.addCriterion("S3 >", value, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3GreaterThanOrEqualTo(String value) {
			this.addCriterion("S3 >=", value, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3LessThan(String value) {
			this.addCriterion("S3 <", value, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3LessThanOrEqualTo(String value) {
			this.addCriterion("S3 <=", value, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3Like(String value) {
			this.addCriterion("S3 like", value, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3NotLike(String value) {
			this.addCriterion("S3 not like", value, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3In(List<String> values) {
			this.addCriterion("S3 in", values, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3NotIn(List<String> values) {
			this.addCriterion("S3 not in", values, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3Between(String value1, String value2) {
			this.addCriterion("S3 between", value1, value2, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS3NotBetween(String value1, String value2) {
			this.addCriterion("S3 not between", value1, value2, "s3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4IsNull() {
			this.addCriterion("S4 is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4IsNotNull() {
			this.addCriterion("S4 is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4EqualTo(String value) {
			this.addCriterion("S4 =", value, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4NotEqualTo(String value) {
			this.addCriterion("S4 <>", value, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4GreaterThan(String value) {
			this.addCriterion("S4 >", value, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4GreaterThanOrEqualTo(String value) {
			this.addCriterion("S4 >=", value, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4LessThan(String value) {
			this.addCriterion("S4 <", value, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4LessThanOrEqualTo(String value) {
			this.addCriterion("S4 <=", value, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4Like(String value) {
			this.addCriterion("S4 like", value, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4NotLike(String value) {
			this.addCriterion("S4 not like", value, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4In(List<String> values) {
			this.addCriterion("S4 in", values, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4NotIn(List<String> values) {
			this.addCriterion("S4 not in", values, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4Between(String value1, String value2) {
			this.addCriterion("S4 between", value1, value2, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS4NotBetween(String value1, String value2) {
			this.addCriterion("S4 not between", value1, value2, "s4");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5IsNull() {
			this.addCriterion("S5 is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5IsNotNull() {
			this.addCriterion("S5 is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5EqualTo(String value) {
			this.addCriterion("S5 =", value, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5NotEqualTo(String value) {
			this.addCriterion("S5 <>", value, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5GreaterThan(String value) {
			this.addCriterion("S5 >", value, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5GreaterThanOrEqualTo(String value) {
			this.addCriterion("S5 >=", value, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5LessThan(String value) {
			this.addCriterion("S5 <", value, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5LessThanOrEqualTo(String value) {
			this.addCriterion("S5 <=", value, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5Like(String value) {
			this.addCriterion("S5 like", value, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5NotLike(String value) {
			this.addCriterion("S5 not like", value, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5In(List<String> values) {
			this.addCriterion("S5 in", values, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5NotIn(List<String> values) {
			this.addCriterion("S5 not in", values, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5Between(String value1, String value2) {
			this.addCriterion("S5 between", value1, value2, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andS5NotBetween(String value1, String value2) {
			this.addCriterion("S5 not between", value1, value2, "s5");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1IsNull() {
			this.addCriterion("NUM1 is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1IsNotNull() {
			this.addCriterion("NUM1 is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1EqualTo(long value) {
			this.addCriterion("NUM1 =", new Long(value), "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1NotEqualTo(long value) {
			this.addCriterion("NUM1 <>", new Long(value), "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1GreaterThan(long value) {
			this.addCriterion("NUM1 >", new Long(value), "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1GreaterThanOrEqualTo(long value) {
			this.addCriterion("NUM1 >=", new Long(value), "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1LessThan(long value) {
			this.addCriterion("NUM1 <", new Long(value), "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1LessThanOrEqualTo(long value) {
			this.addCriterion("NUM1 <=", new Long(value), "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1In(List<Long> values) {
			this.addCriterion("NUM1 in", values, "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1NotIn(List<Long> values) {
			this.addCriterion("NUM1 not in", values, "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1Between(long value1, long value2) {
			this.addCriterion("NUM1 between", new Long(value1), new Long(value2), "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum1NotBetween(long value1, long value2) {
			this.addCriterion("NUM1 not between", new Long(value1), new Long(value2), "num1");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2IsNull() {
			this.addCriterion("NUM2 is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2IsNotNull() {
			this.addCriterion("NUM2 is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2EqualTo(long value) {
			this.addCriterion("NUM2 =", new Long(value), "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2NotEqualTo(long value) {
			this.addCriterion("NUM2 <>", new Long(value), "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2GreaterThan(long value) {
			this.addCriterion("NUM2 >", new Long(value), "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2GreaterThanOrEqualTo(long value) {
			this.addCriterion("NUM2 >=", new Long(value), "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2LessThan(long value) {
			this.addCriterion("NUM2 <", new Long(value), "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2LessThanOrEqualTo(long value) {
			this.addCriterion("NUM2 <=", new Long(value), "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2In(List<Long> values) {
			this.addCriterion("NUM2 in", values, "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2NotIn(List<Long> values) {
			this.addCriterion("NUM2 not in", values, "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2Between(long value1, long value2) {
			this.addCriterion("NUM2 between", new Long(value1), new Long(value2), "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum2NotBetween(long value1, long value2) {
			this.addCriterion("NUM2 not between", new Long(value1), new Long(value2), "num2");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3IsNull() {
			this.addCriterion("NUM3 is null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3IsNotNull() {
			this.addCriterion("NUM3 is not null");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3EqualTo(long value) {
			this.addCriterion("NUM3 =", new Long(value), "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3NotEqualTo(long value) {
			this.addCriterion("NUM3 <>", new Long(value), "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3GreaterThan(long value) {
			this.addCriterion("NUM3 >", new Long(value), "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3GreaterThanOrEqualTo(long value) {
			this.addCriterion("NUM3 >=", new Long(value), "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3LessThan(long value) {
			this.addCriterion("NUM3 <", new Long(value), "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3LessThanOrEqualTo(long value) {
			this.addCriterion("NUM3 <=", new Long(value), "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3In(List<Long> values) {
			this.addCriterion("NUM3 in", values, "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3NotIn(List<Long> values) {
			this.addCriterion("NUM3 not in", values, "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3Between(long value1, long value2) {
			this.addCriterion("NUM3 between", new Long(value1), new Long(value2), "num3");
			return (UserInfoExample.Criteria)this;
		}

		public UserInfoExample.Criteria andNum3NotBetween(long value1, long value2) {
			this.addCriterion("NUM3 not between", new Long(value1), new Long(value2), "num3");
			return (UserInfoExample.Criteria)this;
		}
	}

}
