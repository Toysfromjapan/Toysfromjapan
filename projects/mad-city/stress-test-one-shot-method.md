# MAD City vs the "AI makes an anime in one shot" method

Source: YouTube video 9Y1A2nw_Veg (transcript pasted by the user, 2026-10-16). Sponsored by Higgsfield.

## The method in the video, as a checklist
1. One master prompt to an LLM (Gemini Pro): "award-winning short anime story, 3 minutes = 36 shots of 5 seconds; write a first-frame image prompt per shot; frames will be animated in Higgsfield Cinema Studio; good visuals, character designs and story."
2. The LLM writes a concept and the shot list. It stopped after 12 shots (Act 1), so Acts 2 and 3 needed follow-up prompts.
3. One first-frame still per shot from an image model (Nano Banana Pro). The aspect ratio (21:9 for Cinema Studio) was forgotten and had to be fixed.
4. Quick visual review: consistency mostly good, but duplicate main characters in one frame and some frames in a different art style.
5. Animate in Cinema Studio: video tab, upload the start frame, motion prompt, audio on, duration, camera movement preset.
6. Assemble in DaVinci Resolve.

## Where it is strong
- Speed: zero human decisions, one prompt drives everything.
- A fixed shot grid (36 x 5 s) makes the whole film plannable and budgetable up front.
- Start frame per shot, then animate: the same backbone as our pipeline.
- Cinema Studio camera presets remove a common failure (vague camera language).

## Where it breaks (and which of our gates catches it)
| Failure seen in the video | Cause | Our gate |
|---|---|---|
| Two copies of the main character in one frame | No locked character description or reference image | 1 Bible check |
| Frames from "a different anime" | No locked style block repeated in every prompt | 1 Bible (style entry) |
| Wrong aspect ratio | Format not stated in the master prompt | 2 Scene plan |
| LLM stopped at Act 1 | Asked for too much in one reply | Master prompt asks for acts in sequence |
| Motion prompts never checked | No review step before render | 3 Prompt Gauntlet |
| "I think this will do" | No rejection criteria | 6 Shot QC |

## Alternative master prompt (video method plus our gates)
Fill the bracketed parts from the MAD City baseline. Works in Claude or Gemini.

```
You are the showrunner for MAD City, [ONE-LINE PREMISE].
Format: [GRAPHIC NOVEL PAGES or ANIMATED SHORT]. Aspect ratio [21:9 / 16:9 / 9:16 / page 2:3].
Length: [N] shots of [5] seconds (or [N] pages of [K] panels).

LOCKED STYLE (repeat word for word in every image prompt):
[STYLE BLOCK: medium, line, palette, lighting, film or print texture]

LOCKED CHARACTERS (repeat the relevant block word for word whenever the character appears; never show the same character twice in one frame):
[NAME]: [BIBLE PROMPT BLOCK]
[NAME]: [BIBLE PROMPT BLOCK]

LOCKED LOCATIONS:
[NAME]: [BIBLE PROMPT BLOCK]

Task, in this order, one act per reply, stop after each act and wait for "next":
1. Logline, theme, and a 3-act outline (3 to 5 lines per act).
2. For the current act, a shot table with columns:
   shot | seconds | characters | location | framing | camera move | action beats | sound | first-frame image prompt | motion prompt
   - First-frame prompt: style block + character blocks + location block + composition. Name exactly who is in frame and how many people.
   - Motion prompt: camera move first, then one clear action per 3 seconds, then sound. No text on screen.
3. After the table, list continuity risks for that act (wardrobe changes, props, time of day).
```

## Next
Needs the MAD City baseline (premise, characters, style, any existing prompts) to fill the brackets and score the plan against the checklist.
