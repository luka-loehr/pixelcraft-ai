
import React from 'react';

export const Header: React.FC = () => {
  return (
    <header className="my-8 sm:my-12 text-center">
      <h1 className="text-4xl sm:text-5xl md:text-6xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-400 via-pink-500 to-red-500 animate-pulse">
        PixelCraft AI
      </h1>
      <p className="mt-2 text-sm sm:text-lg text-slate-400 font-mono">Your Retro Image Generator</p>
    </header>
  );
};
    