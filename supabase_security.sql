-- POLICY: Permitir inserciones a cualquier persona (anon)
-- Pero restringir SELECT, UPDATE, DELETE

-- 1. Habilitar RLS en la tabla
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;

-- 2. Crear política para PERMITIR insertar leads a usuarios anónimos
CREATE POLICY "Enable insert for anon leads" ON leads
FOR INSERT
WITH CHECK (true);

-- 3. Crear política para DENEGAR lectura a usuarios anónimos (Opcional, es el default si no hay política, pero mejor explícito)
-- Nota: Si quieres que NADIE pueda leer excepto servicio, no crees ninguna política de SELECT para anon.
-- Solo el rol 'service_role' (tu backend con clave secreta) podría leer.

-- Si necesitas leer tus leads desde el Dashboard de Supabase, tu usuario (autenticado) puede hacerlo.
-- Para mayor seguridad, create una politica que niegue todo acceso anonimo a lectura.

-- 4. (Opcional pero recomendado) Restricción de unicidad si no quieres duplicados de email
-- ALTER TABLE leads ADD CONSTRAINT unique_email UNIQUE (email);
