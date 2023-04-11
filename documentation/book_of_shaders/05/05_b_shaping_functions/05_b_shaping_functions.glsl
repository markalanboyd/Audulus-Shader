// https://thebookofshaders.com/05/
// translated for Audulus by Mark Boyd

// Author: Inigo Quiles
// Title: Expo

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    float u_resolution_x;
    float u_resolution_y;
    float u_xypad_x;
    float u_xypad_y;
    float u_time;
} inputs;

#define PI 3.14159265359

// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st, float pct) {
    return smoothstep(pct - 0.02, pct, st.y) - smoothstep(pct, pct + 0.02, st.y);
}

void main() {
    vec2 st = gl_FragCoord.xy / vec2(inputs.u_resolution_x, inputs.u_resolution_y);

    float y = pow(st.x, 5.0);

    vec3 color = vec3(y);

    float pct = plot(st, y);
    color = (1.0 - pct) * color + pct * vec3(0.0, 1.0, 0.0);

    outColor = vec4(color, 1.0);
}
