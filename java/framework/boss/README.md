# spring-struts-mybatis搭建手册

## 项目说明

​		由spring5.2、struts2.5、mybatis3.5整合搭建的java web项目后端脚手架。

## 项目目录

```txt
\spring-struts-mybatis
│  pom.xml
│  spring-struts-mybatis.iml
│  
├─src
│  ├─main
│  │  ├─java
│  │  │  └─com
│  │  │      └─demo
│  │  │          ├─action										
│  │  │          │      LoginAction.java
│  │  │          │      OrderAction.java
│  │  │          │      SystemAction.java
│  │  │          │      UserAction.java
│  │  │          │      
│  │  │          ├─interceptor
│  │  │          │      SessionInterceptor.java
│  │  │          │      
│  │  │          ├─manager
│  │  │          │  └─impl
│  │  │          ├─mapper
│  │  │          │      PersonMapper.java
│  │  │          │      UserMapper.java
│  │  │          │      
│  │  │          ├─model
│  │  │          │      Person.java
│  │  │          │      PersonExample.java
│  │  │          │      User.java
│  │  │          │      UserExample.java
│  │  │          │      
│  │  │          ├─service
│  │  │          │  │  UserService.java
│  │  │          │  │  
│  │  │          │  └─impl
│  │  │          │          UserServiceImpl.java
│  │  │          │          
│  │  │          └─util
│  │  │                  MybatisGeneratorUtil.java      // mybatis逆向工程生成器
│  │  │                  
│  │  ├─resources
│  │  │  │  generatorConfig.xml                         // mybatis逆向工程生成器配置
│  │  │  │  jdbc.properties                             // jdbc数据库连接配置
│  │  │  │  log4j2.xml                                  // log4j2日志配置
│  │  │  │  mybatis.xml                                 // mybatis配置（无特殊配置可省略）
│  │  │  │  struts-module1.xml                          // struts模块化配置1（可省略）
│  │  │  │  struts-module2.xml                          // struts模块化配置2（可省略）
│  │  │  │  struts.properties                           // struts属性配置（可省略）
│  │  │  │  struts.xml                                  // struts基础配置
│  │  │  │  
│  │  │  ├─com
│  │  │  │  └─demo
│  │  │  │      └─mapper                                // mapperXML配置（与mapper路径相同）
│  │  │  │              PersonMapper.xml			
│  │  │  │              UserMapper.xml
│  │  │  │              
│  │  │  └─spring                                       // spring模块化配置（可省略）
│  │  │          spring-dao.xml                         // dao层bean配置
│  │  │          spring-manager.xml                     // manager层bean配置
│  │  │          spring-service.xml                     // service层bean配置
│  │  │          
│  │  └─webapp
│  │      │  error.jsp
│  │      │  exception.jsp
│  │      │  index.jsp
│  │      │  login.jsp
│  │      │  portal.jsp
│  │      │  
│  │      └─WEB-INF
│  │          │  applicationContext.xml                 // spring应用上下文配置
│  │          │  web.xml                                // web应用配置
│  │          │  
│  │          └─page                                    // 页面文件夹
│  │                  dashboard.jsp
│  │                  default.jsp
│  │                  order.jsp
│  │                  user.jsp
│  │                  
│  └─test
│      └─com
│          └─demo
│              ├─action
│              ├─manager
│              ├─mapper
│              ├─model
│              ├─service
│              └─util
└─target
```

## 配置信息

### maven

pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>ssm</groupId>
  <artifactId>spring-struts-mybatis</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>war</packaging>

  <name>spring-struts-mybatis Maven Webapp</name>
  <url>http://www.example.com</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
    <spring.version>5.2.1.RELEASE</spring.version>
    <struts.version>2.5.20</struts.version>
    <log4j2.version>2.12.1</log4j2.version>
    <mybatis.version>3.5.3</mybatis.version>
    <mybatis.spring.version>2.0.3</mybatis.spring.version>
    <mybatis.generator.version>1.4.0</mybatis.generator.version>
    <mysql.version>5.1.6</mysql.version>
  </properties>

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.11</version>
      <scope>test</scope>
    </dependency>

    <!-- spring -->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-beans</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-context</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-web</artifactId>
      <version>${spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-jdbc</artifactId>
      <version>${spring.version}</version>
    </dependency>

    <!-- struts2 -->
    <dependency>
      <groupId>org.apache.struts</groupId>
      <artifactId>struts2-core</artifactId>
      <version>${struts.version}</version>
    </dependency>
    <dependency>
      <groupId>org.apache.struts</groupId>
      <artifactId>struts2-json-plugin</artifactId>
      <version>${struts.version}</version>
    </dependency>
    <dependency>
      <groupId>org.apache.struts</groupId>
      <artifactId>struts2-spring-plugin</artifactId>
      <version>${struts.version}</version>
    </dependency>

    <!-- log4j2 -->
    <dependency>
      <groupId>org.apache.logging.log4j</groupId>
      <artifactId>log4j-core</artifactId>
      <version>${log4j2.version}</version>
    </dependency>

    <!-- mybatis -->
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis</artifactId>
      <version>${mybatis.version}</version>
    </dependency>
    <dependency>
      <groupId>org.mybatis</groupId>
      <artifactId>mybatis-spring</artifactId>
      <version>${mybatis.spring.version}</version>
    </dependency>
    <dependency>
      <groupId>org.mybatis.generator</groupId>
      <artifactId>mybatis-generator-core</artifactId>
      <version>${mybatis.generator.version}</version>
    </dependency>

    <!-- mysql -->
    <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>${mysql.version}</version>
    </dependency>

  </dependencies>

  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>org.apache.logging.log4j</groupId>
        <artifactId>log4j-api</artifactId>
        <version>${log4j2.version}</version>
      </dependency>
    </dependencies>
  </dependencyManagement>

  <build>
    <finalName>spring-struts-mybatis</finalName>
    <pluginManagement><!-- lock down plugins versions to avoid using Maven defaults (may be moved to parent pom) -->
      <plugins>
        <plugin>
          <artifactId>maven-clean-plugin</artifactId>
          <version>3.1.0</version>
        </plugin>
        <!-- see http://maven.apache.org/ref/current/maven-core/default-bindings.html#Plugin_bindings_for_war_packaging -->
        <plugin>
          <artifactId>maven-resources-plugin</artifactId>
          <version>3.0.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>3.8.0</version>
        </plugin>
        <plugin>
          <artifactId>maven-surefire-plugin</artifactId>
          <version>2.22.1</version>
        </plugin>
        <plugin>
          <artifactId>maven-war-plugin</artifactId>
          <version>3.2.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-install-plugin</artifactId>
          <version>2.5.2</version>
        </plugin>
        <plugin>
          <artifactId>maven-deploy-plugin</artifactId>
          <version>2.8.2</version>
        </plugin>
      </plugins>
    </pluginManagement>
  </build>
</project>
```

### web

web.xml

```xml
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app id="WebApp_9" version="2.4"
         xmlns="http://java.sun.com/xml/ns/j2ee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">

  <display-name>Spring Strut2 Mybatis Maven Web Application</display-name>

  <!-- spring -->
  <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>

  <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/applicationContext*.xml, classpath*:applicationContext*.xml</param-value>
  </context-param>

  <!-- 编码过滤器 -->
  <filter>
    <filter-name>characterEncoding</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>UTF-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>characterEncoding</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>

  <!-- struts2 -->
  <filter>
    <filter-name>struts2</filter-name>
    <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
  </filter>
  <filter-mapping>
    <filter-name>struts2</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>

  <!-- 首页 -->
  <welcome-file-list>
    <welcome-file>index.jsp</welcome-file>
  </welcome-file-list>

</web-app>

```

### spring

spring官网: https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/index.html

- applicationContext.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xmlns:mybatis="http://mybatis.org/schema/mybatis-spring"
	   xmlns:tx="http://www.springframework.org/schema/tx" xmlns:context="http://www.springframework.org/schema/context"
	   xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
	   http://mybatis.org/schema/mybatis-spring http://mybatis.org/schema/mybatis-spring.xsd
	   http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd http://www.springframework.org/schema/context https://www.springframework.org/schema/context/spring-context.xsd">

	<context:property-placeholder location="classpath*:jdbc.properties"/>

	<!-- enable component scanning and autowire (beware that this does not enable mapper scanning!) -->
	<context:component-scan base-package="com.demo.service" />

	<!-- dataSource config -->
	<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="${jdbc.driver}" />
		<property name="url" value="${jdbc.url}" />
		<property name="username" value="${jdbc.username}" />
		<property name="password" value="${jdbc.password}" />
	</bean>

	<!-- transaction manager, use JtaTransactionManager for global tx -->
	<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<constructor-arg ref="dataSource"/>
	</bean>

	<!-- enable transaction demarcation with annotations -->
	<tx:annotation-driven />

	<!-- define the SqlSessionFactory -->
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<!--<property name="configLocation" value="classpath*:mybatis.xml" />-->
		<property name="dataSource" ref="dataSource" />
		<property name="typeAliasesPackage" value="com.demo.model" />
		<property name="mapperLocations" value="classpath*:com/demo/mapper/**/*.xml"/>
	</bean>

	<!-- define the SqlSession -->
	<bean id="sqlSession" class="org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg ref="sqlSessionFactory"/>
	</bean>

	<!-- scan for mappers and let them be autowired -->
	<mybatis:scan base-package="com.demo.mapper" />

	<!-- import beans from other config file -->
	<import resource="classpath*:spring/spring-dao.xml" />
	<import resource="classpath*:spring/spring-service.xml" />
	<import resource="classpath*:spring/spring-manager.xml" />
</beans>
```

- spring-dao.xml

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
	   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

	<!-- dao层相关bean配置 -->
	<!--<bean id="userDAO" class="com.demo.dao.impl.UserDAOImpl" />-->

</beans>
```

- spring-service.xml

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
	   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

	<!-- service层相关bean配置 -->
	<!--<bean id="userService" class="com.demo.service.impl.UserServiceImpl" />-->

</beans>
```

- spring-manager.xml

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
	   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	   xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">

	<!-- manager层相关bean配置 -->
	<!--<bean id="userManager" class="com.demo.manager.impl.UserManagerImpl" />-->

</beans>
```

### jdbc

jdbc.properties

```properties
jdbc.driverClassName=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=UTF-8
jdbc.password=root
jdbc.username=123456
```

### struts

struts2官网: https://struts.apache.org/core-developers/

- struts-xml:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
		"-//Apache Software Foundation//DTD Struts Configuration 2.5//EN"
		"http://struts.apache.org/dtds/struts-2.5.dtd">
<struts>

	<package name="default" extends="json-default">
		<!-- 采用json数据格式，package的extends必须是extends="json-default" -->
		<!-- 并且必须要用到struts2的json-lib，struts2-json-plugin包 -->
		<!-- 采用异步提交方式，result的type="json"，并且result节点值为空 -->
		<interceptors>
			<interceptor name="login" class="com.demo.interceptor.SessionInterceptor" />
			<interceptor-stack name="sessionStack">
				<interceptor-ref name="login" />
				<interceptor-ref name="defaultStack" />
			</interceptor-stack>
		</interceptors>

		<!-- 定义全局result -->
		<global-results>
			<result name="login">login.jsp</result>
			<result name="error">error.jsp</result>
			<result name="exception">exception.jsp</result>
		</global-results>

		<!--  定义全局异常处理映射-->
		<global-exception-mappings>
			<exception-mapping exception="java.lang.RuntimeException" result="error"/>
			<exception-mapping exception="java.sql.SQLException" result="exception"/>
		</global-exception-mappings>

		<!-- 登录操作 -->
		<action name="login" class="com.demo.action.LoginAction" >
			<result name="login" type="json"></result>
			<result name="fail" type="dispatcher">login.jsp</result>
			<result name="success" type="redirect">sysIndex!gotoPortal.do</result>
			<interceptor-ref name="sessionStack" />
		</action>

		<!-- 系统 -->
		<action name="sysIndex" class="com.demo.action.SystemAction">
			<result name="portalPage" type="dispatcher">portal.jsp</result>
			<result name="dashboardPage" type="dispatcher">/WEB-INF/page/dashboard.jsp</result>
			<result name="getRecords" type="json"></result>
			<interceptor-ref name="sessionStack" />
		</action>
	</package>

	<include file="struts-module1.xml" />
	<include file="struts-module2.xml" />
</struts>
```

- struts-module1.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
		"-//Apache Software Foundation//DTD Struts Configuration 2.5//EN"
		"http://struts.apache.org/dtds/struts-2.5.dtd">
<struts>
	<package name="user" namespace="/user" extends="json-default">
		<global-results>
			<result name="success">/WEB-INF/page/user.jsp</result>
		</global-results>
		<action name="add" class="com.demo.action.UserAction" method="add" />
		<action name="delete" class="com.demo.action.UserAction" method="delete" />
		<action name="update" class="com.demo.action.UserAction" method="update" />
		<action name="select" class="com.demo.action.UserAction" method="select">
			<result name="success">/WEB-INF/page/user.jsp</result>
		</action>
	</package>
</struts>
```

- struts-module2.xml

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
		"-//Apache Software Foundation//DTD Struts Configuration 2.5//EN"
		"http://struts.apache.org/dtds/struts-2.5.dtd">
<struts>
	<package name="order" namespace="/order" extends="struts-default">
		<global-results>
			<result name="success">/WEB-INF/page/order.jsp</result>
		</global-results>
		<action name="add" class="com.demo.action.OrderAction" method="add"/>
		<action name="delete" class="com.demo.action.OrderAction" method="delete"/>
		<action name="update" class="com.demo.action.OrderAction" method="update"/>
		<action name="select" class="com.demo.action.OrderAction" method="select">
			<result name="success">/WEB-INF/page/order.jsp</result>
		</action>
	</package>
</struts>
```

- struts.properties（若无特殊配置，可省略）

```properties
# 开发者模式
struts.devMode = true
# 后缀扩展
struts.action.extension = action,do,,
# 配置修改后重新加载
struts.configuration.xml.reload = true
# action名称允许正斜杠
struts.enable.SlashesInActionNames = true
# 动态方法调用，比如：user!add.action
struts.enable.DynamicMethodInvocation = true
# 文件上传最大限制
struts.multipart.maxSize = 20971520
# 对象工厂管理
struts.objectFactory = spring
# 允许ognl表达式中的静态方法调用
struts.ognl.allowStaticMethodAccess = true

```

### mybatis

mybatis3：https://mybatis.org/mybatis-3/index.html

mybatis-spring：http://mybatis.org/spring/index.html

mybatis-generator：http://mybatis.org/generator/index.html

- mybatis.xml （若无特殊配置，如自定义的mapperxml路径，则此文件可省略）

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
		PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
		"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>

	<properties resource="jdbc.properties">
		<property name="org.apache.ibatis.parsing.PropertyParser.enable-default-value" value="true"/>
	</properties>

	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC"/>
			<dataSource type="POOLED">
				<property name="driver" value="${jdbc.driver}"/>
				<property name="url" value="${jdbc.url}"/>
				<property name="username" value="${jdbc.username}"/>
				<property name="password" value="${jdbc.password}"/>
			</dataSource>
		</environment>
	</environments>

	<mappers>
		<mapper resource=""/>
	</mappers>

</configuration>
```

- generatorConfig.xml （mybatis逆向生成器配置）

```xml
<!DOCTYPE generatorConfiguration PUBLIC
		"-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
		"http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">
<generatorConfiguration>
	<context id="ssm_demo" targetRuntime="MyBatis3">
		<commentGenerator>
			<property name="suppressDate" value="true"/>
			<property name="suppressAllComments" value="true"/>
		</commentGenerator>

		<jdbcConnection driverClass="com.mysql.jdbc.Driver" connectionURL="jdbc:mysql://localhost:3306/demo"
						userId="root" password="123456">
			<property name="nullCatalogMeansCurrent" value="true" />
		</jdbcConnection>

		<javaTypeResolver>
			<property name="forceBigDecimals" value="false"/>
		</javaTypeResolver>

		<javaModelGenerator targetPackage="com.demo.model" targetProject="D:\workspace\green-handcode\java\framework\spring-struts-mybatis\src\main\java">
			<property name="enableSubPackages" value="true"/>
			<property name="trimStrings" value="true"/>
		</javaModelGenerator>

		<sqlMapGenerator targetPackage="com.demo.mapper" targetProject="D:\workspace\green-handcode\java\framework\spring-struts-mybatis\src\main\java">
			<property name="enableSubPackages" value="true"/>
		</sqlMapGenerator>

		<javaClientGenerator type="XMLMAPPER" targetPackage="com.demo.mapper" targetProject="D:\workspace\green-handcode\java\framework\spring-struts-mybatis\src\main\resources\com.demo.mapper">
			<property name="enableSubPackages" value="true"/>
		</javaClientGenerator>

		<table tableName="person"
			   domainObjectName="Person"
			   enableCountByExample="true"
			   enableUpdateByExample="true"
			   enableDeleteByExample="true"
			   enableSelectByExample="true"
			   selectByExampleQueryId="true">
		</table>

		<table tableName="user"></table>
	</context>
</generatorConfiguration>
```

### log

log4j2.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration>
	<Properties>
		<Property name="filename">target/rolling/rolling-$${sd:type}.log</Property>
	</Properties>
	<Filter type="ThresholdFilter" level="debug"/>

	<Appenders>
		<Console name="STDOUT" target="SYSTEM_OUT">
			<PatternLayout pattern="%d %-5p [%t] %C{2} (%F:%L) - %m%n"/>
		</Console>
	</Appenders>

	<Loggers>
		<Logger name="org.springframework" level="info"/>
		<Logger name="com.opensymphony.xwork2" level="info"/>
		<Logger name="org.apache.struts2" level="info"/>

		<Logger name="com.demo" level="debug"/>

		<Root level="debug">
			<AppenderRef ref="STDOUT"/>
		</Root>
	</Loggers>

</Configuration>
```

## src源码

### model

- com.demo.model.User

  ```java
  package com.demo.model;
  
  import java.util.Date;
  
  public class User {
      private String id;
  
      private String name;
  
      private Byte sex;
  
      private Date birthday;
  
      private String address;
  
      private String remark;
  
      public String getId() {
          return id;
      }
  
      public void setId(String id) {
          this.id = id == null ? null : id.trim();
      }
  
      public String getName() {
          return name;
      }
  
      public void setName(String name) {
          this.name = name == null ? null : name.trim();
      }
  
      public Byte getSex() {
          return sex;
      }
  
      public void setSex(Byte sex) {
          this.sex = sex;
      }
  
      public Date getBirthday() {
          return birthday;
      }
  
      public void setBirthday(Date birthday) {
          this.birthday = birthday;
      }
  
      public String getAddress() {
          return address;
      }
  
      public void setAddress(String address) {
          this.address = address == null ? null : address.trim();
      }
  
      public String getRemark() {
          return remark;
      }
  
      public void setRemark(String remark) {
          this.remark = remark == null ? null : remark.trim();
      }
  
      @Override
      public String toString() {
          return "User{" +
                  "id='" + id + '\'' +
                  ", name='" + name + '\'' +
                  ", sex=" + sex +
                  ", birthday=" + birthday +
                  ", address='" + address + '\'' +
                  ", remark='" + remark + '\'' +
                  '}';
      }
  }
  ```

  

- com.demo.model.UserExample

  ```java
  package com.demo.model;
  
  import java.util.ArrayList;
  import java.util.Date;
  import java.util.List;
  
  public class UserExample {
      protected String orderByClause;
  
      protected boolean distinct;
  
      protected List<Criteria> oredCriteria;
  
      public UserExample() {
          oredCriteria = new ArrayList<>();
      }
  
      public void setOrderByClause(String orderByClause) {
          this.orderByClause = orderByClause;
      }
  
      public String getOrderByClause() {
          return orderByClause;
      }
  
      public void setDistinct(boolean distinct) {
          this.distinct = distinct;
      }
  
      public boolean isDistinct() {
          return distinct;
      }
  
      public List<Criteria> getOredCriteria() {
          return oredCriteria;
      }
  
      public void or(Criteria criteria) {
          oredCriteria.add(criteria);
      }
  
      public Criteria or() {
          Criteria criteria = createCriteriaInternal();
          oredCriteria.add(criteria);
          return criteria;
      }
  
      public Criteria createCriteria() {
          Criteria criteria = createCriteriaInternal();
          if (oredCriteria.size() == 0) {
              oredCriteria.add(criteria);
          }
          return criteria;
      }
  
      protected Criteria createCriteriaInternal() {
          Criteria criteria = new Criteria();
          return criteria;
      }
  
      public void clear() {
          oredCriteria.clear();
          orderByClause = null;
          distinct = false;
      }
  
      protected abstract static class GeneratedCriteria {
          protected List<Criterion> criteria;
  
          protected GeneratedCriteria() {
              super();
              criteria = new ArrayList<>();
          }
  
          public boolean isValid() {
              return criteria.size() > 0;
          }
  
          public List<Criterion> getAllCriteria() {
              return criteria;
          }
  
          public List<Criterion> getCriteria() {
              return criteria;
          }
  
          protected void addCriterion(String condition) {
              if (condition == null) {
                  throw new RuntimeException("Value for condition cannot be null");
              }
              criteria.add(new Criterion(condition));
          }
  
          protected void addCriterion(String condition, Object value, String property) {
              if (value == null) {
                  throw new RuntimeException("Value for " + property + " cannot be null");
              }
              criteria.add(new Criterion(condition, value));
          }
  
          protected void addCriterion(String condition, Object value1, Object value2, String property) {
              if (value1 == null || value2 == null) {
                  throw new RuntimeException("Between values for " + property + " cannot be null");
              }
              criteria.add(new Criterion(condition, value1, value2));
          }
  
          public Criteria andIdIsNull() {
              addCriterion("id is null");
              return (Criteria) this;
          }
  
          public Criteria andIdIsNotNull() {
              addCriterion("id is not null");
              return (Criteria) this;
          }
  
          public Criteria andIdEqualTo(String value) {
              addCriterion("id =", value, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdNotEqualTo(String value) {
              addCriterion("id <>", value, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdGreaterThan(String value) {
              addCriterion("id >", value, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdGreaterThanOrEqualTo(String value) {
              addCriterion("id >=", value, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdLessThan(String value) {
              addCriterion("id <", value, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdLessThanOrEqualTo(String value) {
              addCriterion("id <=", value, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdLike(String value) {
              addCriterion("id like", value, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdNotLike(String value) {
              addCriterion("id not like", value, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdIn(List<String> values) {
              addCriterion("id in", values, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdNotIn(List<String> values) {
              addCriterion("id not in", values, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdBetween(String value1, String value2) {
              addCriterion("id between", value1, value2, "id");
              return (Criteria) this;
          }
  
          public Criteria andIdNotBetween(String value1, String value2) {
              addCriterion("id not between", value1, value2, "id");
              return (Criteria) this;
          }
  
          public Criteria andNameIsNull() {
              addCriterion("name is null");
              return (Criteria) this;
          }
  
          public Criteria andNameIsNotNull() {
              addCriterion("name is not null");
              return (Criteria) this;
          }
  
          public Criteria andNameEqualTo(String value) {
              addCriterion("name =", value, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameNotEqualTo(String value) {
              addCriterion("name <>", value, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameGreaterThan(String value) {
              addCriterion("name >", value, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameGreaterThanOrEqualTo(String value) {
              addCriterion("name >=", value, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameLessThan(String value) {
              addCriterion("name <", value, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameLessThanOrEqualTo(String value) {
              addCriterion("name <=", value, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameLike(String value) {
              addCriterion("name like", value, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameNotLike(String value) {
              addCriterion("name not like", value, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameIn(List<String> values) {
              addCriterion("name in", values, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameNotIn(List<String> values) {
              addCriterion("name not in", values, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameBetween(String value1, String value2) {
              addCriterion("name between", value1, value2, "name");
              return (Criteria) this;
          }
  
          public Criteria andNameNotBetween(String value1, String value2) {
              addCriterion("name not between", value1, value2, "name");
              return (Criteria) this;
          }
  
          public Criteria andSexIsNull() {
              addCriterion("sex is null");
              return (Criteria) this;
          }
  
          public Criteria andSexIsNotNull() {
              addCriterion("sex is not null");
              return (Criteria) this;
          }
  
          public Criteria andSexEqualTo(Byte value) {
              addCriterion("sex =", value, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexNotEqualTo(Byte value) {
              addCriterion("sex <>", value, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexGreaterThan(Byte value) {
              addCriterion("sex >", value, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexGreaterThanOrEqualTo(Byte value) {
              addCriterion("sex >=", value, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexLessThan(Byte value) {
              addCriterion("sex <", value, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexLessThanOrEqualTo(Byte value) {
              addCriterion("sex <=", value, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexIn(List<Byte> values) {
              addCriterion("sex in", values, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexNotIn(List<Byte> values) {
              addCriterion("sex not in", values, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexBetween(Byte value1, Byte value2) {
              addCriterion("sex between", value1, value2, "sex");
              return (Criteria) this;
          }
  
          public Criteria andSexNotBetween(Byte value1, Byte value2) {
              addCriterion("sex not between", value1, value2, "sex");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayIsNull() {
              addCriterion("birthday is null");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayIsNotNull() {
              addCriterion("birthday is not null");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayEqualTo(Date value) {
              addCriterion("birthday =", value, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayNotEqualTo(Date value) {
              addCriterion("birthday <>", value, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayGreaterThan(Date value) {
              addCriterion("birthday >", value, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayGreaterThanOrEqualTo(Date value) {
              addCriterion("birthday >=", value, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayLessThan(Date value) {
              addCriterion("birthday <", value, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayLessThanOrEqualTo(Date value) {
              addCriterion("birthday <=", value, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayIn(List<Date> values) {
              addCriterion("birthday in", values, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayNotIn(List<Date> values) {
              addCriterion("birthday not in", values, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayBetween(Date value1, Date value2) {
              addCriterion("birthday between", value1, value2, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andBirthdayNotBetween(Date value1, Date value2) {
              addCriterion("birthday not between", value1, value2, "birthday");
              return (Criteria) this;
          }
  
          public Criteria andAddressIsNull() {
              addCriterion("address is null");
              return (Criteria) this;
          }
  
          public Criteria andAddressIsNotNull() {
              addCriterion("address is not null");
              return (Criteria) this;
          }
  
          public Criteria andAddressEqualTo(String value) {
              addCriterion("address =", value, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressNotEqualTo(String value) {
              addCriterion("address <>", value, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressGreaterThan(String value) {
              addCriterion("address >", value, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressGreaterThanOrEqualTo(String value) {
              addCriterion("address >=", value, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressLessThan(String value) {
              addCriterion("address <", value, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressLessThanOrEqualTo(String value) {
              addCriterion("address <=", value, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressLike(String value) {
              addCriterion("address like", value, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressNotLike(String value) {
              addCriterion("address not like", value, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressIn(List<String> values) {
              addCriterion("address in", values, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressNotIn(List<String> values) {
              addCriterion("address not in", values, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressBetween(String value1, String value2) {
              addCriterion("address between", value1, value2, "address");
              return (Criteria) this;
          }
  
          public Criteria andAddressNotBetween(String value1, String value2) {
              addCriterion("address not between", value1, value2, "address");
              return (Criteria) this;
          }
  
          public Criteria andRemarkIsNull() {
              addCriterion("remark is null");
              return (Criteria) this;
          }
  
          public Criteria andRemarkIsNotNull() {
              addCriterion("remark is not null");
              return (Criteria) this;
          }
  
          public Criteria andRemarkEqualTo(String value) {
              addCriterion("remark =", value, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkNotEqualTo(String value) {
              addCriterion("remark <>", value, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkGreaterThan(String value) {
              addCriterion("remark >", value, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkGreaterThanOrEqualTo(String value) {
              addCriterion("remark >=", value, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkLessThan(String value) {
              addCriterion("remark <", value, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkLessThanOrEqualTo(String value) {
              addCriterion("remark <=", value, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkLike(String value) {
              addCriterion("remark like", value, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkNotLike(String value) {
              addCriterion("remark not like", value, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkIn(List<String> values) {
              addCriterion("remark in", values, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkNotIn(List<String> values) {
              addCriterion("remark not in", values, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkBetween(String value1, String value2) {
              addCriterion("remark between", value1, value2, "remark");
              return (Criteria) this;
          }
  
          public Criteria andRemarkNotBetween(String value1, String value2) {
              addCriterion("remark not between", value1, value2, "remark");
              return (Criteria) this;
          }
      }
  
      public static class Criteria extends GeneratedCriteria {
          protected Criteria() {
              super();
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
              return condition;
          }
  
          public Object getValue() {
              return value;
          }
  
          public Object getSecondValue() {
              return secondValue;
          }
  
          public boolean isNoValue() {
              return noValue;
          }
  
          public boolean isSingleValue() {
              return singleValue;
          }
  
          public boolean isBetweenValue() {
              return betweenValue;
          }
  
          public boolean isListValue() {
              return listValue;
          }
  
          public String getTypeHandler() {
              return typeHandler;
          }
  
          protected Criterion(String condition) {
              super();
              this.condition = condition;
              this.typeHandler = null;
              this.noValue = true;
          }
  
          protected Criterion(String condition, Object value, String typeHandler) {
              super();
              this.condition = condition;
              this.value = value;
              this.typeHandler = typeHandler;
              if (value instanceof List<?>) {
                  this.listValue = true;
              } else {
                  this.singleValue = true;
              }
          }
  
          protected Criterion(String condition, Object value) {
              this(condition, value, null);
          }
  
          protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
              super();
              this.condition = condition;
              this.value = value;
              this.secondValue = secondValue;
              this.typeHandler = typeHandler;
              this.betweenValue = true;
          }
  
          protected Criterion(String condition, Object value, Object secondValue) {
              this(condition, value, secondValue, null);
          }
      }
  }
  ```

### mapper

- com.demo.mapper.UserMapper

  ```java
  package com.demo.mapper;
  
  import com.demo.model.User;
  import com.demo.model.UserExample;
  import java.util.List;
  import org.apache.ibatis.annotations.Param;
  
  public interface UserMapper {
      long countByExample(UserExample example);
  
      int deleteByExample(UserExample example);
  
      int deleteByPrimaryKey(String id);
  
      int insert(User record);
  
      int insertSelective(User record);
  
      List<User> selectByExample(UserExample example);
  
      User selectByPrimaryKey(String id);
  
      int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);
  
      int updateByExample(@Param("record") User record, @Param("example") UserExample example);
  
      int updateByPrimaryKeySelective(User record);
  
      int updateByPrimaryKey(User record);
  }
  ```

  

### mapper.xml

- UserMapper.xml

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
  <mapper namespace="com.demo.mapper.UserMapper">
    <resultMap id="BaseResultMap" type="com.demo.model.User">
      <id column="id" jdbcType="VARCHAR" property="id" />
      <result column="name" jdbcType="VARCHAR" property="name" />
      <result column="sex" jdbcType="TINYINT" property="sex" />
      <result column="birthday" jdbcType="TIMESTAMP" property="birthday" />
      <result column="address" jdbcType="VARCHAR" property="address" />
      <result column="remark" jdbcType="VARCHAR" property="remark" />
    </resultMap>
    <sql id="Example_Where_Clause">
      <where>
        <foreach collection="oredCriteria" item="criteria" separator="or">
          <if test="criteria.valid">
            <trim prefix="(" prefixOverrides="and" suffix=")">
              <foreach collection="criteria.criteria" item="criterion">
                <choose>
                  <when test="criterion.noValue">
                    and ${criterion.condition}
                  </when>
                  <when test="criterion.singleValue">
                    and ${criterion.condition} #{criterion.value}
                  </when>
                  <when test="criterion.betweenValue">
                    and ${criterion.condition} #{criterion.value} and #{criterion.secondValue}
                  </when>
                  <when test="criterion.listValue">
                    and ${criterion.condition}
                    <foreach close=")" collection="criterion.value" item="listItem" open="(" separator=",">
                      #{listItem}
                    </foreach>
                  </when>
                </choose>
              </foreach>
            </trim>
          </if>
        </foreach>
      </where>
    </sql>
    <sql id="Update_By_Example_Where_Clause">
      <where>
        <foreach collection="example.oredCriteria" item="criteria" separator="or">
          <if test="criteria.valid">
            <trim prefix="(" prefixOverrides="and" suffix=")">
              <foreach collection="criteria.criteria" item="criterion">
                <choose>
                  <when test="criterion.noValue">
                    and ${criterion.condition}
                  </when>
                  <when test="criterion.singleValue">
                    and ${criterion.condition} #{criterion.value}
                  </when>
                  <when test="criterion.betweenValue">
                    and ${criterion.condition} #{criterion.value} and #{criterion.secondValue}
                  </when>
                  <when test="criterion.listValue">
                    and ${criterion.condition}
                    <foreach close=")" collection="criterion.value" item="listItem" open="(" separator=",">
                      #{listItem}
                    </foreach>
                  </when>
                </choose>
              </foreach>
            </trim>
          </if>
        </foreach>
      </where>
    </sql>
    <sql id="Base_Column_List">
      id, name, sex, birthday, address, remark
    </sql>
    <select id="selectByExample" parameterType="com.demo.model.UserExample" resultMap="BaseResultMap">
      select
      <if test="distinct">
        distinct
      </if>
      <include refid="Base_Column_List" />
      from user
      <if test="_parameter != null">
        <include refid="Example_Where_Clause" />
      </if>
      <if test="orderByClause != null">
        order by ${orderByClause}
      </if>
    </select>
    <select id="selectByPrimaryKey" parameterType="java.lang.String" resultMap="BaseResultMap">
      select 
      <include refid="Base_Column_List" />
      from user
      where id = #{id,jdbcType=VARCHAR}
    </select>
    <delete id="deleteByPrimaryKey" parameterType="java.lang.String">
      delete from user
      where id = #{id,jdbcType=VARCHAR}
    </delete>
    <delete id="deleteByExample" parameterType="com.demo.model.UserExample">
      delete from user
      <if test="_parameter != null">
        <include refid="Example_Where_Clause" />
      </if>
    </delete>
    <insert id="insert" parameterType="com.demo.model.User">
      insert into user (id, name, sex, 
        birthday, address, remark
        )
      values (#{id,jdbcType=VARCHAR}, #{name,jdbcType=VARCHAR}, #{sex,jdbcType=TINYINT}, 
        #{birthday,jdbcType=TIMESTAMP}, #{address,jdbcType=VARCHAR}, #{remark,jdbcType=VARCHAR}
        )
    </insert>
    <insert id="insertSelective" parameterType="com.demo.model.User">
      insert into user
      <trim prefix="(" suffix=")" suffixOverrides=",">
        <if test="id != null">
          id,
        </if>
        <if test="name != null">
          name,
        </if>
        <if test="sex != null">
          sex,
        </if>
        <if test="birthday != null">
          birthday,
        </if>
        <if test="address != null">
          address,
        </if>
        <if test="remark != null">
          remark,
        </if>
      </trim>
      <trim prefix="values (" suffix=")" suffixOverrides=",">
        <if test="id != null">
          #{id,jdbcType=VARCHAR},
        </if>
        <if test="name != null">
          #{name,jdbcType=VARCHAR},
        </if>
        <if test="sex != null">
          #{sex,jdbcType=TINYINT},
        </if>
        <if test="birthday != null">
          #{birthday,jdbcType=TIMESTAMP},
        </if>
        <if test="address != null">
          #{address,jdbcType=VARCHAR},
        </if>
        <if test="remark != null">
          #{remark,jdbcType=VARCHAR},
        </if>
      </trim>
    </insert>
    <select id="countByExample" parameterType="com.demo.model.UserExample" resultType="java.lang.Long">
      select count(*) from user
      <if test="_parameter != null">
        <include refid="Example_Where_Clause" />
      </if>
    </select>
    <update id="updateByExampleSelective" parameterType="map">
      update user
      <set>
        <if test="record.id != null">
          id = #{record.id,jdbcType=VARCHAR},
        </if>
        <if test="record.name != null">
          name = #{record.name,jdbcType=VARCHAR},
        </if>
        <if test="record.sex != null">
          sex = #{record.sex,jdbcType=TINYINT},
        </if>
        <if test="record.birthday != null">
          birthday = #{record.birthday,jdbcType=TIMESTAMP},
        </if>
        <if test="record.address != null">
          address = #{record.address,jdbcType=VARCHAR},
        </if>
        <if test="record.remark != null">
          remark = #{record.remark,jdbcType=VARCHAR},
        </if>
      </set>
      <if test="_parameter != null">
        <include refid="Update_By_Example_Where_Clause" />
      </if>
    </update>
    <update id="updateByExample" parameterType="map">
      update user
      set id = #{record.id,jdbcType=VARCHAR},
        name = #{record.name,jdbcType=VARCHAR},
        sex = #{record.sex,jdbcType=TINYINT},
        birthday = #{record.birthday,jdbcType=TIMESTAMP},
        address = #{record.address,jdbcType=VARCHAR},
        remark = #{record.remark,jdbcType=VARCHAR}
      <if test="_parameter != null">
        <include refid="Update_By_Example_Where_Clause" />
      </if>
    </update>
    <update id="updateByPrimaryKeySelective" parameterType="com.demo.model.User">
      update user
      <set>
        <if test="name != null">
          name = #{name,jdbcType=VARCHAR},
        </if>
        <if test="sex != null">
          sex = #{sex,jdbcType=TINYINT},
        </if>
        <if test="birthday != null">
          birthday = #{birthday,jdbcType=TIMESTAMP},
        </if>
        <if test="address != null">
          address = #{address,jdbcType=VARCHAR},
        </if>
        <if test="remark != null">
          remark = #{remark,jdbcType=VARCHAR},
        </if>
      </set>
      where id = #{id,jdbcType=VARCHAR}
    </update>
    <update id="updateByPrimaryKey" parameterType="com.demo.model.User">
      update user
      set name = #{name,jdbcType=VARCHAR},
        sex = #{sex,jdbcType=TINYINT},
        birthday = #{birthday,jdbcType=TIMESTAMP},
        address = #{address,jdbcType=VARCHAR},
        remark = #{remark,jdbcType=VARCHAR}
      where id = #{id,jdbcType=VARCHAR}
    </update>
  </mapper>
  ```

### service

- com.demo.service.UserService

  ```java
  package com.demo.service;
  
  import com.demo.model.User;
  
  public interface UserService {
  
  	void add(User user);
  
  	void delete(User user);
  
  	void deleteByPrimaryKey(String id);
  
  	void update(User user);
  
  	User select(String id);
  
  }
  ```

### service.impl

- com.demo.service.impl.UserServiceImpl

  ```java
  package com.demo.service.impl;
  
  import com.demo.mapper.UserMapper;
  import com.demo.model.User;
  import com.demo.service.UserService;
  import org.springframework.beans.factory.annotation.Autowired;
  import org.springframework.stereotype.Service;
  
  @Service
  public class UserServiceImpl implements UserService {
  
  	@Autowired
  	private UserMapper userMapper;
  
  	@Override
  	public void add(User user) {
  		userMapper.insert(user);
  	}
  
  	@Override
  	public void delete(User user) {
  		userMapper.deleteByPrimaryKey(user.getId());
  	}
  
  	@Override
  	public void deleteByPrimaryKey(String id) {
  		userMapper.deleteByPrimaryKey(id);
  	}
  
  	@Override
  	public void update(User user) {
  		userMapper.updateByPrimaryKeySelective(user);
  	}
  
  	@Override
  	public User select(String id) {
  		return userMapper.selectByPrimaryKey(id);
  	}
  }
  
  ```

### action

- com.demo.action.UserAction

  ```java
  package com.demo.action;
  
  import com.demo.model.User;
  import com.demo.service.UserService;
  import com.opensymphony.xwork2.ActionSupport;
  import org.apache.logging.log4j.LogManager;
  import org.apache.logging.log4j.Logger;
  import org.springframework.beans.factory.annotation.Autowired;
  
  public class UserAction extends ActionSupport {
  	
  	private static final Logger logger = LogManager.getLogger(UserAction.class);
  
  	@Autowired
  	private UserService userService;
  
  	public String execute() throws Exception {
  		logger.info("user action execute");
  		return SUCCESS;
  	}
  
  	public String add() throws Exception {
  		logger.info("user action add");
  		return SUCCESS;
  	}
  
  	public String delete() throws Exception {
  		logger.info("user action delete");
  		return SUCCESS;
  	}
  
  	public String update() throws Exception {
  		logger.info("user action update");
  		return SUCCESS;
  	}
  
  	public String select() throws Exception {
  		logger.info("user action select");
  		User user = userService.select("1");
  		logger.info("user:{}", user);
  		return SUCCESS;
  	}
  
  }
  ```

### util

- com.demo.util.MybatisGeneratorUtil
	
	 ```java
	package com.demo.util;
	
	import org.mybatis.generator.api.MyBatisGenerator;
	import org.mybatis.generator.config.Configuration;
	import org.mybatis.generator.config.xml.ConfigurationParser;
	import org.mybatis.generator.internal.DefaultShellCallback;
	
	import java.io.File;
	import java.util.ArrayList;
	import java.util.List;
	
	/**
	   * @author 
	   * @version 1.0
	   * @Description: mybatis逆向工程生成器
	   * @date 
	   */
	public class MybatisGeneratorUtil {
	
	    private static final String CONFIG_FILE = "generatorConfig.xml";
	
	    public static void main(String[] args) throws Exception {
	        List<String> warnings = new ArrayList<String>();
	        boolean overwrite = true;
	        String path = MybatisGeneratorUtil.class.getClassLoader().getResource(CONFIG_FILE).getPath();
	        File configFile = new File(path);
	        ConfigurationParser cp = new ConfigurationParser(warnings);
	        Configuration config = cp.parseConfiguration(configFile);
	        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
	        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
	        myBatisGenerator.generate(null);
	    }
	
	}
	
	```
	
## 搭建心得

​		推荐去看一些官网的文档和示例。

​		 

​		  


​	
​	







