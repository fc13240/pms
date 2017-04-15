package com.lotut.pms.web.util.weixin;

import java.awt.BasicStroke;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Shape;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Hashtable;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;
import com.lotut.pms.web.util.weixin.md5.WeixinXmlParse;

public class QRCodeUtil {
	private static final String CHARSET = "utf-8";  
    private static final String FORMAT = "JPG";  
    // 二维码尺寸  
    private static final int QRCODE_SIZE = 300;  
    // LOGO宽度  
    private static final int LOGO_WIDTH = 80;  
    // LOGO高度  
    private static final int LOGO_HEIGHT = 80;  
  
    private static BufferedImage createImage(String content, String logoPath, boolean needCompress) throws Exception {  
        Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();  
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);  
        hints.put(EncodeHintType.CHARACTER_SET, CHARSET);  
        hints.put(EncodeHintType.MARGIN, 1);  
        BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE,  
                hints);  
        int width = bitMatrix.getWidth();  
        int height = bitMatrix.getHeight();  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        for (int x = 0; x < width; x++) {  
            for (int y = 0; y < height; y++) {  
                image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);  
            }  
        }  
        if (logoPath == null || "".equals(logoPath)) {  
            return image;  
        }  
        // 插入图片  
        QRCodeUtil.insertImage(image, logoPath, needCompress);  
        return image;  
    }  
  
    private static void insertImage(BufferedImage source, String logoPath, boolean needCompress) throws Exception {  
        File file = new File(logoPath);  
        if (!file.exists()) {  
            throw new Exception("logo file not found.");  
        }  
        Image src = ImageIO.read(new File(logoPath));  
        int width = src.getWidth(null);  
        int height = src.getHeight(null);  
        if (needCompress) { // 压缩LOGO  
            if (width > LOGO_WIDTH) {  
                width = LOGO_WIDTH;  
            }  
            if (height > LOGO_HEIGHT) {  
                height = LOGO_HEIGHT;  
            }  
            Image image = src.getScaledInstance(width, height, Image.SCALE_SMOOTH);  
            BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
            Graphics g = tag.getGraphics();  
            g.drawImage(image, 0, 0, null); // 绘制缩小后的图  
            g.dispose();  
            src = image;  
        }  
        // 插入LOGO  
        Graphics2D graph = source.createGraphics();  
        int x = (QRCODE_SIZE - width) / 2;  
        int y = (QRCODE_SIZE - height) / 2;  
        graph.drawImage(src, x, y, width, height, null);  
        Shape shape = new RoundRectangle2D.Float(x, y, width, width, 6, 6);  
        graph.setStroke(new BasicStroke(3f));  
        graph.draw(shape);  
        graph.dispose();  
    }  
  
    public static String encode(String content, String logoPath, String destPath, String fileName, boolean needCompress) throws Exception {  
        BufferedImage image = QRCodeUtil.createImage(content, logoPath, needCompress);  
        mkdirs(destPath);  
        fileName = fileName.substring(0, fileName.indexOf(".")>0?fileName.indexOf("."):fileName.length())   
                + "." + FORMAT.toLowerCase();  
        ImageIO.write(image, FORMAT, new File(destPath + "/" + fileName));  
        //return fileName;  
        return destPath+"/" +fileName;  
    }  
    public static void mkdirs(String destPath) {  
        File file = new File(destPath);  
        if (!file.exists() && !file.isDirectory()) {  
            file.mkdirs();  
        }  
    }  
}
