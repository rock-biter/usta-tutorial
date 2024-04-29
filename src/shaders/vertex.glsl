attribute vec3 color;
attribute float offset;
attribute vec3 position2;
varying vec3 vColor;
uniform float uTime;
uniform float uProgress;
varying float vDistance;

void main() {

  vColor = color;
  vec3 pos = mix(position,position2,uProgress);
  pos *= 1. + sin(3.14 * uProgress) * 3.;
  pos.y += sin(uTime * 0.5 * (offset - 0.5) + offset * 10.) * 0.15;
  pos.x += cos(uTime * 0.5 * (offset - 0.5) + offset * 10.) * 0.15;

  vec3 wPos = vec4( modelMatrix * vec4(pos, 1.0) ).xyz;
  float dist = distance(cameraPosition, wPos);

  vDistance = smoothstep(15.,0., dist);

  gl_Position = projectionMatrix * modelViewMatrix * vec4(pos, 1.0);
  gl_PointSize = 40. * vDistance * (sin(uTime * 3. + offset * 10.) * 0.4 + 0.6 );
}