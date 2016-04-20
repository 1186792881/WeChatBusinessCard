package com.cdkj.util;
  
/**
 * 读取配置文件类
 */
public class PropertyUtil {
  
	/**
	 * 从configure.properties文件中获取 字符串 值
	 * @param key 键值
	 * @return
	 */
    public static String getString(String key) {  
    	String result = null;
        try {  
            // 通过java.util.ResourceBundle读取资源属性文件  
            result = java.util.ResourceBundle.getBundle("configure.properties").getString(key);  
        } catch (Exception e) {  
        	throw new RuntimeException(e);
        }  
        return result;  
    }
    
    /**
	 * 从configure.properties中读取 int 值
	 * @param key 键值
	 * @return
	 */
    public static Integer getInt(String key) {
    	return Integer.parseInt(getString(key));
    }
  
}  