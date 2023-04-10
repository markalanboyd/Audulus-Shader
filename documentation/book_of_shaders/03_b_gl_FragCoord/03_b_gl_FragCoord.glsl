// https://thebookofshaders.com/03/
// translated by Mark Boyd
// NB: Orientation of st.y needed to be flipped to match example

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    vec2 u_resolution;
    vec2 u_mouse;
    float u_time;
} inputs;

void main() {
    vec2 st = gl_FragCoord.xy / inputs.u_resolution;
    outColor = vec4(st.x, 1 - st.y, 0.0, 1.0);
}
