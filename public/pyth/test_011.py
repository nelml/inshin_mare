from browser import document, window

# templete
THREE = window.THREE

# Pcamera 奥行きあるカメラ(視野、　アスペクト、 near、　far)
camera = THREE.PerspectiveCamera.new(100, 1, 1, 10000)

# z軸の設定
camera.position.z = 1000

#シーンの設定
scene = THREE.Scene.new()

#ジオメトリ(形状)の作成
geometry = THREE.CubeGeometry.new(200, 200, 200)

#マテリアル(見え方)を形成
material = THREE.MeshBasicMaterial.new({"color": "#ff0000"})

#geometryとmaterialをまとめる
mesh = THREE.Mesh.new(geometry, material)

#メッシュの場所設定後、シーンに配置
mesh.position.set(0, 0, 0)
scene.add(mesh)

#HTMLで表示するためrendererの設定
renderer = THREE.WebGLRenderer.new()
renderer.setSize(444, 444)
document <= renderer.domElement


def anima():
	renderer.render(scene, camera)

def sizing():
	width = window.innerWidth
	height = window.innerHeight
	renderer.setPixelRatio(window.devisePixelRatio)
	renderer.setSize(width, height)
	camera.aspect = width / height
	camera.updateProjectionMatrix();

window.addEventListener('resize', sizing)

