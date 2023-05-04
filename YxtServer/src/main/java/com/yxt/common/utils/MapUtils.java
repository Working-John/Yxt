package com.yxt.common.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapUtils {
    public static Map<Integer, String> mapListToIntegerStringMap(List<Map<String,Object>> list) {
        Map<Integer, String> map = new HashMap<>();
        if (list != null && !list.isEmpty()) {
            for (Map<String, Object> map1 : list) {
                Integer key = null;
                String value = null;
                for (Map.Entry<String, Object> entry : map1.entrySet()) {
                    if ("key".equals(entry.getKey())) {
                        key = (Integer) entry.getValue();
                    } else if ("value".equals(entry.getKey())) {
                        value = (String) entry.getValue();
                    }
                }
                map.put(key, value);
            }
        }
        return map;
    }
}
