package com.example.controller;

import com.example.common.Result;
import com.example.entity.teastu;
import com.example.service.teastuService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/teastu")
public class teastuController {
    @Resource
     private teastuService teastuService;

    @PostMapping
    public Result<?> save(@RequestBody teastu teastu) {
        return Result.success(teastuService.save(teastu));
    }

    @PutMapping
    public Result<?> update(@RequestBody teastu teastu) {
        return Result.success(teastuService.updateById(teastu));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        teastuService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<teastu> findById(@PathVariable Long id) {
        return Result.success(teastuService.getById(id));
    }

    @GetMapping
    public Result<List<teastu>> findAll() {
        return Result.success(teastuService.list());
    }

    @GetMapping("/page")
    public Result<IPage<teastu>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(teastuService.page(new Page<>(pageNum, pageSize), Wrappers.<teastu>lambdaQuery().like(teastu::getSname, name)));
    }

}