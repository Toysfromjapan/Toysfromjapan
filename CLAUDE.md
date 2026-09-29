# Project notes

## illusion/
Daily bistable "spinning dots" reels (kinetic depth effect), rendered procedurally, not with AI video.
- Render: `pip install -r illusion/requirements.txt && python3 illusion/spin.py [--shape torus] [--out x.mp4]`
- Output: 1080x1920, 30 fps, 10 s seamless loop (one full turn). Shape rotates daily by date seed.
- Rules that keep the illusion working: orthographic projection, equal dot size and brightness, no shading or depth fog.
- Style: no em dashes in captions or docs.
