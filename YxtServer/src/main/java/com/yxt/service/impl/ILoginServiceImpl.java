package com.yxt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yxt.entity.LoginInfo;
import com.yxt.mapper.LoginMapper;
import com.yxt.service.ILoginService;
import org.springframework.stereotype.Service;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/9
 */
@Service
public class ILoginServiceImpl extends ServiceImpl<LoginMapper, LoginInfo> implements ILoginService {
}
