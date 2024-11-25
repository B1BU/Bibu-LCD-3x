# Bibu LCD 3x

This repository contains my attempt at an LCD shader for [Magpie](https://github.com/Blinue/Magpie) inspired by the feel of playing a game on a Nintendo DS. It is intended for low resolution games using 3x scaling.

## Preview

![Shader Screenshot Example](https://github.com/B1BU/Bibu-LCD-3x/raw/main/assets/Shader-Screenshot-Example.png)
![Shader Screenshot](https://github.com/B1BU/Bibu-LCD-3x/raw/main/assets/Shader-Screenshot-2.png)
Screenshots from [Hardcoded](https://store.steampowered.com/app/2693710/HARDCODED), a queer NSFW game. Sorry, it was the only game I could find to use as an example.

## Installation

1. Download and extract [Magpie](https://github.com/Blinue/Magpie/releases).
2. Drop [Bibu_LCD_3x.hlsl](https://github.com/B1BU/Bibu-LCD-3x/releases) into the **effects** folder inside of your Magpie folder.
3. Create a new scaling mode with the **Bibu_LCD_3x** effect.
	- If you want a pixel-perfect look, set the scaling type to **Factor** and adjust the scaling factors accordingly.
	- If you want the program to fit to the screen, set the scaling type to **Adjust**.
4. Make a profile for the program you want to use the effect with and set the scaling mode to the one you created.
5. Press the **Scale** keybind from Magpie in the program you configured to make it fullscreen.

## Notes

- I had no experience with shaders prior to the making of this project, so I made heavy use of Chat GPT to get it to a working state. Things may not be perfect.

## Usage

Feel free to use this shader however you like. Credit isn't required, but would be appreciated when sharing or using it publicly.
