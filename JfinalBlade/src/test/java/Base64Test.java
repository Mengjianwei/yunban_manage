import com.ikkong.core.toolbox.kit.CharsetKit;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

public class Base64Test {

    /**
     * Shiro 记住密码采用的是AES加密，AES key length 需要是16位，该方法生成16位的key
     */
    public static void main(String[] args) {
        String keyStr = "JFinalBlade";
        
        byte[] keys;
		try {
			keys = keyStr.getBytes(CharsetKit.UTF_8);
	        System.out.println(new BASE64Encoder().encode(Arrays.copyOf(keys, 16)));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        
    }

}
