package com.esoom.kcc.common;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class AesUtil {
	// AES 암호 알고리즘, 암호 운용 방식 : CBC 모드, 패딩 기법 : PKCS7 고정 < iv 필요
	//public static String algorithm = "AES/CBC/PKCS5Padding";  
	// AES 암호 알고리즘, 암호 운용 방식 : ECB 모드,패딩 기법 : PKCS7 고정   < ECB = iv 필요없음
	private static final Charset ENCODING_TYPE = StandardCharsets.UTF_8;
    private static final String INSTANCE_TYPE = "AES/ECB/PKCS5Padding";

    @Value("#{aes['secretkey']}")
    private String secretKey;
    private IvParameterSpec ivParameterSpec;
    private SecretKeySpec secretKeySpec;
    private Cipher cipher;

    public void init() throws NoSuchPaddingException, NoSuchAlgorithmException {
        SecureRandom secureRandom = new SecureRandom();
        byte[] iv = new byte[16];   // 16bytes = 128bits
        secureRandom.nextBytes(iv);
        ivParameterSpec = new IvParameterSpec(iv);
        secretKeySpec = new SecretKeySpec(secretKey.getBytes(ENCODING_TYPE), "AES");
        cipher = Cipher.getInstance(INSTANCE_TYPE);
        System.out.println(ivParameterSpec.toString());
        System.out.println(secretKeySpec.toString());
    }

    // AES 암호화
    public String encryptAes(String plaintext) {
        try {
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
            byte[] encryted = cipher.doFinal(plaintext.getBytes(ENCODING_TYPE));
            return new String(Base64.getEncoder().encode(encryted), ENCODING_TYPE);
        } catch (Exception e) {
            return "false";
        }
    }

    // AES 복호화
    public String decryptAes(String plaintext) {
        try {
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);
            byte[] decoded = Base64.getDecoder().decode(plaintext.getBytes(ENCODING_TYPE));
            return new String(cipher.doFinal(decoded), ENCODING_TYPE);
        } catch (Exception e) {
        	return "false";
        }
    }
    
    
 // AES 암호화
    public String encryptAes2(String plaintext) {
        try {
        	cipher = Cipher.getInstance(INSTANCE_TYPE);
    		secretKeySpec = new SecretKeySpec(secretKey.getBytes(ENCODING_TYPE), "AES");
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
            byte[] encryted = cipher.doFinal(plaintext.getBytes(ENCODING_TYPE));
            return new String(Base64.getEncoder().encode(encryted), ENCODING_TYPE);
        } catch (Exception e) {
            return "false";
        }
    }
    // AES 복호화
    public String decryptAes2(String plaintext) {
    	try {
    		cipher = Cipher.getInstance(INSTANCE_TYPE);
    		secretKeySpec = new SecretKeySpec(secretKey.getBytes(ENCODING_TYPE), "AES");
    		cipher.init(Cipher.DECRYPT_MODE,secretKeySpec);
    		byte[] decoded = Base64.getDecoder().decode(plaintext.getBytes(ENCODING_TYPE));
    		return new String(cipher.doFinal(decoded), ENCODING_TYPE);
    	} catch (Exception e) {
    		return "false";
    	}
    }
}