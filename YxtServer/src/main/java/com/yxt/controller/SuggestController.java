package com.yxt.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yxt.common.utils.DateUtils;
import com.yxt.common.utils.StringUtils;
import com.yxt.entity.Submit;
import com.yxt.entity.SuggestInfo;
import com.yxt.model.common.ApiDataResult;
import com.yxt.model.common.ApiResult;
import com.yxt.service.ISubmitService;
import com.yxt.service.ISuggestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author :liuzhengfeng
 * @date : 2022/10/21
 */
@Slf4j
@RestController
@RequestMapping("suggest")
public class SuggestController {

    @Autowired
    private ISuggestService iSuggestService;

    @Autowired
    private ISubmitService submitService;

    /**
     * 建议功能
     * @param suggestInfo
     * @return
     */
    @PostMapping("suggest")
    public ApiResult suggest(@RequestBody SuggestInfo suggestInfo ){
        String content = suggestInfo.getContent();
        if (StringUtils.isNotEmpty(content)){
            suggestInfo.setContent(content);
            suggestInfo.setTime(DateUtils.getTime());
            iSuggestService.save(suggestInfo);
            log.info("suggestInfo");
        }

    return ApiResult.succ();
    }

    /**
     * 新增投稿经验
     * @param submit
     * @return
     */
    @PostMapping("saveSubmit")
    public ApiResult saveSubmit(@RequestBody Submit submit){
        String name = submit.getName();
        String contents = submit.getContents();
        String fromname = submit.getFromname();
        String type = submit.getType();
        if (StringUtils.isNotEmpty(name)||
                StringUtils.isNotEmpty(contents)||
                StringUtils.isNotEmpty(fromname)||
                StringUtils.isNotEmpty(type)){
            submit.setName(name);
            submit.setContents(contents);
            submit.setType(type);
            submit.setFromname(fromname);
            submitService.save(submit);
        }
        return ApiResult.succ();
    }

    /**
     * 查询投稿经验列表
     * @return
     */
    @GetMapping("selectSubmit")
    public ApiDataResult selectSubmit(){
        return ApiDataResult.succ(submitService.list());
    }

    /**
     * 根据投稿名字删除投稿
     * @param submit
     * @return
     */
    @PostMapping("delSubmit")
    public ApiResult delSubmit(@RequestBody Submit submit){
        String fromname = submit.getFromname();
        LambdaQueryWrapper<Submit> queryWrapper = new LambdaQueryWrapper<>();
        if (StringUtils.isNotEmpty(fromname)){

            queryWrapper.eq(Submit::getFromname,fromname);
        submitService.remove(queryWrapper);
        }
        return ApiResult.succ();
    }
}
