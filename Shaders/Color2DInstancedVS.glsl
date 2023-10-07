#version 330 core

layout(std140) uniform INSTANCE_UNIFORMS
{
    mat4 instance_transforms;
    vec4 instance_colors;
    mat4 viewPerspective;
    bool isPaused;
};

out vec3 fragNormal;
out vec4 vertexColor;

///TESTING AREA    // vertex position attribute
layout(location = 0) in vec3 aPos;
layout (location = 1) in vec3 aTexCoord; // texture coordinate attribute

out vec2 TexCoord;
///

void main()
{
    uint vertexInstanceID = uint(gl_InstanceID);

    vec4 transformedPosition = instance_transforms * vec4(aPos,1);
    gl_Position = transformedPosition * viewPerspective;

    vertexColor = instance_colors;
    TexCoord = aTexCoord.xy;

    fragNormal = normalize(mat3(instance_transforms) * aPos);
}



