# Prompt Gauntlet

A single-page tool for stress-testing prompts for AI video generation (Veo 3, Sora 2, Kling, Runway, Hailuo, Seedance, Wan, or any other model).

Open `index.html` in a browser. Nothing to install, and it works offline apart from the web fonts.

## How it works

1. **The contender.** Paste a raw prompt. Pick the target model, the clip length, the aspect ratio, whether you have a start frame (image-to-video), and whether the model makes sound.
2. **The ten trials.** The prompt is checked for Subject, Action, Setting, Camera, Light, Style, Sound, Timing, Clarity and Hazards. Each trial is scored out of 10, and the weighted total gives a verdict: Survived (80+), Wounded (55-79) or Fallen (below 55).
3. **Fortify.** Every weak trial asks the questions it needs answered, using quick-pick chips (shot size, lens, light source, pace...) and short text fields.
4. **The forge.** Your raw prompt (with filler words removed and "no X" phrases moved out) is merged with your answers into a final prompt, as a paragraph or a labeled shot sheet. An avoid list is built for models that take a negative prompt. You can send the forged prompt back through the gauntlet.
5. **The judge** (only when opened as a claude.ai artifact). Claude reviews the forged prompt and returns a score, its weaknesses, questions only you can answer, and a rewrite.
6. **Take log.** Every run is saved in your browser so you can compare versions.

The trials are keyword checks, and the model profiles are rules of thumb. Check your model's current docs for exact limits.
