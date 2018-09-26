package cn.edu.nku.cc.FakeDouban.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Base64.Encoder;

public class MD5Util {
	public static String md5(String srcPassword){
		//  将上述字符转换为MD5字串
		// 1 - 获取MD5摘要算法的实例对象
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("md5");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 2 - 对MD5摘要算法的实例对象进行更新，放入要进行操作的字符串的byte[]
		md.update(srcPassword.getBytes());
		// 3 - 完成摘要算法
		byte[] outputData = md.digest();
		// 4 - 重置MD5算法
		md.reset();
		
		// 对outputData  --- 编码  》》 String
		/*
		 * 编码：
		 * 	1. Android 内置 Base64encode
		 * 2.  Java内置编码器
		 * 			> JavaSE 8  
		 * 			< 1.8 打开隐藏API，使用sun.misc.BASE64Encoder
		 * 3. 自己写
		 */
		// Java SE 8 
		Encoder encoder = Base64.getEncoder();
		String destPassword =encoder.encodeToString(outputData);

		// < 1.8 BuildPath->Libraries->某个JRE SystemLibrary
		// -> Access rules->Edit->Add-> Accessible-**
		//BASE64Encoder encoder = new BASE64Encoder();
		//String destPassword = encoder.encode(outputData);
		return destPassword;
		
	}
	
	public static void main(String[] args) {
		// 测试MD5Util工具类生成MD5摘要后的password
		String srcPassword = "password";
		String destPassword = MD5Util.md5(srcPassword);
		System.out.println(destPassword);
	}
}
