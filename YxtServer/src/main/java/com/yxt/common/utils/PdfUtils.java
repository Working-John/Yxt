package com.yxt.common.utils;

import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.pdf.*;
import com.timvale.sealplatform.bean.PosBean;
import com.timvale.sealplatform.result.file.SignPDFResult;
import com.timvale.sealplatform.sdk.file.SignLocalClient;
import com.yxt.model.common.PdfItextModel;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class PdfUtils {

  public static String fillTemplate(String templatePath,String newpdfPath,String pdfContent) {
    //String templatePath = "E:\\Code\\javaProject\\jinxi\\减负\\表格模板\\春风行动申请表.pdf";
    //新pdf
    File folder = new File(newpdfPath);
    if(!folder.exists() && !folder.isDirectory()){
      folder.mkdir();
    }
    String newPDFPath = newpdfPath+FileNameUtils.getFileName(templatePath);
    PdfReader pdfReader;
    FileOutputStream out;
    ByteArrayOutputStream bos;//字节数组缓冲区
    PdfStamper pdfStamper;//pdf解析器

    try {
      out = new FileOutputStream(newPDFPath); // 输出流
      pdfReader = new PdfReader(templatePath); // 读取pdf模板
      bos = new ByteArrayOutputStream();
      pdfStamper = new PdfStamper(pdfReader, bos);//读取模板交予解析器
      AcroFields form = pdfStamper.getAcroFields();//获取表单域

      String[] str = pdfContent.split("\\|");
      int i = 0;
      // 解决中文不显示的问题，需要引入itext-asian.jar包
      //BaseFont bf = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
      BaseFont bf = getBaseFont();
      //Font fontChinese = null;//设置字体
      //fontChinese = new Font(bf, 12, Font.NORMAL, BaseColor.BLUE);
      Iterator<String> it = form.getFields().keySet().iterator();//迭代器
      /*while (it.hasNext()) {
        String name = it.next().toString();
        form.setFieldProperty(name, "textfont", bf, null);//设置文本域表单的字体
        System.out.println(name);
      }*/
      while (it.hasNext()&&i<str.length) {
        String name = it.next().toString();
        form.setFieldProperty(name, "textfont", bf, null);//设置文本域表单的字体
        //System.out.println(name);
        form.setField(name, str[i++],true);//编辑文本域表单的内容
      }
      //form.setField("Unmarried", "Yes",true);
      pdfStamper.setFormFlattening(true); //设置为不可编辑
      pdfStamper.close();

      //创建文本对象 Document
      Document doc = new Document();
      PdfCopy copy = new PdfCopy(doc, out);
      doc.open();
      int pageNums = pdfReader.getNumberOfPages();
      for (int i1 = 1; i1 < pageNums + 1; i1++) {
        PdfImportedPage importPage = copy.getImportedPage(new PdfReader(bos.toByteArray()), i1);
        copy.addPage(importPage);
      }
      doc.close();
      return newPDFPath;

    } catch (IOException e) {
      e.printStackTrace();
      return "0";
    } catch (DocumentException e) {
      e.printStackTrace();
      return "0";
    }
  }

  //修改了入参
  public static String fillTemplate(String templatePath, String newpdfPath, Map<String,String> map) {
    //String templatePath = "E:\\Code\\javaProject\\jinxi\\减负\\表格模板\\春风行动申请表.pdf";
    File folder = new File(newpdfPath);
    if(!folder.exists() && !folder.isDirectory()){
      folder.mkdir();
    }
    //新pdf
    String newPDFPath = newpdfPath+FileNameUtils.getFileName(templatePath);
    PdfReader pdfReader;
    FileOutputStream out;
    ByteArrayOutputStream bos;//字节数组缓冲区
    PdfStamper pdfStamper;//pdf解析器

    try {
      out = new FileOutputStream(newPDFPath); // 输出流
      pdfReader = new PdfReader(templatePath); // 读取pdf模板
      bos = new ByteArrayOutputStream();
      pdfStamper = new PdfStamper(pdfReader, bos);//读取模板交予解析器
      AcroFields form = pdfStamper.getAcroFields();//获取表单域

      //String[] str = pdfContent.split("\\|");
      int i = 0;
      // 解决中文不显示的问题，需要引入itext-asian.jar包
      BaseFont bf = getBaseFont();
      Iterator<Map.Entry<String, String>> it = map.entrySet().iterator();

      while (it.hasNext()) {
        Map.Entry<String,String> entry = it.next();
        form.setFieldProperty(entry.getKey(), "textfont", bf, null);//设置文本域表单的字体
        form.setField(entry.getKey(), entry.getValue(),true);//编辑文本域表单的内容
      }

      pdfStamper.setFormFlattening(true); //设置为不可编辑
      pdfStamper.close();

      //创建文本对象 Document
      Document doc = new Document();
      PdfCopy copy = new PdfCopy(doc, out);
      doc.open();
      int pageNums = pdfReader.getNumberOfPages();
      for (int i1 = 1; i1 < pageNums + 1; i1++) {
        PdfImportedPage importPage = copy.getImportedPage(new PdfReader(bos.toByteArray()), i1);
        copy.addPage(importPage);
      }
      doc.close();
      return newPDFPath;

    } catch (IOException e) {
      e.printStackTrace();
      return "0";
    } catch (DocumentException e) {
      e.printStackTrace();
      return "0";
    }
  }

  public static String fillTemplate(String templatePath, String newpdfPath, JSONObject jsonObject) {
    //String templatePath = "E:\\Code\\javaProject\\jinxi\\减负\\表格模板\\春风行动申请表.pdf";
    File folder = new File(newpdfPath);
    if(!folder.exists() && !folder.isDirectory()){
      folder.mkdir();
    }
    //新pdf
    String newPDFPath = newpdfPath+FileNameUtils.getFileName(templatePath);
    PdfReader pdfReader;
    FileOutputStream out;
    ByteArrayOutputStream bos;//字节数组缓冲区
    PdfStamper pdfStamper;//pdf解析器

    try {
      out = new FileOutputStream(newPDFPath); // 输出流
      pdfReader = new PdfReader(templatePath); // 读取pdf模板
      bos = new ByteArrayOutputStream();
      pdfStamper = new PdfStamper(pdfReader, bos);//读取模板交予解析器
      AcroFields form = pdfStamper.getAcroFields();//获取表单域

      //String[] str = pdfContent.split("\\|");
      int i = 0;
      // 解决中文不显示的问题，需要引入itext-asian.jar包
      BaseFont bf = getBaseFont();
      Iterator it = jsonObject.entrySet().iterator();

      while (it.hasNext()) {
        Map.Entry entry = (Map.Entry) it.next();
        form.setFieldProperty((String) entry.getKey(), "textfont", bf, null);//设置文本域表单的字体
        form.setField((String)entry.getKey(), (String)entry.getValue(),true);//编辑文本域表单的内容
      }

      pdfStamper.setFormFlattening(true); //设置为不可编辑
      pdfStamper.close();

      //创建文本对象 Document
      Document doc = new Document();
      PdfCopy copy = new PdfCopy(doc, out);
      doc.open();
      int pageNums = pdfReader.getNumberOfPages();
      for (int i1 = 1; i1 < pageNums + 1; i1++) {
        PdfImportedPage importPage = copy.getImportedPage(new PdfReader(bos.toByteArray()), i1);
        copy.addPage(importPage);
      }
      doc.close();
      return newPDFPath;

    } catch (IOException e) {
      e.printStackTrace();
      return "0";
    } catch (DocumentException e) {
      e.printStackTrace();
      return "0";
    }
  }

  //pdf转图片
  public static String pdfToImg(String fileName,String fileType){
    File file = new File(fileName);
    //String imgName = fileName.substring(0,fileName.lastIndexOf("."))+"."+fileType;
    String imgName = fileName.substring(0,fileName.lastIndexOf("."));
    String imgNames = "";
    try {
      PDDocument doc = PDDocument.load(file);
      PDFRenderer renderer = new PDFRenderer(doc);
      int pageCount = doc.getNumberOfPages();
      if(pageCount > 1 ) {
        for (int i = 0; i < pageCount; i++) {
          BufferedImage image = renderer.renderImageWithDPI(i, 400);
          // BufferedImage image = renderer.renderImage(i, 2.5f);
          imgNames = imgNames +"|"+ imgName+i+"."+fileType;
          ImageIO.write(image, fileType, new File(imgName+i+"."+fileType));
        }
        imgName = imgNames.substring(1,imgNames.length());
      }
      else{
        BufferedImage image = renderer.renderImageWithDPI(0, 400);
        ImageIO.write(image, fileType, new File(imgName+"."+fileType));
        imgName = imgName +"."+fileType;
      }
      return imgName;
    } catch (IOException e) {
      e.printStackTrace();
      return "0";
    }
  }

  // 获取基础文字
  public static BaseFont getBaseFont() throws DocumentException, IOException {
    BaseFont base = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", false);
    return base;
  }

  /**
   * 添加文本
   * @param oldPswFilePath 原来的文件地址
   * @param list 需要添加的详细信息
   * @return
   * @throws IOException
   * @throws DocumentException
   */
  public static String signSinglePsw(String oldPswFilePath, List<PdfItextModel> list) throws IOException, DocumentException {

    int lastIndex = oldPswFilePath.lastIndexOf('.');
    // 获取文件后缀
    String suffix = oldPswFilePath.substring(lastIndex + 1);
    // 判断是否为pdf文件
    if (!"pdf".equals(suffix.toLowerCase())) {
      throw new RuntimeException("Not is PDF file");
    }


    int index = oldPswFilePath.lastIndexOf('/') + 1;
    // 生成新的文件路径
    //String newPswPath = oldPswFilePath.substring(0, lastIndex) /*+ "-副本." */+"."+ suffix;
    String newPswPath = oldPswFilePath.substring(0, index) + FileNameUtils.getFileName(oldPswFilePath);
    //System.out.println("单个psw文件签名生成的新路径：" + newPswPath);

    //解析文件
    PdfReader reader = new PdfReader(oldPswFilePath);
    FileOutputStream fOut = new FileOutputStream(newPswPath);
    PdfStamper stp = new PdfStamper(reader, fOut);

    // 总页数
    //System.out.println("PDF总页数：" + reader.getNumberOfPages());

    for (PdfItextModel model : list) {
      Float xCoordinate = model.getxCoordinate();
      Float yCoordinate = model.getyCoordinate();
      Integer pageNum = model.getPageNum();
      String content = model.getContent();
      if(xCoordinate == null || yCoordinate == null ||
              pageNum == null || pageNum == 0 || content == null || "".equals(content)){
        continue;
      }
      //content = stamper.getUnderContent(pageNum);//在内容下方加水印
      PdfContentByte pdfContentByte = stp.getOverContent(pageNum);
      pdfContentByte.beginText();
      // 设置字体及字号
      pdfContentByte.setFontAndSize(getBaseFont(), 14);
      addDeptReview(xCoordinate,yCoordinate,pdfContentByte, content);
      pdfContentByte.endText();
    }
    stp.close();
    // 将输出流关闭
    fOut.close();
    reader.close();
    // 文件读写结束
    //System.out.println("PSW文件读写完毕");

    return newPswPath;
  }

  /**
   * @Author
   * @Date 18:48 2020/3/7
   * @Description 添加水印
   * @param content
   * @param keyword
   * @param x X轴坐标
   * @param y Y轴坐标
   */
  private static void addDeptReview(float x,float y,PdfContentByte content, String keyword) {
    content.setColorFill(BaseColor.BLACK);
    // 设置水印位置和内容
    System.out.println("水印内容：" + keyword);
    System.out.println("打印位置坐标：" + x + "," + y);
    content.showTextAligned(Element.ALIGN_LEFT, keyword, x, y, 0);
  }

  public static SignPDFResult stampPDF(SignLocalClient signLocalClient,int x,int y,String page,String pdfPath,String sealSn) {
    PosBean posBean = new PosBean();
    posBean.setPosX(x);
    posBean.setPosY(y);
    posBean.setPosPage(page);
    SignPDFResult signPDFResult = signLocalClient.localSignPDF(
            pdfPath, pdfPath,
            sealSn, 1, posBean, "");
    return signPDFResult;
  }
}
