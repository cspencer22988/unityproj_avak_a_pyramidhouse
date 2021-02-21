Shader "Lockwood/Mobile/VertexAlpha_Tint_Unlit" {
	Properties {
		_BaseColor ("Base color", Vector) = (1,1,1,1)
		_MainTex ("Texture RGB", 2D) = "white" {}
	}
	SubShader {
		Tags { "QUEUE" = "Transparent+4" "RenderType" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent+4" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			Cull Off
			GpuProgramID 38076
			Program "vp" {
				SubProgram "gles hw_tier00 " {
					"!!GLES
					#version 100
					
					#ifdef VERTEX
					attribute vec4 _glesVertex;
					attribute vec4 _glesColor;
					attribute vec4 _glesMultiTexCoord0;
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord0_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_2 = tmpvar_5;
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = texcoord0_2;
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (tmpvar_2 * _BaseColor);
					  col1_1 = tmpvar_3;
					  col1_1 = (col1_1 * xlv_COLOR0);
					  gl_FragData[0] = col1_1;
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
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord0_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_2 = tmpvar_5;
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = texcoord0_2;
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (tmpvar_2 * _BaseColor);
					  col1_1 = tmpvar_3;
					  col1_1 = (col1_1 * xlv_COLOR0);
					  gl_FragData[0] = col1_1;
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
					uniform highp mat4 unity_ObjectToWorld;
					uniform highp mat4 unity_MatrixVP;
					uniform highp vec4 _MainTex_ST;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  highp vec4 tmpvar_1;
					  tmpvar_1 = _glesColor;
					  mediump vec2 texcoord0_2;
					  mediump vec4 tmpvar_3;
					  highp vec4 tmpvar_4;
					  tmpvar_4.w = 1.0;
					  tmpvar_4.xyz = _glesVertex.xyz;
					  highp vec2 tmpvar_5;
					  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
					  texcoord0_2 = tmpvar_5;
					  tmpvar_3 = tmpvar_1;
					  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
					  xlv_TEXCOORD0 = texcoord0_2;
					  xlv_COLOR0 = tmpvar_3;
					}
					
					
					#endif
					#ifdef FRAGMENT
					uniform sampler2D _MainTex;
					uniform highp vec4 _BaseColor;
					varying mediump vec2 xlv_TEXCOORD0;
					varying mediump vec4 xlv_COLOR0;
					void main ()
					{
					  lowp vec4 col1_1;
					  lowp vec4 tmpvar_2;
					  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
					  highp vec4 tmpvar_3;
					  tmpvar_3 = (tmpvar_2 * _BaseColor);
					  col1_1 = tmpvar_3;
					  col1_1 = (col1_1 * xlv_COLOR0);
					  gl_FragData[0] = col1_1;
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
}