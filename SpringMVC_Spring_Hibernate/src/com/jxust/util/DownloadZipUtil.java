package com.jxust.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.swing.plaf.ButtonUI;

public class DownloadZipUtil {
	
	public static void zipFile(List<BufferedInputStream> files, String[] names, ZipOutputStream outputStream) throws IOException, ServletException {
        try {
            int size = files.size();
            // 压缩列表中的文件
            for (int i = 0; i < size; i++) {
                zipFile(files.get(i), names[i], outputStream);
            }
        } catch (IOException e) {
            throw e;
        }
    }
	
	public static void zipFile(BufferedInputStream bis, String name,ZipOutputStream outputstream) throws IOException, ServletException {
        try { 
                    ZipEntry entry = new ZipEntry(name + "/" + name + ".xls");
                    outputstream.putNextEntry(entry);

                    final int MAX_BYTE = 10 * 1024 * 1024; // 最大的流为10M
                    long streamTotal = 0; // 接受流的容量
                    int streamNum = 0; // 流需要分开的数量
                    int leaveByte = 0; // 文件剩下的字符数
                    byte[] inOutbyte; // byte数组接受文件的数据

                    streamTotal = bis.available(); // 通过available方法取得流的最大字符数
                    streamNum = (int) Math.floor(streamTotal / MAX_BYTE); // 取得流文件需要分开的数量
                    leaveByte = (int) streamTotal % MAX_BYTE; // 分开文件之后,剩余的数量

                    if (streamNum > 0) {
                        for (int j = 0; j < streamNum; ++j) {
                            inOutbyte = new byte[MAX_BYTE];
                            // 读入流,保存在byte数组
                            bis.read(inOutbyte, 0, MAX_BYTE);
                            outputstream.write(inOutbyte, 0, MAX_BYTE); // 写出流
                        }
                    }
                    // 写出剩下的流数据
                    inOutbyte = new byte[leaveByte];
                    bis.read(inOutbyte, 0, leaveByte);
                    outputstream.write(inOutbyte);
                    outputstream.closeEntry(); // Closes the current ZIP entry
                    // and positions the stream for
                    // writing the next entry
        } catch (IOException e) {
            throw e;
        }
    }
}
