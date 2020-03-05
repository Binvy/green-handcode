package com.tstar.ocs.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:23
 */
public class OcsCustomerBill {

	private Integer id;
	private String customerId;
	private String accountId;
	private String customerNo;
	private String customerName;
	private Integer customerType;
	private String userId;
	private String billNo;
	private String billMonth;
	private Date startDate;
	private Date endDate;
	private BigDecimal amountDue;
	private BigDecimal amountProceed;
	private BigDecimal amountScore;
	private Integer payPolicy;
	private Integer status;
	private Date createTime;
	private Date updateTime;
	private BigDecimal hf1;
	private BigDecimal hf2;
	private BigDecimal hf3;
	private BigDecimal hf4;
	private BigDecimal hf5;
	private BigDecimal hf6;
	private BigDecimal hf7;
	private BigDecimal hf8;
	private BigDecimal hf9;
	private BigDecimal hf10;
	private BigDecimal hf11;
	private BigDecimal hf12;
	private BigDecimal hf13;
	private BigDecimal hf14;
	private BigDecimal hf15;
	private BigDecimal hf16;
	private BigDecimal hf17;
	private BigDecimal hf18;
	private BigDecimal hf19;
	private BigDecimal hf20;
	private BigDecimal hf21;
	private BigDecimal hf22;
	private BigDecimal hf23;
	private BigDecimal hf24;
	private BigDecimal hf25;
	private BigDecimal hf26;
	private BigDecimal hthzfs1;
	private BigDecimal zfs1;
	private BigDecimal zfs2;
	private BigDecimal zfs3;
	private BigDecimal zfs4;
	private BigDecimal zfs5;
	private BigDecimal zfs28;
	private BigDecimal zfs29;
	private BigDecimal zfs9;
	private BigDecimal zfs91;
	private BigDecimal zfs92;
	private BigDecimal zfs93;
	private BigDecimal zfs94;
	private BigDecimal amountTotal;
	private BigDecimal amountAdjust;
	private BigDecimal amountDiscount;
	private BigDecimal amountOverdue;
	private String remark;
	private String overdueFlag;
	private String amount;
	private String departmentId;
	private String businessSta;
	private String userName;
	private String userType;
	private String businessKey;
	private String shf;
	private String gnctf;
	private String gjctf;

	public BigDecimal getHf14() {
		return this.hf14;
	}

	public void setHf14(BigDecimal hf14) {
		this.hf14 = hf14;
	}

	public BigDecimal getHf15() {
		return this.hf15;
	}

	public void setHf15(BigDecimal hf15) {
		this.hf15 = hf15;
	}

	public BigDecimal getHf16() {
		return this.hf16;
	}

	public void setHf16(BigDecimal hf16) {
		this.hf16 = hf16;
	}

	public BigDecimal getHf17() {
		return this.hf17;
	}

	public void setHf17(BigDecimal hf17) {
		this.hf17 = hf17;
	}

	public BigDecimal getHf18() {
		return this.hf18;
	}

	public void setHf18(BigDecimal hf18) {
		this.hf18 = hf18;
	}

	public BigDecimal getHf19() {
		return this.hf19;
	}

	public void setHf19(BigDecimal hf19) {
		this.hf19 = hf19;
	}

	public BigDecimal getHf20() {
		return this.hf20;
	}

	public void setHf20(BigDecimal hf20) {
		this.hf20 = hf20;
	}

	public BigDecimal getHf21() {
		return this.hf21;
	}

	public void setHf21(BigDecimal hf21) {
		this.hf21 = hf21;
	}

	public BigDecimal getHf22() {
		return this.hf22;
	}

	public void setHf22(BigDecimal hf22) {
		this.hf22 = hf22;
	}

	public BigDecimal getHf23() {
		return this.hf23;
	}

	public void setHf23(BigDecimal hf23) {
		this.hf23 = hf23;
	}

	public BigDecimal getHf24() {
		return this.hf24;
	}

	public void setHf24(BigDecimal hf24) {
		this.hf24 = hf24;
	}

	public BigDecimal getHf25() {
		return this.hf25;
	}

	public void setHf25(BigDecimal hf25) {
		this.hf25 = hf25;
	}

	public BigDecimal getHf26() {
		return this.hf26;
	}

	public void setHf26(BigDecimal hf26) {
		this.hf26 = hf26;
	}

	public String getOverdueFlag() {
		return this.overdueFlag;
	}

	public void setOverdueFlag(String overdueFlag) {
		this.overdueFlag = overdueFlag;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public OcsCustomerBill() {
		this.hf1 = new BigDecimal(0);
		this.hf2 = new BigDecimal(0);
		this.hf3 = new BigDecimal(0);
		this.hf4 = new BigDecimal(0);
		this.hf5 = new BigDecimal(0);
		this.hf6 = new BigDecimal(0);
		this.hf7 = new BigDecimal(0);
		this.hf8 = new BigDecimal(0);
		this.hf9 = new BigDecimal(0);
		this.hf10 = new BigDecimal(0);
		this.hf11 = new BigDecimal(0);
		this.hf12 = new BigDecimal(0);
		this.hf13 = new BigDecimal(0);
		this.hf14 = new BigDecimal(0);
		this.hf15 = new BigDecimal(0);
		this.hf16 = new BigDecimal(0);
		this.hf17 = new BigDecimal(0);
		this.hf18 = new BigDecimal(0);
		this.hf19 = new BigDecimal(0);
		this.hf20 = new BigDecimal(0);
		this.hf21 = new BigDecimal(0);
		this.hf22 = new BigDecimal(0);
		this.hf23 = new BigDecimal(0);
		this.hf24 = new BigDecimal(0);
		this.hf25 = new BigDecimal(0);
		this.hf26 = new BigDecimal(0);
		this.hthzfs1 = new BigDecimal(0);
		this.zfs1 = new BigDecimal(0);
		this.zfs2 = new BigDecimal(0);
		this.zfs3 = new BigDecimal(0);
		this.zfs4 = new BigDecimal(0);
		this.zfs5 = new BigDecimal(0);
		this.zfs28 = new BigDecimal(0);
		this.zfs29 = new BigDecimal(0);
		this.zfs9 = new BigDecimal(0);
		this.zfs91 = new BigDecimal(0);
		this.zfs92 = new BigDecimal(0);
		this.zfs93 = new BigDecimal(0);
		this.zfs94 = new BigDecimal(0);
		this.amountTotal = new BigDecimal(0);
		this.amountAdjust = new BigDecimal(0);
		this.amountDiscount = new BigDecimal(0);
		this.amountDue = new BigDecimal(0);
		this.amountProceed = new BigDecimal(0);
		this.amountScore = new BigDecimal(0);
		this.amountOverdue = new BigDecimal(0);
	}

	public OcsCustomerBill(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId == null ? null : customerId.trim();
	}

	public String getAccountId() {
		return this.accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId == null ? null : accountId.trim();
	}

	public String getCustomerNo() {
		return this.customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo == null ? null : customerNo.trim();
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName == null ? null : customerName.trim();
	}

	public Integer getCustomerType() {
		return this.customerType;
	}

	public void setCustomerType(Integer customerType) {
		this.customerType = customerType;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId == null ? null : userId.trim();
	}

	public String getBillNo() {
		return this.billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo == null ? null : billNo.trim();
	}

	public String getBillMonth() {
		return this.billMonth;
	}

	public void setBillMonth(String billMonth) {
		this.billMonth = billMonth == null ? null : billMonth.trim();
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public BigDecimal getAmountDue() {
		return this.amountDue;
	}

	public void setAmountDue(BigDecimal amountDue) {
		this.amountDue = amountDue;
	}

	public BigDecimal getAmountProceed() {
		return this.amountProceed;
	}

	public void setAmountProceed(BigDecimal amountProceed) {
		this.amountProceed = amountProceed;
	}

	public BigDecimal getAmountScore() {
		return this.amountScore;
	}

	public void setAmountScore(BigDecimal amountScore) {
		this.amountScore = amountScore;
	}

	public Integer getPayPolicy() {
		return this.payPolicy;
	}

	public void setPayPolicy(Integer payPolicy) {
		this.payPolicy = payPolicy;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public BigDecimal getHf1() {
		return this.hf1;
	}

	public void setHf1(BigDecimal hf1) {
		this.hf1 = hf1;
	}

	public BigDecimal getHf2() {
		return this.hf2;
	}

	public void setHf2(BigDecimal hf2) {
		this.hf2 = hf2;
	}

	public BigDecimal getHf3() {
		return this.hf3;
	}

	public void setHf3(BigDecimal hf3) {
		this.hf3 = hf3;
	}

	public BigDecimal getHf4() {
		return this.hf4;
	}

	public void setHf4(BigDecimal hf4) {
		this.hf4 = hf4;
	}

	public BigDecimal getHf5() {
		return this.hf5;
	}

	public void setHf5(BigDecimal hf5) {
		this.hf5 = hf5;
	}

	public BigDecimal getHf6() {
		return this.hf6;
	}

	public void setHf6(BigDecimal hf6) {
		this.hf6 = hf6;
	}

	public BigDecimal getHf7() {
		return this.hf7;
	}

	public void setHf7(BigDecimal hf7) {
		this.hf7 = hf7;
	}

	public BigDecimal getHf8() {
		return this.hf8;
	}

	public void setHf8(BigDecimal hf8) {
		this.hf8 = hf8;
	}

	public BigDecimal getHf9() {
		return this.hf9;
	}

	public void setHf9(BigDecimal hf9) {
		this.hf9 = hf9;
	}

	public BigDecimal getHf10() {
		return this.hf10;
	}

	public void setHf10(BigDecimal hf10) {
		this.hf10 = hf10;
	}

	public BigDecimal getHf11() {
		return this.hf11;
	}

	public void setHf11(BigDecimal hf11) {
		this.hf11 = hf11;
	}

	public BigDecimal getHf12() {
		return this.hf12;
	}

	public void setHf12(BigDecimal hf12) {
		this.hf12 = hf12;
	}

	public BigDecimal getHf13() {
		return this.hf13;
	}

	public void setHf13(BigDecimal hf13) {
		this.hf13 = hf13;
	}

	public BigDecimal getHthzfs1() {
		return this.hthzfs1;
	}

	public void setHthzfs1(BigDecimal hthzfs1) {
		this.hthzfs1 = hthzfs1;
	}

	public BigDecimal getZfs1() {
		return this.zfs1;
	}

	public void setZfs1(BigDecimal zfs1) {
		this.zfs1 = zfs1;
	}

	public BigDecimal getZfs2() {
		return this.zfs2;
	}

	public void setZfs2(BigDecimal zfs2) {
		this.zfs2 = zfs2;
	}

	public BigDecimal getZfs3() {
		return this.zfs3;
	}

	public void setZfs3(BigDecimal zfs3) {
		this.zfs3 = zfs3;
	}

	public BigDecimal getZfs4() {
		return this.zfs4;
	}

	public void setZfs4(BigDecimal zfs4) {
		this.zfs4 = zfs4;
	}

	public BigDecimal getZfs5() {
		return this.zfs5;
	}

	public void setZfs5(BigDecimal zfs5) {
		this.zfs5 = zfs5;
	}

	public BigDecimal getZfs28() {
		return this.zfs28;
	}

	public void setZfs28(BigDecimal zfs28) {
		this.zfs28 = zfs28;
	}

	public BigDecimal getZfs29() {
		return this.zfs29;
	}

	public void setZfs29(BigDecimal zfs29) {
		this.zfs29 = zfs29;
	}

	public BigDecimal getZfs9() {
		return this.zfs9;
	}

	public void setZfs9(BigDecimal zfs9) {
		this.zfs9 = zfs9;
	}

	public BigDecimal getZfs91() {
		return this.zfs91;
	}

	public void setZfs91(BigDecimal zfs91) {
		this.zfs91 = zfs91;
	}

	public BigDecimal getZfs92() {
		return this.zfs92;
	}

	public void setZfs92(BigDecimal zfs92) {
		this.zfs92 = zfs92;
	}

	public BigDecimal getZfs93() {
		return this.zfs93;
	}

	public void setZfs93(BigDecimal zfs93) {
		this.zfs93 = zfs93;
	}

	public BigDecimal getZfs94() {
		return this.zfs94;
	}

	public void setZfs94(BigDecimal zfs94) {
		this.zfs94 = zfs94;
	}

	public BigDecimal getAmountTotal() {
		return this.amountTotal;
	}

	public void setAmountTotal(BigDecimal amountTotal) {
		this.amountTotal = amountTotal;
	}

	public BigDecimal getAmountAdjust() {
		return this.amountAdjust;
	}

	public void setAmountAdjust(BigDecimal amountAdjust) {
		this.amountAdjust = amountAdjust;
	}

	public BigDecimal getAmountDiscount() {
		return this.amountDiscount;
	}

	public void setAmountDiscount(BigDecimal amountDiscount) {
		this.amountDiscount = amountDiscount;
	}

	public BigDecimal getAmountOverdue() {
		return this.amountOverdue;
	}

	public void setAmountOverdue(BigDecimal amountOverdue) {
		this.amountOverdue = amountOverdue;
	}

	public int findUserTypes() {
		int userTypes = 0;
		double phoneFee = this.hf1.doubleValue() + this.hf2.doubleValue() + this.hf3.doubleValue() + this.hf4.doubleValue() + this.hf4.doubleValue() + this.hf5.doubleValue() + this.hf6.doubleValue() + this.hf7.doubleValue() + this.hf8.doubleValue() + this.hf9.doubleValue() + this.hf10.doubleValue() + this.hf11.doubleValue() + this.hf12.doubleValue() + this.hf13.doubleValue() + this.hf14.doubleValue() + this.hf15.doubleValue() + this.hf16.doubleValue() + this.hf17.doubleValue() + this.hf18.doubleValue() + this.hf19.doubleValue() + this.hf20.doubleValue() + this.hf21.doubleValue() + this.hf22.doubleValue() + this.hf23.doubleValue() + this.hf24.doubleValue() + this.hf25.doubleValue() + this.hf26.doubleValue() + this.hthzfs1.doubleValue() + this.zfs91.doubleValue() + this.zfs1.doubleValue() + this.zfs2.doubleValue() + this.zfs3.doubleValue() + this.zfs4.doubleValue() + this.zfs5.doubleValue() + this.zfs28.doubleValue() + this.zfs29.doubleValue() + this.zfs9.doubleValue();
		if (phoneFee > 0.0D) {
			++userTypes;
		}

		if (userTypes == 0) {
			userTypes = 1;
		}

		return userTypes;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getBusinessKey() {
		return this.businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	public String getShf() {
		return this.shf;
	}

	public void setShf(String shf) {
		this.shf = shf;
	}

	public String getGnctf() {
		return this.gnctf;
	}

	public void setGnctf(String gnctf) {
		this.gnctf = gnctf;
	}

	public String getGjctf() {
		return this.gjctf;
	}

	public void setGjctf(String gjctf) {
		this.gjctf = gjctf;
	}

	public String getAmount() {
		return this.amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getDepartmentId() {
		return this.departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getBusinessSta() {
		return this.businessSta;
	}

	public void setBusinessSta(String businessSta) {
		this.businessSta = businessSta;
	}

}
