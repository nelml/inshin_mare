from browser import document, window

# templete
THREE = window.THREE

# Pcamera 奥行きあるカメラ(視野、　アスペクト、 near、　far)
camera = THREE.PerspectiveCamera.new(1, 2, 3, 4)

# z軸の設定
camera.position.z = 1000

