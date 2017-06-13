package org.asechs.wheelwego.model;

import javax.annotation.Resource;

import org.asechs.wheelwego.model.vo.FileVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOImpl implements FileDAO {
	@Resource
	private SqlSessionTemplate sessionTemplate;

	@Override
	public void saveFilePath(FileVO vo) {
		sessionTemplate.insert("file.saveFilePath",vo);
	}
}
