export class CloudViewer {
  constructor (el, options) {
    this.el = el;
    this.options = options;

    this.viewer = new Potree.Viewer(document.getElementById("potree_render_area"));

    this.viewer.setEDLEnabled(true);
		this.viewer.setFOV(60);
		this.viewer.setPointBudget(3_000_000);
		this.viewer.loadSettingsFromURL();

		this.viewer.setDescription("Loading Entwine-generated EPT format");

		this.viewer.loadGUI(() => {
			this.viewer.setLanguage('en');
			$("#menu_appearance").next().show();
		});

    this.load = this.load.bind(this);
  }

  load(url) {
    Potree.loadPointCloud(url, "USGS_LPC_WI_Winnebago_TL_2014_LAS_2019", (e) => {
			

			let material = e.pointcloud.material;
			material.size = 3;
			material.pointSizeType = Potree.PointSizeType.FIXED;
			material.shape = Potree.PointShape.SQUARE;
			material.activeAttributeName = "intensity gradient";
			//material.pointColorType = Potree.PointColorType.INTENSITY;
			//material.gradient = Potree.Gradients.GRAYSCALE;
			//material.pointColorType = Potree.PointColorType.INTENSITY_GRADIENT;
			if(material.intensityRange[0] === Infinity){
				material.intensityRange = [0, 65536];
			}
			//material.intensityRange = 
			this.viewer.scene.addPointCloud(e.pointcloud);

			this.viewer.fitToScreen();
		});
  }

}