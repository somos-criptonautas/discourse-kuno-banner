# Kuno Banner

[ENGLISH](README.md) | **ESPAÑOL**

Mantenido por Criptonautas. Sin afiliación ni respaldo de Discourse (Civilized Discourse Construction Kit, Inc.).

Un aviso descartable en la portada que cambia cada día y muestra un tema del foro con
una etiqueta elegida o una recaudación externa de Monero en
[Kuno](https://codeberg.org/nebras/kuno) que apoya la comunidad. Hecho para el tema
[Horizon](https://meta.discourse.org/t/horizon-theme/360486).

## Qué hace

- **Un solo grupo, un elemento al día.** Los temas con `kuno_tag` (los más antiguos
  primero) seguidos de las URLs de `supported_kunos`. Todos ven el mismo elemento el
  mismo día UTC; al día siguiente avanza un paso y vuelve a empezar al final.
- **Temas etiquetados:** muestran su título con enlace al tema.
- **Kunos apoyados:** muestran *"¡Atención! Estamos apoyando este Kuno externo:"* y el
  enlace, que abre en otra pestaña. Solo se aceptan URLs `https://`.
- **Descartable.** El botón de cerrar oculta el aviso en ese navegador hasta el elemento
  del día siguiente. Funciona también para visitantes sin sesión.
- **Solo en la portada**, en la columna principal de Horizon bajo el banner de bienvenida
  y sobre la lista de temas. Si el grupo está vacío no se muestra nada.

## Ajustes

| Ajuste | Por defecto | |
|---|---|---|
| `kuno_tag` | `kuno` | Etiqueta cuyos temas entran en la rotación. Vacío para mostrar solo Kunos apoyados. |
| `supported_kunos` | vacío | URLs de recaudaciones externas de Kuno. |

El texto del aviso está en las traducciones del componente (`kuno_banner.supporting`).

## Límites

- **Sin datos en vivo de Kuno.** Kuno no publica API ni feed, así que los Kunos apoyados
  muestran su URL, no su título ni su progreso.
- **Las etiquetas privadas siguen privadas.** Los temas se leen de `/tag/<tag>.json` como
  el visitante, así que quien no puede ver un tema no lo recibe en su rotación, y su
  elemento del día puede ser otro.

## Instalación

**Admin → Apariencia → Temas y componentes → Instalar**, desde la URL de este
repositorio, y añádelo a Horizon.

## Desarrollo

`pnpm install && pnpm lint`. CI también corre los tests QUnit de `test/` y el spec de
funciones básicas del núcleo. Las notas para contribuir están en [AGENTS.md](AGENTS.md).

## Licencia

MIT. Ver [LICENSE](LICENSE).

Texto de este README bajo [CC BY-NC-SA 4.0](CC-BY-NC-SA-4.0.txt).
