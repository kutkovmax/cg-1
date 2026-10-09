#version 450

layout(location = 0) in vec3 fragNormal;
layout(location = 1) in vec3 fragPos;
layout(location = 2) in vec3 fragColor;

layout(location = 0) out vec4 outColor;

void main() {
    vec3 lightDir = normalize(vec3(1.0, 2.0, 3.0));
    vec3 norm = normalize(fragNormal);

    float ambient = 0.18;
    float diff = max(dot(norm, lightDir), 0.0);

    vec3 viewDir = normalize(vec3(0.0, -4.0, 2.0) - fragPos);
    vec3 halfDir = normalize(lightDir + viewDir);
    float spec = pow(max(dot(norm, halfDir), 0.0), 48.0) * 0.4;

    vec3 result = (ambient + diff + spec) * fragColor;
    outColor = vec4(result, 1.0);
}
