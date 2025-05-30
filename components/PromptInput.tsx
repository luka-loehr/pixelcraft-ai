
import React from 'react';

interface PromptInputProps {
  value: string;
  onChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
  placeholder?: string;
  disabled?: boolean;
}

export const PromptInput: React.FC<PromptInputProps> = ({ value, onChange, placeholder, disabled }) => {
  return (
    <input
      type="text"
      value={value}
      onChange={onChange}
      placeholder={placeholder || "Enter prompt..."}
      disabled={disabled}
      className="w-full p-3 sm:p-4 bg-slate-700 text-slate-100 border-2 border-slate-600 rounded-none focus:border-purple-500 focus:ring-2 focus:ring-purple-500 focus:outline-none transition-colors duration-200 placeholder-slate-400 disabled:opacity-50 disabled:cursor-not-allowed font-mono text-sm sm:text-base"
    />
  );
};
    