package com.lotut.pms.service.utils;

import java.io.File;
import java.io.FileFilter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.util.PrincipalUtils;

public class NoticeXmlParser {
	public static List<Notice> parseNoticeXmlFiles(String noticePath) {
		List<File> noticeXmlFiles = findNoticeXmlFiles(noticePath);
		String zipFileName = noticePath.substring(noticePath.lastIndexOf("/")+1);
		List<Notice> notices = new ArrayList<>();
		for (File noticeXmlFile: noticeXmlFiles) {
			notices.add(parseNoticeXmlFile(noticeXmlFile, zipFileName));
		}
		return notices;
	}
	
	public static List<File> findNoticeXmlFiles(String unzipNoticeDirectory) {
		FileFilter noticeDirectoryFilter = new NoticeDirectoryFilter();
		FileFilter noticeXmlFileFilter = new NoticeXmlFileFilter();
		List<File> noticeXmlFiles = new ArrayList<>();
		
		File noticeDirectory = new File(unzipNoticeDirectory);
		File[] gaDirecotories = noticeDirectory.listFiles(noticeDirectoryFilter);
		for (File gaDir: gaDirecotories) {
			File[] listXmlFiles = gaDir.listFiles(noticeXmlFileFilter);
			for (File xmlFile: listXmlFiles) {
				noticeXmlFiles.add(xmlFile);
			}
		}
		
		return noticeXmlFiles;
	}
	
	/**
	 * @param noticeXmlFile
	 * @param zipFileName
	 * @return
	 */
	public static Notice parseNoticeXmlFile(File noticeXmlFile, String zipFileName) {
		try {
			Notice notice = new Notice();
			Patent patent = new Patent();
			notice.setPatent(patent);
			SAXReader reader = new SAXReader();
			Document doc = reader.read(noticeXmlFile);
			String noticeInfoRootPath = "//data-bus/TONGZHISXJ/SHUXINGXX";
			String noticeSequence = doc.valueOf( "//data-bus/TONGZHISID" );
			String dispatchSequence = doc.valueOf( "//data-bus/FAWENXLH" );
			Node noticeInfoNode = doc.selectSingleNode(noticeInfoRootPath);
			Node timeLimitNode = noticeInfoNode.selectSingleNode("QIXIAN");
			Node dispatchDateNode = noticeInfoNode.selectSingleNode("FAWENR");
			Node noticeNameNode = noticeInfoNode.selectSingleNode("TONGZHISMC");
			Node noticeCodeNode = noticeInfoNode.selectSingleNode("TONGZHISBM");
			Node zipBidNode = noticeInfoNode.selectSingleNode("ZIPBID");
			Node dmhFlagNode = noticeInfoNode.selectSingleNode("DMHFLAG");
			Node archiveNoNode = noticeInfoNode.selectSingleNode("ANJUANH");
			
			Node appNameNode = noticeInfoNode.selectSingleNode("FAMINGMC");
			Node appNoNode = noticeInfoNode.selectSingleNode("SHENQINGH");
			Node appDateNode = noticeInfoNode.selectSingleNode("SHENQINGR");
			Node internalCodeNode = noticeInfoNode.selectSingleNode("NEIBUBH");
			Node patentTypeNode = noticeInfoNode.selectSingleNode("FAMINGLX");
			
			
			notice.setNoticeSequence(noticeSequence);
			notice.setDispatchSequence(dispatchSequence);
			notice.setTimeLimt(timeLimitNode == null ? null : Integer.valueOf(timeLimitNode.getStringValue()));
			notice.setDispatchDate(dispatchDateNode == null ? null : new SimpleDateFormat("yyyyMMdd").parse(dispatchDateNode.getStringValue()));
			notice.setName(noticeNameNode.getStringValue());
			notice.setNoticeCode(noticeCodeNode ==  null ? null : noticeCodeNode.getStringValue());
			notice.setZipBid(zipBidNode ==  null ? null : zipBidNode.getStringValue());
			notice.setDmhFlag(dmhFlagNode ==  null ? null : dmhFlagNode.getStringValue());
			notice.setArchiveNo(archiveNoNode ==  null ? null : archiveNoNode.getStringValue());
			notice.setZipfileName(zipFileName);
			NoticeType noticeType = new NoticeType();
			
			noticeType.setNoticeTypeId(getNoticeTypeByName(noticeNameNode.getStringValue()));
			notice.setNoticeType(noticeType);
			
			notice.setNoticeStatusText(patentTypeNode.getStringValue());
			
			patent.setAppNo(appNoNode.getStringValue());
			patent.setName(appNameNode ==  null ? null : appNameNode.getStringValue());
			patent.setAppDate(appDateNode == null ? null : new SimpleDateFormat("yyyyMMdd").parse(appDateNode.getStringValue()));
			patent.setInternalCode(internalCodeNode ==  null ? null : internalCodeNode.getStringValue());
			patent.setOwnerId(PrincipalUtils.getCurrentUserId());
			Integer patentType = getPatentType(patentTypeNode.getStringValue());
			PatentType patentTypeObj = null;
			if (patentType !=  null) {
				patentTypeObj =  new PatentType();
				patentTypeObj.setPatentTypeId(patentType);
				patent.setPatentType(patentTypeObj);
			}
			
			return notice;
		} catch (DocumentException e) {
			throw new RuntimeException("Error occured while parse notice xml file " +  noticeXmlFile.getName() + ", please check the xml format");
		} catch (ParseException e) {
			throw new RuntimeException("The format of dispatch date is not valid for notice xml file " + noticeXmlFile.getName() + ", the valid format is yyyyMMdd");
		}
	}

	private static Integer getPatentType(String patentTypeStr) {
		if (patentTypeStr == null) {
			return null;
		}
		
		if (patentTypeStr == "0" || patentTypeStr == "3") {
			return 1;
		}
		
		if (patentTypeStr == "1" || patentTypeStr == "4") {
			return 2;
		}
		
		if (patentTypeStr == "2") {
			return 3;
		}
		
		return null;
	}
	
	private static int getNoticeTypeByName(String noticeName) {
	    if (noticeName.contains("受理")) {
	        return 1;
	    }
	    
	    if (noticeName.contains("费")) {
	        return 2;
	    }
	    
	    if (noticeName.contains("补正") || noticeName.contains("审查")) {
	        return 3;
	    }
	    
	    if (noticeName.contains("授权") || noticeName.contains("登记")) {
	    	return 4;
	    }
	    
	    if (noticeName.contains("视为") || noticeName.contains("驳回") || noticeName.contains("终止")) {
	    	return 5;
	    }

	    if (noticeName.contains("合格")) {
	    	return 6;
	    }

	    return 7;
	}
	
	private static class NoticeDirectoryFilter implements FileFilter {
		@Override
		public boolean accept(File pathname) {
			if (pathname.isDirectory() && pathname.getName().startsWith("GA")) {
				return true;
			}
				
			return false;
		}
		
	}
	
	private static class NoticeXmlFileFilter implements FileFilter {
		@Override
		public boolean accept(File pathname) {
			if (pathname.isFile() && pathname.getName().equals("list.xml")) {
				return true;
			}
				
			return false;
		}
	}
}
