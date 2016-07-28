package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.PatentDoc;

public interface PatentDocService {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDoc(int userId);
	
	PatentDoc getUserPatentDocById(long patentDocsId);
	
	void updatePatentDoc(PatentDoc patentDoc);

<<<<<<< HEAD
=======
	void deletePatentDoc(long patentDocsId);

	
	
	
>>>>>>> 882c657179a3a488f07883a2037b4eb400740a47
}
