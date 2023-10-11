package com.ele007.quartz.controller;

import com.ele007.quartz.core.AjaxResult;
import com.ele007.quartz.core.page.TableDataInfo;
import com.ele007.quartz.domain.SysJob;
import com.ele007.quartz.domain.SysJobLog;
import com.ele007.quartz.service.ISysJobLogService;
import com.ele007.quartz.service.ISysJobService;
import com.ele007.quartz.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 调度日志操作处理
 */
@Controller
@RequestMapping("/jobLog")
public class SysJobLogController extends BaseController {
    private String prefix = "job";

    @Autowired
    private ISysJobService jobService;

    @Autowired
    private ISysJobLogService jobLogService;

    @GetMapping()
    public String jobLog(@RequestParam(value = "jobId", required = false) Long jobId, ModelMap mmap) {
        if (StringUtils.isNotNull(jobId)) {
            SysJob job = jobService.selectJobById(jobId);
            mmap.put("job", job);
        }
        return prefix + "/jobLog";
    }

    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysJobLog jobLog) {
        try {
            startPage();
            List<SysJobLog> list = jobLogService.selectJobLogList(jobLog);
            return getDataTable(list);
        } catch (Exception e) {
            logger.error("查询失败， error:", e);
        }
        return new TableDataInfo();
    }


    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(jobLogService.deleteJobLogByIds(ids));
    }

    @GetMapping("/detail/{jobLogId}")
    public String detail(@PathVariable("jobLogId") Long jobLogId, ModelMap mmap) {
        mmap.put("name", "jobLog");
        mmap.put("jobLog", jobLogService.selectJobLogById(jobLogId));
        return prefix + "/detail";
    }

    @PostMapping("/clean")
    @ResponseBody
    public AjaxResult clean() {
        jobLogService.cleanJobLog();
        return success();
    }
}
