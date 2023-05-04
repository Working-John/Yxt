/*
package com.yxt.common.utils;


import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.rtf.RtfWriter2;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.Document;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

import java.awt.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//word编辑工具类
public class WordUtils {
    */
/**
     * itext word操作
     * @param fileName
     * @throws Exception
     *//*

    public static void wordOperating(String fileName) throws Exception {
        //创建word并设置纸张大小
        Document document = new Document(PageSize.A4);
        File file = new File(fileName);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdir();
        }
        if (file.exists() && file.isFile()) {
            file.delete();
        }
        file.createNewFile();

        // 写入文件信息
        RtfWriter2.getInstance(document, new FileOutputStream(fileName));
        // 打开document
        document.open();
        // 设置字体，字号，加粗，颜色
        Font font = new Font(Font.NORMAL, 20, Font.BOLD, new Color(255, 0, 0));
        // 设置新的段落，使其字体为font
        Paragraph p = new Paragraph("文书制作", font);
        // 设置段落居中，其中1为居中对齐，2为右对齐，3为左对齐
        p.setAlignment(1);
        // 文档中加入该段落
        document.add(p);

        //调用系统的“楷体”字体，设置该段落时楷体
        BaseFont bf = BaseFont.createFont("C:\\Windows\\Fonts\\simli.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        font = new Font(bf, 16, Font.NORMAL, new Color(0, 0, 0));
        p = new Paragraph(
                "    itext可以实现插入段落，可以设置段落的缩进，居中，首行缩进，段前距，段后距。可以设置字体，字号，格式。功能比较齐全。",
                font);
        // 设置段落缩进
        p.setIndentationLeft(20);
        // 设置首行缩进
        p.setFirstLineIndent(30f);
        // 设置段后距和段前距
        p.setSpacingAfter(10f);
        p.setSpacingBefore(100f);
        document.add(p);
        p = new Paragraph(
                "itext可以插入表格，设置表格的行列数，可以设置表格边框，可以设置表格位置，可以设置表格总宽度和每一列的宽度。单元格的插入和内容可控",
                font);
        document.add(p);

        p = new Paragraph("itext可以插入图片，可以设置图片的大小，gif、jpg、png格式的图片都可以", font);
        document.add(p);
        // 创建有三列的表格
        Table table = new Table(2, 3);
        // 设置table的边框宽度为0
        table.setBorderWidth(1f);
        // table.setAbsWidth("120px");
        // 设置表格右对齐，其中1为居中对齐，2为右对齐，3为左对齐
        table.setAlignment(2);
        // 设置各列的宽度
        int[] widths = { 200, 100 };
        table.setWidths(widths);
        // table.setPadding(0);
        // table.setSpacing(0);

        // 读取图片(参数为gif、jpg、png格式的图片都可以)，设置图片大小
        Image image = Image.getInstance("D:/test/1.jpg");
        // Image img = Image.getInstance(new URL("http://xxx.com/logo.jpg)");
        // 设置图片的绝对大小，宽和高
        image.scaleAbsolute(50f, 50f);
        // 设置图片居中显示
        image.setAlignment(Image.MIDDLE);
        // 创建单元格,并且将单元格内容设置为图片
        Cell cell = new Cell(image);
        // 设置单元格边框为0
        cell.setBorder(0);
        // cell.setHeader(true);
        // cell.setColspan(3);// 设置表格为三列
        // cell.setRowspan(3);// 设置表格为三行
        table.addCell(cell);
        // table.endHeaders();// 表头结束
        table.addCell(cell);
        cell = new Cell("该单元格的长度是200");
        cell.setBorder(0);
        table.addCell(cell);
        cell = new Cell("该单元格的长度是100");
        // cell.setWidth("10px");
        table.addCell(cell);
        // cell.setBorder(1);
        // 设置垂直居中
        cell.setVerticalAlignment(1);
        // 设置水平居中
        cell.setHorizontalAlignment(1);
        // document.add(new Paragraph("用java生成word文件"));
        document.add(table);
        // 关闭document
        document.close();
    }

    public static void fillWordTemplate(String templatePath,List<Map<String,Object>> data) throws Exception {
        File file = new File(templatePath);
        List<CustomXWPFDocument> wordList = new ArrayList<CustomXWPFDocument>();
        for(Map<String,Object> m : data) {
            InputStream stream = new FileInputStream(file);
            CustomXWPFDocument xwd = new CustomXWPFDocument(stream);
            OfficeUtils.changeText(xwd, m);
            OfficeUtils.changeTables(xwd, m);
            wordList.add(xwd);
            stream.close();
        }
        XWPFDocument doc = OfficeUtils.mergeWord(wordList);
        File newFile = new File("D:/test/" + FileNameUtils.getFileName(templatePath));
        FileOutputStream streamOut = new FileOutputStream(newFile);
        doc.write(streamOut);
    }

    */
/**
     * 根据模板生成word
     * @param templatePath 模板的路径
     * @param data 参数
     * @throws Exception
     *//*

    public static String getWord(String templatePath, List<Map<String,Object>> data ,String filePath) throws Exception {
        File file = new File(templatePath);
        List<CustomXWPFDocument> wordList = new ArrayList<CustomXWPFDocument>();
        for(Map<String,Object> m : data) {
            InputStream stream = new FileInputStream(file);
            CustomXWPFDocument xwd = new CustomXWPFDocument(stream);
            //replaceInPara(xwd, m);    //替换文本里面的变量
            OfficeUtils.replaceInTable(xwd, m); //替换表格里面的变量
            wordList.add(xwd);
            stream.close();
        }
        CustomXWPFDocument doc = OfficeUtils.mergeWord(wordList);
        String fileName = filePath + FileNameUtils.getFileName(templatePath);
        File newFile = new File(fileName);
        FileOutputStream streamOut = new FileOutputStream(newFile);
        doc.write(streamOut);
        return fileName;

    }

    public static String editExcel(List<CWorker> list,String filePath,CWorker total,CWorker[] matter,CWorker[] dp){
        String newFile = filePath+UUIDUtils.getUUID()+".xlsx";
        writeExcel(list, newFile,total,matter,dp);
        return newFile;

    }

    //向Excel中写数据
    public static void writeExcel(List<CWorker> list ,String filePath,CWorker total,CWorker[] matter,CWorker[] dp){
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("数据明细");
        XSSFRow firstRow = sheet.createRow(0);//第一行表头

        String[] titles = new String[]{"编号","工作日期","工作日/休息日",
                "一级目录","二级目录","备注", "部门",
                "耗时","发布时间"*/
/*,"图片","语音"*//*
,"白天/晚上",};
        XSSFCell cells[] = new XSSFCell[titles.length];

        //循环设置表头信息
        for (int i=0;i< titles.length;i++){
            cells[0]=firstRow.createCell(i);
            cells[0].setCellValue(titles[i]);
        }

        //将数据写入Excel中
        for (int i=0;i<list.size();i++){
            XSSFRow row = sheet.createRow(i+1);
            XSSFCell cell = row.createCell(0); //第一列
             //写入数据明细
                CWorker cWorker = list.get(i);
                cell.setCellValue(cWorker.getRecordId());
                cell = row.createCell(1); //第二列
                cell.setCellValue(cWorker.getDate());
                cell = row.createCell(2); //第三列
                cell.setCellValue(cWorker.getWorkTime());
                cell = row.createCell(3); //第三列
                cell.setCellValue(cWorker.getContentList1());
                cell = row.createCell(4);
                cell.setCellValue(cWorker.getContentList2());
                cell = row.createCell(5);
                cell.setCellValue(cWorker.getContentRemark());
                cell = row.createCell(6);
                cell.setCellValue(cWorker.getDepartment());
                cell = row.createCell(7);
                cell.setCellValue(cWorker.getHour());
                cell = row.createCell(8);
                cell.setCellValue(DateUtils.timeStamp2Date(cWorker.getPublishTime(), ""));
            */
/*cell=row.createCell(9);
            cell.setCellValue(cWorker.getImg());
            cell=row.createCell(10);
            cell.setCellValue(cWorker.getVoiceMessage());*//*

                cell = row.createCell(9);
                cell.setCellValue(cWorker.getDaynight());


        }
        //创建sheet2
        XSSFSheet sheet2 = workbook.createSheet("数据汇总");
        XSSFRow firstRow2 = sheet2.createRow(0);//第一行表头
        String[] title2 = new String[]{"总耗时","总事项数",
                "","","事项名称","耗时数","耗时占比",
                "","","涉及部门名称","事项数","耗时数"};
        XSSFCell cells2[] = new XSSFCell[title2.length];

        //循环设置表头信息
        for (int i=0;i< title2.length;i++){
            cells2[0]=firstRow2.createCell(i);
            cells2[0].setCellValue(title2[i]);
        }
        int max = matter.length> dp.length? matter.length : dp.length;

        XSSFRow row = sheet2.createRow(1);
        XSSFCell cell = row.createCell(0);

        for(int i=0;i<max;i++){//写入总耗时、总事项
            row = sheet2.createRow(i+1);
            if(i==0){
                cell = row.createCell(0);
                cell.setCellValue(total.getHour());
                cell = row.createCell(1);
                cell.setCellValue(total.getRecordNum());
            }
            if(i<matter.length) {//写入八大事项耗时和占比
                cell = row.createCell(4);
                cell.setCellValue(matter[i].getContentList1());
                cell = row.createCell(5);
                cell.setCellValue(matter[i].getHour());
                cell = row.createCell(6);
                cell.setCellValue(matter[i].getTimeRatio());
            }
            if(i<dp.length){//写入涉及部门事项数、耗时数
                cell = row.createCell(9);
                cell.setCellValue(dp[i].getDepartment());
                cell = row.createCell(10);
                cell.setCellValue(dp[i].getRecordNum());
                cell = row.createCell(11);
                cell.setCellValue(dp[i].getHour());
            }
        }
        ExcelChartUtils.createBarChart(sheet2, dp.length);  //柱状图
        ExcelChartUtils.createPieChart(sheet2);  //饼图

        XSSFRow firstRow3 = sheet2.createRow(28);//表头

        //设置榜单标题
        cells[0] = sheet2.createRow(27).createCell(3);
        cells[0].setCellValue("工作事项耗时榜单(由大到小)");
        //排序
        list.sort((o1, o2) -> o1.getHour() > o2.getHour() ? -1 : 0);
        //循环设置表头信息
        for (int i=0;i< titles.length;i++){
            cells[0]=firstRow3.createCell(i);
            cells[0].setCellValue(titles[i]);
        }

        //将数据写入Excel中
        for (int i=0;i<list.size();i++){
            row = sheet2.createRow(i + 29);
            cell = row.createCell(0); //第一列
            //写入数据明细
            CWorker cWorker = list.get(i);
            cell.setCellValue(cWorker.getRecordId());
            cell = row.createCell(1); //第二列
            cell.setCellValue(cWorker.getDate());
            cell = row.createCell(2); //第三列
            cell.setCellValue(cWorker.getWorkTime());
            cell = row.createCell(3); //第三列
            cell.setCellValue(cWorker.getContentList1());
            cell = row.createCell(4);
            cell.setCellValue(cWorker.getContentList2());
            cell = row.createCell(5);
            cell.setCellValue(cWorker.getContentRemark());
            cell = row.createCell(6);
            cell.setCellValue(cWorker.getDepartment());
            cell = row.createCell(7);
            cell.setCellValue(cWorker.getHour());
            cell = row.createCell(8);
            cell.setCellValue(DateUtils.timeStamp2Date(cWorker.getPublishTime(), ""));
            cell = row.createCell(9);
            cell.setCellValue(cWorker.getDaynight());
        }
        try {
            File file = new File(filePath);
            FileOutputStream out = new FileOutputStream(file);
            workbook.write(out);
            out.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
*/
