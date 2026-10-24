# Image & Video Processing – Motion Detection and Video Restoration (MATLAB)

![MATLAB](https://img.shields.io/badge/MATLAB-0076A8?logo=mathworks&logoColor=white)
![Image Processing](https://img.shields.io/badge/Image%20Processing-555)

Two video-processing challenges solved in MATLAB with classic pixel-level techniques (no machine learning). Each script splits a video into frames, processes every frame, and writes a new video.

---

## Challenge 1 – Detecting moving balls (`ch1.m`)

**Goal:** highlight the moving objects (balls) in a video filmed with a fixed camera.

**Approach**
1. Extract all frames of the input video as images.
2. **Rebuild a clean background** by combining frames taken at different moments (1, 2, 61 and 211). Each subtraction removes what moved between those frames, which leaves only the static scene.
3. For every frame, mark each pixel that is noticeably brighter than the background (threshold +29) and colour it **red**.
4. Re-assemble the frames into an output video (`boules_detectees`) where the balls appear in red.

**Techniques:** background estimation · frame differencing · thresholding · pixel-wise colour masking

## Challenge 2 – Removing noise from a damaged video (`ch2.m`)

**Goal:** clean an old-style video affected by dark spots and flicker that appear on single frames.

**Approach**
1. Extract the frames and convert them to **grayscale**.
2. The user enters the start and end frame of each scene, so that filtering never mixes two different shots.
3. Inside a scene, apply a **temporal max filter**: each pixel takes the brightest value among the current frame and its two neighbours. Dark defects that last only one frame disappear, while the static image is preserved. The first and last frames of a scene use their two following or two previous frames.
4. Write the restored frames to `video_corrige.mp4`.

**Techniques:** colour-to-grayscale conversion · temporal (inter-frame) filtering · scene-aware processing · video I/O with `VideoReader` / `VideoWriter`

## How to run

1. Open the script in MATLAB with the Image Processing Toolbox installed.
2. Put the input video (`challenge.mp4` for challenge 1, `defi.mp4` for challenge 2) next to the script.
3. Replace the hard-coded `C:\Users\...` folders with folders on your machine (the scripts write intermediate frames to disk).
4. Run the script. Challenge 2 asks for the start and end frame of each scene in the command window.

> Input videos aren't included in the repository because of their size. Comments are in French.

## Author

**Mohammed Anes Boucetla** – Image & Video Processing coursework · [github.com/moxaness](https://github.com/moxaness)
