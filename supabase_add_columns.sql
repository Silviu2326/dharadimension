-- Agregar columnas a la tabla leads para el formulario de unión

ALTER TABLE public.leads ADD COLUMN IF NOT EXISTS name TEXT;
ALTER TABLE public.leads ADD COLUMN IF NOT EXISTS opinion TEXT;
ALTER TABLE public.leads ADD COLUMN IF NOT EXISTS main_problem TEXT;
