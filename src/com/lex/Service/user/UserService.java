package com.lex.Service.user;

import com.fh.util.PageData;

/**
 * Created by Administrator on 2016/9/28.
 */

public interface UserService {

    public void saveSms(PageData pd) throws Exception;

   public void saveUser(PageData pd) throws Exception;
}
