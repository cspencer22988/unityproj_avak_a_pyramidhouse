Shader "Lockwood/Mobile/VertexBendCombined_Cutout" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_WindDirection ("Wind Direction", Vector) = (1,1,1,1)
		_WindEdgeFlutterFreqScale ("Wind edge fultter freq scale", Float) = 0.5
		_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		LOD 100
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
		Pass {
			LOD 100
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
			Cull Off
			GpuProgramID 61417
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.xyz = tmpvar_3.xyz;
					  lowp float tmpvar_4;
					  tmpvar_4 = tmpvar_3.w;
					  alpha_1 = tmpvar_4;
					  highp float x_5;
					  x_5 = (alpha_1 - _Cutoff);
					  if ((x_5 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.xyz = tmpvar_3.xyz;
					  lowp float tmpvar_4;
					  tmpvar_4 = tmpvar_3.w;
					  alpha_1 = tmpvar_4;
					  highp float x_5;
					  x_5 = (alpha_1 - _Cutoff);
					  if ((x_5 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.xyz = tmpvar_3.xyz;
					  lowp float tmpvar_4;
					  tmpvar_4 = tmpvar_3.w;
					  alpha_1 = tmpvar_4;
					  highp float x_5;
					  x_5 = (alpha_1 - _Cutoff);
					  if ((x_5 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  lowp float tmpvar_7;
					  tmpvar_7 = col_2.w;
					  alpha_1 = tmpvar_7;
					  highp float x_8;
					  x_8 = (alpha_1 - _Cutoff);
					  if ((x_8 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  lowp float tmpvar_7;
					  tmpvar_7 = col_2.w;
					  alpha_1 = tmpvar_7;
					  highp float x_8;
					  x_8 = (alpha_1 - _Cutoff);
					  if ((x_8 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  tmpvar_18.w = 1.0;
					  tmpvar_18.xyz = pos_10.xyz;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_18));
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  lowp float tmpvar_7;
					  tmpvar_7 = col_2.w;
					  alpha_1 = tmpvar_7;
					  highp float x_8;
					  x_8 = (alpha_1 - _Cutoff);
					  if ((x_8 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = ((tmpvar_18.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = ((tmpvar_18.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = ((tmpvar_18.z * unity_FogParams.z) + unity_FogParams.w);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = ((tmpvar_18.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = ((tmpvar_18.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = ((tmpvar_18.z * unity_FogParams.z) + unity_FogParams.w);
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_18.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_18.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_18.z)));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_18.z)));
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_18.z)));
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2(-((unity_FogParams.y * tmpvar_18.z)));
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  highp float tmpvar_20;
					  tmpvar_20 = (unity_FogParams.x * tmpvar_18.z);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2((-(tmpvar_20) * tmpvar_20));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  highp float tmpvar_20;
					  tmpvar_20 = (unity_FogParams.x * tmpvar_18.z);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2((-(tmpvar_20) * tmpvar_20));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  highp float tmpvar_20;
					  tmpvar_20 = (unity_FogParams.x * tmpvar_18.z);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2((-(tmpvar_20) * tmpvar_20));
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  highp float tmpvar_4;
					  tmpvar_4 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, tmpvar_3.xyz, vec3(tmpvar_4));
					  lowp float tmpvar_5;
					  tmpvar_5 = col_2.w;
					  alpha_1 = tmpvar_5;
					  highp float x_6;
					  x_6 = (alpha_1 - _Cutoff);
					  if ((x_6 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  highp float tmpvar_20;
					  tmpvar_20 = (unity_FogParams.x * tmpvar_18.z);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2((-(tmpvar_20) * tmpvar_20));
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  highp float tmpvar_20;
					  tmpvar_20 = (unity_FogParams.x * tmpvar_18.z);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2((-(tmpvar_20) * tmpvar_20));
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" }
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec3 _glesNormal;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					uniform highp vec4 _Time;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_WorldToObject;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_FogParams;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 _MainTex_ST;
					uniform highp vec4 _WindDirection;
					uniform highp float _WindEdgeFlutterFreqScale;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  lowp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  highp float windEdgeFlutter_2;
					  highp float bendingFact_3;
					  highp vec4 wind_4;
					  mediump vec2 tmpvar_5;
					  lowp float tmpvar_6;
					  tmpvar_6 = tmpvar_1.x;
					  bendingFact_3 = tmpvar_6;
					  lowp float tmpvar_7;
					  tmpvar_7 = tmpvar_1.y;
					  windEdgeFlutter_2 = tmpvar_7;
					  highp mat3 tmpvar_8;
					  tmpvar_8[0] = unity_WorldToObject[0].xyz;
					  tmpvar_8[1] = unity_WorldToObject[1].xyz;
					  tmpvar_8[2] = unity_WorldToObject[2].xyz;
					  wind_4.xyz = (tmpvar_8 * _WindDirection.xyz);
					  wind_4.w = (_WindDirection.w * bendingFact_3);
					  highp vec2 tmpvar_9;
					  tmpvar_9.y = 1.0;
					  tmpvar_9.x = _WindEdgeFlutterFreqScale;
					  highp vec4 pos_10;
					  pos_10.w = _glesVertex.w;
					  highp vec3 bend_11;
					  highp vec4 v_12;
					  v_12.x = unity_ObjectToWorld[0].w;
					  v_12.y = unity_ObjectToWorld[1].w;
					  v_12.z = unity_ObjectToWorld[2].w;
					  v_12.w = unity_ObjectToWorld[3].w;
					  highp float tmpvar_13;
					  tmpvar_13 = dot (v_12.xyz, vec3(1.0, 1.0, 1.0));
					  highp vec2 tmpvar_14;
					  tmpvar_14.x = dot (_glesVertex.xyz, vec3((windEdgeFlutter_2 + tmpvar_13)));
					  tmpvar_14.y = tmpvar_13;
					  highp vec4 tmpvar_15;
					  tmpvar_15 = abs(((
					    fract((((
					      fract((((_Time.y * tmpvar_9).xx + tmpvar_14).xxyy * vec4(1.975, 0.793, 0.375, 0.193)))
					     * 2.0) - 1.0) + 0.5))
					   * 2.0) - 1.0));
					  highp vec4 tmpvar_16;
					  tmpvar_16 = ((tmpvar_15 * tmpvar_15) * (3.0 - (2.0 * tmpvar_15)));
					  highp vec2 tmpvar_17;
					  tmpvar_17 = (tmpvar_16.xz + tmpvar_16.yw);
					  bend_11.xz = ((windEdgeFlutter_2 * 0.1) * _glesNormal).xz;
					  bend_11.y = (bendingFact_3 * 0.3);
					  pos_10.xyz = (_glesVertex.xyz + ((
					    (tmpvar_17.xyx * bend_11)
					   + 
					    ((wind_4.xyz * tmpvar_17.y) * bendingFact_3)
					  ) * wind_4.w));
					  pos_10.xyz = (pos_10.xyz + (bendingFact_3 * wind_4.xyz));
					  highp vec4 tmpvar_18;
					  highp vec4 tmpvar_19;
					  tmpvar_19.w = 1.0;
					  tmpvar_19.xyz = pos_10.xyz;
					  tmpvar_18 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  highp float tmpvar_20;
					  tmpvar_20 = (unity_FogParams.x * tmpvar_18.z);
					  gl_Position = tmpvar_18;
					  xlv_TEXCOORD0 = tmpvar_5;
					  xlv_TEXCOORD1 = exp2((-(tmpvar_20) * tmpvar_20));
					  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform lowp vec4 unity_FogColor;
					uniform mediump sampler2D unity_Lightmap;
					uniform mediump vec4 unity_Lightmap_HDR;
					uniform sampler2D _MainTex;
					uniform lowp float _Cutoff;
					varying mediump vec2 xlv_TEXCOORD0;
					varying highp float xlv_TEXCOORD1;
					varying highp vec2 xlv_TEXCOORD2;
					void main ()
					{
					  highp float alpha_1;
					  lowp vec4 col_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
					  col_2.w = tmpvar_3.w;
					  mediump vec4 tmpvar_4;
					  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
					  lowp vec4 color_5;
					  color_5 = tmpvar_4;
					  mediump vec3 tmpvar_6;
					  tmpvar_6 = (unity_Lightmap_HDR.x * color_5.xyz);
					  col_2.xyz = (tmpvar_3.xyz * tmpvar_6);
					  highp float tmpvar_7;
					  tmpvar_7 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
					  col_2.xyz = mix (unity_FogColor.xyz, col_2.xyz, vec3(tmpvar_7));
					  lowp float tmpvar_8;
					  tmpvar_8 = col_2.w;
					  alpha_1 = tmpvar_8;
					  highp float x_9;
					  x_9 = (alpha_1 - _Cutoff);
					  if ((x_9 < 0.0)) {
					    discard;
					  };
					  col_2.w = alpha_1;
					  gl_FragData[0] = col_2;
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
				SubProgram "gles hw_tier00 " {
					Keywords { "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_LINEAR" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" }
					"!!GLES"
				}
				SubProgram "gles hw_tier00 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier01 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
				SubProgram "gles hw_tier02 " {
					Keywords { "FOG_EXP2" "LKWD_LIGHTMAP_ON" }
					"!!GLES"
				}
			}
		}
		Pass {
			Name "META"
			LOD 100
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
			Cull Off
			GpuProgramID 108892
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 vertex_4;
					  vertex_4 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_5;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_4.z = tmpvar_5;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_6;
					    if ((vertex_4.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_4.z = tmpvar_6;
					  };
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = vertex_4.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_2.zw = vec2(0.0, 0.0);
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying mediump vec4 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  tmpvar_1 = tmpvar_3.xyz;
					  mediump vec4 res_4;
					  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_5;
					    tmpvar_5.w = 1.0;
					    tmpvar_5.xyz = tmpvar_1;
					    res_4.w = tmpvar_5.w;
					    highp vec3 tmpvar_6;
					    tmpvar_6 = clamp (pow (tmpvar_1, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_4.xyz = tmpvar_6;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_7;
					    if (bool(unity_UseLinearSpace)) {
					      emission_7 = tmpvar_2;
					    } else {
					      emission_7 = (tmpvar_2 * ((tmpvar_2 * 
					        ((tmpvar_2 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = emission_7;
					    res_4 = tmpvar_8;
					  };
					  gl_FragData[0] = res_4;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier01 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 vertex_4;
					  vertex_4 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_5;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_4.z = tmpvar_5;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_6;
					    if ((vertex_4.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_4.z = tmpvar_6;
					  };
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = vertex_4.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_2.zw = vec2(0.0, 0.0);
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying mediump vec4 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  tmpvar_1 = tmpvar_3.xyz;
					  mediump vec4 res_4;
					  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_5;
					    tmpvar_5.w = 1.0;
					    tmpvar_5.xyz = tmpvar_1;
					    res_4.w = tmpvar_5.w;
					    highp vec3 tmpvar_6;
					    tmpvar_6 = clamp (pow (tmpvar_1, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_4.xyz = tmpvar_6;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_7;
					    if (bool(unity_UseLinearSpace)) {
					      emission_7 = tmpvar_2;
					    } else {
					      emission_7 = (tmpvar_2 * ((tmpvar_2 * 
					        ((tmpvar_2 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = emission_7;
					    res_4 = tmpvar_8;
					  };
					  gl_FragData[0] = res_4;
					}
					
					
					#endif"
				}
				SubProgram "gles hw_tier02 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					attribute vec4 _glesMultiTexCoord1;
					attribute vec4 _glesMultiTexCoord2;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 unity_LightmapST;
					uniform highp vec4 unity_DynamicLightmapST;
					uniform bvec4 unity_MetaVertexControl;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec4 xlv_TEXCOORD0;
					varying highp vec2 xlv_TEXCOORD1;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec4 tmpvar_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 vertex_4;
					  vertex_4 = _glesVertex;
					  if (unity_MetaVertexControl.x) {
					    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
					    highp float tmpvar_5;
					    if ((_glesVertex.z > 0.0)) {
					      tmpvar_5 = 0.0001;
					    } else {
					      tmpvar_5 = 0.0;
					    };
					    vertex_4.z = tmpvar_5;
					  };
					  if (unity_MetaVertexControl.y) {
					    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
					    highp float tmpvar_6;
					    if ((vertex_4.z > 0.0)) {
					      tmpvar_6 = 0.0001;
					    } else {
					      tmpvar_6 = 0.0;
					    };
					    vertex_4.z = tmpvar_6;
					  };
					  highp vec4 tmpvar_7;
					  tmpvar_7.w = 1.0;
					  tmpvar_7.xyz = vertex_4.xyz;
					  tmpvar_2.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  tmpvar_2.zw = vec2(0.0, 0.0);
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
					  xlv_TEXCOORD0 = tmpvar_2;
					  xlv_TEXCOORD1 = vec2(0.0, 0.0);
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform bvec4 unity_MetaFragmentControl;
					uniform highp float unity_OneOverOutputBoost;
					uniform highp float unity_MaxOutputValue;
					uniform highp float unity_UseLinearSpace;
					uniform sampler2D _MainTex;
					varying mediump vec4 xlv_TEXCOORD0;
					void main ()
					{
					  mediump vec3 tmpvar_1;
					  mediump vec3 tmpvar_2;
					  lowp vec4 tmpvar_3;
					  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
					  tmpvar_1 = tmpvar_3.xyz;
					  mediump vec4 res_4;
					  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
					  if (unity_MetaFragmentControl.x) {
					    mediump vec4 tmpvar_5;
					    tmpvar_5.w = 1.0;
					    tmpvar_5.xyz = tmpvar_1;
					    res_4.w = tmpvar_5.w;
					    highp vec3 tmpvar_6;
					    tmpvar_6 = clamp (pow (tmpvar_1, vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
					    res_4.xyz = tmpvar_6;
					  };
					  if (unity_MetaFragmentControl.y) {
					    mediump vec3 emission_7;
					    if (bool(unity_UseLinearSpace)) {
					      emission_7 = tmpvar_2;
					    } else {
					      emission_7 = (tmpvar_2 * ((tmpvar_2 * 
					        ((tmpvar_2 * 0.305306) + 0.6821711)
					      ) + 0.01252288));
					    };
					    mediump vec4 tmpvar_8;
					    tmpvar_8.w = 1.0;
					    tmpvar_8.xyz = emission_7;
					    res_4 = tmpvar_8;
					  };
					  gl_FragData[0] = res_4;
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
	Fallback "Lockwood/Mobile/VertexBlend_2Tex"
}