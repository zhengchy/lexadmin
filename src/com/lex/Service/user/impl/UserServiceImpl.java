package com.lex.Service.user.impl;

import com.fh.dao.DaoSupport;
import com.fh.util.PageData;
import com.lex.Service.user.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/9/28.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;


    public void saveSms(PageData pd) throws Exception {
        dao.save("LexUserMapper.saveSms", pd);
    }

    @Override
    public void saveUser(PageData pd) throws Exception {
        dao.save("LexUserMapper.registerUser",pd);
    }
}
