// https://thebookofshaders.com/03/
// translated for Audulus by Mark Boyd
// NB: You must attach a Timer node to the u_time input.

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    float u_time;
} inputs;

void main() {
    outColor = vec4(abs(sin(u_time)), 0.0, 0.0, 1.0);
}
