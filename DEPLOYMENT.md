# Guía de Despliegue en Vercel

## Configuración de Vercel

Se ha creado el archivo `vercel.json` que permite que React Router funcione correctamente en Vercel.

### ¿Qué hace `vercel.json`?

El archivo redirige todas las rutas al `index.html`, permitiendo que React Router maneje el routing del lado del cliente. Esto resuelve el problema de 404 cuando refrescas la página en rutas como `/unsubscribe`.

## Pasos para Desplegar

### 1. Preparar el Proyecto

Asegúrate de que el proyecto está listo:

```bash
# Instalar dependencias si no lo has hecho
npm install

# Probar el build localmente
npm run build

# Verificar que funciona
npm run preview
```

### 2. Conectar con Vercel

**Opción A: Usando Vercel CLI**

```bash
# Instalar Vercel CLI globalmente
npm i -g vercel

# Login en Vercel
vercel login

# Desplegar
vercel
```

**Opción B: Usando la Web de Vercel**

1. Ve a [vercel.com](https://vercel.com)
2. Click en "Add New Project"
3. Importa tu repositorio de GitHub/GitLab/Bitbucket
4. Vercel detectará automáticamente que es un proyecto Vite

### 3. Configuración en Vercel Dashboard

**Build Settings:**
- Framework Preset: `Vite`
- Build Command: `npm run build`
- Output Directory: `dist`
- Install Command: `npm install`

**Environment Variables:**

Agrega estas variables en el dashboard de Vercel (Settings → Environment Variables):

```env
VITE_SUPABASE_URL=https://jeqqvtliltdtbxsgdedo.supabase.co
VITE_SUPABASE_ANON_KEY=sb_publishable_14x8zb3-GZivvOq7OWr0zA_3jLorkrk
VITE_API_URL=https://backenddhara-production.up.railway.app
```

### 4. Configurar el Backend

Tu backend debe estar desplegado en un servidor separado (Railway, Render, Heroku, etc.).

**Tu Backend en Railway:**
- URL: `https://backenddhara-production.up.railway.app`

### 5. Configurar CORS en el Backend

En tu `backend/server.js`, actualiza la configuración de CORS:

```javascript
app.use(cors({
  origin: [
    'http://localhost:5173', // Desarrollo local
    'http://localhost:5175', // Desarrollo local alternativo
    'https://dharadimensionhumana.es', // Producción
    'https://www.dharadimensionhumana.es', // Producción con www
    'https://tu-proyecto.vercel.app' // Vercel preview/producción
  ],
  credentials: true
}));
```

## Estructura de Despliegue

```
┌─────────────────────────┐
│   Vercel (Frontend)     │
│   dharadimensionhumana  │
│   - React + Vite        │
│   - /                   │
│   - /unsubscribe        │
└───────────┬─────────────┘
            │
            │ API Calls
            │ /api/*
            ▼
┌─────────────────────────┐
│  Railway/Render         │
│  (Backend)              │
│  - Node.js + Express    │
│  - /api/leads           │
│  - /api/unsubscribe     │
│  - /api/contacto        │
└─────────────────────────┘
```

## Verificación Post-Despliegue

Después de desplegar, verifica que funcionen:

- [ ] Landing principal: `https://dharadimensionhumana.es/`
- [ ] Navegación del menú
- [ ] Popup de registro (profesional y cliente)
- [ ] Página de desuscripción: `https://dharadimensionhumana.es/unsubscribe?email=test@example.com`
- [ ] Refresh en `/unsubscribe` no da 404
- [ ] Formularios envían datos al backend
- [ ] Emails se envían correctamente

## Dominios Personalizados

### Configurar dharadimensionhumana.es

1. Ve a tu proyecto en Vercel
2. Settings → Domains
3. Agrega `dharadimensionhumana.es`
4. Sigue las instrucciones para configurar los registros DNS:

```
Tipo  Nombre  Valor
A     @       76.76.21.21
CNAME www     cname.vercel-dns.com
```

5. Espera a que se verifique (puede tomar hasta 48 horas)

## Troubleshooting

### Error: 404 en /unsubscribe al refrescar
- **Causa:** Falta el archivo `vercel.json` o no está configurado correctamente
- **Solución:** Verifica que `vercel.json` existe en la raíz del proyecto

### Error: API calls fallan en producción
- **Causa:** Variable `VITE_API_URL` no está configurada o CORS bloqueado
- **Solución:**
  1. Verifica que `VITE_API_URL` está en las variables de entorno de Vercel
  2. Actualiza CORS en el backend para permitir el dominio de Vercel

### Error: Variables de entorno no funcionan
- **Causa:** Variables deben empezar con `VITE_` en Vite
- **Solución:** Todas las variables de entorno deben tener el prefijo `VITE_`

### Build falla en Vercel
- **Causa:** Dependencias faltantes o errores de TypeScript
- **Solución:**
  ```bash
  # Probar build localmente primero
  npm run build

  # Verificar errores
  npm run lint
  ```

## Comandos Útiles

```bash
# Build local
npm run build

# Preview del build
npm run preview

# Desplegar a Vercel (CLI)
vercel

# Desplegar a producción (CLI)
vercel --prod

# Ver logs de Vercel
vercel logs

# Ver variables de entorno
vercel env ls
```

## Rollback

Si necesitas volver a una versión anterior:

1. Ve a tu proyecto en Vercel Dashboard
2. Click en "Deployments"
3. Encuentra el deployment que funcionaba
4. Click en los tres puntos (•••)
5. "Promote to Production"

## Monitoreo

Vercel proporciona:
- Analytics (tráfico, performance)
- Error tracking
- Deployment logs
- Real-time logs

Accede desde: `Dashboard → Your Project → Analytics`

## Recursos Adicionales

- [Vercel Documentation](https://vercel.com/docs)
- [Vite Deployment](https://vitejs.dev/guide/static-deploy.html#vercel)
- [React Router with Vercel](https://vercel.com/guides/deploying-react-with-vercel)
