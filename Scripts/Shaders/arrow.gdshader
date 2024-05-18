shader_type canvas_item;
 
uniform vec3 rgb : source_color;
 
void fragment() {
    COLOR = vec4(rgb,COLOR.a);
}