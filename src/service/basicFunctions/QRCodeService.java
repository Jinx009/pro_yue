package service.basicFunctions;

import java.util.List;

import database.models.QRCode;

public interface QRCodeService {

	public QRCode save(QRCode qrCode);
	
	public QRCode findByKey(String key);
	
	public List<QRCode> findAll();
	
}
