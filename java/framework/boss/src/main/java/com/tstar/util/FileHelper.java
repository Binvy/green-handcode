package com.tstar.util;

import java.io.*;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:27
 */
public class FileHelper {

	public FileHelper() {
	}

	public static String getRootPath() {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		if (classLoader == null) {
			classLoader = ClassLoader.getSystemClassLoader();
		}

		if (classLoader == null) {
			return "";
		} else {
			URL url = classLoader.getResource("");
			return url == null ? "" : url.getPath();
		}
	}

	public static void write(String fileName, String content) throws IOException {
		File file = new File(fileName);
		String parent = file.getParent();
		File dir = new File(parent);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		if (!file.exists()) {
			file.createNewFile();
		}

		FileWriter fw = new FileWriter(file.getAbsoluteFile());
		BufferedWriter bw = new BufferedWriter(fw);

		try {
			bw.write(content);
		} finally {
			bw.close();
		}

	}

	public static void write(String fileName, String[] lines) throws IOException {
		File file = new File(fileName);
		String parent = file.getParent();
		File dir = new File(parent);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		if (!file.exists()) {
			file.createNewFile();
		}

		FileWriter fw = new FileWriter(file.getAbsoluteFile());
		BufferedWriter bw = new BufferedWriter(fw);

		try {
			for(int i = 0; i < lines.length; ++i) {
				bw.write(lines[i]);
				bw.newLine();
			}
		} finally {
			bw.close();
		}

	}

	public static String readTxtFile(String filePath) {
		StringBuilder sb = new StringBuilder();
		File file = new File(filePath);
		if (file.isFile() && file.exists()) {
			try {
				InputStreamReader isr = new InputStreamReader(new FileInputStream(file));

				try {
					BufferedReader br = new BufferedReader(isr);
					String line = null;

					while((line = br.readLine()) != null) {
						sb.append(line);
					}
				} finally {
					isr.close();
				}
			} catch (Exception var10) {
				var10.printStackTrace();
			}
		}

		return sb.toString();
	}

	public static void deleteFile(String filePath) {
		File file = new File(filePath);
		if (file.exists() && file.isFile()) {
			try {
				file.delete();
			} catch (RuntimeException var3) {
			}
		}

	}

	public static File[] getFileNames(String folder, String filterName) {
		List<File> fileList = new ArrayList();
		boolean filterRes = false;
		String prefixName = "";
		String suffixName = "";
		if (-1 != filterName.indexOf(".")) {
			String[] nameArray = filterName.split("\\.");
			if (nameArray.length > 1) {
				prefixName = nameArray[0];
				suffixName = nameArray[1];
			}

			if (prefixName.endsWith("*")) {
				prefixName = prefixName.replaceAll("\\*", "");
			}

			if (suffixName.endsWith("*")) {
				suffixName = suffixName.replaceAll("\\*", "");
			}

			filterRes = true;
		}

		File file = new File(folder);
		File[] files = file.listFiles();
		String fileName = "";
		int i;
		if (filterRes) {
			if (files.length > 0) {
				for(i = 0; i < files.length; ++i) {
					if (files[i].isFile()) {
						fileName = files[i].getName();
						if (fileName.endsWith(suffixName) && -1 != fileName.indexOf(prefixName)) {
							fileList.add(files[i]);
						}
					}
				}
			}
		} else if (files.length > 0) {
			for(i = 0; i < files.length; ++i) {
				if (files[i].isFile()) {
					fileList.add(files[i]);
				}
			}
		}

		for(i = 0; i < fileList.size(); ++i) {
		}

		File[] fileRes = new File[fileList.size()];
		fileList.toArray(fileRes);
		return fileRes;
	}

	public static List<File> getFiles(String folder) {
		List<File> fileList = new ArrayList();
		File file = new File(folder);
		File[] files = file.listFiles();
		if (files.length > 0) {
			for(int i = 0; i < files.length; ++i) {
				if (files[i].isFile()) {
					fileList.add(files[i]);
				}
			}
		}

		return fileList;
	}

	public static List<String> list(String dir, String regexp) {
		List<String> files = new ArrayList();
		File folder = new File(dir);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		File[] infos = folder.listFiles();
		File[] var8 = infos;
		int var7 = infos.length;

		for(int var6 = 0; var6 < var7; ++var6) {
			File info = var8[var6];
			if (info.isFile()) {
				String fileName = info.getName();
				if (RegExp.matches(regexp, fileName)) {
					files.add(fileName);
				}
			}
		}

		return files;
	}

	public static List<FileInfo> listFiles(String dir, String regexp) {
		List<FileInfo> files = new ArrayList();
		File folder = new File(dir);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		File[] infos = folder.listFiles();
		File[] var8 = infos;
		int var7 = infos.length;

		for(int var6 = 0; var6 < var7; ++var6) {
			File info = var8[var6];
			if (info.isFile()) {
				String fileName = info.getName();
				if (RegExp.matches(regexp, fileName)) {
					FileInfo fileInfo = new FileInfo();
					fileInfo.setName(fileName);
					fileInfo.setSize(info.length());
					fileInfo.setCheckSum(0);
					files.add(fileInfo);
				}
			}
		}

		return files;
	}

	public static void copy(String fileFrom, String fileTo) throws IOException {
		FileInputStream in = new FileInputStream(fileFrom);
		FileOutputStream out = new FileOutputStream(fileTo);
		byte[] bt = new byte[1024];

		int count;
		while((count = in.read(bt)) > 0) {
			out.write(bt, 0, count);
		}

		in.close();
		out.close();
	}

	public static void move(String fileFrom, String fileTo) throws IOException {
		copy(fileFrom, fileTo);
		(new File(fileFrom)).delete();
	}

	public static byte[] copyFile(String filepath) {
		File srcFile = new File(filepath);
		BufferedInputStream in = null;
		ByteArrayOutputStream out = null;
		byte[] content = (byte[])null;

		try {
			in = new BufferedInputStream(new FileInputStream(srcFile));
			out = new ByteArrayOutputStream(1024);
			byte[] b = new byte[1024];

			int len;
			while((len = in.read(b)) != -1) {
				out.write(b, 0, len);
			}

			content = out.toByteArray();
		} catch (Exception var19) {
			var19.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (IOException var18) {
				var18.printStackTrace();
			}

			try {
				out.close();
			} catch (IOException var17) {
				var17.printStackTrace();
			}

		}

		return content;
	}

	public static byte[] copyFile(String filepath, String head, String tail) {
		File srcFile = new File(filepath);
		BufferedInputStream in = null;
		ByteArrayOutputStream out = null;
		byte[] content = (byte[])null;

		try {
			in = new BufferedInputStream(new FileInputStream(srcFile));
			out = new ByteArrayOutputStream(1024);
			if (head != null && !head.equals("")) {
				byte[] h = head.getBytes();
				out.write(h, 0, h.length);
			}

			byte[] b = new byte[1024];

			int len;
			while((len = in.read(b)) != -1) {
				out.write(b, 0, len);
			}

			if (tail != null && !tail.equals("")) {
				byte[] t = tail.getBytes();
				out.write(t, 0, t.length);
			}

			content = out.toByteArray();
		} catch (Exception var22) {
			var22.printStackTrace();
		} finally {
			try {
				in.close();
			} catch (IOException var21) {
				var21.printStackTrace();
			}

			try {
				out.close();
			} catch (IOException var20) {
				var20.printStackTrace();
			}

		}

		return content;
	}

	public static void main(String[] args) {
		String folder = "e:/cdr/source/ims";
		folder = "e:/";
		List<String> fs = list(folder, (String)null);
		Iterator var4 = fs.iterator();

		while(var4.hasNext()) {
			String s = (String)var4.next();
			System.out.println(s);
		}
	}

}
