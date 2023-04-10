// https://thebookofshaders.com/02/
// translated by Mark Boyd

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    float u_time;
} inputs;

void main() {
    outColor = vec4(1.0, 0.0, 1.0, 1.0);
}
