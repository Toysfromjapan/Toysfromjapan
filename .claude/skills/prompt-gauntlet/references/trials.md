# The ten trials: full rubric

Each trial is scored from 0 to 10. Status: **pass** is 7 or above, **weak** is 4 to 6.9, **fail** is below 4. The scoring guides below are anchors. Use judgment, but stay close to them so scores mean the same thing from one take to the next.

## Contents
- Weights
- T01 Subject
- T02 Action
- T03 Setting
- T04 Camera
- T05 Light
- T06 Style
- T07 Sound
- T08 Timing
- T09 Clarity
- T10 Hazards
- Default avoid list

## Weights

| Trial | Text-to-video | Image-to-video |
|---|---|---|
| Subject | 1.2 | 0.5 |
| Action | 1.3 | 1.6 |
| Setting | 0.9 | 0.5 |
| Camera | 1.1 | 1.5 |
| Light | 0.9 | 0.5 |
| Style | 0.8 | 0.5 |
| Sound | 0.7 (left out when audio is off) | 0.7 |
| Timing | 0.8 | 0.9 |
| Clarity | 1.0 | 1.0 |
| Hazards | 0.7 | 0.8 |

Total = Σ(score × weight) / Σ(weights) × 10, rounded to a whole number. Show each trial's score to one decimal place (drop a trailing .0), and use the unrounded values in the total.

A word is scored in one place only. Filler such as "4k" or "epic" is penalized in Clarity. "Cinematic" is handled in Style, not Clarity.

---

## T01 Subject: who or what does the eye land on?

Video models turn a bare noun ("a man") into the most average man they can. Visible specifics make the subject appear and keep it consistent from frame to frame.

**Look for:** a clear subject noun, plus concrete details such as age or build, wardrobe items, colors, materials, hair and face features, and wear or texture (weathered, rain-soaked, scuffed).

**Scoring:**
- Start at 3 if there's a subject noun, otherwise 0.
- Add about 1.3 per distinct visible detail, up to 6. Add 1 for a specific age ("in her 60s", "8-year-old").
- With **several characters**, subtract 1 and require that each one has a distinguishing trait and a place in frame (left/right, foreground/background). Pronouns (he/she/they) with two or more characters are ambiguous to the model. Recommend short repeated labels ("the boy", "the tall man").
- **Image-to-video:** score at least 7. Only details that must stay consistent as things move need restating.

**Questions to ask:** age and build, wardrobe and its colors and materials, one distinctive detail, and for multiple characters, how to tell them apart and where each one stands.

## T02 Action: what moves, and how?

A prompt without motion produces a moving photograph: drifting hair and a slow zoom.

**Look for:** motion verbs, pace words (slowly, briskly, in slow motion, in real time), and sequence words (then, as, while, finally).

**Scoring:**
- No motion verbs: 1.
- Only the environment moves (wind, rain, clouds) and the subject is static ("stands", "sits"): 3. Ask what the subject does, even if it's something small like a head turn or a step.
- Otherwise 5, plus up to 2 for multiple coordinated actions, plus 2 for a pace word, plus 1 for sequence words.
- **Capacity check:** about one clear action per 3 seconds (round(duration/3), minimum 1). Two actions over capacity is tight (-1). More than that is overloaded (-3), and the model will rush or drop actions.
- **Image-to-video:** motion is the whole prompt. Ask for the change, step by step.

**Questions to ask:** what happens from start to finish, the pace, and the order of events.

## T03 Setting: where and when?

**Look for:** a specific place (not just "city" or "forest"), time of day, weather or air (rain, haze, dust, steam), and era or season.

**Scoring:** place +4, time of day +3, atmosphere +2, era or season +1. Subtract 1 if the only place word is broad ("city", "street", "forest", "beach", "room", "cliff", "field"). An era clearly implied by the subject (a samurai, a Roman legionary) earns the era point. Image-to-video: minimum 6.

**Questions to ask:** where specifically (one or two signature details, such as signage, materials, region or scale), time of day, and weather or air.

## T04 Camera: shot size, angle, movement, lens

Without direction the model picks a default, usually a slow generic push toward the middle of the frame.

**Scoring:** shot size +3, movement +3, angle +2, lens or focus +2. With no camera language at all, score 1. Image-to-video: +1 if movement is given, since camera movement matters even more there.

**Options to offer:**
- Shot size: extreme wide, wide, medium, medium close-up, close-up, extreme close-up
- Angle: eye level, low, high, overhead top-down, dutch, POV
- Movement: static or locked-off, slow push-in, pull-out, tracking alongside, following from behind, orbit, crane up, handheld, FPV drone, pan, tilt
- Lens: 24mm wide, 35mm, 50mm, 85mm, macro, anamorphic, shallow depth of field, deep focus

"Static" is a valid answer. The point is that the choice is made, not left to the model.

## T05 Light: source, quality, color

**Scoring:** about 3 per distinct lighting element, up to 10. If light is only implied by time of day ("at night"), score 3. With nothing at all, score 0. Image-to-video: minimum 6.

**Options to offer:**
- Source: sun, low golden sun, overcast daylight, neon signs, practical lamps, candlelight, moonlight, softbox, headlights, firelight
- Quality: soft and diffused, hard shadows, backlit, rim light, silhouette, volumetric beams, high contrast, low key
- Color: warm tungsten, cool blue, mixed warm and cool, teal and orange, neutral, monochrome

## T06 Style: medium, stock, grade

**Scoring:** about 2.6 per distinct style element, up to 10. "Cinematic" alone scores 3, because it says almost nothing: ask for the film stock, lens character or grade. Subtract 2 for photoreal and animated cues mixed together. Image-to-video: minimum 6.

**Options to offer:**
- Medium: photoreal live action, 35mm film, 16mm documentary, Super 8, VHS camcorder, 3D animation, stop-motion claymation, anime cel, watercolor animation
- Look: natural color, desaturated, rich saturation, bleach bypass, pastel, fine film grain, crushed blacks, halation
- Genre, era or reference

## T07 Sound (only when audio is on)

**Scoring:** dialogue or a speaker tag +3, sound effects +3, ambience +2, a music decision +2 ("no music" counts).
- Natural speech runs about 2.5 words per second. If quoted dialogue goes over duration × 2.5 words, subtract 2.
- Dialogue in quotes with no speaker tag is a warning. Write who says it and how ("the old man whispers, '…'").
- Without ambience, models often fill the soundtrack with generic music.

**Questions to ask:** who says what and how, the effects tied to each visible action, the ambience bed, and music (or none).

## T08 Timing: does it fit the clip?

**Scoring:**
- Word count within the model's range (see models.md): +4. Under half the minimum: 0. Otherwise short or long: +2. Over the range, late details get dropped.
- Action within capacity: +3.
- Explicit order (then, as, beat times like "0-3s: …"): +2.
- An explicit single continuous shot: +1.
- Cuts ("cut to", "next shot", montage) on a single-shot model: -2. Recommend separate generations. Multi-shot models (Sora 2, Seedance) can handle cuts, but each shot should still be one clear action.

## T09 Clarity: filler, negations, feelings, contradictions

Start at 10 and subtract:
- **Filler and quality tags:** -1.2 each, up to -4. Examples: beautiful, stunning, amazing, epic, awesome, gorgeous, breathtaking, masterpiece, best or high quality, ultra-realistic, hyper-detailed, highly detailed, 4k, 8k, 16k, UHD, trending on artstation, award-winning, unreal engine, octane render, perfect. These are habits from image models and change nothing on screen.
- **Negations in the main prompt:** -2 each, up to -4. Examples: "no cars", "without people", "don't show". Naming a thing tends to summon it. Move it to the avoid list and describe what *is* there instead ("an empty street").
- **Feelings the camera can't see:** -1 each, up to -3. Examples: feels lonely, a sense of nostalgia, a mysterious vibe. Turn each one into something visible: posture, framing, distance, light, pace.
- **Contradictions:** -2 each. Daytime and nighttime cues together (unless it's a time-lapse or transition), a static camera and a moving camera, photoreal and animated together. Handheld with smooth/steady: -1. Two shot sizes with no move between them: -1 (is it a push-in, or two shots?).
- **Tag soup:** six or more comma fragments averaging under three words: -2. Video models follow sentences better.

## T10 Hazards: known failure zones

Start at 10 and subtract 1.8 for each hazard present. Give the fix for each one:

| Hazard | Triggers | Fix |
|---|---|---|
| Fine hand work | typing, playing an instrument, knitting, sewing, shuffling cards, chopsticks, "fingers" | Wider framing, hands partly out of frame, simpler gesture |
| Readable text | signs that say…, logos, captions, titles, lettering | Add text in the edit, or keep signs blurred in the background |
| Crowds | crowd, hundreds, an army, audience | Crowd soft-focus in the background, one foreground subject |
| Bodies in contact | fights, punches, kisses, hugs, handshakes, dancing together | One clear interaction at moderate speed, state who is on which side |
| Complex body motion | flips, gymnastics, parkour, breakdancing, juggling, martial arts | Slow it down, one move, frame it to read in silhouette |
| Physics events | pouring, splashing, shattering, exploding, melting | Describe cause and result, slow the pace |
| Exact counts | numbers above 2-3 ("five birds") | Use "a small group" unless the number matters, then check it in review |
| Mirrors and reflections | mirror, reflection | Keep reflections incidental or angle the mirror away |
| Transformations | morphs into, turns into, becomes | Spell out start and end states, give it most of the duration, use start and end frames if supported |
| Eating and drinking | eating, biting, chewing | Cut away before contact, or show the moment just after |

## Default avoid list

Choose from these based on the hazards found: morphing, warped hands, extra fingers, extra limbs, distorted faces, flickering, garbled text, watermark, jump cuts, jittery camera, blurry footage, duplicate subjects. Then add the user's own exclusions and any negations taken out of the prompt.
