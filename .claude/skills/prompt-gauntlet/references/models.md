# Model profiles

These are rules of thumb, not official specs. Models update often, so if the user says their version behaves differently, believe them and adjust. Word ranges are where prompts tend to work best for each model, not hard limits.

| Model | Audio | Negative field | Common durations | Word range | Multi-shot |
|---|---|---|---|---|---|
| Google Veo 3 | Yes | Yes (API and some front ends) | 4, 6, 8 s | 50-200 | No |
| OpenAI Sora 2 | Yes | No | 4, 8, 12 s | 50-220 | Yes |
| Kling | Newer versions | Yes | 5, 10 s | 30-150 | No |
| Runway Gen-4 | No | No | 5, 10 s | 15-100 | No |
| MiniMax Hailuo | No | No | 6, 10 s | 30-150 | No |
| ByteDance Seedance | No | No | 5, 10 s | 30-160 | Yes |
| Wan | No | Yes | 5, 8 s | 40-160 | No |
| Generic / other (Luma, Pika, Higgsfield, etc.) | Check | Check | 4-15 s | 30-170 | No |

## Habits to apply in the forge

**Veo 3:** Put dialogue in quotes and attach it to a named speaker with a delivery note ("the barista says warmly, '…'"). List sound effects and ambience separately from music. Keep each spoken line short enough for the clip.

**Sora 2:** Open with a clear description of the shot (framing, lens, movement), then the action in beats. It can handle several shots in one prompt if each one is clearly labeled. Phrase every constraint positively, because there is no negative field.

**Kling:** Name the camera movement explicitly. It can follow multi-step motion, but keep to one main action per few seconds. Put exclusions in the negative field.

**Runway Gen-4:** Usually image-to-video. Keep prompts short and about motion: what moves, how, and how the camera moves. Don't re-describe what the image already shows. Plain sentences work better than tag lists.

**MiniMax Hailuo:** Director models accept bracketed camera commands in the prompt. Put the command at the start, or at the moment it should happen. Mapping:

| Movement | Command |
|---|---|
| static | [Static shot] |
| push-in | [Push in] |
| pull-out | [Pull out] |
| tracking or following | [Tracking shot] |
| crane up | [Pedestal up] |
| handheld | [Shake] |
| pan left / right | [Pan left] / [Pan right] |
| tilt up / down | [Tilt up] / [Tilt down] |
| truck left / right | [Truck left] / [Truck right] |
| zoom in / out | [Zoom in] / [Zoom out] |

**Seedance:** Supports multiple shots in one prompt. Label each shot and keep each one to a single clear action.

**Wan:** Long descriptive prompts work well, and it has a negative prompt field. A detailed shot sheet suits it.

**Generic:** Use the paragraph format, camera first. Tell the user to check their model's docs for length limits and negative prompt support.
