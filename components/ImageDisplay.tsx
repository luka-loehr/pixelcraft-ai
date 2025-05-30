
import React from 'react';

interface ImageDisplayProps {
  imageUrl: string | null;
  isLoading: boolean;
  prompt: string;
}

export const ImageDisplay: React.FC<ImageDisplayProps> = ({ imageUrl, isLoading, prompt }) => {
  if (isLoading) {
    return (
      <div className="w-full aspect-square bg-slate-700 border-2 border-slate-600 rounded-none flex items-center justify-center p-4">
        <p className="text-slate-400 font-mono animate-pulse">Pixelating your vision...</p>
      </div>
    );
  }

  if (imageUrl) {
    return (
      <div className="w-full p-1 bg-gradient-to-br from-purple-500 via-pink-500 to-red-500 rounded-none shadow-lg">
        <img 
          src={imageUrl} 
          alt={`Pixel art generated for: ${prompt}`} 
          className="w-full h-auto object-contain rounded-none border-4 border-slate-800"
        />
      </div>
    );
  }

  return (
    <div className="w-full aspect-square bg-slate-700 border-2 border-dashed border-slate-600 rounded-none flex flex-col items-center justify-center p-4 text-center">
      <svg xmlns="http://www.w3.org/2000/svg" className="h-12 w-12 text-slate-500 mb-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="1">
        <path strokeLinecap="round" strokeLinejoin="round" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
      </svg>
      <p className="text-slate-400 font-mono text-sm">Your generated pixel art will appear here.</p>
      <p className="text-slate-500 font-mono text-xs mt-1">Enter a prompt and click "Craft Pixels!"</p>
    </div>
  );
};
    