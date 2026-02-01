-- Script para agregar la columna 'name' a la tabla leads
-- Ejecutar en el Editor SQL de Supabase

-- 1. Agregar la columna name (nullable para no afectar registros existentes)
ALTER TABLE leads ADD COLUMN name TEXT;

-- 2. (Opcional) Agregar constraint de longitud mínima si se desea
-- ALTER TABLE leads ADD CONSTRAINT name_min_length CHECK (char_length(name) >= 2);

-- 3. Crear índice para búsquedas rápidas por nombre (opcional)
-- CREATE INDEX idx_leads_name ON leads(name);

-- Verificar que la columna fue agregada
-- SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'leads';
