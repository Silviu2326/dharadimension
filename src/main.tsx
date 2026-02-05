import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import App from './App.tsx';
import Unsubscribe from './Unsubscribe.tsx';
import './index.css';

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<App />} />
        <Route path="/unsubscribe" element={<Unsubscribe />} />
        {/* Ruta alternativa por si hay typo */}
        <Route path="/unsuscribe" element={<Navigate to="/unsubscribe" replace />} />
      </Routes>
    </BrowserRouter>
  </StrictMode>
);
