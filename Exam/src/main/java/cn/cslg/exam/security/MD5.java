/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.cslg.exam.security;

/**
 *
 * @author jimshen
 */
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author jimshen
 */
public class MD5 {

	public static void main(String[] args) throws Exception {
		String salt = "sgdjkajdhakld";
		System.out.println(md5(""));
		System.out.println(md5("a"));
		System.out.println(md5("abc"));
		System.out.println(md5("abcdefghijklmnopqrstuvwxyz"));
		System.out.println(md5("abcdefghijklmnopqrstuvwxyy"));
		System.out.println(md5("123456"));
		System.out.println(md5(salt + md5("123456")));
	}

	public static String md5(byte[] input) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] b = md.digest(input);
		return ByteArrayUtil.ByteArray2HexString(b);
	}

	public static String md5(String s) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		return md5(s.getBytes("UTF8"));
	}

	public static String md5File(String filename) throws NoSuchAlgorithmException, FileNotFoundException, IOException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		DigestInputStream in = new DigestInputStream(new FileInputStream(filename), md);
		byte[] buffer = new byte[8192];
		while (in.read(buffer) != -1) {
			md.update(buffer);
		}
		byte[] raw = md.digest();
		in.close();
		return ByteArrayUtil.ByteArray2HexString(raw);
	}
}
