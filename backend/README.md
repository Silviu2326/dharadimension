# Configuración de Mailgun para Dhara Dimension

## Cómo obtener las credenciales de Mailgun

### 1. Crear cuenta en Mailgun

1. Ve a https://mailgun.com y crea una cuenta gratuita
2. Mailgun ofrece 5,000 emails gratuitos al mes

### 2. Obtener tu API Key

1. Inicia sesión en tu cuenta de Mailgun
2. Ve a **Settings** > **API Keys**
3. Copia tu **Private API Key** (comienza con `key-`)
4. Esta es tu `MAILGUN_API_KEY`

### 3. Configurar tu dominio

**Opción A: Usar tu propio dominio**
1. Ve a **Sending** > **Domains**
2. Agrega tu dominio (ej: `mail.tudominio.com`)
3. Sigue las instrucciones DNS para verificar el dominio
4. Tu `MAILGUN_DOMAIN` será: `mail.tudominio.com`

**Opción B: Usar dominio gratuito de Mailgun**
1. Mailgun te asigna un dominio como `mg.tudominio.com`
2. También puedes usar el sandbox: `sandbox123.mailgun.org`
3. El dominio aparece en **Sending** > **Domains**
4. NOTA: El sandbox solo funciona con emails autorizados

### 4. Configurar el archivo .env

```bash
# Copia el archivo de ejemplo
cp .env.example .env

# Edita el archivo .env con tus credenciales
```

Ejemplo de `.env`:
```env
# Servidor
PORT=3000
NODE_ENV=development

# Mailgun Configuration
MAILGUN_API_KEY=key-xxxxxxxxxxxxxxxxxxxxxxxxxxxx
MAILGUN_DOMAIN=mg.tudominio.com
ADMIN_EMAIL=admin@tudominio.com

# Supabase Configuration
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu-anon-key
```

### 5. Probar el envío

```bash
# Instalar dependencias
npm install

# Iniciar servidor
npm start
```

El servidor mostrará:
```
✅ Servicio de email inicializado
🚀 Servidor ejecutándose en http://localhost:3000
```

### 6. Verificar funcionamiento

Puedes probar el endpoint con curl:
```bash
curl -X POST http://localhost:3000/api/leads \
  -H "Content-Type: application/json" \
  -d '{"name":"Juan Pérez","email":"juan@ejemplo.com","user_type":"professional"}'
```

### Solución de problemas

**"Mailgun no configurado"**
- Verifica que las variables de entorno estén correctamente seteadas
- Reinicia el servidor después de cambiar el .env

**Error de autenticación**
- Verifica que tu API key sea correcta (sin espacios)
- Asegúrate de usar la Private API Key, no la pública

**Email no llega**
- Si usas sandbox, autoriza el email destinatario en Mailgun
- Verifica la carpeta de spam
- Revisa los logs de Mailgun en su dashboard

### Límites de la cuenta gratuita

- 5,000 emails/mes
- 300 emails/día
- 100 emails/hora

### Alternativas a Mailgun

Si prefieres otro servicio:
- **SendGrid** - https://sendgrid.com
- **Resend** - https://resend.com
- **AWS SES** - https://aws.amazon.com/ses

El código está preparado para ser adaptable a cualquier servicio de email.
