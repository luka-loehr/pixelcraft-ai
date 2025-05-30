
import { GoogleGenAI } from "@google/genai";

// Ensure API_KEY is available in the environment.
// The instructions state to assume process.env.API_KEY is pre-configured and valid.
const apiKey = process.env.API_KEY;
if (!apiKey) {
  // This error will be caught by the caller if API_KEY is not set.
  // In a real-world scenario, you might have more robust handling or UI feedback here,
  // but per instructions, we assume it's set.
  console.error("API_KEY environment variable not set.");
}

const ai = new GoogleGenAI({ apiKey: apiKey || "MISSING_API_KEY" }); // Fallback to prevent crash if undefined, though error will be thrown by API

const PIXEL_ART_MODEL = 'imagen-3.0-generate-002';

export const generatePixelArt = async (userPrompt: string): Promise<string> => {
  if (!apiKey) {
    throw new Error("API_KEY is not configured. Please set the API_KEY environment variable.");
  }

  // Enhance the prompt for better pixel art results
  const enhancedPrompt = `${userPrompt}, pixel art, 8-bit style, retro video game aesthetic, vibrant colors, clear outlines`;

  try {
    const response = await ai.models.generateImages({
      model: PIXEL_ART_MODEL,
      prompt: enhancedPrompt,
      config: { 
        numberOfImages: 1, 
        outputMimeType: 'image/png' // PNG is good for pixel art
      },
    });

    if (response.generatedImages && response.generatedImages.length > 0 && response.generatedImages[0].image?.imageBytes) {
      const base64ImageBytes = response.generatedImages[0].image.imageBytes;
      return `data:image/png;base64,${base64ImageBytes}`;
    } else {
      console.error("No image data received from API:", response);
      throw new Error('No image data received from API. The response might be empty or malformed.');
    }
  } catch (error) {
    console.error('Error generating image with Imagen API:', error);
    if (error instanceof Error) {
        // Check for specific error messages from GenAI if needed
        if (error.message.includes("API key not valid")) {
             throw new Error("Invalid API Key. Please check your API_KEY environment variable.");
        }
         throw new Error(`API Error: ${error.message}`);
    }
    throw new Error('An unknown error occurred while generating the image.');
  }
};
    