package com.example.controller;

import com.example.common.Result;
import com.example.entity.Report;
import com.example.service.ReportService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/report")
public class ReportController {
    @Resource
     private ReportService reportService;

    @PostMapping
    public Result<?> save(@RequestBody Report report) {
        return Result.success(reportService.save(report));
    }

    @PutMapping
    public Result<?> update(@RequestBody Report report) {
        return Result.success(reportService.updateById(report));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        reportService.removeById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Report> findById(@PathVariable Long id) {
        return Result.success(reportService.getById(id));
    }

    @GetMapping
    public Result<List<Report>> findAll() {
        return Result.success(reportService.list());
    }

    @GetMapping("/page")
    public Result<IPage<Report>> findPage(@RequestParam(required = false, defaultValue = "") String name,
                                           @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                           @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(reportService.page(new Page<>(pageNum, pageSize), Wrappers.<Report>lambdaQuery().like(Report::getName, name)));
    }

}