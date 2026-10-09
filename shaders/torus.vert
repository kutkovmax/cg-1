#version 450

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;
layout(location = 2) in vec3 inColor;

layout(set = 0, binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
    vec4 userColor;
} ubo;

layout(location = 0) out vec3 fragNormal;
layout(location = 1) out vec3 fragPos;
layout(location = 2) out vec3 fragColor;

void main() {
    vec4 worldPos = ubo.model * vec4(inPosition, 1.0);
    fragPos = worldPos.xyz;
    fragNormal = normalize(mat3(transpose(inverse(ubo.model))) * inNormal);
    // Per-vertex color multiplied by user color (task 4+5)
    fragColor = inColor * ubo.userColor.rgb;
    gl_Position = ubo.proj * ubo.view * worldPos;
}
