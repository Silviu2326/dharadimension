-- Script para agregar columnas de unsubscribe a la tabla leads
-- Ejecutar en el Editor SQL de Supabase

-- 1. Agregar columna active (por defecto true)
ALTER TABLE leads ADD COLUMN active BOOLEAN DEFAULT true;

-- 2. Agregar columna para motivo de baja
ALTER TABLE leads ADD COLUMN unsubscribe_reason TEXT;

-- 3. Agregar columna para fecha de baja
ALTER TABLE leads ADD COLUMN unsubscribed_at TIMESTAMP WITH TIME ZONE;

-- 4. Crear índice para búsquedas rápidas
CREATE INDEX idx_leads_active ON leads(active) WHERE active = true;
CREATE INDEX idx_leads_email ON leads(email);

-- 5. Verificar las columnas agregadas
-- SELECT column_name, data_type, column_default 
-- FROM information_schema.columns 
-- WHERE table_name = 'leads'
-- ORDER BY ordinal_position;

-- 6. Actualizar política RLS para excluir inactivos (opcional)
-- Esto evita que se envíen emails a personas dadas de baja
