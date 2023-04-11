// A modified version of CoderSpaceChannel's Mandelbrot shader
// https://www.youtube.com/shorts/h5PuIm6fRr8
// Translated to Audulus by Mark Boyd

#version 450
layout(location = 0) out vec4 outColor;
layout(binding = 0) uniform Inputs {
    float u_resolution_x;
    float u_resolution_y;
    float u_touchpad_x;
    float u_touchpad_y;
    float u_time;
} inputs;

const float MAX_ITER = 128.0;

float mandelbrot(vec2 uv) {
    vec2 c = 2.5 * uv - vec2(0.7, 0.0);
    vec2 z = vec2(0.0);
    float iter = 0.0;
    for (float i = 0.0; i < MAX_ITER; i++) {
        z = vec2(z.x * z.x - z.y * z.y, 2.0 * z.x * z.y) + c;
        if (dot(z, z) > 4.0) return iter / MAX_ITER;
        iter++;
    }
    return 0.0;
}

vec3 getColor(float t) {
    vec3 col = vec3(0.0);
    col.r = 9.0 * (1.0 - t) * t * t * t;
    col.g = 15.0 * (1.0 - t) * (1.0 - t) * t * t;
    col.b = 8.5 * (1.0 - t) * (1.0 - t) * (1.0 - t) * t;
    return col;
}

void main(void) {
    vec2 resolution = vec2(inputs.u_resolution_x, inputs.u_resolution_y);
    vec2 touchpad_uv = vec2(inputs.u_touchpad_x, inputs.u_touchpad_y) * 2.0 - vec2(1.0);
    float time = inputs.u_time;
    
    float zoom_factor = pow(2.0, time);
    vec2 uv = (gl_FragCoord.xy / resolution - 0.5) * 2.0 / zoom_factor;
    uv.y *= resolution.y / resolution.x;
    uv += touchpad_uv;
    
    float m = mandelbrot(uv);
    vec3 col = getColor(m);

    outColor = vec4(col, 1.0);
}
