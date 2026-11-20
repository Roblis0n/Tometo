<p align="center">
  <img src="assets/tometo-logo.png" alt="Tometo, un pequeño tomate mecánico con una llave al hombro" width="180">
</p>

<h1 align="center">Tometo</h1>

<p align="center">
  <a href="README.md">English</a> · <a href="README.zh-CN.md">简体中文</a> · <a href="README.ja.md">日本語</a> · Español
</p>

Tometo es una skill de Codex para escribir, depurar, refactorizar y revisar código. Parte del punto de entrada que usa la aplicación, sigue la cadena de llamadas y comprueba cómo afecta un cambio a los datos existentes o a una solicitud que se envía de nuevo.

Imagina que al cambiar de cuenta aparece a veces el perfil anterior. La primera carga puede funcionar sin problemas. ¿Qué ocurre si una petición de la cuenta anterior termina después del cambio? Tometo orienta a Codex para averiguar qué componente conserva los datos y qué respuesta puede actualizar la pantalla. Sus diez guías se consultan según la tarea.

## Instalación

1. En la página del repositorio, selecciona **Code → Download ZIP** y descomprime el archivo.
2. Crea la carpeta `~/.agents/skills/tometo/` (en Windows, `%USERPROFILE%\.agents\skills\tometo\`). Copia en ella `SKILL.md`, `references/`, `agents/` y `assets/`. Comprueba que el archivo queda en `tometo/SKILL.md`.
3. Abre una nueva sesión de Codex e incluye `$tometo` en tu petición. Codex también puede seleccionar la skill si la tarea coincide con su descripción.

La instalación habitual funciona sin configurar hooks. Si ya gestionas tus propios hooks en Windows, puedes usar el [lector de eventos](scripts/emit-codex-context.ps1) incluido. [Documentación de Codex](https://developers.openai.com/codex/skills/)

## Ejemplos

```text
$tometo Al cambiar de cuenta a veces aparece el perfil del usuario anterior. Sigue el orden de las peticiones y corrige la actualización que sobrescribe los datos actuales.
```

```text
$tometo Revisa cómo afecta esta migración a los registros existentes y a los clientes antiguos. Haz la revisión sin modificar el código.
```

## Guías de referencia

Las instrucciones y las diez guías están escritas en chino simplificado. El [archivo principal](SKILL.md) indica cuándo consultar cada una.

| Si necesitas… | Consulta |
| --- | --- |
| Localizar el punto de entrada o aclarar información contradictoria | [Repositorio y contexto](references/repository-context.md) |
| Diseñar un cambio o delimitar una refactorización | [Diseño y cambios](references/design-and-change.md) |
| Trabajar con estados, concurrencia, permisos o ciclos de vida | [Implementación](references/implementation.md) |
| Añadir una dependencia o resolver un fallo de una herramienta | [Dependencias y herramientas](references/dependencies-and-tools.md) |
| Explicar un fallo o por qué una corrección no ha funcionado | [Diagnóstico](references/diagnosis.md) |
| Determinar qué demuestran las comprobaciones | [Evidencia y finalización](references/evidence-and-completion.md) |
| Revisar código o responder a los comentarios de una revisión | [Revisión](references/review.md) |
| Cambiar una interfaz compartida, migrar datos o publicar una versión | [Compatibilidad y entrega](references/compatibility-and-delivery.md) |
| Repartir el trabajo o retomar una tarea interrumpida | [Tareas largas](references/long-running.md) |
| Reducir la latencia o el consumo de recursos | [Rendimiento y coste](references/performance-and-cost.md) |
