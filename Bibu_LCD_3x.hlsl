//!MAGPIE EFFECT
//!VERSION 4

//!TEXTURE
Texture2D INPUT;

//!TEXTURE
Texture2D OUTPUT;

//!SAMPLER
//!FILTER POINT
SamplerState sam;

//!PASS 1
//!STYLE PS
//!IN INPUT
//!OUT OUTPUT
float4 Pass1(float2 pos) {
	// Get output size
	const uint2 outputSize = GetOutputSize();

	// Sample the texture color at the current position
	float4 color = INPUT.SampleLevel(sam, pos, 0);

	// Initialize the output color
	float4 outputColor = float4(0, 0, 0, color.a);

	// Convert normalized position to pixel coordinates
	int2 pixelPos = int2(pos * float2(outputSize) + 1);

	// Use the pixel position to determine the color channel
	if (pixelPos.x % 3 == 1) {
		outputColor.r = color.r; // First third: Red only
	} else if (pixelPos.x % 3 == 2) {
		outputColor.g = color.g; // Second third: Green only
	} else {
		outputColor.b = color.b; // Last third: Blue only
	}

	return outputColor;
}
