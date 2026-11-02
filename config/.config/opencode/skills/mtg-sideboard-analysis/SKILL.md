---
name: mtg-sideboard-analysis
description: Analiza un mazo de Magic: The Gathering desde .opencode/sideboard-input.md y construye un sideboard competitivo de 15 cartas usando datos recientes de mtgdecks.net. Usar cuando el usuario pida analizar un mazo, construir un sideboard o preparar guías de enfrentamientos de Standard u otro formato.
---

# Análisis competitivo de sideboard

## Objetivo

Realiza un análisis competitivo reproducible a partir del archivo local
`.opencode/sideboard-input.md`. Investiga el arquetipo y los enfrentamientos
en `mtgdecks.net`, valida la legalidad con fuentes de reglas y entrega un
sideboard exacto de 15 cartas con planes de juego y cambios equilibrados.

## Fuente de entrada obligatoria

1. Lee primero `<project-root>/.opencode/sideboard-input.md`.
2. No sustituyas el archivo por el mensaje del usuario ni completes secciones
   ausentes con suposiciones.
3. Extrae, si existen:
   - formato;
   - fecha de referencia;
   - nombre del mazo;
   - lista completa del mazo principal y sus cantidades;
   - enfrentamientos esperados;
   - restricciones adicionales, como BO1, BO3 o presupuesto.
4. Si el archivo no existe, está vacío o no contiene una lista interpretable,
   detén el análisis y explica exactamente qué falta.
5. Conserva los nombres de cartas en inglés tal como aparecen en la entrada.

## Investigación en mtgdecks.net

La investigación en `mtgdecks.net` es obligatoria cuando el sitio está
disponible. No bases la propuesta en una única lista.

### Arquetipo

Busca el arquetipo mediante búsquedas como:

- `site:mtgdecks.net/Standard <archetype>`
- `site:mtgdecks.net/guides <archetype> sideboard`
- `site:mtgdecks.net/Standard <archetype> decklist`

Usa la página del arquetipo, listas individuales, guías y páginas de
metajuego. Prioriza, en este orden:

1. Torneos competitivos BO3 recientes.
2. RCQ, Regional Championship, Challenges y ligas.
3. Listas con buen resultado dentro de eventos con una muestra razonable.
4. Guías de sideboard del propio sitio.

No mezcles BO1 con BO3 sin indicarlo. No mezcles Standard con Alchemy,
Historic, Pioneer u otros formatos.

### Datos que se deben recopilar

Para cada lista útil, registra internamente:

- URL;
- fecha del evento o de publicación;
- formato y tipo de partida;
- nombre del arquetipo;
- resultado o posición;
- cartas del sideboard;
- enfrentamientos disponibles;
- tamaño de la muestra cuando el sitio lo muestre.

Para el metajuego registra, cuando exista:

- presencia del arquetipo;
- porcentaje de victorias;
- tendencia;
- porcentaje de conversión;
- resultados contra cada enfrentamiento solicitado.

Si la fecha de referencia está indicada, excluye datos posteriores a esa
fecha. Si el usuario no indica fecha, usa los datos más recientes disponibles
y muestra el intervalo temporal usado.

### Calidad de la evidencia

Clasifica cada conclusión como:

- **Alta:** varias listas competitivas recientes y una muestra suficiente.
- **Media:** algunas listas competitivas o una guía reciente, pero muestra
  limitada.
- **Baja:** pocas partidas, listas casuales o datos indirectos.

No presentes una tasa con pocas partidas como una predicción fiable. Indica
si una estadística procede de una muestra pequeña.

## Construcción del sideboard

Genera exactamente 15 cartas. Las cartas pueden ser nuevas respecto al archivo
de entrada porque el usuario ha autorizado construir una reserva basada en
datos externos, pero no inventes nombres, cantidades, estadísticas ni textos
de reglas.

Construye primero un conjunto de candidatas observadas en listas o guías de
`mtgdecks.net`. Para cada candidata considera:

- frecuencia de aparición en sideboards;
- resultados de las listas que la incluyen;
- relevancia frente a los enfrentamientos esperados;
- compatibilidad con el mazo principal;
- coste de maná y requisitos de color;
- solapamiento funcional con otras cartas;
- legalidad y regla de cuatro copias.

Prioriza cartas con cobertura múltiple. Evita llenar el sideboard con balas
de un solo enfrentamiento salvo que ese enfrentamiento sea muy frecuente o
especialmente desfavorable.

Comprueba siempre que:

- el sideboard sume exactamente 15;
- las cartas sean legales en el formato y fecha indicados;
- no se excedan cuatro copias totales entre mazo principal y sideboard,
  salvo tierras básicas y excepciones explícitas del formato;
- no se incluya una carta inexistente o con nombre dudoso.

La propuesta debe distinguir entre cartas respaldadas directamente por listas
observadas y ajustes propios para el metajuego del usuario.

## Legalidad

No uses `mtgdecks.net` como única fuente de legalidad. Comprueba el formato
con una fuente oficial de Wizards of the Coast y el estado individual de las
cartas con Scryfall o Gatherer cuando sea necesario.

Considera:

- rotación del formato en la fecha indicada;
- cartas prohibidas o restringidas;
- reimpresiones que hagan legal una carta;
- diferencia entre carta nueva de un producto suplementario y una reimpresión;
- regla de cuatro copias;
- tamaño mínimo del mazo y tamaño máximo del sideboard.

Si no puedes confirmar una carta, márcala como **no confirmada** y no la uses
en la propuesta final hasta resolverlo.

## Guías de sideboard

Para cada enfrentamiento del archivo proporciona:

- plan de juego;
- cartas que entran con cantidades;
- cartas que salen con cantidades;
- suma de cartas que entran;
- suma de cartas que salen;
- nivel de confianza de la guía.

Cada guía debe cumplir matemáticamente:

```text
sum(IN) == sum(OUT)
60 - sum(OUT) + sum(IN) == 60
```

No elimines cartas solo para cuadrar cantidades. Explica si una carta se
queda porque sigue siendo útil en el enfrentamiento o si se corta por ser
demasiado lenta, situacional o redundante.

Si el enfrentamiento solo aparece como nombre de arquetipo y no hay una lista
concreta, utiliza la configuración habitual observada en `mtgdecks.net` y
decláralo como supuesto.

## Formato de salida

Usa esta estructura, salvo que el usuario pida otra:

```markdown
## Análisis del mazo

Incluye formato, fecha, tamaño, suma de cartas, fortalezas, debilidades y
resumen de la evidencia de mtgdecks.net.

## Sideboard propuesto

| Cantidad | Carta | Función | Motivo |
|---:|---|---|---|

Total: 15 cartas.

## Guía de enfrentamientos

### [Nombre del enfrentamiento]

**Datos y confianza:** ...

**Plan de juego:** ...

**IN**

| Cantidad | Carta |
|---:|---|

**OUT**

| Cantidad | Carta |
|---:|---|

**Intercambio:** X cartas entran y X cartas salen.

## Observaciones

Incluye legalidad, supuestos, muestras pequeñas, cartas ambiguas, datos que no
se pudieron encontrar y fuentes utilizadas.
```

Incluye enlaces directos a las páginas importantes de `mtgdecks.net` y a las
fuentes de legalidad. No ocultes que una página no pudo consultarse o que una
estadística procede de una muestra pequeña.

## Restricciones contra alucinaciones

- No inventes cartas, arquetipos, resultados, porcentajes ni textos de cartas.
- No atribuyas una carta a `mtgdecks.net` si no aparece en una lista o guía
  consultada.
- No confundas cartas con nombres similares.
- No afirmes que un enfrentamiento es favorable o desfavorable sin datos o sin
  marcarlo como evaluación estratégica.
- Si `mtgdecks.net` no responde, informa del fallo y continúa solo con datos
  verificables de otras fuentes; nunca simules haber consultado el sitio.
