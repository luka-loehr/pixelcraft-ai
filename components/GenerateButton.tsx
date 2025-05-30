
import React from 'react';

interface GenerateButtonProps {
  onClick: () => void;
  isLoading: boolean;
  disabled?: boolean;
}

export const GenerateButton: React.FC<GenerateButtonProps> = ({ onClick, isLoading, disabled }) => {
  return (
    <button
      onClick={onClick}
      disabled={isLoading || disabled}
      className={`w-full font-mono text-base sm:text-lg py-3 px-6 rounded-none border-2 transition-all duration-150 ease-in-out
                  ${isLoading || disabled
                    ? 'bg-slate-600 text-slate-400 border-slate-500 cursor-not-allowed'
                    : 'bg-green-500 text-slate-900 border-green-700 hover:bg-green-400 hover:border-green-600 active:bg-green-600 active:shadow-[inset_2px_2px_0px_0px_rgba(0,0,0,0.2)] transform active:translate-y-px'
                  } 
                  shadow-[4px_4px_0px_0px_rgba(30,41,59,1)] active:shadow-none active:translate-x-[2px] active:translate-y-[2px]`}
    >
      {isLoading ? 'Generating...' : 'Craft Pixels!'}
    </button>
  );
};
    