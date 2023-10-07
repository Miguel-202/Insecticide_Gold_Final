#version 330 core

layout(std140) uniform INSTANCE_UNIFORMS
{
    mat4 instance_transforms;
    vec4 instance_colors;
    mat4 viewPerspective;
    bool isPaused;
};

in vec4 vertexColor;
//in vec3 fragPos;
in vec3 fragNormal;

out vec4 fragColor;
in vec2 TexCoord;
uniform sampler2D textureSampler;

void main()
{
    if(isPaused)
    {
        vec4 texColor = texture(textureSampler, TexCoord) * vertexColor;
        float gray = (texColor.r + texColor.g + texColor.b) / 3.0;
        fragColor = vec4(vec3(gray), texColor.a);
    }
    else
    {
	    fragColor = texture(textureSampler, TexCoord) * vertexColor;
    }
    
    // Output blended color
    if (fragColor.a == 0.0) 
    {
        discard;
    } 
    else 
    {
        fragColor = mix(vec4(0.0), fragColor, fragColor.a);
    }
}

