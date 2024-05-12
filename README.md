# Legend Of Zelda - CS50 Version

## Introduction

This is a simplified version of the classic game "The Legend of Zelda" developed as part of the CS50 Introduction to Game Development course. In this game, players control a character who must navigate through dungeons, defeat enemies, and solve puzzles to progress.

![zelda](https://github.com/najlae01/zelda/assets/88176530/a004ac3e-ca2f-452d-93a1-8b9db8860795)

## Features

- Top-down view reminiscent of classic Zelda games.
- Player movement and interaction with objects and enemies.
- Basic combat system with sword attacks.
- Dungeon exploration with multiple rooms and obstacles.
- Collectible items and power-ups.
- Heart system for player health.

## Additional Features (from Game Dev Specifications)

1. **Healing Hearts**: Implement hearts that sometimes drop from vanquished enemies at random, which will heal the player for a full heart when picked up (consumed). 

2. **Carrying and Throwing Pots**: Add pots to the game world that the player can pick up, carry over his head, and throw at walls or enemies. When thrown, the pot should disappear upon collision with a wall or enemy, inflicting damage on enemies.

These additional features are not implemented in this version but can be considered for future development.

## Controls

- Arrow keys: Move the player character.
- Spacebar: Attack with the sword or throw pots (if carried).
- Enter/Return: Pick up pots (if carried).

## Installation

To run the game, ensure you have Love2D framework installed on your system. You can download Love2D from [the official website](https://love2d.org/).

Clone this repository to your local machine:

```
git clone https://github.com/najlae01/zelda
```

## Usage

Navigate to the project directory and run the game with Love2D:

```
cd zelda
```
```
love .
```

## Credits

- Developed with Love2D (Lua) as part of the CS50 Introduction to Game Development course.
- Game development specifications and guidance provided by CS50 team.
