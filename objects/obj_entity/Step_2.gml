// Se sai pela parte esquerda da camera
if ((x + sprite_width / 2) < camera_get_view_x(view_camera[0])){
    // Me destruo
    instance_destroy(id, false)
}