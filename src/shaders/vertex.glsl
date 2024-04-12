attribute vec3 color;
varying vec3 vColor;

void main() {

  vColor = color;
  vec3 wPos = vec4( modelMatrix * vec4(position, 1.0) ).xyz;
  float dist = distance(cameraPosition, wPos);

  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
  gl_PointSize = 50. * smoothstep(30.,0., dist);
}