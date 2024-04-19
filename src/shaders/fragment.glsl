varying vec3 vColor;
varying float vDistance;

void main() {
  float strength = distance(gl_PointCoord, vec2(0.5));
    strength *= 2.0;
    strength = smoothstep(0.7,0.8,1.0 - strength);
  gl_FragColor.rgba = vec4(vColor,1.);
  gl_FragColor.a *= strength;
  gl_FragColor.a *= vDistance;
}