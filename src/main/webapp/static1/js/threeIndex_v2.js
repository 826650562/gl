$(function() {
	var H = parseInt($(".model-show").css("height"));
	var W = parseInt($(".model-show").css("width"));

	console.info(W, H);

	var container;
	var camera,
		scene,
		renderer;
	var mouseX = 0,
		mouseY = 0;
	var windowHalfX = W / 2;
	var windowHalfY = H / 2;

	var selectedObjects = [];
	var composer,
		effectFXAA,
		outlinePass;
	//选中的
	var checkoutParts = [];
	var removeOrshowParts = [];
	mode_init = function() {
		container = document.createElement('div');
		$(".model-show").append(container);
		mouse = new THREE.Vector2();
		raycaster = new THREE.Raycaster();

		scene = new THREE.Scene();
		camera = new THREE.PerspectiveCamera(45, W / H, 1, 10000);
		camera.position.x = 0;
		camera.position.y = 50;
		camera.position.z = 500;
		camera.lookAt(scene.position);

		//添加摄像头控制
		control = new THREE.OrbitControls(camera);
		control.minDistance = 50;
		control.maxDistance = 760;
		/*control.addEventListener('change', function(e) {
			renderer.render(scene, camera);
		});
*/
		// scene
		var ambientLight = new THREE.AmbientLight(0xcccccc, 0.4);
		scene.add(ambientLight);
		var pointLight = new THREE.PointLight(0xffffff, 0.8);
		camera.add(pointLight);
		scene.add(camera);
		// texture
		var manager = new THREE.LoadingManager();
		manager.onProgress = function(item, loaded, total) {
			console.log(item, loaded, total);
		};

		// model
		var onProgress = function(xhr) {
			if (xhr.lengthComputable) {
				var percentComplete = xhr.loaded / xhr.total * 100;
				console.log(Math.round(percentComplete, 2) + '% downloaded');
			}
		};

		var onError = function(xhr) {};
		addSky();
		loadJZW();
		
		function loadJZW() {
			var ifame=window.parent.document.getElementById("modeContainer");
			var _name=$(ifame).attr("_name"); 
			var _type=$(ifame).attr("_type"); 
			//$("#ifm").contents().find("#btnOk")
			$.ajax({
				type : "POST",
				url : "getModePath",
				data : {
					_name : _name,
					_type : _type,
				},
				async : false,
				cache : false,
				contentType : "application/x-www-form-urlencoded",
				success : function(data) {
					 console.info(data);
				},
				error : function(data) {
					console.log("error:" + data.responseText);
				}
			});
			
			
			var mtlLoader = new THREE.MTLLoader();
			mtlLoader.setPath('http://localhost:8080/seckill/uploadFiles/');
			mtlLoader.load('lss.mtl', function(materials) {
				materials.preload();
				var loader = new THREE.OBJLoader();
				loader.setMaterials(materials);
				loader.setPath('http://localhost:8080/seckill/uploadFiles/');
				loader.load('lss.obj', function(object) {
					object.scale.set(0.1, 0.1, 0.1);
					object.position.y = 0;
					getParts(object, scene);

					scene.add(object);
				}, onProgress, onError);
			});
		}

		renderer = new THREE.WebGLRenderer();
		renderer.setPixelRatio(window.devicePixelRatio);
		renderer.setSize(W, H);
		container.appendChild(renderer.domElement);
		//document.addEventListener( 'mousemove', onDocumentMouseMove, false );
		//window.addEventListener('resize', onWindowResize, false);


		composer = new THREE.EffectComposer(renderer);
		var renderPass = new THREE.RenderPass(scene, camera);
		composer.addPass(renderPass);

		outlinePass = new THREE.OutlinePass(new THREE.Vector2(window.innerWidth, window.innerHeight), scene, camera);
		composer.addPass(outlinePass);
		effectFXAA = new THREE.ShaderPass(THREE.FXAAShader);
		effectFXAA.uniforms['resolution'].value.set(1 / window.innerWidth, 1 / window.innerHeight);
		effectFXAA.renderToScreen = true;
		composer.addPass(effectFXAA);

		var model = document.getElementById("model-show")
		//model.addEventListener('mousemove', onTouchMove);
		//model.addEventListener('touchmove', onTouchMove);

		function onTouchMove(event) {
			var x,
				y;
			if (event.changedTouches) {

				x = event.changedTouches[0].pageX;
				y = event.changedTouches[0].pageY;
			} else {
				x = event.layerX;
				y = event.layerY;
			}
			mouse.x = (x / W) * 2 - 1;
			mouse.y = -(y / H) * 2 + 1;
			checkIntersection();
		}

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
				outlinePass.selectedObjects = [];
			}
		}
		
		animate();
	}
	function onWindowResize() {
		windowHalfX = window.innerWidth / 2;
		windowHalfY = window.innerHeight / 2;
		camera.aspect = window.innerWidth / window.innerHeight;
		camera.updateProjectionMatrix();
		renderer.setSize(window.innerWidth, window.innerHeight);
	}

	function animate() {
		render();
	}
	function render() {
		control.update();
		composer.render();
		requestAnimationFrame(animate);
	}

	function getParts(_datas, scene) {
		//获取模型的原件
		var datas = $.extend([], _datas.children);
		var scene = scene;
		var html = [];
		if (datas.length > 0) {
			datas.map(function(data) {
				html.push(getHtml(data));
			});
		} else {
			$("#parts_").html("<font>无数据</font>");
		}
		var len = html.length;
		if (len > 0) {
			//分页
			var fenLen = 8;
			layui.use([ 'laypage', 'layer' ], function() {
				var laypage = layui.laypage,
					layer = layui.layer;
				//总页数低于页码总数
				laypage.render({
					elem : 'fenye',
					count : len, //数据总数,
					limit : fenLen,
					groups : 2,
					theme : "#007bff",
					jump : function(obj, first) {
						//首次不执行
						if (!first) {
							$("#parts_").html(gethtml(html, obj.curr, fenLen));
						}
						addEventerlister();
					}
				});
			})
			$("#parts_").html(gethtml(html, 1, fenLen));
			$("#fenye").fadeIn(100);
			//注册监控事件

			function addEventerlister() {
				$("#parts_").find("input").click(function() {
					var type = $(this).attr("_type");
					var id = $(this).attr("value");
					if (type == "show") {
						if ($(this).is(':checked')) {
							checkoutParts.push(id);
						} else {
							var index = checkoutParts.indexOf(id);
							if (index >= 0) {
								checkoutParts.splice(index, 1);
							}
						}
						outlinePass.selectedObjects = _getParts(checkoutParts);
					} else {
						if ($(this).is(':checked')) {
							_datas.remove(_getParts([ id ])[0]);
							removeOrshowParts.push(id)
						} else {
							var index = removeOrshowParts.indexOf(id);
							if (index >= 0) {
								checkoutParts.splice(index, 1);
							}
							_datas.add(_getParts([ id ])[0]);
						}
					}
				});

				//创建部件
				$("#_createParts").click(function() {
					if (checkoutParts.length <= 0) {
						alert('请先勾选部件！');
					} else {

					}
				});


			}
			function _getParts(arr) {
				var modeParts = [];
				arr.map(function(item) {
					datas.map(function(data) {
						if (data.name == item) {
							modeParts.push(data);
						}
					});
				});
				return modeParts
			}
			function showOrhide() {
			}
		}
		function gethtml(html, cur, len) {
			var h = "";
			var be = (cur - 1) * len;
			var end = cur * len;
			for (var i = 0; i < html.length; i++) {
				if (i >= be && i < end) {
					h += html[i];
				}
			}
			return h;
		}
	}


	function getHtml(data) {
		return "<tr> <th scope='row'>" + data.name + "</th>" +
			"<td><input type='checkbox' name='vehicle' value='" + data.name + "'  _type='show'  /></td>" +
			"<td><input type='checkbox' name='vehicle' value='" + data.name + "'  _type='hide'  /></td> </tr>";
	}

	//添加天空盒
	function addSky() {
		var path = "../static/img/"; //设置路径
		var directions = [ "bg", "bg", "bg", "bg", "bg", "bg" ]; //获取对象
		var format = ".png"; //格式
		//创建盒子，并设置盒子的大小为( 5000, 5000, 5000 )
		var skyGeometry = new THREE.BoxGeometry(2000, 2000, 2000);
		//设置盒子材质
		var materialArray = [];
		for (var i = 0; i < 6; i++)
			materialArray.push(new THREE.MeshBasicMaterial({
				map : THREE.ImageUtils.loadTexture(path + directions[i] + format), //将图片纹理贴上
				side : THREE.BackSide /*镜像翻转，如果设置镜像翻转，那么只会看到黑漆漆的一片，因为你身处在盒子的内部，所以一定要设置镜像翻转。*/
			}));
		var skyMaterial = new THREE.MeshFaceMaterial(materialArray);
		var skyBox = new THREE.Mesh(skyGeometry, skyMaterial); //创建一个完整的天空盒，填入几何模型和材质的参数
		scene.add(skyBox); //在场景中加入天空盒
	}
})