
import React from 'react';

export const Footer: React.FC = () => {
  return (
    <footer className="w-full max-w-2xl mt-10 mb-6 text-center text-xs text-slate-500 font-mono">
      <p>&copy; {new Date().getFullYear()} PixelCraft AI. Powered by Gemini.</p>
      <p>Enter a prompt and watch the magic happen!</p>
    </footer>
  );
};
    