# Project notes

Style: no em dashes in captions, prompts or docs.

## AI video production pipeline (Higgsfield)

Nothing is generated until every detail is locked. Skipping a gate wastes credits.

1. **Bible check.** Every character and prop in the shot has an entry in `bible/`. Copy its locked description into the prompt word for word and attach its approved reference IDs. A missing entry blocks the shot: ask the user to fill it in.
2. **Scene plan.** Shot list with framing, camera move, action beats and duration per shot, agreed with the user (whiteboard sketch when available).
3. **Prompt Gauntlet (mandatory).** Run every shot prompt through the `prompt-gauntlet` skill, the full flow: trials, interrogation of the user for anything under 7, forge, rematch. Use the forged prompt exactly as forged. Only prompts scoring 80+ (SURVIVED) may render. A prompt forged in another session counts only if its score and forged text are supplied; re-run the gauntlet if anything in it changed (model, start frame, wardrobe, duration).
4. **Cost check.** Preflight with `get_cost`, show the user the total, wait for a go.
5. **Test take.** One draft-quality take per shot (or of the riskiest shot first). User approves before the full batch.
6. **Shot QC.** Before showing any result, pull frames (Higgsfield `sandbox_exec` + ffmpeg contact sheet) and check: identity vs bible, hands, readable text, morphing, wardrobe, continuity with neighboring shots. Show only passing takes and say what was rejected and why.
7. **Finishing.** Assemble with the `finishing` skill (music bed, crossfades, grain, -14 LUFS). Never deliver a raw concat.

Model routing defaults: stills `gpt_image_2_5`; dance or complex choreography uses Genjutsu motion transfer (`hf_mult_motion_control`) with a real reference clip, never text alone; on-screen text via Veo or added in the edit; Veo 3.1 takes only a start frame, so build start frames from bible references.

## bible/
Locked character and prop descriptions plus approved reference image/job IDs. Templates: `bible/characters/_TEMPLATE.md`, `bible/props/_TEMPLATE.md`. Entries marked DRAFT are not locked yet and need user sign-off before use.

## illusion/
Daily bistable "spinning dots" reels (kinetic depth effect), rendered procedurally, not with AI video.
- Render: `pip install -r illusion/requirements.txt && python3 illusion/spin.py [--shape torus] [--out x.mp4]`
- Output: 1080x1920, 30 fps, 10 s seamless loop (one full turn). Shape rotates daily by date seed.
- Rules that keep the illusion working: orthographic projection, equal dot size and brightness, no shading or depth fog.
