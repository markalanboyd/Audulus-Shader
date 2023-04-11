// https://thebookofshaders.com/05/
// translated for Audulus by Mark Boyd

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    float u_resolution_x;
    float u_resolution_y;
    float u_xypad_x;
    float u_xypad_y;
    float u_time;
} inputs;

// Plot a line on Y using a value between 0.0-1.0
float plot(float x, float y) {
    return smoothstep(0.02, 0.0, abs(y - x));
}

void main() {
    vec2 resolution = vec2(inputs.u_resolution_x, inputs.u_resolution_y);
    vec2 st = gl_FragCoord.xy / resolution;
    vec2 xypad = vec2(inputs.u_xypad_x, inputs.u_xypad_y);

    float y = st.x;

    vec3 color = vec3(y);

    // Plot a line
    float pct = plot(st.x, st.y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    outColor = vec4(color, 1.0);
}
