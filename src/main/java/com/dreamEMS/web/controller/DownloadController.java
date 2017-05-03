/**
 * @author min gyeong
 * @since 2017. 4. 27.
 * @version 1.0
 */
package com.dreamEMS.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author min gyeong
 */
@Controller
@RequestMapping("/download")
public class DownloadController {

    //private static final String FILE_PATH = "/excel/ems_template.xls";
    private static final String APPLICATION_EXCEL = "application/vnd.ms-excel";

    /*@RequestMapping(value = "/a", method = RequestMethod.GET, produces = APPLICATION_EXCEL)
    public @ResponseBody void downloadA(HttpServletResponse response) throws IOException {
        File file = getFile();
        InputStream in = new FileInputStream(file);

        response.setContentType(APPLICATION_EXCEL);
        response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
        response.setHeader("Content-Length", String.valueOf(file.length()));
        FileCopyUtils.copy(in, response.getOutputStream());
    }

    @RequestMapping(value = "/b", method = RequestMethod.GET, produces = APPLICATION_EXCEL)
    public @ResponseBody HttpEntity<byte[]> downloadB() throws IOException {
        File file = getFile();
        byte[] document = FileCopyUtils.copyToByteArray(file);

        HttpHeaders header = new HttpHeaders();
        header.setContentType(new MediaType("application", "pdf"));
        header.set("Content-Disposition", "inline; filename=" + file.getName());
        header.setContentLength(document.length);

        return new HttpEntity<byte[]>(document, header);
    }*/

    @RequestMapping(value = "/ems_template", method = RequestMethod.GET, produces = APPLICATION_EXCEL)
    public @ResponseBody Resource post_template(HttpServletResponse response) throws FileNotFoundException {
        
    	String path = "excel/ems_template.xls";
    	File file = getFile(path);
        response.setContentType(APPLICATION_EXCEL);
        response.setHeader("Content-Disposition", "inline; filename=" + file.getName());
        response.setHeader("Content-Length", String.valueOf(file.length()));
        return new FileSystemResource(file);
    }
    
    @RequestMapping(value = "/dreamEMS_template", method = RequestMethod.GET, produces = APPLICATION_EXCEL)
    public @ResponseBody Resource dreamEMS_template(HttpServletResponse response) throws FileNotFoundException {
        
    	String path = "excel/dreamEMS_template.xlsx";
    	File file = getFile(path);
        response.setContentType(APPLICATION_EXCEL);
        response.setHeader("Content-Disposition", "inline; filename=" + file.getName());
        response.setHeader("Content-Length", String.valueOf(file.length()));
        return new FileSystemResource(file);
    }

    private File getFile(String path) throws FileNotFoundException {
        File file;
		try {
			file = new File( ClassLoader.getSystemResource(path).toURI());
		} catch (URISyntaxException e) {
			throw new FileNotFoundException("file with path: " + path + " was not found.");
		}
        if (!file.exists()){
            throw new FileNotFoundException("file with path: " + path + " was not found.");
        }
        return file;
    }

}