// https://thebookofshaders.com/05/
// translated for Audulus by Mark Boyd

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    float u_resolution_x;
    float u_resolution_y;
    float u_time;
} inputs;

void main() {
    vec3 c;
    float l, z = inputs.u_time;
    for (int i = 0; i < 3; i++) {
        vec2 uv, p = gl_FragCoord.xy / vec2(inputs.u_resolution_x, inputs.u_resolution_y);
        uv = p;
        p -= 0.5;
        p.x *= inputs.u_resolution_x / inputs.u_resolution_y;
        z += 0.07;
        l = length(p);
        uv += p / l * (sin(z) + 1.0) * abs(sin(l * 9.0 - z - z));
        c[i] = 0.01 / length(mod(uv, 1.0) - 0.5);
    }
    outColor = vec4(c / l, inputs.u_time);
}
