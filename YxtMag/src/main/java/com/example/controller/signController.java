package com.example.controller;

import com.example.common.Result;
import com.example.entity.sign;
import com.example.service.signService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/sign")
public class signController {
    @Resource
     private signService signService;

    @PostMapping
    public Result<?> save(@RequestBody sign sign) {
        return Result.success(signService.save(sign));
    }

    @PutMapping
    public Result<?> update(@RequestBody sign sign) {
        return Result.success(signService.updateById(sign));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        signService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<sign> findById(@PathVariable Long id) {
        return Result.success(signService.getById(id));
    }

    @GetMapping
    public Result<List<sign>> findAll() {
        return Result.success(signService.list());
    }

    @GetMapping("/page")
    public Result<IPage<sign>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(signService.page(new Page<>(pageNum, pageSize), Wrappers.<sign>lambdaQuery().like(sign::getName, name)));
    }

}