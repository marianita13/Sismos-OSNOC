# 🌋 Documentación Técnica del Frontend — Plataforma Sismológica OSNOC

**Universidad de Santander (UDES) — Proyecto Interdisciplinario de Software**

> 👥 **Equipo de Desarrollo Frontend (3 Integrantes):**
>
> * **Coordinador & Arquitecto Frontend:** UI/UX design, arquitectura Flutter/Dart y responsive engine.
>
> * **Desarrollador de Componentes & Vistas:** Módulos de Login, Perfil y Vistas Principales (`Home`, `Views`).
>
> * **Desarrollador de Módulos & Estado:** Módulo de Estaciones, controladores de interacción local (`Controllers`) y gestión de formularios.

## 📄 Resumen Ejecutivo

El presente documento detalla la arquitectura, decisiones de diseño y componentes implementados en la capa de **Frontend (Interfaz de Usuario e Interacción)** para la plataforma web y móvil del **Observatorio Sismológico del Nororiente Colombiano (OSNOC)**, en colaboración institucional con la **Universidad de Santander (UDES)**, la **CDMB** y el **Servicio Geológico**.

El objetivo primario de nuestro equipo de desarrollo ha sido diseñar y construir una experiencia de usuario (UX/UI) moderna, altamente intuitiva, completamente funcional a nivel visual y totalmente responsiva (**Mobile & Web**).

> ⚠️ **Aclaración de Alcance:**
>
> Nuestro equipo se enfocó de manera **exclusiva en el área Frontend** (UI, controladores de pantalla, navegación, adaptabilidad y prototipado visual de datos). La infraestructura del servidor, lógica de negocio profunda, conexión a APIs y consumo de endpoints (**Backend**) serán integrados posteriormente por el **profesor** sobre la base visual entregada en este proyecto.

## 🎯 Objetivo General del Frontend

Desarrollar una interfaz multiplataforma (Web y Móvil) responsiva, accesible y de alta jerarquía visual que permita a los usuarios interactuar de forma intuitiva con la información sismológica regional de manera rápida y clara.

### 🧩 Pilares Técnicos de la Interfaz

| Pilar | Descripción | 
 | ----- | ----- | 
| **📱 Cross-Platform** | Mismo código base ejecutable en navegadores Web (Chrome, Edge, Firefox) y dispositivos Móviles (Android, iOS). | 
| **🎨 Responsive Layout** | Adaptación dinámica de rejillas y componentes según el breakpoint de pantalla mediante `LayoutBuilder`. | 
| **📐 Material Design 3** | Implementación de tokens de diseño modernos, sombras suaves y contrastes normados. | 
| **📦 Modularidad** | Separación limpia de la capa visual (`Views`/`Pages`), lógica local (`Controllers`) y presentación (`Widgets`). | 

## 🛠️ Stack Tecnológico

| Tecnología | Rol en el Proyecto | Justificación | 
 | ----- | ----- | ----- | 
| Flutter | **Framework Principal** | Permite compilación multiplataforma ágil (Web/Mobile) manteniendo un diseño único. | 
| Dart | **Lenguaje de Programación** | Lenguaje fuertemente tipado para construcción de widgets, modelos visuales y controladores. | 
| Material Design 3 | **Sistema de Diseño** | Componentes UI normalizados (`useMaterial3: true`) para una estética formal e institucional. | 

## 🏛️ Arquitectura del Proyecto (Frontend)

El proyecto adopta una estructura orientada a **Features (Características)** con una separación estricta de responsabilidades en la capa de presentación.

```
flutter_sismo/
│
├── assets/
│   └── images/                       # Recursos gráficos institucionales (UDES, OSNOC, CDMB, SGM)
│
├── lib/
│   ├── main.dart                     # Punto de entrada de la aplicación
│   │
│   ├── config/
│   │   └── routes.dart               # Enrutamiento centralizado (AppRoutes)
│   │
│   └── features/
│       └── auth/
│           ├── models/               # Modelos de datos para representación visual (station.dart)
│           ├── user_store.dart       # Estado global ligero para la sesión visual
│           │
│           └── presentation/
│               ├── controllers/      # Controladores de UI y flujo local
│               ├── pages/            # Pantallas contenedor (Páginas)
│               ├── theme/            # Estilos centralizados por módulo
│               ├── views/            # Vistas internas de contenido
│               └── widgets/          # Componentes visuales reutilizables
│
├── pubspec.yaml                      # Configuración de assets y dependencias
└── README.md

```

## 📐 Patrón de Separación de Responsabilidades

Para asegurar un código mantenible y escalable para la posterior integración del profesor, dividimos cada módulo en cuatro capas específicas:

```
graph TD
    SubGraph1[📱 Layer: Page] -->|Contiene| SubGraph2[🎨 Layer: View]
    SubGraph2 -->|Usa| SubGraph3[🧩 Layer: Reusable Widgets]
    SubGraph1 -->|Notifica / Consume| SubGraph4[⚙️ Layer: Controller]
    SubGraph4 -->|Modula| SubGraph5[📊 Layer: Visual Model]

    style SubGraph1 fill:#1e3a8a,color:#fff,stroke:#3b82f6
    style SubGraph2 fill:#0284c7,color:#fff,stroke:#38bdf8
    style SubGraph3 fill:#0f766e,color:#fff,stroke:#2dd4bf
    style SubGraph4 fill:#4338ca,color:#fff,stroke:#818cf8
    style SubGraph5 fill:#374151,color:#fff,stroke:#9ca3af

```

### 📋 Mapeo de Capas Técnicas

| Capa | Ubicación | Función Principal | 
 | ----- | ----- | ----- | 
| **Pages** | `presentation/pages/` | Define el andamiaje (`Scaffold`), barras de navegación, `Drawers` y coordinadores de pantalla. | 
| **Views** | `presentation/views/` | Renderiza el contenido estético y distribuye la rejilla gráfica responsiva. | 
| **Controllers** | `presentation/controllers/` | Administra estados visuales (p. ej., filtros de búsqueda, visibilidad de contraseñas, toggles). | 
| **Widgets** | `presentation/widgets/` | Tarjetas, campos de texto y botones altamente parametrizables y reutilizables. | 
| **Theme** | `presentation/theme/` | Define paleta de colores, tipografías, bordes y sombras por módulo visual. | 

## 🔄 Flujos Visuales y Navegación

### 1. Flujo de Acceso al Sistema (Login Flow)

```
sequenceDiagram
    autonumber
    actor Usuario
    participant LoginPage as 📱 Login Page
    participant LoginController as ⚙️ Login Controller
    participant HomePage as 🖥️ Home Page

    Usuario->>LoginPage: Ingresa credenciales visuales
    Usuario->>LoginPage: Oculta/Muestra contraseña (LoginTextField)
    Usuario->>LoginPage: Presiona "Iniciar Sesión"
    LoginPage->>LoginController: Ejecuta validación de formulario visual
    LoginController-->>LoginPage: Confirmación de estado válido
    LoginPage->>HomePage: Redirecciona vía AppRoutes (/home)

```

### 2. Navegación Principal y Módulos Disponibles

```
graph LR
    AppRoutes[/config/routes.dart/] --> Login[/login]
    AppRoutes --> Home[/home]
    AppRoutes --> Stations[/stations]
    AppRoutes --> Profile[/profile]

    Home --> NavBottom[Barra Inferior Móvil]
    Home --> NavDrawer[Menú Lateral Web/Desktop]

    NavBottom --> Mod1[📌 Inicio]
    NavBottom --> Mod2[📡 Estaciones]
    NavBottom --> Mod3[📁 Proyectos]
    NavBottom --> Mod4[📚 Publicaciones]
    NavBottom --> Mod5[👤 Perfil]

    NavDrawer --> Extra1[📰 Noticias]
    NavDrawer --> Extra2[📋 Log de Eventos]
    NavDrawer --> Extra3[📊 Reportes Sísmicos]

```

## 🧩 Inventario de Componentes y Pantallas

### 🖥️ Pantallas Principales (`Pages` & `Views`)

| Pantalla | Ruta | Descripción y Funcionalidad Visual | 
 | ----- | ----- | ----- | 
| **Login** | `/login` | Formulario centrado con identidad institucional UDES/OSNOC, campos interactivos para credenciales y feedback de validación. | 
| **Home Page** | `/home` | Panel general que integra banner institucional, tarjeta interactiva de evento sísmico reciente, mapa contextual e indicadores. | 
| **Estaciones** | `/stations` | Listado dinámico de estaciones sismológicas con buscador en tiempo real, contador de registros y filtros por estado. | 
| **Detalle Estación** | `/stations/detail` | Vista expandida que redistribuye imágenes, datos técnicos (latitud, longitud, altitud) y estado operativo según la pantalla. | 
| **Perfil Usuario** | `/profile` | Módulo organizador de datos personales, información de contacto, ubicación y asignación visual de **Roles por Chips**. | 

### 📦 Widgets Reutilizables Diseñados

| Componente | Archivo | Propósito Visual | 
 | ----- | ----- | ----- | 
| `LoginTextField` | `login_text_field.dart` | Campo de texto con diseño personalizado, íconos de entrada y botón de alternado para visibilidad de contraseña (`obscureText`). | 
| `SeismicEventCard` | `seismic_event_card.dart` | Tarjeta gráfica para resaltar eventos sísmicos (magnitud, profundidad, ubicación, municipios cercanos). | 
| `StationCard` | `station_card.dart` | Ficha técnica para cada estación sismológica. Incluye badges de estado (*Activo/Inactivo*) y acciones (*Editar, Ver, Eliminar*). | 
| `SectionCard` | `user_profile_widgets.dart` | Contenedor elegante con bordes redondeados y sombreado suave para agrupar formularios por categorías. | 
| `RoleChip` | `user_profile_widgets.dart` | Etiqueta gráfica para mostrar visualmente las atribuciones del usuario (Ej: *Geo-divulgador*, *Gestor de Estaciones*). | 
| `HomeFooter` / `ProfileFooter` | `home_footer.dart` | Cierre institucional inferior que incorpora la imagen corporativa de UDES, OSNOC, CDMB y Servicio Geológico. | 

## 📱 Responsividad y Experiencia de Usuario (UX/UI)

El diseño del frontend se adaptó estratégicamente considerando dos entornos operacionales clave:

```
graph TD
    LayoutBuilder{Ancho de Pantalla}
    LayoutBuilder -->|< 768px - Celular| MobileUI[📱 Móvil / Tablet]
    LayoutBuilder -->|>= 768px - Escritorio| WebUI[🖥️ Navegador Web]

    MobileUI --> M1[Navegación por BottomNavigationBar]
    MobileUI --> M2[Distribución vertical en 1 sola columna]
    MobileUI --> M3[Tarjetas colapsables y botones amplios]

    WebUI --> W1[Menú Lateral Drawer permanente / Expandido]
    WebUI --> W2[Layout Multi-columna en cuadrículas]
    WebUI --> W3[Aprovechamiento de espacio horizontal]

```

### 📊 Estrategia de Layout por Dispositivo

```
===================================================================
 MÓVIL (Ancho < 768px)                WEB / DESKTOP (Ancho ≥ 768px)
===================================================================
┌──────────────────────┐             ┌─────────────────────────────┐
│ [≡] OSNOC      [👤] │             │ [≡] OSNOC           [Perfil]│
├──────────────────────┤             ├─────────────┬───────────────┤
│ ┌──────────────────┐ │             │ ┌─────────┐ │ ┌───────────┐ │
│ │ Imagen Estación  │ │             │ │ Imagen  │ │ │ Detalle   │ │
│ └──────────────────┘ │             │ │ Estación│ │ │ Técnico   │ │
│ ┌──────────────────┐ │             │ └─────────┘ │ └───────────┘ │
│ │ Detalle Técnico  │ │             └─────────────┴───────────────┘
│ └──────────────────┘ │             │ Footer Institucional        │
├──────────────────────┤             └─────────────────────────────┘
│ [🏠] [📡] [📁] [👤]  │
└──────────────────────┘

```

## 🎨 Sistema de Diseño e Identidad Visual

Para cumplir con la formalidad de una plataforma científica universitaria, definimos la siguiente paleta cromática y estilos visuales en el código (`theme/`):

* 🔵 **Azul Institucional UDES (`#1E3A8A`):** Presente en encabezados, AppBars y botones de acción principal.

* 🟢 **Verde Sismológico OSNOC (`#10B981`):** Utilizado para resaltar estados activos, magnitudes sísmicas y acentos visuales.

* ⚪ **Blanco & Grises Claros (`#F9FAFB` / `#F3F4F6`):** Fondos limpios para favorecer la lectura de datos técnicos.

* 🔴 **Alertas & Inactividad (`#EF4444`):** Identificación visual inmediata de estaciones inactivas o eventos de alta severidad.

* 🔳 **Sombras Suaves & Bordes (`BorderRadius.circular(12)`):** Estética moderna, limpia y libre de saturación gráfica.

## ⚡ Comandos para Verificación e Inspección Visual

Para ejecutar y probar la interfaz del proyecto localmente, el equipo definió los siguientes scripts estándar de Flutter:

```
# 1. Obtención de paquetes y dependencias visuales
flutter pub get

# 2. Ejecución en modo Web (Navegador Chrome)
flutter run -d chrome

# 3. Ejecución en emulador o dispositivo móvil conectado
flutter run

# 4. Verificación de calidad y formato de código (Linter)
flutter analyze

```

## 🏁 Conclusiones y Entregables del Equipo

1. **Interfaz Entregada:** Como equipo de 3 se ha completado la construcción visual, navegacional y estilística de los módulos de *Login, Inicio, Estaciones Sismológicas y Perfil de Usuario, con el objetivo de seguir trabajando para terminar los módulos restantes*.

2. **Multiplataforma Real:** Se garantiza un comportamiento fluido, profesional y responsivo tanto en navegadores de escritorio como en smartphones.