$(function() {
	var textMesh1s = []; //需要转向的字体
	var shiwaiMeshs = [];
	var shineiMeshs = [];

	var selectedObjects = [];

	var composer,
		effectFXAA,
		outlinePass;

	var scene = new THREE.Scene();
	var mouse = new THREE.Vector2();
	var raycaster = new THREE.Raycaster();
	//增加雾化效果
	//scene.fog=new THREE.Fog("#fff",0.05,500);
	scene.background = new THREE.Color('#f3f3f3');
	var camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 1, 10000);

	var renderer = new THREE.WebGLRenderer();
	renderer.setSize(window.innerWidth, window.innerHeight);
	//设置可以出现阴影
	renderer.shadowMapEnabled = true;

	$(".mode_main").append(renderer.domElement);
	var axes = new THREE.AxesHelper(200);
	scene.add(axes);

	var ambientLight = new THREE.AmbientLight(0x404040);
	var directionalLight1 = new THREE.DirectionalLight(0xC0C090);
	var directionalLight2 = new THREE.DirectionalLight(0xC0C090);

	directionalLight1.position.set(-300, -300, 100);
	directionalLight2.position.set(300, 300, -100);


	var directionalLight = new THREE.DirectionalLight(0xffffff, 1.1); // 新建一个平行光, 平行光照射到的每个点的强度都一样
	directionalLight.position.set(300, 1000, 500);
	directionalLight.target.position.set(0, 0, 0);
	directionalLight.castShadow = true; // 开启平行光的投影

	// 下面是设置投影的效果
	var d = 300;
	directionalLight.shadow.camera = new THREE.OrthographicCamera(-d, d, d, -d, 500, 1600); // 投影的可视范围
	directionalLight.shadow.bias = 0.0001;
	directionalLight.shadow.mapSize.width = directionalLight.shadow.mapSize.height = 1024; // 投影的精度
	scene.add(directionalLight)

	// 再添加一个环境光, 目的是为了调和平行光的投影区域, 防止投影过度黑
	var light = new THREE.AmbientLight(0xffffff, 0.3)
	scene.add(light)


	camera.position.x = 0;
	camera.position.y = 600;
	camera.position.z = 1000;
	camera.lookAt(scene.position);

	//添加摄像头控制
	var control = new THREE.OrbitControls(camera);
	control.addEventListener('change', function(e) {
		textMesh1s.map(function(item) {
			item.rotation.set(e.target.object.rotation._x, e.target.object.rotation._y, e.target.object.rotation._z);
		});
		renderer.render(scene, camera);
	});

	var mtlLoader = new THREE.MTLLoader();
	mtlLoader.setPath('http://localhost:8080/seckill/uploadFiles/');
	loadJZW();

	function loadJZW() {
		mtlLoader.load('1519440890638-smq.mtl', function(materials) {
			materials.preload();
			var loader = new THREE.OBJLoader();
			loader.setMaterials(materials);
			loader.setPath('http://localhost:8080/seckill/uploadFiles/');
			loader.load('1519440869450-smq.obj', function(object) {
				object.scale.set(0.1, 0.1, 0.1);
				object.position.y = 0;
				shiwaiMeshs.push(object);
				scene.add(object);
			}, function(e) {}, function() {});
		});
	}


	composer = new THREE.EffectComposer(renderer);
	var renderPass = new THREE.RenderPass(scene, camera);
	composer.addPass(renderPass);

	outlinePass = new THREE.OutlinePass(new THREE.Vector2(window.innerWidth, window.innerHeight), scene, camera);
	composer.addPass(outlinePass);
	effectFXAA = new THREE.ShaderPass(THREE.FXAAShader);
	effectFXAA.uniforms['resolution'].value.set(1 / window.innerWidth, 1 / window.innerHeight);
	effectFXAA.renderToScreen = true;
	composer.addPass(effectFXAA);
	//window.addEventListener('resize', onWindowResize, false);
	/*    window.addEventListener('mousemove', onTouchMove);
	    window.addEventListener('touchmove', onTouchMove);*/

	/*  function onTouchMove(event) {
	      var x, y;
	      if (event.changedTouches) {

	          x = event.changedTouches[0].pageX;
	          y = event.changedTouches[0].pageY;
	      } else {
	          x = event.clientX;
	          y = event.clientY;
	      }
	      mouse.x = ( x / window.innerWidth ) * 2 - 1;
	      mouse.y = -( y / window.innerHeight ) * 2 + 1;
	      checkIntersection();
	  }*/

	function addSelectedObject(object) {
		selectedObjects = [];
		selectedObjects.push(object);
	}

	function checkIntersection() {
		raycaster.setFromCamera(mouse, camera);
		var intersects = raycaster.intersectObjects([ scene ], true);
		if (intersects.length > 0) {
			var selectedObject = intersects[0].object;
			addSelectedObject(selectedObject);
			outlinePass.selectedObjects = selectedObjects;
		} else {
		}
	}


	function onWindowResize() {
		var width = window.innerWidth;
		var height = window.innerHeight;

		camera.aspect = width / height;
		camera.updateProjectionMatrix();

		renderer.setSize(width, height);
		composer.setSize(width, height);

		//effectFXAA.uniforms['resolution'].value.set(1 / window.innerWidth, 1 / window.innerHeight);

	}

	anmition = function() {
		control.update();
		composer.render();
		requestAnimationFrame(anmition);
	}
	anmition();


})