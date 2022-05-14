
import { Controller } from "@hotwired/stimulus"
import * as threeJs from 'https://esm.run/three';


export default class extends Controller {
  
  connect() {
    console.log("connect")
    window.viewer = new Potree.Viewer(document.getElementById("potree_render_area"));

    viewer.setEDLEnabled(true);
		viewer.setFOV(60);
		viewer.setPointBudget(3_000_000);
		viewer.loadSettingsFromURL();

		viewer.setDescription("Loading Entwine-generated EPT format");

		viewer.loadGUI(() => {
			viewer.setLanguage('en');
			$("#menu_appearance").next().show();
		});

		var path = "/static/pointclouds/USGS_LPC_WI_Winnebago_TL_2014_LAS_2019/ept.json";
		var name = "lion";

		var getQueryParam = function(name) {
			name = name.replace(/[\[\]]/g, "\\$&");
			var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
				results = regex.exec(window.location.href);
			if (!results || !results[2]) return null;
			return decodeURIComponent(results[2].replace(/\+/g, " "));
		}


		Potree.loadPointCloud("https://romanch.uk/static/pointclouds/USGS_LPC_WI_Winnebago_TL_2014_LAS_2019/ept.json", name, function(e){
			

			let material = e.pointcloud.material;
			material.size = 3;
			material.pointSizeType = Potree.PointSizeType.FIXED;
			material.shape = Potree.PointShape.SQUARE;
			//material.pointColorType = Potree.PointColorType.INTENSITY_GRADIENT;
			if(material.intensityRange[0] === Infinity){
				material.intensityRange = [0, 65536];
			}
			//material.intensityRange = 
			viewer.scene.addPointCloud(e.pointcloud);

			viewer.fitToScreen();
		});
    
  }
}


// var defaults = {
// 	pointBudget: mobile ? 700 * 1000 : 3.5 * 1000 * 1000,
// 	edlEnabled: !mobile,
// 	edlStrength: 0.2,
// 	edlRadius: 1.4,
// 	pointSize: 3,
// 	pointType: Potree.PointSizeType.FIXED,
// 	pointShape: Potree.PointShape.SQUARE,
// 	material: Potree.PointColorType.INTENSITY_GRADIENT,
// 	intensityRange: [0, 65536],
// 	weightClassification: 1,
// 	fov: 80,
// 	opacity: 1,
// 	rgbGamma: 1,
// 	rgbContrast: 0,
// 	rgbBrightness: 0,
// 	intensityGamma: 1,
// 	intensityContrast: 0,
// 	intensityBrightness: 0,
// 	classificationFilter: [],
// 	hq: true
// }