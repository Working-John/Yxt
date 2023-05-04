package com.example.controller;

import com.example.common.Result;
import com.example.entity.info;
import com.example.service.infoService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/info")
public class infoController {
    @Resource
     private infoService infoService;

    @PostMapping
    public Result<?> save(@RequestBody info info) {
        return Result.success(infoService.save(info));
    }

    @PutMapping
    public Result<?> update(@RequestBody info info) {
        return Result.success(infoService.updateById(info));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        infoService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<info> findById(@PathVariable Long id) {
        return Result.success(infoService.getById(id));
    }

    @GetMapping
    public Result<List<info>> findAll() {
        return Result.success(infoService.list());
    }

    @GetMapping("/page")
    public Result<IPage<info>> findPage(@RequestParam(required = false, defaultValue = "") String stuName,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(infoService.page(new Page<>(pageNum, pageSize), Wrappers.<info>lambdaQuery().like(info::getStuName, stuName)));
    }

}