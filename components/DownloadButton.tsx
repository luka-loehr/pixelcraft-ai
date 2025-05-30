
import React from 'react';

interface DownloadButtonProps {
  imageUrl: string | null;
  prompt: string;
}

const sanitizeFilename = (name: string): string => {
  // Replace non-alphanumeric characters (except underscores) with underscores
  let sanitized = name.replace(/[^\w\s]/gi, '').replace(/\s+/g, '_');
  // Reduce multiple underscores to a single underscore
  sanitized = sanitized.replace(/_{2,}/g, '_');
  // Ensure it's not too long and lowercase
  return `pixelcraft_${sanitized.toLowerCase().slice(0, 50) || 'art'}.png`;
};

export const DownloadButton: React.FC<DownloadButtonProps> = ({ imageUrl, prompt }) => {
  if (!imageUrl) {
    return null;
  }

  const handleDownload = () => {
    if (!imageUrl) return;

    const link = document.createElement('a');
    link.href = imageUrl;
    link.download = sanitizeFilename(prompt);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  return (
    <button
      onClick={handleDownload}
      className={`w-full font-mono text-base sm:text-lg py-3 px-6 mt-4 rounded-none border-2 transition-all duration-150 ease-in-out
                  bg-blue-500 text-slate-900 border-blue-700 hover:bg-blue-400 hover:border-blue-600 
                  active:bg-blue-600 active:shadow-[inset_2px_2px_0px_0px_rgba(0,0,0,0.2)] 
                  transform active:translate-y-px
                  shadow-[4px_4px_0px_0px_rgba(30,41,59,1)] active:shadow-none active:translate-x-[2px] active:translate-y-[2px]`}
      aria-label="Download generated pixel art"
    >
      Download Art
    </button>
  );
};
