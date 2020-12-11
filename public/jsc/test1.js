window.addEventListener('load', init)

function init(){
    const renderer = new THREE.WebGLRenderer({
        canvas: document.querySelector('#testCanvas')
    });

    renderer.setSize(400, 400)

    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(45, 400 / 400);
    const geometry = new THREE.BoxGeometry(500, 500, 500);
    const material = new THREE.MeshNomalMaterial();
    const box = new THREE.Mesh(geometry, material);

    scene.add(box);
}

tick();

function tick(){
    requestAnimationFrame(tick);
    box.rotation.y += 0.01;
    renderer.render(scene, camera);
}
