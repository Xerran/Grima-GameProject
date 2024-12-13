/// @description Sets Position and Text

switch ( camera ) {
	
	// In case of Camera Button 1
	case 1:
		
		x = obj_grima_controller.x - 90
		y = obj_grima_controller.y + 116
		
		btn_txt = "Camera 1"
		
		image_xscale = 0.6
		image_yscale = 0.6
		
	break;
	
	// In case of Camera Button 2
	case 2:
		
		x = obj_grima_controller.x - 30
		y = obj_grima_controller.y + 116
		
		btn_txt = "Camera 2"
		
		image_xscale = 0.6
		image_yscale = 0.6
		
	break;
	
	// In case of Camera Button 3
	case 3:
		
		x = obj_grima_controller.x + 30
		y = obj_grima_controller.y + 116
		
		btn_txt = "Camera 3"
		
		image_xscale = 0.6
		image_yscale = 0.6
		
	break;
	
	// In case of Camera Button 4
	case 4:
		
		x = obj_grima_controller.x + 90
		y = obj_grima_controller.y + 116
		
		btn_txt = "Camera 4"
		
		image_xscale = 0.6
		image_yscale = 0.6
		
	break;
	
}
