# Casa Carrizalejo · Montana Realty Co.

Landing page exclusiva para la propiedad **EB-TZ4590** de Montana Realty Co., ubicada en Carrizalejo, San Pedro Garza García. Diseñada como subdomain/sublanding del [sitio principal de Montana Realty](https://montanaweb.vercel.app/).

**Propiedad:** Residencia de 1,317 m² sobre 2,128 m² · 110 m de frente · 3 recámaras · 9 estacionamientos · paneles solares · arroyo privado al fondo.

**Precio:** $75,000,000 MXN

---

## Stack

Sin build, sin dependencias, sin framework. Todo en un solo archivo HTML con CSS y JS inline.

- **HTML + CSS + JS vanilla** (un solo `index.html`)
- **Video MP4** optimizado (H.264 Main profile + faststart, autoplay-compatible en mobile)
- **PNG con transparencia** para el logo
- **JPEG progressive** para las fotos (~5.5 MB total, max 1600px lado mayor)
- **Tipografías:** Italiana + Cormorant Garamond (display) + Inter (body), vía Google Fonts
- **Deploy:** Vercel, GitHub Pages, Netlify, o cualquier servidor estático

---

## Estructura

```
casa-carrizalejo/
├── index.html                        # Único archivo de código — CSS y JS inline
├── carrizalejo-hero.mp4              # Video aéreo del hero (2.8 MB · 30s loop)
├── casa-carrizalejo-web.mp4          # Video del portal para sección "Pieza fílmica" (7.9 MB · 46s)
├── hero-poster.jpg                   # Fallback del video del hero
├── reel-poster.jpg                   # Fallback del video del reel
├── montana-logo-sm.png               # Logo Montana Realty optimizado (nav/footer)
├── montana-logo.png                  # Logo Montana Realty full-res (respaldo)
├── README.md
├── CLAUDE.md                         # Contexto para Claude Code
├── .gitignore
└── img/                              # 17 fotos de la propiedad, procesadas
    ├── fachada-torre.jpg             # Fachada principal con la torre y el perro
    ├── aerea-oblicua.jpg             # Aérea oblicua de toda la propiedad
    ├── aerea-cenital.jpg             # Aérea top-down (no usada actualmente)
    ├── vestibulo-vitral.jpg          # Vestíbulo con candelabro y vitral
    ├── comedor-formal.jpg            # Comedor con triple altura
    ├── sala-caceria.jpg              # Sala/comedor con cabezas de caza
    ├── estudio-escritorio.jpg        # Estudio privado
    ├── pasillo-marmol.jpg            # Pasillo arqueado con mármol
    ├── driveway-cipreses.jpg         # Driveway con vista Sierra Madre
    ├── portico-cochera.jpg           # Frente con portón abierto
    ├── terraza-asadores.jpg          # Terraza con Big Green Egg y horno
    ├── patio-evento.jpg              # Patio con mesa de evento
    ├── patio-arboles.jpg             # Patio interior desde arriba
    ├── arboleda-lateral.jpg          # Camino lateral con árboles
    ├── cerrada-calle.jpg             # Vista desde la calle
    ├── jardin-arroyo.jpg             # Jardín lateral
    └── jardin-trasero-sol.jpg        # Jardín posterior con sol
```

---

## Secciones de la landing

1. **Hero** — Video aéreo de fondo + título "Casa Carrizalejo" + precio + CTAs
2. **Ribbon de stats** — 7 datos clave (recámaras, baños, m², etc.)
3. **Pieza fílmica** — Video vertical del portal con marco editorial estilo viewfinder, botón de sonido
4. **Overview** — Fachada con drop cap + 4 columnas de pillares (cerrada, paneles solares, arroyo, planta única)
5. **Galería** — 8 tiles en mosaico asimétrico con hover labels
6. **Ficha técnica** — 4 bloques de datos + grid de 8 features con iconos
7. **Tour de espacios** — 6 espacios interactivos con sidebar + panel sticky y auto-rotate
8. **Ubicación** — Mapa SVG estilizado + amenidades cercanas
9. **CTA / Formulario** — 3 pasos con scoring interno y dispatch a WhatsApp
10. **Footer**
11. **Sticky WhatsApp FAB** abajo a la derecha

---

## El formulario: filtrado de leads → WhatsApp

El formulario califica al lead en 3 pasos:

- **Paso 1 — Identidad:** nombre, WhatsApp, correo
- **Paso 2 — Intent:** intereses (chips multi-select), urgencia, forma de compra
- **Paso 3 — Budget:** rango de inversión + mensaje libre

Al enviar, calcula un **score interno (A · HOT / B · WARM / C · NURTURE)** basado en:
- Urgencia de visita (+3 esta/próxima semana)
- Forma de compra (+3 contado)
- Presupuesto (+3 si $75M+)

Después arma un mensaje pre-formateado de WhatsApp con todos los datos del lead etiquetados y abre `wa.me/528123532365` en nueva pestaña.

---

## Cómo previsualizar localmente

**Opción A — Live Server (VS Code):** click derecho en `index.html` → "Open with Live Server"

**Opción B — Python:**
```bash
cd casa-carrizalejo
python3 -m http.server 8000
# abrir http://localhost:8000
```

**Opción C — Node:**
```bash
npx serve
```

> ⚠️ **Importante:** abrir el archivo con doble click (`file://`) puede bloquear el autoplay de los videos en algunos browsers. Usa servidor local para preview fiel.

---

## Cómo hacer deploy

### Vercel (recomendado)

```bash
npx vercel
```

Acepta los defaults. En menos de un minuto te da una URL `*.vercel.app`. Para producción:

```bash
npx vercel --prod
```

### GitHub Pages

1. Push del repo a GitHub
2. Settings → Pages → Branch: `main`, folder: `/` → Save
3. Disponible en `https://<usuario>.github.io/<repo>/`

### Netlify

Drag & drop de la carpeta en [app.netlify.com/drop](https://app.netlify.com/drop)

---

## Cómo intercambiar fotos

En `index.html` busca el `src` de la imagen que quieras cambiar (ej. `img/comedor-formal.jpg`) y reemplázalo por el nombre de cualquier otra foto disponible en `img/`. Las fotos disponibles que **no** se están usando actualmente:

- `aerea-cenital.jpg`
- `cerrada-calle.jpg`
- `jardin-arroyo.jpg`
- `jardin-trasero-sol.jpg`
- `pasillo-marmol.jpg`
- `portico-cochera.jpg`

Si reemplazas, también actualiza el `alt` y el `<figcaption class="tile__label">` correspondiente para que el caption coincida con lo que se ve.

---

## Cómo modificar el número de WhatsApp

Buscar y reemplazar `528123532365` en el archivo. Aparece en:
- Sticky FAB (`<a class="wa-fab" href="...">`)
- Footer (`<a href="tel:...">` y `<a href="https://wa.me/...">`)
- Función `submitLead()` en el JavaScript

---

## Variables CSS principales

Definidas en `:root` al inicio del `<style>`:

```css
--bg: #0a0a0a;        /* fondo principal */
--ink: #f5f1e8;       /* texto crema */
--gold: #c9a96e;      /* dorado de acento */
--serif: 'Cormorant Garamond', serif;
--display: 'Italiana', serif;
--sans: 'Inter', sans-serif;
```

---

## Créditos

- **Diseño & desarrollo:** VITA Studio
- **Cliente:** Montana Realty Co.
- **Propiedad:** EB-TZ4590 · Casa Carrizalejo
- **Año:** 2026
