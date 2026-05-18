# Claude Code · Casa Carrizalejo

Contexto para Claude Code cuando trabaje en este repo.

## Qué es

Landing page single-file de una propiedad inmobiliaria de lujo en Monterrey. **TEMPLATE PRINCIPAL** para futuras propiedades de Montana Realty Co. La meta es captar leads pre-calificados y mandarlos directo a WhatsApp del dueño.

- **Cliente:** Montana Realty Co.
- **Uso:** Template base para todas las propiedades. Customizar contenido, imágenes y WhatsApp por propiedad.
- **Propiedad ejemplo:** EB-TZ4590 · Casa Carrizalejo · $75M MXN
- **WhatsApp destino (Casa Carrizalejo):** 528123532365

## Stack & convenciones

- **NO usar build tools.** Es un solo `index.html` con CSS y JS inline. Cualquier cambio se hace directo en ese archivo. Deploy = subir archivos estáticos.
- **NO instalar dependencias npm.** No hay `package.json` ni `node_modules`. No metas React, Tailwind, ni nada que requiera compilación.
- **NO mover el CSS o JS a archivos separados** salvo que se pida explícito. La preferencia es mantener todo inline para portabilidad.
- **Tipografías:** Cormorant Garamond (display) + Inter (body). Vienen vía Google Fonts CDN.
- **Paleta:** light modern premium — `#F5F4F0` (bg) + `#3A3E45` (ink) + `#3A3E45` (accent). Variables CSS en `:root` — fácil de customizar por propiedad.
- **Estilo:** editorial premium, clean, sin emojis. Énfasis en tipografía y espaciado.

## Estructura del HTML (orden de las secciones)

1. `<nav>` con logo Montana y enlaces ancla
2. `<section class="hero">` — video aéreo de fondo + título
3. `<section class="ribbon">` — 7 stats clave
4. `<section class="reel">` — video vertical del portal en marco editorial
5. `<section class="section overview">` — fachada + 4 pillares
6. `<section class="section gallery">` — mosaico de 8 tiles
7. `<section class="section spec">` — ficha técnica + features grid
8. `<section class="section tour">` — recorrido por espacios (6 con sticky panel)
9. `<section class="section location">` — mapa SVG estilizado
10. `<section class="cta">` — formulario de 3 pasos
11. `<footer class="foot">`
12. `<a class="wa-fab">` flotante

## Lógica del formulario (lead-filter)

3 pasos con chips multi-select, dropdowns, validación básica. Al `submit`:

1. Lee los campos
2. Calcula `score` interno (A/B/C) basado en urgencia + forma de pago + presupuesto
3. Arma mensaje WhatsApp pre-formateado con todos los datos
4. Abre `wa.me/528123532365?text=<encoded>` en nueva pestaña
5. Muestra pantalla de "success" con opción de re-abrir

**No hay backend.** Todo es client-side. Si quieres también guardar el lead en una base de datos o pasarlo a Formspree/Make/Zapier, se hace antes del `window.open()`.

## Videos

- `carrizalejo-hero.mp4` — aéreo del exterior con la torre, 30s, 2.8MB. Va en el hero como background con object-fit: cover + object-position: center 45%.
- `casa-carrizalejo-web.mp4` — portal/entrada del pórtico, 46s, 7.9MB. Va en la sección "Pieza fílmica" con marco vertical.

Ambos están encodeados con: H.264 Main profile · yuv420p · faststart · brand mp42 · sin audio. Esto garantiza autoplay en iOS Safari, Chrome Android, Firefox.

Hay un **script de rescate de autoplay** (`ensureVideoPlay()`) que captura cuando el browser bloquea el play y lo dispara al primer gesto del usuario.

**Si re-encodeas los videos:** mantener esos settings o se romperá el autoplay en mobile.

## Tareas comunes

### Cambiar una foto

Buscar el `src="img/<nombre>.jpg"` y reemplazar. Actualizar también el `alt` y el `<figcaption class="tile__label">` correspondiente. Fotos disponibles en `img/` (algunas ya usadas, otras de reserva — ver README).

### Cambiar el número de WhatsApp

Search & replace de `528123532365` en `index.html` (aparece 3 veces: FAB, footer, función `submitLead`).

### Modificar el precio o stats

- Precio: buscar `$75,000,000` en el hero
- Stats del ribbon: sección `<section class="ribbon">` — 7 items
- Ficha técnica: sección `<section class="section spec">` — 4 bloques de `<ul class="spec__list">`

### Agregar/quitar una sección del tour

En `<div class="tour__nav">` añadir/quitar un `<button class="tour__nav-item">` y en `<div class="tour__panel">` el `<div class="tour__panel-slide">` correspondiente. El `data-slide="N"` debe matchear el índice (0-based) del slide.

### Cambiar tipografía o paleta

Variables CSS en `:root` al inicio del `<style>`. Si cambias fuentes, actualiza también el `<link>` de Google Fonts en `<head>`.

## Qué NO hacer

- No agregar tracking pixels o analytics sin pedir permiso explícito al cliente
- No quitar el `disablepictureinpicture` de los `<video>` (los videos son piezas inmersivas, no contenido para que el user los lleve a PiP)
- No reemplazar el formulario por un servicio de terceros (Formspree/Mailchimp) sin discutirlo — el flujo WhatsApp directo es la decisión arquitectónica clave
- No comprimir más las fotos (ya están en calidad 82 progressive, balance correcto)
- No agregar service workers o PWA features — es una landing, no una app

## Uso como Template

Esta landing **es el template base** para todas las futuras propiedades. Para crear una nueva landing:

1. **Duplicar este `index.html`** como punto de partida
2. **Cambiar datos específicos de la propiedad:**
   - Título, precio y descripción en `.hero`
   - WhatsApp: search & replace `528123532365` → nuevo número
   - Fotos: reemplazar `src="img/<nombre>.jpg"` con nuevas imágenes
   - Stats del `ribbon` y `spec` según la propiedad
   - Tour: ajustar los 6 espacios según la propiedad específica
   - Ubicación: actualizar el `iframe` de Google Maps
3. **Mantener la estructura intacta:** No cambiar las clases CSS ni el HTML de las secciones (facilita mantenimiento futuro)
4. **Paleta opcional:** Las variables CSS en `:root` se pueden ajustar si la propiedad necesita un look diferente, pero el default light modern funciona para todas

## Notas del cliente

- Montana Realty maneja propiedades de lujo en San Pedro Garza García (Valle Oriente, Del Valle, San Agustín, etc.). El tono debe ser premium pero no presumido.
- El dueño contesta directo por WhatsApp — por eso el lead-filter es importante: ahorra su tiempo filtrando los leads C antes de que lleguen.
- **Esta es la landing 1.0.** Está optimizada para conversión y reutilización. Si Montana Realty quiere variaciones de diseño (paleta oscura, layout diferente), se pueden crear como variantes del template base.
