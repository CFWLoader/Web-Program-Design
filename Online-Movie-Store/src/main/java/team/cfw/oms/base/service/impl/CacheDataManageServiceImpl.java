package team.cfw.oms.base.service.impl;

import org.springframework.stereotype.Service;
import team.cfw.oms.base.service.CacheDataManageService;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by CFWLoader on 11/5/16.
 */
@Service
public class CacheDataManageServiceImpl implements CacheDataManageService {

    private Map<String, List<Object>> cacheDataMap;

    public CacheDataManageServiceImpl()
    {
        cacheDataMap = new HashMap<String, List<Object>>();
    }

    @SuppressWarnings("unchecked")
    public <T> List<T> getColumnByColumnName(String columnName, Class<T> typeTag) {

        List<T> cacheData = (List<T>) cacheDataMap.get(columnName);

        if(cacheData == null)
        {
            cacheData = new LinkedList<T>();

            cacheDataMap.put(columnName, (List<Object>) cacheData);
        }

        return cacheData;
    }

    @SuppressWarnings("unchecked")
    public <T> boolean rewriteAColumnCacheData(String columnName, List<T> newCacheData) {

        List<T> cacheData = (List<T>) cacheDataMap.get(columnName);

        if(cacheData == null)
        {
            cacheData = new LinkedList<T>();

            cacheDataMap.put(columnName, (List<Object>) cacheData);
        }
        else
        {
            cacheDataMap.remove(columnName);

            cacheDataMap.put(columnName, (List<Object>) newCacheData);
        }

        return true;
    }
}
