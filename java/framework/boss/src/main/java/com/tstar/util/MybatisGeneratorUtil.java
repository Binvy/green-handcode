package com.tstar.util;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description: mybatis-generator in java
 * @date 2019/12/1 17:27
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
