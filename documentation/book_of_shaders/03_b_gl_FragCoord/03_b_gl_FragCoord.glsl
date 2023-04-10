// https://thebookofshaders.com/03/
// translated by Mark Boyd
// NB: Orientation of st.y needed to be flipped to match example

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    float u_resolution;
    float u_pad_x;
    float u_pad_y;
    float u_time;
} inputs;

void main() {
    vec2 st = gl_FragCoord.xy / inputs.u_resolution;
    vec2 touch = vec2(inputs.u_pad_x, inputs.u_pad_y);
    outColor = vec4(st.x, 1.0 - st.y, 0.0, 1.0);
}
