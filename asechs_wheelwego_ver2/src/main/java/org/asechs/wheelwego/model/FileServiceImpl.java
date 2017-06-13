package org.asechs.wheelwego.model;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.FileVO;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl implements FileService{
	@Resource
	private FileDAO fileDAO;

	@Override
	public void saveFilePath(FileVO vo) {
		fileDAO.saveFilePath(vo);
	}
	
}
