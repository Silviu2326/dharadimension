# Página de Desuscripción - Configuración

## Resumen

Se ha creado una página de desuscripción integrada en el frontend React que permite a los usuarios darse de baja de los emails de Dhara.

## Archivos Creados/Modificados

### Nuevos Archivos:
1. **`src/Unsubscribe.tsx`** - Componente React de la página de desuscripción
2. **`UNSUBSCRIBE_SETUP.md`** - Este archivo de documentación

### Archivos Modificados:
1. **`src/main.tsx`** - Configurado React Router con rutas
2. **`vite.config.ts`** - Agregado proxy para las llamadas al API
3. **`package.json`** - Instalado `react-router-dom`

## Cómo Funciona

### 1. Rutas Disponibles

**Frontend (React):**
- `http://localhost:5173/` - Landing page principal
- `http://localhost:5173/unsubscribe?email=usuario@email.com` - Página de desuscripción React

**Backend (Express):**
- `http://localhost:3000/unsubscribe?email=usuario@email.com` - Página de desuscripción HTML (legacy)
- `http://localhost:3000/api/unsubscribe` - API endpoint (POST)

### 2. Flujo de Usuario

1. Usuario recibe email con enlace: `https://dharadimensionhumana.es/unsubscribe?email=usuario@email.com`
2. Hace clic en el enlace
3. Se abre la página React de desuscripción
4. El email viene pre-rellenado desde el parámetro de la URL
5. Usuario puede agregar un motivo (opcional)
6. Al confirmar, se hace POST a `/api/unsubscribe`
7. El backend actualiza Supabase marcando `active: false`
8. Se muestra mensaje de éxito

### 3. Configuración del Proxy

En desarrollo, Vite redirige automáticamente:
- `/api/*` → `http://localhost:3000/api/*`
- `/unsubscribe` (POST) → `http://localhost:3000/unsubscribe`

Esto permite que el frontend en `localhost:5173` se comunique con el backend en `localhost:3000`.

## Instrucciones de Uso

### Desarrollo

1. **Iniciar el Backend:**
   ```bash
   cd backend
   npm run dev
   # Servidor corriendo en http://localhost:3000
   ```

2. **Iniciar el Frontend:**
   ```bash
   npm run dev
   # Servidor corriendo en http://localhost:5173
   ```

3. **Probar la página de desuscripción:**
   - Abre: `http://localhost:5173/unsubscribe?email=test@example.com`
   - El email debe aparecer pre-rellenado
   - Completa el formulario y envía

### Producción

En producción, necesitas:

1. **Build del Frontend:**
   ```bash
   npm run build
   # Genera carpeta dist/
   ```

2. **Servir el Frontend:**
   - Opción A: Subir `dist/` a Netlify/Vercel/similar
   - Opción B: Servir desde el backend Express

3. **Variables de Entorno:**
   - Agregar `VITE_API_URL` en el servicio de hosting del frontend
   - Ejemplo en Netlify: `VITE_API_URL=https://api.dharadimensionhumana.es`

## Características de la Página

- **Diseño Moderno:** Coincide con el estilo de la landing
- **Email Pre-rellenado:** Si viene del email, el campo ya está completo
- **Validación:** Email válido requerido
- **Motivo Opcional:** Usuario puede explicar por qué se da de baja
- **Estados:**
  - Loading durante el envío
  - Error si algo falla
  - Éxito con opción de volver al inicio
- **Responsive:** Funciona en móvil y desktop

## Migrando de Backend a Frontend

Actualmente tienes **DOS** páginas de desuscripción:

1. **Backend HTML** - `backend/routes/unsubscribe.js` (GET)
2. **Frontend React** - `src/Unsubscribe.tsx`

### Opción 1: Usar SOLO Frontend (Recomendado)
- Los emails apuntan a `/unsubscribe`
- El backend maneja solo el POST `/api/unsubscribe`
- El frontend React maneja la UI

### Opción 2: Mantener Ambos
- Usuarios del email antiguo → Backend HTML
- Nuevos emails → Frontend React
- Ambos funcionan igual

## Actualizar Enlaces en Emails

Si quieres que todos los emails usen la versión React, los enlaces ya están configurados correctamente:

```javascript
// En backend/services/emailService.js
https://dharadimensionhumana.es/unsubscribe?email=${email}
```

En producción, este enlace automáticamente:
- Abre el frontend React si está en la ruta principal
- Funciona con el backend si no hay frontend configurado

## Testing Checklist

- [ ] Backend corriendo en puerto 3000
- [ ] Frontend corriendo en puerto 5173
- [ ] Página carga en `http://localhost:5173/unsubscribe`
- [ ] Email se pre-rellena desde URL params
- [ ] Validación de email funciona
- [ ] POST a `/api/unsubscribe` funciona
- [ ] Supabase se actualiza correctamente
- [ ] Mensaje de éxito se muestra
- [ ] Botón "Volver al inicio" redirige a `/`

## Posibles Problemas

### Error: "Cannot POST /api/unsubscribe"
- **Causa:** Backend no está corriendo
- **Solución:** Iniciar backend con `npm run dev` en carpeta backend/

### Error: Email no se pre-rellena
- **Causa:** Falta el parámetro `?email=` en la URL
- **Solución:** Usar URL completa: `/unsubscribe?email=test@example.com`

### Error: CORS
- **Causa:** Frontend y backend en diferentes puertos
- **Solución:** El proxy en `vite.config.ts` debería resolverlo. Verificar configuración.

## Notas Adicionales

- La página usa los mismos colores y estilos que la landing
- El logo es el mismo de Dhara
- Los estados de loading/error/success están manejados
- El formulario es accesible y responsivo
