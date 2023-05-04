package com.example.controller;

import com.example.common.Result;
import com.example.entity.daka;
import com.example.service.dakaService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/daka")
public class dakaController {
    @Resource
     private dakaService dakaService;

    @PostMapping
    public Result<?> save(@RequestBody daka daka) {
        return Result.success(dakaService.save(daka));
    }

    @PutMapping
    public Result<?> update(@RequestBody daka daka) {
        return Result.success(dakaService.updateById(daka));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        dakaService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<daka> findById(@PathVariable Long id) {
        return Result.success(dakaService.getById(id));
    }

    @GetMapping
    public Result<List<daka>> findAll() {
        return Result.success(dakaService.list());
    }

    @GetMapping("/page")
    public Result<IPage<daka>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(dakaService.page(new Page<>(pageNum, pageSize), Wrappers.<daka>lambdaQuery().like(daka::getName, name)));
    }

}