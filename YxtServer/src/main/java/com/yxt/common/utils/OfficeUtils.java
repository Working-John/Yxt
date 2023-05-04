package com.yxt.common.utils;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.*;
import org.apache.xmlbeans.XmlOptions;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTBody;

import java.io.*;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class OfficeUtils {
    public static CustomXWPFDocument openWord(String filePath) throws Exception {
        InputStream stream = new FileInputStream(filePath);
        CustomXWPFDocument xwd = new CustomXWPFDocument(stream);
        stream.close();
        return xwd;
    }

    public static List<CustomXWPFDocument> getWordList(List<String> pathList) throws Exception {
        List<CustomXWPFDocument> wordList = new ArrayList<CustomXWPFDocument>();
        for(String path : pathList) {
            CustomXWPFDocument xwd = openWord(path);
            wordList.add(xwd);
        }
        return wordList;
    }

    /**
     * 修改Doc中文本域内对象
     * 处理对象${name}类型
     */
    public static void changeText(XWPFDocument document, Map<String, Object> map) {

        List<XWPFParagraph> paragraphs = document.getParagraphs();
        for (XWPFParagraph paragraph : paragraphs) {
            //判断此段落时候需要进行替换
            String text = paragraph.getText();
            if (checkText(text)) {
                List<XWPFRun> runs = paragraph.getRuns();
                for (XWPFRun run : runs) {
                    run.setText(changeValue(run.toString(), map), 0);
                }
            }
        }

    }

    /**
     * 修改Doc中Tables text对象
     * 处理对象${name}类型
     *
     * @param document
     */
    public static void changeTables(XWPFDocument document, Map map) {
        List<XWPFTable> tables = document.getTables();
        for (int i = 0; i < tables.size(); i++) {
            XWPFTable table = tables.get(i);
            if (table.getRows().size() >= 1) {
                if (checkText(table.getText())) {
                    List<XWPFTableRow> rows = table.getRows();
                    eachTable(rows, map);
                }
            }
        }
    }

    /**
     * 遍历表格
     */
    public static void eachTable(List<XWPFTableRow> rows, Map<String, Object> textMap) {
        for (XWPFTableRow row : rows) {
            List<XWPFTableCell> cells = row.getTableCells();
            for (XWPFTableCell cell : cells) {
                //判断单元格是否需要替换
                if (checkText(cell.getText())) {
                    List<XWPFParagraph> paragraphs = cell.getParagraphs();
                    for (XWPFParagraph paragraph : paragraphs) {
                        List<XWPFRun> runs = paragraph.getRuns();
                        for (XWPFRun run : runs) {
                            run.setText(changeValue(run.toString(), textMap), 0);
                        }
                    }
                }
            }
        }
    }

    /**
     * 匹配传入信息集合与模板
     *
     * @param value 模板需要替换的区域
     */
    public static String changeValue(String value, Map<String, Object> textMap) {
        value.trim();
        Set<Map.Entry<String, Object>> textSets = textMap.entrySet();
        for (Map.Entry<String, Object> textSet : textSets) {
            //匹配模板与替换值 格式${key}
            String key = "${" + textSet.getKey() + "}";
            if (value.indexOf(key) != -1) {
                value = textSet.getValue().toString();
            }
        }
        //模板未匹配到区域替换为空
        if (checkText(value)) {
            value = "";
        }
        return value;
    }

    /**
     * 判断文本中时候包含$
     */
    public static boolean checkText(String text) {
        boolean check = false;
        if (text.indexOf("$") != -1) {
            check = true;
        }
        return check;

    }

    public static void createOfficeFile(POIXMLDocument source, String dirs, String fileName) throws IOException {
        File dir = new File(dirs);
        if(!dir.exists() && !dir.isDirectory()){
            dir.mkdirs();
        }
        File file = new File(dirs + fileName);
        FileOutputStream stream = new FileOutputStream(file);
        source.write(stream);
        stream.close();
    }

    /**
     * 修改Excell 值
     */
    public static void changeExcelSheet(XSSFWorkbook xwb, Map<String, Object> data, int sheet) {
        XSSFSheet xSheet = xwb.getSheetAt(sheet);
        int begin = xSheet.getFirstRowNum();
        int end = xSheet.getLastRowNum();
        for (int i = begin; i <= end; i++) {
            if (null == xSheet.getRow(i)) {
                continue;
            }
            int beginCell = xSheet.getRow(i).getFirstCellNum();
            int endCell = xSheet.getRow(i).getLastCellNum();
            for (int j = beginCell; j <= endCell; j++) {
                if (xSheet.getRow(i).getCell(j) == null) {
                    continue;
                }
                String value =changeValue(xSheet.getRow(i).getCell(j).getStringCellValue(), data);
                if(!value.equals("")){
                    xSheet.getRow(i).getCell(j).setCellValue(value);
                }
            }
        }
    }

    /**
     * word文件合并
     * @param wordList
     * @return
     * @throws Exception
     */
    public static  CustomXWPFDocument mergeWord(List<CustomXWPFDocument> wordList) throws Exception{
        if (CollectionUtils.isEmpty(wordList)) {
            throw  new RuntimeException("待合并的word文档list为空");
        }
        CustomXWPFDocument doc = wordList.get(0);
        int size = wordList.size();
        if (size > 1) {
            doc.createParagraph().setPageBreak(true);
            for (int i = 1; i < size; i++) {
                // 从第二个word开始合并
                XWPFDocument nextPageDoc = wordList.get(i);
                // 最后一页不需要设置分页符
                if (i != (size-1)) {
                    nextPageDoc.createParagraph().setPageBreak(true);
                }
                appendBody(doc, nextPageDoc);
            }
        }
        return doc;
    }

    public static String mergeWord(List<String> pathList,String filePath) throws Exception{
        List<CustomXWPFDocument> wordList = getWordList(pathList);
        CustomXWPFDocument doc = OfficeUtils.mergeWord(wordList);

        String fileName = filePath + FileNameUtils.getFileName(pathList.get(0));
        File newFile = new File(fileName);
        FileOutputStream streamOut = new FileOutputStream(newFile);
        doc.write(streamOut);

        return fileName;
    }

    private static void appendBody(XWPFDocument src, XWPFDocument append) throws Exception {
        CTBody src1Body = src.getDocument().getBody();
        CTBody src2Body = append.getDocument().getBody();
        List<XWPFPictureData> allPictures = append.getAllPictures();
        // 记录图片合并前及合并后的ID
        Map<String,String> map = new HashMap<>();
        for (XWPFPictureData picture : allPictures) {
            String before = append.getRelationId(picture);
            //将原文档中的图片加入到目标文档中
            String after = src.addPictureData(picture.getData(), Document.PICTURE_TYPE_PNG);
            map.put(before, after);
        }
        appendBody(src1Body, src2Body,map);
    }

    private static void appendBody(CTBody src, CTBody append,Map<String,String> map) throws Exception {
        XmlOptions optionsOuter = new XmlOptions();
        optionsOuter.setSaveOuter();
        String appendString = append.xmlText(optionsOuter);
        String srcString = src.xmlText();
        String prefix = srcString.substring(0,srcString.indexOf(">")+1);
        String mainPart = srcString.substring(srcString.indexOf(">")+1,srcString.lastIndexOf("<"));
        String sufix = srcString.substring( srcString.lastIndexOf("<") );
        String addPart = appendString.substring(appendString.indexOf(">") + 1, appendString.lastIndexOf("<"));
        if (map != null && !map.isEmpty()) {
            //对xml字符串中图片ID进行替换
            for (Map.Entry<String, String> set : map.entrySet()) {
                addPart = addPart.replace(set.getKey(), set.getValue());
            }
        }
        //将两个文档的xml内容进行拼接
        CTBody makeBody = CTBody.Factory.parse(prefix+mainPart+addPart+sufix);
        src.set(makeBody);
    }

    /**
     * 替换段落里面的变量
     * @param doc    要替换的文档
     * @param params 参数
     */
    private static void replaceInPara(CustomXWPFDocument doc, Map<String, Object> params) {
        Iterator<XWPFParagraph> iterator = doc.getParagraphsIterator();
        XWPFParagraph para;
        while (iterator.hasNext()) {
            para = iterator.next();
            replaceInPara(para, params, doc);
        }
    }

    /**
     * 替换段落里面的变量
     *
     * @param para   要替换的段落
     * @param params 参数
     */
    private static void replaceInPara(XWPFParagraph para, Map<String, Object> params, CustomXWPFDocument doc) {
        List<XWPFRun> runs;
        Matcher matcher;
        if (matcher(para.getParagraphText()).find()) {
            runs = para.getRuns();
            int start = -1;
            int end = -1;
            String str = "";
            /*for (int i = 0; i < runs.size(); i++) {
                XWPFRun run = runs.get(i);
                String runText = run.toString();
                if ('$' == runText.charAt(0) && '{' == runText.charAt(1)) {
                    start = i;
                }
                if ((start != -1)) {
                    str += runText.substring(2,runText.length()-1);
                }
                if ('}' == runText.charAt(runText.length() - 1)) {
                    if (start != -1) {
                        end = i;
                        break;
                    }
                }
            }

            for (int i = start; i <= end; i++) {
                para.removeRun(i);
                i--;
                end--;
            }*/
            for (int i = 0; i < runs.size(); i++)
                str += runs.get(i).toString();

            if(OfficeUtils.checkText(str)){
                str = str.substring(2,str.length()-1);
                while (runs.size() > 0)
                    para.removeRun(0);
            }

            for (Map.Entry<String, Object> entry : params.entrySet()) {
                String key = entry.getKey();
                if (str.indexOf(key) != -1) {
                    Object value = entry.getValue();
                    if (value instanceof String) {
                        str = str.replace(key, value.toString());
                        para.createRun().setText(str, 0);
                        break;
                    } else if (value instanceof Map) {
                        str = str.replace(key, "");
                        Map pic = (Map) value;
                        int width = Integer.parseInt(pic.get("width").toString());
                        int height = Integer.parseInt(pic.get("height").toString());
                        int picType = getPictureType(pic.get("type").toString());
                        byte[] byteArray = (byte[]) pic.get("content");
                        ByteArrayInputStream byteInputStream = new ByteArrayInputStream(byteArray);
                        try {
                            //int ind = doc.addPicture(byteInputStream,picType);
                            //doc.createPicture(ind, width , height,para);
                            doc.addPictureData(byteInputStream, picType);
                            doc.createPicture(doc.getAllPictures().size() - 1, width, height, para);
                            para.createRun().setText(str, 0);
                            break;
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
    }

    /**
     * 为表格插入数据，行数不够添加新行
     *
     * @param table     需要插入数据的表格
     * @param tableList 插入数据集合
     */
    private static void insertTable(XWPFTable table, List<String[]> tableList) {
        //创建行,根据需要插入的数据添加新行，不处理表头
        for (int i = 0; i < tableList.size(); i++) {
            XWPFTableRow row = table.createRow();
        }
        //遍历表格插入数据
        List<XWPFTableRow> rows = table.getRows();
        int length = table.getRows().size();
        for (int i = 1; i < length - 1; i++) {
            XWPFTableRow newRow = table.getRow(i);
            List<XWPFTableCell> cells = newRow.getTableCells();
            for (int j = 0; j < cells.size(); j++) {
                XWPFTableCell cell = cells.get(j);
                String s = tableList.get(i - 1)[j];
                cell.setText(s);
            }
        }
    }

    /**
     * 替换表格里面的变量
     * @param doc    要替换的文档
     * @param params 参数
     */
    static void replaceInTable(CustomXWPFDocument doc, Map<String, Object> params) {
        Iterator<XWPFTable> iterator = doc.getTablesIterator();
        XWPFTable table;
        List<XWPFTableRow> rows;
        List<XWPFTableCell> cells;
        List<XWPFParagraph> paras;
        while (iterator.hasNext()) {
            table = iterator.next();
            if (table.getRows().size() > 1) {
                //判断表格是需要替换还是需要插入，判断逻辑有$为替换，表格无$为插入
                if (matcher(table.getText()).find()) {
                    rows = table.getRows();
                    for (XWPFTableRow row : rows) {
                        cells = row.getTableCells();
                        for (XWPFTableCell cell : cells) {
                            paras = cell.getParagraphs();
                            for (XWPFParagraph para : paras) {
                                replaceInPara(para, params, doc);
                            }
                        }
                    }
                }
            }
        }
    }

    /**
     * 正则匹配字符串
     *
     * @param str
     * @return
     */
    private static Matcher matcher(String str) {
        Pattern pattern = Pattern.compile("\\$\\{(.+?)\\}", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(str);
        return matcher;
    }

    /**
     * 根据图片类型，取得对应的图片类型代码
     *
     * @param picType
     * @return int
     */
    private static int getPictureType(String picType) {
        int res = CustomXWPFDocument.PICTURE_TYPE_PICT;
        if (picType != null) {
            if (picType.equalsIgnoreCase("png")) {
                res = CustomXWPFDocument.PICTURE_TYPE_PNG;
            } else if (picType.equalsIgnoreCase("dib")) {
                res = CustomXWPFDocument.PICTURE_TYPE_DIB;
            } else if (picType.equalsIgnoreCase("emf")) {
                res = CustomXWPFDocument.PICTURE_TYPE_EMF;
            } else if (picType.equalsIgnoreCase("jpg") || picType.equalsIgnoreCase("jpeg")) {
                res = CustomXWPFDocument.PICTURE_TYPE_JPEG;
            } else if (picType.equalsIgnoreCase("wmf")) {
                res = CustomXWPFDocument.PICTURE_TYPE_WMF;
            }
        }
        return res;
    }

    /**
     * 将输入流中的数据写入字节数组
     *
     * @param in
     * @return
     */
    public static byte[] inputStream2ByteArray(InputStream in, boolean isClose) {
        byte[] byteArray = null;
        try {
            int total = in.available();
            byteArray = new byte[total];
            in.read(byteArray);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (isClose) {
                try {
                    in.close();
                } catch (Exception e2) {
                    e2.getStackTrace();
                }
            }
        }
        return byteArray;
    }
}
