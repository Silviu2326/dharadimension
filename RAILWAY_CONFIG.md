# Configuración del Backend en Railway

Tu backend está desplegado en: **https://backenddhara-production.up.railway.app**

## Variables de Entorno en Railway

Asegúrate de tener estas variables configuradas en Railway:

```env
# Servidor
PORT=3000
NODE_ENV=production

# Frontend URL (para enlaces en emails)
FRONTEND_URL=https://dharadimension.vercel.app

# Mailgun Configuration
MAILGUN_API_KEY=tu-api-key
MAILGUN_DOMAIN=appdhara.com
MAILGUN_REGION=eu
ADMIN_EMAIL=info@dharadimensionhumana.es

# Supabase Configuration
SUPABASE_URL=https://jeqqvtliltdtbxsgdedo.supabase.co
SUPABASE_ANON_KEY=tu-anon-key
```

## Configurar CORS en el Backend

El backend debe permitir peticiones desde tu frontend de Vercel.

Edita `backend/server.js` y actualiza la configuración de CORS:

```javascript
app.use(cors({
  origin: [
    'http://localhost:5173',
    'http://localhost:5175',
    'https://dharadimension.vercel.app',
    'https://www.dharadimension.vercel.app'
  ],
  credentials: true
}));
```

## Verificar que funciona

1. **Health Check:**
   ```
   https://backenddhara-production.up.railway.app/api/health
   ```
   Debería responder con status 200.

2. **Desde el Frontend:**
   - Abre el popup de registro
   - Completa el formulario
   - Verifica que los datos se envíen correctamente

3. **Logs en Railway:**
   - Ve al dashboard de Railway
   - Revisa los logs para ver las peticiones

## Troubleshooting

### Error: CORS blocked
**Solución:** Verifica que el dominio de Vercel esté en la lista de orígenes permitidos en `server.js`

### Error: 503 Service Unavailable
**Solución:** El servicio puede estar iniciándose. Espera 1-2 minutos.

### Error: Variables de entorno no definidas
**Solución:** Verifica que todas las variables están configuradas en Railway Dashboard → Variables

### Emails no se envían
**Solución:** 
1. Verifica `MAILGUN_API_KEY` y `MAILGUN_DOMAIN`
2. Revisa los logs de Railway para ver errores de Mailgun
3. Consulta `backend/MAILGUN_SETUP.md`

## Redeploy

Si haces cambios en el código del backend:

```bash
cd backend
git add .
git commit -m "Descripción de cambios"
git push origin main
```

Railway detectará el push automáticamente y redesplegará.

## Monitoreo

Railway provee:
- **Métricas**: CPU, RAM, Network
- **Logs**: En tiempo real
- **Deployments**: Historial de despliegues

Dashboard: https://railway.app/project/[tu-proyecto-id]
