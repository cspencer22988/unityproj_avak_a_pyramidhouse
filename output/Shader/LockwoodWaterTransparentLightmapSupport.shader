Shader "Lockwood/WaterTransparentLightmapSupport" {
	Properties {
		_BumpMap ("Normals ", 2D) = "bump" {}
		_CubeMap ("Environment ", Cube) = "white" {}
		_DistortParams ("Distortions (Bump waves, FresnelScale, Fresnel power, Fresnel bias)", Vector) = (1,0.75,2,1.15)
		_BumpTiling ("Bump Tiling", Vector) = (1,1,-2,3)
		_BumpDirection ("Bump Direction & Speed", Vector) = (1,1,-1,1)
		_BaseColor ("Base color", Vector) = (0.54,0.95,0.99,0.5)
		_ReflectionColor ("Reflection color", Vector) = (0.54,0.95,0.99,0.5)
	}
	SubShader {
		Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 59542
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying mediump vec3 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  tmpvar_2 = ((tmpvar_3.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  tmpvar_1 = (tmpvar_3 - _WorldSpaceCameraPos);
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec4 _DistortParams;
					varying mediump vec3 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec4 baseColor_1;
					  mediump vec3 reflectVector_2;
					  mediump vec3 worldNormal_3;
					  mediump vec3 bump_4;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (((bump_4.xxy * _DistortParams.x) * vec3(1.0, 0.0, 1.0)) + vec3(0.0, 1.0, 0.0));
					  worldNormal_3 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldNormal_3);
					  worldNormal_3 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(xlv_TEXCOORD0);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 - (2.0 * (
					    dot (tmpvar_7, tmpvar_8)
					   * tmpvar_7)));
					  reflectVector_2.yz = tmpvar_9.yz;
					  reflectVector_2.x = -(tmpvar_9.x);
					  baseColor_1 = _BaseColor;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = textureCube (_CubeMap, reflectVector_2);
					  baseColor_1.xyz = ((baseColor_1.xyz * tmpvar_12.xyz) * (unity_Lightmap_HDR.x * color_11.xyz));
					  baseColor_1.w = _ReflectionColor.w;
					  gl_FragData[0] = baseColor_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying mediump vec3 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  tmpvar_2 = ((tmpvar_3.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  tmpvar_1 = (tmpvar_3 - _WorldSpaceCameraPos);
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec4 _DistortParams;
					varying mediump vec3 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec4 baseColor_1;
					  mediump vec3 reflectVector_2;
					  mediump vec3 worldNormal_3;
					  mediump vec3 bump_4;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (((bump_4.xxy * _DistortParams.x) * vec3(1.0, 0.0, 1.0)) + vec3(0.0, 1.0, 0.0));
					  worldNormal_3 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldNormal_3);
					  worldNormal_3 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(xlv_TEXCOORD0);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 - (2.0 * (
					    dot (tmpvar_7, tmpvar_8)
					   * tmpvar_7)));
					  reflectVector_2.yz = tmpvar_9.yz;
					  reflectVector_2.x = -(tmpvar_9.x);
					  baseColor_1 = _BaseColor;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = textureCube (_CubeMap, reflectVector_2);
					  baseColor_1.xyz = ((baseColor_1.xyz * tmpvar_12.xyz) * (unity_Lightmap_HDR.x * color_11.xyz));
					  baseColor_1.w = _ReflectionColor.w;
					  gl_FragData[0] = baseColor_1;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp vec3 _WorldSpaceCameraPos;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _BumpTiling;
					uniform highp vec4 _BumpDirection;
					varying mediump vec3 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec4 tmpvar_2;
					  highp vec3 tmpvar_3;
					  tmpvar_3 = (unity_ObjectToWorld * _glesVertex).xyz;
					  tmpvar_2 = ((tmpvar_3.xzxz + (_Time.xxxx * _BumpDirection)) * _BumpTiling);
					  tmpvar_1 = (tmpvar_3 - _WorldSpaceCameraPos);
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = tmpvar_1;
					  xlv_TEXCOORD1 = tmpvar_2;
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _BumpMap;
					uniform lowp samplerCube _CubeMap;
					uniform highp vec4 _BaseColor;
					uniform highp vec4 _ReflectionColor;
					uniform highp vec4 _DistortParams;
					varying mediump vec3 xlv_TEXCOORD0;
					varying mediump vec4 xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  mediump vec4 baseColor_1;
					  mediump vec3 reflectVector_2;
					  mediump vec3 worldNormal_3;
					  mediump vec3 bump_4;
					  lowp vec3 tmpvar_5;
					  tmpvar_5 = (((texture2D (_BumpMap, xlv_TEXCOORD1.xy).xyz * 2.0) - 1.0) + ((texture2D (_BumpMap, xlv_TEXCOORD1.zw).xyz * 2.0) - 1.0));
					  bump_4 = tmpvar_5;
					  highp vec3 tmpvar_6;
					  tmpvar_6 = (((bump_4.xxy * _DistortParams.x) * vec3(1.0, 0.0, 1.0)) + vec3(0.0, 1.0, 0.0));
					  worldNormal_3 = tmpvar_6;
					  mediump vec3 tmpvar_7;
					  tmpvar_7 = normalize(worldNormal_3);
					  worldNormal_3 = tmpvar_7;
					  mediump vec3 tmpvar_8;
					  tmpvar_8 = normalize(xlv_TEXCOORD0);
					  mediump vec3 tmpvar_9;
					  tmpvar_9 = (tmpvar_8 - (2.0 * (
					    dot (tmpvar_7, tmpvar_8)
					   * tmpvar_7)));
					  reflectVector_2.yz = tmpvar_9.yz;
					  reflectVector_2.x = -(tmpvar_9.x);
					  baseColor_1 = _BaseColor;
					  mediump vec4 tmpvar_10;
					  tmpvar_10 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_11;
					  color_11 = tmpvar_10;
					  lowp vec4 tmpvar_12;
					  tmpvar_12 = textureCube (_CubeMap, reflectVector_2);
					  baseColor_1.xyz = ((baseColor_1.xyz * tmpvar_12.xyz) * (unity_Lightmap_HDR.x * color_11.xyz));
					  baseColor_1.w = _ReflectionColor.w;
					  gl_FragData[0] = baseColor_1;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Cull Off
			GpuProgramID 69157
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _BaseColor;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _BaseColor.xyz);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _BaseColor;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _BaseColor.xyz);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp vec4 vertex_1;
					  vertex_1 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_1.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_2;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_2 = 0.0001;
					    } else {
					      tmpvar_2 = 0.0;
					    };
					    vertex_1.z = tmpvar_2;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_1.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_3;
					    if ((vertex_1.z > 0.0)) {
					      tmpvar_3 = 0.0001;
					    } else {
					      tmpvar_3 = 0.0;
					    };
					    vertex_1.z = tmpvar_3;
					  };
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = vertex_1.xyz;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform highp vec4 _BaseColor;
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying highp vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tex_1;
					  mediump vec3 tmpvar_2;
					  mediump vec3 tmpvar_3;
					  lowp vec4 tmpvar_4;
					  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
					  tex_1.w = tmpvar_4.w;
					  tex_1.xyz = (tmpvar_4.xyz * _BaseColor.xyz);
					  tmpvar_2 = tex_1.xyz;
					  mediump vec4 res_5;
					  res_5 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_6;
					    tmpvar_6.w = 1.0;
					    tmpvar_6.xyz = tmpvar_2;
					    res_5.w = tmpvar_6.w;
					    highp vec3 tmpvar_7;
					    tmpvar_7 = clamp (pow (tmpvar_2, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_5.xyz = tmpvar_7;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_8;
					    if (bool(unity_UseLinearSpace)) {
					      emission_8 = tmpvar_3;
					    } else {
					      emission_8 = (tmpvar_3 * ((tmpvar_3 * 
					        ((tmpvar_3 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_9;
					    tmpvar_9.w = 1.0;
					    tmpvar_9.xyz = emission_8;
					    res_5 = tmpvar_9;
					  };
					  gl_FragData[0] = res_5;
					}
					
					
					#endif"
				}
			}
			Program "fp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES"
				}
			}
		}
	}
	Fallback "Lockwood/Diffuse"
}