package team.cfw.oms.base.service;

import java.util.List;

/**
 * Created by CFWLoader on 11/5/16.
 */
public interface CacheDataManageService {

    <T> List<T> getColumnByColumnName(String columnName, Class<T> typeTag);

    <T> boolean rewriteAColumnCacheData(String columnName, List<T> newCacheData);

}
