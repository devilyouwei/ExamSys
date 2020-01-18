package cn.cslg.exam.security;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;

public class ByteArrayUtil {
	public static String ByteArray2HexString(byte[] b) {
		return Hex.encodeHexString(b);
	}

	public static byte[] HexString2ByteArray(String hex) {
		byte array[] = null;
		try {
			array = Hex.decodeHex(hex.toCharArray());
		} catch (DecoderException e) {
			Logger.getLogger(ByteArrayUtil.class.getName()).log(Level.SEVERE, null, e);
		}
		return array;
	}
}
