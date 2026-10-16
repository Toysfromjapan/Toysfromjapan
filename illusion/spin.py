"""Bistable rotating dot-shape generator (kinetic depth effect).

Dots are projected orthographically with uniform size and brightness, so the
brain gets no depth cue and the spin direction is ambiguous: viewers can flip
it at will. Adding perspective, shading or size falloff breaks the illusion.

Usage:
  python3 spin.py                     # shape picked from today's date
  python3 spin.py --shape torus --seed 7 --out out.mp4
"""
import argparse
import datetime
import math

import imageio.v2 as imageio
import numpy as np
from PIL import Image, ImageDraw

W, H = 1080, 1920  # 9:16 for Reels / TikTok
SS = 2             # supersampling for smooth dots


def sphere(n=700, **_):
    i = np.arange(n) + 0.5
    phi = np.arccos(1 - 2 * i / n)
    th = math.pi * (1 + 5 ** 0.5) * i
    return np.c_[np.cos(th) * np.sin(phi), np.cos(phi), np.sin(th) * np.sin(phi)]


def torus(n=900, R=1.0, r=0.4, **_):
    u = np.linspace(0, 2 * np.pi, 45, endpoint=False)
    v = np.linspace(0, 2 * np.pi, 20, endpoint=False)
    u, v = np.meshgrid(u, v)
    x = (R + r * np.cos(v)) * np.cos(u)
    z = (R + r * np.cos(v)) * np.sin(u)
    y = r * np.sin(v)
    return np.c_[x.ravel(), y.ravel(), z.ravel()] / (R + r)


def cube(n=10, **_):
    g = np.linspace(-1, 1, n)
    pts = [(x, y, z) for x in g for y in g for z in g
           if sum(abs(c) == 1 for c in (x, y, z)) >= 2]  # edges only
    return np.array(pts) / math.sqrt(3) * 1.3


def helix(n=400, **_):
    t = np.linspace(0, 6 * np.pi, n // 2)
    y = np.linspace(-1, 1, n // 2)
    a = np.c_[0.5 * np.cos(t), y, 0.5 * np.sin(t)]
    b = np.c_[0.5 * np.cos(t + np.pi), y, 0.5 * np.sin(t + np.pi)]
    return np.r_[a, b]


def knot(n=600, p=2, q=3, **_):
    t = np.linspace(0, 2 * np.pi, n, endpoint=False)
    r = np.cos(q * t) + 2
    return np.c_[r * np.cos(p * t), -np.sin(q * t), r * np.sin(p * t)] / 3


def rings(n=8, **_):
    pts = []
    for k in range(n):
        a = math.pi * k / n
        t = np.linspace(0, 2 * np.pi, 70, endpoint=False)
        ring = np.c_[np.cos(t), np.sin(t), np.zeros_like(t)]
        c, s = math.cos(a), math.sin(a)
        pts.append(ring @ np.array([[c, 0, s], [0, 1, 0], [-s, 0, c]]))
    return np.vstack(pts)


SHAPES = {f.__name__: f for f in (sphere, torus, cube, helix, knot, rings)}


def rot_x(a):
    c, s = math.cos(a), math.sin(a)
    return np.array([[1, 0, 0], [0, c, -s], [0, s, c]])


def rot_y(a):
    c, s = math.cos(a), math.sin(a)
    return np.array([[c, 0, s], [0, 1, 0], [-s, 0, c]])


def render(shape, out, seconds=10, fps=30, tilt_deg=15, dot=7, color=(255, 255, 255)):
    pts = SHAPES[shape]()
    frames = seconds * fps
    scale = W * 0.38 * SS
    cx, cy = W * SS / 2, H * SS / 2
    r = dot * SS / 2
    tilt = rot_x(math.radians(tilt_deg))
    with imageio.get_writer(out, fps=fps, codec="libx264", quality=9,
                            macro_block_size=8, pixelformat="yuv420p") as wr:
        for f in range(frames):
            # One full turn per loop, so the clip repeats seamlessly.
            p = pts @ rot_y(2 * math.pi * f / frames).T @ tilt.T
            img = Image.new("RGB", (W * SS, H * SS), (0, 0, 0))
            d = ImageDraw.Draw(img)
            for x, y in zip(p[:, 0] * scale + cx, -p[:, 1] * scale + cy):
                d.ellipse((x - r, y - r, x + r, y + r), fill=color)
            wr.append_data(np.asarray(img.resize((W, H), Image.LANCZOS)))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--shape", choices=SHAPES)
    ap.add_argument("--seed", type=int, default=datetime.date.today().toordinal())
    ap.add_argument("--seconds", type=int, default=10)
    ap.add_argument("--out", default="spin.mp4")
    a = ap.parse_args()
    shape = a.shape or sorted(SHAPES)[a.seed % len(SHAPES)]
    render(shape, a.out, seconds=a.seconds)
    print(shape, a.out)
