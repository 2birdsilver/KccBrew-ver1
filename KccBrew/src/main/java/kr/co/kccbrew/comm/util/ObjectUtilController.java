package kr.co.kccbrew.comm.util;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody; 

@Controller
public class ObjectUtilController {
	@Autowired
	private ObjectUtilService objectUtilService;
	
	/*장비코드로 장비이름 조회 */
	@RequestMapping(value="/getEquipmentName", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getEquipmentName(@RequestParam("equipmentCode") String equipmentCode) {
		System.out.println("equipmentCode: " + equipmentCode);
		return objectUtilService.getEquipmentName(equipmentCode);
	} 
	
	
	/*지역코드로 지역이름 조회 */
	@RequestMapping(value="/getLocationName", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String getLocationName(@RequestParam("locationCode") String locationCode) {
		System.out.println("locationCode: " + locationCode);
		return objectUtilService.getLocationName(locationCode);
	}

}
