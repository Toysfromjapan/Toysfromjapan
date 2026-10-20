# MAD City vs the "AI makes an anime in one shot" method

Source: YouTube video 9Y1A2nw_Veg (transcript pasted by the user, 2026-10-16). Sponsored by Higgsfield.
Baseline: the doc "MAD CITY — Master Chronology", tabs Story by Chapter and Character Charts (read 2026-10-16), Chapters 1 and 2.

## The method in the video, as a checklist
1. One master prompt to an LLM: "award-winning short anime, 36 shots of 5 seconds, a first-frame image prompt per shot, frames animated in Higgsfield Cinema Studio."
2. The LLM writes concept and shot list. It stopped at Act 1; Acts 2 and 3 needed follow-ups.
3. One first-frame still per shot (Nano Banana Pro). Aspect ratio forgotten.
4. Quick review: duplicate main character in one frame, some frames in a different art style, accepted anyway.
5. Animate each still in Cinema Studio: start frame, motion prompt, audio, duration, camera preset.
6. Assemble in DaVinci Resolve.

## Scoring the MAD City baseline (Chapters 1 and 2) against it
| Step in the video | MAD City today | Verdict |
|---|---|---|
| Story and script | Ch1 has 8 beats, Ch2 has 16 beats plus Malcolm's interludes, hidden truths marked in italics, continuity rules (hair as a clock, the water drop, Stacks vs Surface ages) | Far ahead of the video |
| Shot or panel grid | No page count, no panels per page | Missing |
| Format and aspect | Graphic novel, page size and reading direction not set | Missing |
| Art style lock | Not defined anywhere | Missing, the video's main failure |
| Character visuals | Sho partly (bald in Ch1, smoker, Gash tin); Kira only "mixed race, deaf"; Cam, Malcolm blank | Mostly missing |
| Location visuals | The Stacks, the Surface, the Clinic, the Spire named but not described | Missing |
| Per-frame prompts | None yet | Not started |
| Review criteria | Character Charts tab lists what each chart needs | Partly there |

Takeaway: MAD City is story-rich and visual-poor. The video is the opposite: its story was generic, but it got to pictures in one sitting because it let the LLM decide every visual. The alternative below keeps your story fixed and borrows the video's speed for the visual blanks, with an approval stop before anything is drawn.

## Alternative master prompt: MAD City, Chapters 1 and 2
Paste into Claude or Gemini. Fixed parts come from the Master Chronology; bracketed parts are your choices.

```
You are the art director and panel planner for MAD CITY, a graphic novel.
Premise: in Mad City, metahuman children taken in "the Great Divergence" grow up in the Stacks below and the Surface above, controlled by an AI that builds human "shells". Sho, 19, a Gash dealer, is slowly waking up; Kira, deaf and telepathic, is trying to wake him.
Format: graphic novel pages, [6.625 x 10.25 in portrait], read left to right. Chapter 1 = [10] pages, Chapter 2 = [22] pages. 3 to 6 panels per page; splash pages allowed for the mushroom cloud and the black page.

RULES YOU MUST KEEP
- Events, order and dialogue below are fixed. Do not add plot.
- Items marked HIDDEN are true but must never be shown or hinted visually yet.
- Sho's hair is the story's clock: shaved bald on page 1 of Ch1, grown back after the black page, longer through Ch2's time skip.
- The water drop is a motif: on his forehead in Ch1, from the AC unit in Ch2. Draw it the same way both times.
- Never draw the same character twice in one panel.
- No on-panel text except speech balloons and captions I approve; no signage text.

CHAPTER 1: HOUR ZERO (fixed beats)
1 Sho wakes at 10:47 AM and shaves his head bald. 2 TV: 8th Divergence anniversary broadcast. 3 Empty Gash tin; he smokes a cigarette and thinks. 4 Emergency countdown on every channel. 5 Mushroom-shaped cloud at midday, no heat. 6 The wave hits, everyone drops; Kira, there to rescue him, stays standing across from his window; he doesn't see her. 7 Black page; water drips on his forehead. 8 He wakes as if from a dream, hair grown back, a crack in the window: "...I need to get going."

CHAPTER 2: CAM (fixed beats)
1 Cam's graduation monologue. 2 A letter offers Cam a job in Mad City, recommended by his cousin Sho (HIDDEN: the system sent it). 3 Cam finds Sho in an altered state. 4 Cam thanks Sho; Sho never says he didn't send it. 5 Time skip of months: Gash, Surface parties 2 to 3 nights a week, the business grows (HIDDEN: the Spirit keeps them alive). 6 Cam forgets why he came. 7 Kira watches from the shadows. 8 Kira speaks into Sho's mind while he deals: "Sho, wake up please." 9 He looks up, startled. 10 "Sho, please wake up. They poison your mind. You are strong. Wake up, wake up." Cut. 11 Morning, the AC water drop: "Was that a dream?" 12 Cam is gone. 13 Sho skips the Gash and searches. 14 Fight with rival Gash sellers; Cam dies. 15 Kira drags Sho out. 16 Kira is arrested, sent to the Clinic, beaten; the treatment fails on her.
Interludes: Agent Malcolm Carter's missing-persons monologue on Cam's case, cutting between Cam's pages.

CANON VISUALS (keep): Sho: 19, heavy smoker, nicotine-stained fingers and small burns, holds the Gash tin differently from cigarettes, rappels from the Stacks to the Surface. Kira: ~19, mixed race, deaf. Cam: 18, an outsider, declines over months. Malcolm: ~30, holster and gun, Seiko watch.

WORK IN THIS ORDER. Stop after each step and wait for "approved".
STEP 0, LOCKS (propose, I approve):
  a. Art style block, one paragraph I will paste into every image prompt: medium, line, inking, palette with hex values, lighting, texture.
  b. A character block for Sho, Kira, Cam and Malcolm filling every blank: ethnicity, build, height, face, marks, hair, wardrobe, palette. Two options each where I have not decided.
  c. A location block for Sho's apartment, the Stacks, the Surface, the Clinic exterior.
  d. How Kira's telepathy looks on the page (balloon shape, color, lettering).
STEP 1, CHAPTER 1 PAGE PLAN: a table: page | panel | beat number | characters (exact count) | location | shot size and angle | what happens | caption or balloon text | image prompt. Each image prompt = style block + character blocks + location block + the panel's composition.
STEP 2, CHAPTER 2 PAGE PLAN, pages 1 to 11, same table.
STEP 3, CHAPTER 2 PAGE PLAN, pages 12 to 22, same table.
After every step list continuity risks: hair length, wardrobe, the water drop, HIDDEN items leaking.
```

## What the alternative changes compared with the video
| Video | Alternative |
|---|---|
| LLM invents the story | Story fixed from your chronology; LLM only plans panels |
| Visuals decided silently inside each prompt | Step 0 proposes visual locks for your approval first |
| One request for everything, stalled at Act 1 | Four steps, one reply each |
| Aspect ratio forgotten | Page size and panel counts stated up front |
| Duplicate characters, style drift | Repeated style and character blocks plus "never twice in one panel" |
| No spoiler control | HIDDEN items barred from the art |

Open choices for the user (the bracketed values): page size, page counts per chapter, and whether MAD City stays print-only or also becomes a motion comic (then each panel gets a motion prompt and goes through the Prompt Gauntlet).
