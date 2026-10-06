---
name: prompt-gauntlet
description: The PROMPT GAUNTLET stress-tests and strengthens prompts for AI video generation (Veo, Sora, Kling, Runway, Hailuo, Seedance, Wan, Higgsfield, Luma, Pika, and others). It runs the prompt through ten trials (Subject, Action, Setting, Camera, Light, Style, Sound, Timing, Clarity, Hazards), scores it out of 100, asks the user for the missing details, and forges a final prompt plus an avoid list. Use this whenever the user says "gauntlet" or "prompt gauntlet", pastes a video prompt and asks whether it's good, wants to improve, test, critique, score or tighten a text-to-video or image-to-video prompt, or is about to generate an AI video clip and is unsure what to write. Use it even when they only say "check my prompt" or "make this better for Veo" about a shot or scene. Don't use it for still-image prompts unless the user asks.
---

# Prompt Gauntlet

The Prompt Gauntlet is a trial for AI video prompts. Video models fill every gap the prompt leaves with a default: a generic person, a slow push-in, flat light, stock music. The gauntlet finds those gaps before the user spends credits. It gets the details that matter from the user and turns them into a prompt the target model can follow.

The user named it and treats it as a ritual. Keep the framing: trials, a verdict, the forge. Keep the language plain and the feedback concrete. Every criticism should name what will go wrong on screen and how to fix it.

## The flow

1. **Intake**: the contender and its conditions
2. **The trials**: score ten dimensions
3. **The verdict**: total score and stamp
4. **Interrogation**: ask only what's missing
5. **The forge**: write the final prompt and avoid list
6. **The rematch**: re-score the forged prompt

Run steps 1-4 in a single reply when you can. The user wants momentum, not a form to fill in.

### 1. Intake

You need the prompt plus five conditions. Infer what you can from the conversation and state your assumptions in one line instead of asking:

- **Target model.** Default to "generic" if unknown. Read `references/models.md` for the profile of the named model.
- **Duration.** Use the model's common default (often 5 or 8 s) if unstated.
- **Aspect ratio.** 16:9 unless the user mentions vertical, Reels, TikTok or Shorts (then 9:16).
- **Start frame.** Image-to-video changes everything: the image already fixes subject, setting, light and style, so the prompt should be about motion and camera. If the user attached or mentions a start image, treat it as image-to-video.
- **Audio.** On for Veo 3 and Sora 2. Off for everything else (including plain "Kling") unless the user says their version makes sound. Flag the assumption.

If the user gave no prompt at all, ask for their idea in a sentence or two and continue from there.

### 2. The ten trials

Read `references/trials.md` for the full rubric: what each trial checks, how to score it from 0 to 10, and the red flags. In short:

| # | Trial | Core question |
|---|---|---|
| T01 | Subject | Who or what does the eye land on, in visible concrete terms? Can multiple characters be told apart? |
| T02 | Action | What moves, how fast, in what order? Does the action fit the duration (about one clear action per 3 seconds)? |
| T03 | Setting | Where, specifically? Time of day? Weather or air? |
| T04 | Camera | Shot size, angle, movement, lens or focus |
| T05 | Light | Source, quality, color temperature |
| T06 | Style | Medium, film stock or animation type, grade, era |
| T07 | Sound | Dialogue with a speaker, effects tied to actions, ambience, music. Mark it N/A when audio is off. |
| T08 | Timing | Prompt length vs. the model's sweet spot, action vs. clip length, cuts the model can't do |
| T09 | Clarity | Filler ("epic", "8k", "masterpiece"), negations ("no cars"), feelings the camera can't see, contradictions |
| T10 | Hazards | Known failure zones: fine hand work, readable text, crowds, bodies in contact, acrobatics, liquids and breakage, exact counts, mirrors, transformations, eating |

Weights: with text-to-video, Action, Subject, Camera and Clarity weigh the most. With image-to-video, Action and Camera weigh the most, and Subject, Setting, Light and Style weigh about half, because the image carries them. Total = weighted average × 10, rounded. Use the exact weights in `references/trials.md`.

Score honestly. A one-line prompt should fail. Don't pad the score to be encouraging, because the whole value of the gauntlet is that it's a real test.

### 3. The verdict

- **80-100 SURVIVED.** Ready to render. Mention any remaining tips.
- **55-79 WOUNDED.** It will render, but the model will make choices the user didn't.
- **0-54 FALLEN.** Too much is left to chance.

### 4. Interrogation

For each trial that scored under 7, ask the questions that would fix it. This is where the gauntlet earns its keep: it's "gathering every important detail", so the questions should pull out things only the user knows (their intent, their story, their taste). Don't ask about things you could reasonably decide yourself.

- Timing and Clarity problems are usually fixed in the forge itself: cut filler, move negations, trim length. Ask about them only when the fix depends on the user's intent, such as which of two contradictory things they meant, or what should replace an excluded thing.
- Group the questions by trial, weakest trial first.
- Ask at most about 8 questions in a round. If more are needed, take the most important first and say more will follow.
- Offer 3-6 short options for each question where it helps (shot sizes, camera moves, light sources, pace), plus "or describe your own". Options make answering fast.
- If the user says "just pick" or "you decide", make strong, coherent choices, mark each assumption in [square brackets] in the forged prompt, and move on.

### 5. The forge

Build the final prompt from the original plus the answers:

- Remove filler and quality tags that change nothing on screen.
- Move negations out of the prompt into the avoid list, and rephrase them positively where possible: "no cars" becomes "an empty street".
- Turn feelings into visible things (posture, framing, light, pace).
- Resolve contradictions. Ask if the fix isn't obvious.
- Fit the length to the model's word range and the action to the duration.
- Follow the model's habits from `references/models.md`, such as bracketed camera commands for Hailuo, motion-only prompts for Runway image-to-video, and quoted dialogue with a named speaker for Veo and Sora.

Offer two formats and default to the paragraph:

- **Paragraph.** Camera first, then subject and action, then setting, light, style, timing, and audio last. Use plain descriptive sentences.
- **Shot sheet.** Labeled lines (SCENE, SHOT, CAMERA, SUBJECT, ACTION, SETTING, LIGHTING, STYLE, AUDIO, TIMING), for users who iterate field by field or for models that like structure.

Give the **avoid list** as one comma-separated line. Include the extracted negations plus defaults suited to the hazards found (warped hands, extra fingers, morphing, garbled text, flicker, watermark, duplicate subjects). If the model has no negative field, say so, and present the list as a checklist for reviewing takes.

Put the forged prompt and the avoid list in their own code blocks so they're easy to copy.

### 6. The rematch

Re-score the forged prompt with the same rubric and show the change ("Raw 34 → Forged 82"), plus any trials that are still weak. If something is still under 7 because the user hasn't answered, say what single answer would fix it. Offer another round, or offer variations: an alternate camera, a vertical version, or a version split into separate shots.

## Output format for a gauntlet run

Use this layout, kept tight:

```
## ⚔ PROMPT GAUNTLET — Take 1
**Target:** Veo 3 · 8s · 16:9 · text-to-video · audio on   (assumed: …)

### Verdict: 34/100 — FALLEN

| Trial | Score | Finding |
|---|---|---|
| T01 Subject | 3/10 | "a woman": no age, wardrobe, or anything visible |
| … | … | … |

### The interrogation
**Action (1/10)**
1. What does she do over the 8 seconds? e.g. walks, stops at a crossing, looks up …
…
```

After the user answers, reply with **The forge** (prompt and avoid list in code blocks) and **The rematch** (new score and remaining notes).

## Optional: the interactive gauntlet

`assets/prompt-gauntlet.html` is a self-contained interactive version of this tool. It runs the same ten trials with live scoring and click-to-answer chips, builds the forged prompt and avoid list, and keeps a take log. If the user wants to work through prompts by clicking instead of chatting, or wants a tool to keep, render or publish that file as an artifact without changing it. Its built-in "judge" uses Claude when it's opened on claude.ai. Mention it once, in one line at the end of the first gauntlet reply. Don't push it.
