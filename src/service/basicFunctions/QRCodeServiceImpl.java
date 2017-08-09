package service.basicFunctions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import database.basicFunctions.dao.QRcodeDao;
import database.models.QRCode;

@Service("QRCodeService")
public class QRCodeServiceImpl implements QRCodeService{

	@Autowired
	private QRcodeDao QRCodeDao;
	
	public QRCode save(QRCode qrCode) {
		return QRCodeDao.save(qrCode);
	}

	public QRCode find(String key) {
		return QRCodeDao.getByKey(key);
	}

	public List<QRCode> findAll() {
		return QRCodeDao.findAll();
	}

}
