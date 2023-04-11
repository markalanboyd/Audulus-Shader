// https://thebookofshaders.com/03/
// translated for Audulus by Mark Boyd

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    float u_resolution_x;
    float u_resolution_y;
    float u_pad_x;
    float u_pad_y;
    float u_time;
} inputs;

void main() {
    vec2 resolution = vec2(inputs.u_resolution_x, inputs.u_resolution_y);
    vec2 st = gl_FragCoord.xy / resolution;
    vec2 xypad = vec2(inputs.u_pad_x, inputs.u_pad_y);
    outColor = vec4(st.x, st.y, 0.0, 1.0);
}
