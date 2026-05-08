# League of Dodging Game
A fan-made 2D dodge survival game inspired by League of Legends, built with Godot Engine v4.6.2.


# About the Game
League of Dodging is a 2D top-down survival game where the player must dodge various projectiles for as long as possible. The longer you survive, the higher your score and the harder it gets!

This project was developed as a school project for learning purposes using the Godot Engine.


# How to Play
- Use the Arrow Keys to move your character
- Dodge all incoming projectiles
- Survive as long as possible to get the highest score
- One hit = Game Over


# Projectiles
Projectile and Behavior 
Bomb - Randomly spawns on the map, explodes after 5-8 seconds 
Rocket - Spawns from the edges of the map and travels across 
Rolling Bomb - Rolls across the map from random directions, explodes on timer 
Skull - Homing projectile that chases the player, disappears after 8-10 seconds 
Explosion - Visual effect triggered by Bomb and Rolling Bomb 


# Difficulty Scaling
The game gets progressively harder over time:
- Projectiles spawn more frequently


# Project Structure
```
res://
├── assets/
│   ├── background/       # Map background image
│   ├── character/
│   │   ├── idle/         # Idle sprites (4 directions)
│   │   └── run/          # Run sprites (4 directions)
│   ├── music/            # Background music
│   ├── projectiles/    
│   │   ├── Bomb/
│   │   ├── Explosion/
│   │   ├── RocketBlue/
│   │   ├── RocketRed/
│   │   ├── RollingBomb/
│   │   └── Skull/
│   ├── sfx/              # Sound effects 
│   └── ui/               # Game Over and Start Screen assets
│       └── countdown/    # Count down PNG's
├── scenes/
│   ├── Main.tscn         # Main game scene
│   ├── Player.tscn       # Player character
│   ├── Bomb.tscn
│   ├── Explosion.tscn
│   ├── Rocket.tscn
│   ├── RollingBomb.tscn
│   ├── Skull.tscn
│   ├── GameOver.tscn
│   └── StartScreen.tscn
└── scripts/
    ├── main.gd
    ├── player.gd
    ├── bomb.gd
    ├── explosion.gd
    ├── rocket.gd
    ├── rolling_bomb.gd
    ├── skull.gd
    ├── spawner.gd
    ├── game_manager.gd
    ├── game_over.gd
    ├── hud.gd
    └── start_screen.gd
```


# Built With
- Godot Engine v4.6.2 (Steam)
- GDScript
- Art assets inspired by League of Legends (for educational purposes only)


# Disclaimer
This is a fan-made project developed for school/educational purposes only. It is not for commercial use or public distribution. All League of Legends related assets belong to Riot Games.


# Developer
Developed by Reymart V. Goc-ong BSCS 3-1
COSC 106 MID-TERM LABORATORY — Game Development using Godot Engine
