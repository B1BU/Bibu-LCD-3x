//!MAGPIE EFFECT
//!VERSION 4

//!PARAMETER
//!LABEL Pixel Size
//!DEFAULT 3
//!MIN 3
//!MAX 60
//!STEP 3
int pixelSize;

//!PARAMETER
//!LABEL Pixel Edge Width
//!DEFAULT 1
//!MIN 1
//!MAX 60
//!STEP 1
int pixelEdgeWidth;

//!PARAMETER
//!LABEL Pixel Edge Opacity
//!DEFAULT 0
//!MIN 0
//!MAX 1
//!STEP 0.025
float pixelEdgeOpacity;

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

	// Sample color at current position
	float4 color = INPUT.SampleLevel(sam, pos, 0);

	// Initialize output color
	float4 outputColor = float4(0, 0, 0, color.a);

	// Convert normalized position to pixel coordinates
	int2 pixelPos = int2(pos * float2(outputSize) + 1);

	// Define pixel section
	int2 pixelSection = (pixelPos / (pixelSize / 3)) % 3;

	// Determine the color channel from pixel section
	if (pixelSection.x == 1) {
		outputColor.r = color.r; // First third: Red channel
	} else if (pixelSection.x == 2) {
		outputColor.g = color.g; // Second third: Green channel
	} else {
		outputColor.b = color.b; // Last third: Blue channel
	}

	// Darken the bottom of every pixel
	if (pixelEdgeOpacity && pixelPos.y % pixelSize < pixelEdgeWidth) {
		outputColor -= pixelEdgeOpacity;
	}

	return outputColor;
}
