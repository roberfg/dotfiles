---
name: repository-naming-review
description: Usar cuando el usuario pida validar, revisar, comparar o recomendar nombres de repositorios de GitHub. Aplicar convenciones de nomenclatura y devolver alternativas accionables con sus motivos.
---

# Validar nombres de repositorios

## Propósito

Validar nombres existentes o proponer nombres para repositorios de GitHub. La
evaluación debe priorizar claridad, consistencia, facilidad de búsqueda y
compatibilidad con URLs, terminales, automatizaciones y sistemas de archivos.

Esta skill solo recomienda nombres. No crea, renombra ni elimina repositorios y
no ejecuta comandos de GitHub salvo que el usuario lo solicite explícitamente.

## Activación

Usar esta skill cuando el usuario pida, en español o inglés:

- Validar un nombre de repositorio.
- Revisar una lista de nombres.
- Recomendar nombres para un proyecto, producto, API, librería, CLI o aplicación.
- Comparar nombres de repositorios.
- Comprobar si un nombre sigue buenas prácticas de GitHub.
- Corregir nombres con espacios, mayúsculas, guiones bajos o fechas.

Ejemplos de activación:

- `valida este nombre de repositorio: Mi Proyecto`
- `recomienda un nombre para una API de facturación`
- `¿Está bien llamar al repo api_python_2026?`
- `review these GitHub repository names`
- `suggest a repository name for a CLI`

## Información necesaria

Antes de evaluar, identificar lo siguiente si está disponible:

- Propósito principal del repositorio.
- Tipo de proyecto: aplicación, librería, CLI, servicio, documentación,
  plantilla, datos o investigación.
- Producto, paquete o binario público asociado.
- Organización o dominio, solo si forma parte de la identidad pública.
- Nombre actual y restricciones conocidas.
- Repositorios relacionados o patrón de nombres existente.

Si falta contexto, hacer una evaluación provisional y declarar los supuestos.
No bloquear una recomendación por falta de información que no sea esencial.

## Reglas de validación

### Regla predeterminada

Recomendar `kebab-case` en minúsculas:

```text
api-gateway
invoice-worker
customer-portal
```

Usar palabras separadas por guiones (`-`), sin espacios ni guiones bajos. Este
formato funciona bien en URLs, comandos de terminal, documentación, CI y
herramientas que distinguen mayúsculas y minúsculas.

### Claridad y propósito

- El nombre debe describir la función, el dominio o el producto.
- Mantenerlo corto, específico y fácil de recordar.
- Incluir palabras clave útiles para búsquedas.
- Evitar términos genéricos como `project`, `test`, `new`, `misc` o `stuff`
  salvo que formen parte de un nombre oficial.
- Evitar palabras innecesarias y repeticiones.
- Comprobar que no sea ambiguo ni fácilmente confundible con otro repositorio.

### Estabilidad

- No incluir años, fechas, versiones o números de iteración en el nombre.
- No incluir el nombre de una dependencia o framework si el proyecto puede
  cambiar de tecnología.
- Incluir una dependencia solo cuando el repositorio deja de tener sentido sin
  ella o cuando es parte esencial de su identidad pública.
- No incluir nombres de equipos, departamentos u organizaciones internas si
  pueden cambiar. Usar la organización de GitHub, equipos, temas o metadatos
  para esa clasificación.

### Mayúsculas y caracteres

- Desaconsejar mayúsculas, espacios, acentos, símbolos y caracteres especiales.
- Evitar nombres que solo se diferencien por mayúsculas, como `MyApp` y
  `myapp`, porque algunos sistemas de archivos y herramientas no distinguen
  entre ellas.
- Evitar guiones bajos (`_`) en el nombre del repositorio, aunque puedan ser
  válidos técnicamente.
- No convertir automáticamente un nombre oficial a `kebab-case` sin comprobar
  si esa conversión dañaría su identidad pública.

### Restricciones técnicas de GitHub

- Un nombre de repositorio de GitHub no debe superar los 100 caracteres.
- GitHub acepta letras ASCII, números, puntos (`.`), guiones (`-`) y guiones
  bajos (`_`). Que un carácter sea válido técnicamente no significa que sea la
  opción recomendada.
- Para una organización, se puede imponer una expresión regular mediante una
  política de nombres. Para `kebab-case` estricto se puede usar:

  ```regex
  ^([a-z][a-z0-9]*)(-[a-z0-9]+)*$
  ```

- Si se evalúa un nombre para una organización, comprobar si existe una
  política interna antes de presentar una preferencia como requisito.

### Prefijos y estructura semántica

- En una colección de repositorios relacionados, usar una estructura estable
  como `<producto>-<componente>`:

  ```text
  payments-api
  payments-web
  payments-docs
  ```

- Para artefactos pertenecientes a un ecosistema concreto, puede usarse
  `<ecosistema>-<categoría>-<recurso>`:

  ```text
  ansible-role-http
  roundcube-plugin-calendar
  ```

- La estructura semántica es opcional. No añadir prefijos solo para indicar el
  lenguaje, framework o sistema operativo de implementación. `python-tool` y
  `react-dashboard` suelen ser menos estables que `tool` y `dashboard`.
- Sí puede usarse un prefijo cuando identifica el ecosistema o el tipo de
  artefacto publicado, por ejemplo `ansible-role-*`, `github-action-*` o
  `python-*` si el repositorio es realmente un paquete del ecosistema Python.
- Evitar duplicaciones entre prefijo, categoría y recurso. Preferir
  `ansible-lint` a `ansible-ansible-lint` cuando el nombre del recurso ya
  identifica el ecosistema.
- El orden de las palabras debe poner primero el término más útil para agrupar
  y buscar repositorios. Aplicar una sola convención de vocabulario para
  términos como `frontend` frente a `front-end`, `docs` frente a
  `documentation` y `service` frente a `svc`.
- No incluir el nombre de un equipo, departamento u organización interna salvo
  que sea una identidad pública, estable o una necesidad explícita de
  aislamiento. Usar la organización, equipos, topics o propiedades de GitHub
  para esa clasificación.

### Tipos especiales de repositorio

- Hacer explícita la finalidad cuando un repositorio no es la fuente principal:

  ```text
  api-client-template
  react-dashboard-example
  checkout-prototype
  billing-infrastructure
  ```

- Usar términos como `template`, `example`, `prototype`, `docs`, `infra` o
  `infrastructure` solo cuando describan una diferencia real y estable.
- Para un monorepo, preferir el nombre del producto o dominio principal y no
  concatenar todos los nombres de sus directorios. La estructura interna y el
  README deben aportar ese detalle.
- Para una aplicación independiente, omitir prefijos de ecosistema y
  categorías que no aporten información. El nombre normalizado del producto
  suele ser suficiente.
- Para un sitio web, el dominio desnudo o el subdominio puede ser una opción
  adecuada, por ejemplo `example.com` o `docs.example.com`. No incluir
  `www.` si no aporta una diferencia útil.

### Nombre frente a metadatos

- No sobrecargar el nombre con lenguaje, plataforma, equipo, estado, URL o
  detalles de implementación que puedan cambiar.
- Usar la descripción del repositorio para una explicación breve de su
  propósito.
- Usar topics para lenguaje, audiencia, dominio, plataforma y ecosistema.
- Usar el README para instalación, propiedad, estado, relación con otros
  repositorios y contribución.
- Usar propiedades de GitHub o equipos para clasificaciones internas. El nombre
  debe seguir siendo útil fuera de la organización.

### Estabilidad y renombrados

- Considerar el coste de cambiar el nombre antes de recomendar un renombrado.
  Los nombres aparecen en URLs, documentación, automatizaciones, paquetes,
  clones locales y referencias externas.
- GitHub conserva muchas redirecciones después de un renombrado, pero no se debe
  asumir que todas las integraciones se actualizan. En particular, las GitHub
  Actions que referencian una acción alojada en el repositorio renombrado pueden
  fallar.
- No reutilizar inmediatamente el nombre antiguo de un repositorio renombrado,
  porque puede romper sus redirecciones.
- Si el nombre actual es válido y el cambio solo corrige una preferencia
  estética, recomendar conservarlo. Priorizar renombrados cuando exista
  ambigüedad, riesgo de colisión, información falsa o una restricción técnica.

### Excepción para herramientas publicadas

Si el repositorio es la implementación pública de una herramienta, librería,
CLI o producto con un nombre establecido, conservar el nombre oficial cuando
sea necesario. Por ejemplo, un proyecto puede conservar `fastVEP`, `RastQC` o
`TRACE-Kin` si ese nombre es el que usan los usuarios, paquetes o binarios.

La excepción no aplica solo porque el autor prefiera mayúsculas. Preguntar o
declarar el supuesto cuando no esté claro si el nombre es una identidad pública
o solo el nombre interno del proyecto.

## Niveles de resultado

Clasificar cada observación como:

- `OK`: cumple las reglas principales y no requiere cambios.
- `RECOMENDACIÓN`: es válido, pero existe una alternativa más clara, estable o
  consistente.
- `PROBLEMA`: contiene una práctica que puede causar confusión, problemas de
  compatibilidad o mantenimiento.
- `BLOQUEADOR`: es ambiguo, induce a error, colisiona con otro nombre o viola
  una restricción esencial proporcionada por el usuario.

No presentar una preferencia estilística como un error técnico. Explicar la
regla, el impacto y la excepción aplicable.

## Flujo de trabajo

1. Extraer los nombres candidatos y el contexto disponible.
2. Normalizar solo para comparar: no modificar silenciosamente el nombre
   original.
3. Revisar formato, claridad, estabilidad, búsqueda, colisiones y coherencia
    con nombres relacionados, incluyendo el tipo especial del repositorio y la
    política de nombres de la organización cuando exista.
4. Determinar si aplica la excepción de una herramienta o producto publicado.
5. Determinar si el nombre necesita un prefijo o sufijo semántico, o si esos
   detalles deben ir en la descripción, topics o README.
6. Proponer una opción preferida y hasta tres alternativas cuando el nombre no
   sea adecuado.
7. Explicar los cambios concretos y sus motivos, distinguiendo requisitos
   técnicos, reglas internas y preferencias estilísticas.
8. Si se propone renombrar un repositorio existente, advertir sobre URLs,
   clones, automatizaciones, GitHub Actions y referencias externas.
9. Indicar los supuestos, la información faltante y cualquier comprobación que
   el usuario deba hacer, como disponibilidad en GitHub o conflicto con un
   paquete publicado.

No afirmar que un nombre está disponible en GitHub sin comprobarlo mediante una
fuente autorizada. La validez de la nomenclatura y la disponibilidad son
comprobaciones distintas.

## Formato de respuesta

Responder en español neutro y mantener los nombres candidatos en código
inline. Para un único nombre, usar:

```text
## Resultado
Estado: OK | RECOMENDACIÓN | PROBLEMA | BLOQUEADOR

Nombre evaluado: `nombre-original`
Nombre recomendado: `nombre-recomendado`

## Motivos
- Regla o hallazgo concreto.
- Impacto práctico.

## Alternativas
- `alternativa-uno`: motivo breve.
- `alternativa-dos`: motivo breve.

## Supuestos
- Información asumida o comprobación pendiente.
```

Omitir las secciones vacías. Para listas, mostrar una tabla o un bloque por
nombre con estado, observaciones y recomendación. No generar alternativas que
solo cambien palabras sin mejorar claridad o estabilidad.

## Fuentes

Usar estas fuentes como base de las recomendaciones. Si una fuente no está
disponible, no inventar su contenido y continuar con las reglas documentadas
arriba:

- [Fermi AD: GitHub Repository Naming Guide](https://fermi-ad.github.io/getting-started/repo-naming-guide.html)
- [SSW: Do you know how to name a GitHub Repository?](https://www.ssw.com.au/rules/do-you-know-how-to-name-a-github-repository)
- [GitHub Community: What is proper naming for GitHub repos?](https://github.com/orgs/community/discussions/196726)
- [Huang Lab: Repository conventions](https://raw.githubusercontent.com/Huang-lab/lab-repo-template/refs/heads/main/CONVENTIONS.md#1)
- [GitHub: Creating a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)
- [GitHub: Governing repository use in an organization](https://docs.github.com/en/enterprise-cloud@latest/organizations/managing-organization-settings/governing-how-people-use-repositories-in-your-organization)
- [GitHub: Renaming a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/renaming-a-repository)
- [Foundata: Git repository naming guidelines](https://github.com/foundata/guidelines/blob/master/git-repository-naming.md)
- [Qoomon: GitHub onboarding](https://github.com/qoomon/github-onboarding)
- [Spatie: Version control guidelines](https://spatie.be/guidelines/version-control)
- [VLIZ: GitHub management conventions](https://open-science.vliz.be/conventions/github-management)

Las fuentes coinciden en preferir nombres descriptivos, consistentes, breves y
con minúsculas separadas por guiones. La guía de Huang Lab añade la excepción
para nombres oficiales de herramientas publicadas y desaconseja fechas. La
discusión de GitHub es orientación comunitaria, no una restricción técnica de
la plataforma. Las guías de Foundata y Qoomon aportan estructuras para agrupar
familias de repositorios, mientras que GitHub documenta los caracteres válidos,
las políticas de nombres y los riesgos de los renombrados. Spatie y VLIZ
aportan excepciones para sitios web, paquetes y artefactos con sufijos de
ecosistema.
