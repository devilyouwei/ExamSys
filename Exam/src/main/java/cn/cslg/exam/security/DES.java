package cn.cslg.exam.security;

/**
 * Created by jimshen on 2015/12/7.
 */
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

public class DES {

	public static String encrypt(String str, String key) {
		byte[] enc = (byte[]) null;
		try {
			enc = desEncrypt(str, key);
		} catch (Exception localException) {
		}
		return ByteArrayUtil.ByteArray2HexString(enc);
	}

	public static byte[] desEncrypt(String message, String key) throws Exception {
		Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
		DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
		IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));
		cipher.init(1, secretKey, iv);
		return cipher.doFinal(message.getBytes("UTF-8"));
	}

	public static String decrypt(String base64, String key) throws Exception {
		Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
		DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
		IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));
		cipher.init(2, secretKey, iv);
		byte[] raw = ByteArrayUtil.HexString2ByteArray(base64);
		byte[] stringBytes = cipher.doFinal(raw);
		String result = new String(stringBytes, "UTF8");
		return result;
	}
}
