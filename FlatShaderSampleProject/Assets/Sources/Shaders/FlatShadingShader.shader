Shader "Custom/FlatSurfaceShader" {
	Properties{	}
		SubShader{
		Tags{ "Queue" = "Geometry" "RenderType" = "Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf FlatShading vertex:vert noforwardadd
		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		struct Input {
			float3 worldPos;
			float3 localPos;
		};

		void vert(inout appdata_full v, out Input o) {
			UNITY_INITIALIZE_OUTPUT(Input, o);
			o.localPos = v.vertex.xyz;
		}

		half4 LightingFlatShading(SurfaceOutput s, half3 lightDir, half atten) {
			half dotProductNormalLightDir = dot(s.Normal, lightDir);
			half diff = dotProductNormalLightDir * 0.5 + 0.8;
			half4 color;
			color.rgb = s.Albedo * _LightColor0.rgb * (diff *atten);
			color.a = s.Alpha;
			return color;
		}

		void surf(Input IN, inout SurfaceOutput o) {
			//calculate normal
			float3 x = ddx(IN.worldPos);
			float3 y = ddy(IN.worldPos);
			fixed3 norm = normalize(cross(x, y));
			//apply colors, normals and other params
			o.Albedo = 0.5;
			o.Alpha = 1;
			o.Normal = norm;
			o.Specular = 0.5;
			o.Gloss = 0.5;
		}
	ENDCG
	}
	FallBack "Diffuse"
}