-- Load libs
require("libs.AnAL") -- Library for animations (is there another one?)

-- Base classes
require("game")        -- Basic game handling
require("static")      -- Static functions and variables
require("console")     -- Game console TODO
require("debug-print") -- Debug output functions

-- Load Controller classes
require("lua-ctl/controller")          -- General controller class
require("lua-ctl/controller-keyboard") -- Keyboard compatibility
require("lua-ctl/controller-xbox")     -- Xbox gamepad compat

-- States and scenes
require("game-state")             -- Class holding the game state (everything after starting new game)
require("lua-scenes.scene-title") -- Scene for the titles and the "press start"

-- Load Player
require("lua-player.player")          -- Player class
require("lua-player.player-weapons")  -- Player weapons system
require("lua-player.player-movement") -- Player movement

-- Load Entities
require("lua-ent.director")                     -- The director that controls the waves :)
require("lua-ent.entity")                       -- Generic entity that may appear in the game area
require("lua-ent.enemy")                        -- Generic enemy
require("lua-ent.enemies.enemy-asteroid")       -- Medium Asteroid
require("lua-ent.enemies.enemy-asteroid-small") -- Small Asteroid
require("lua-ent.enemies.enemy-medium")         -- Medium shooty enemy
require("lua-ent.enemies.enemy-simu-med")       -- Medium simu shooty enemy
require("lua-ent.enemies.enemy-mine")           -- Mine enemy
require("lua-ent.powerup")                      -- Generic powerup that may be picked up
require("lua-ent.powerups.powerup-hp")          -- Health powerup
require("lua-ent.powerups.powerup-hp-full")     -- Full Health powerup
require("lua-ent.powerups.powerup-sp")          -- Shield powerup
require("lua-ent.powerups.powerup-sp-full")     -- Full Shield powerup
require("lua-ent.powerups.powerup-pp")          -- Energy powerup
require("lua-ent.powerups.powerup-pp-full")     -- Full Energy powerup

-- Load Ships
require("lua-ent.ship")          -- Prototype ship class
require("lua-ent.ships.arrow")   -- The main ship in the game
require("lua-ent.ships.dart")    -- PIECES OF UTTER
require("lua-ent.ships.javelin") -- MEGA USELESSNESS

-- Load Particle Systems
require("lua-part.bullet-system")
require("lua-part.bullet")
require("lua-part.bullets.bullet-hammer")
require("lua-part.explosion")
require("lua-part.explosions.explosion-hit")
require("lua-part.explosions.explosion-med")
require("lua-part.emitter")
require("lua-part.particle")

-- Load Emitters
require("lua-part.emitters.emitter-exhaust")
require("lua-part.emitters.emitter-explosion")

-- Load Particles
require("lua-part.particles.particle-small-fire")

-- Aditional Visual Elements
require("lua-bg.background")
require("lua-bg.back-space-proto")
require("lua-bg.back-nebula")
require("lua-bg.back-eagle")
require("lua-bg.back-simu")
require("lua-gui.gui")
require("lua-gui.gui-fonts")
--require("shader")

-- Weapons
require("lua-we.weapon")
require("lua-we.weapon-hammer")

-- Load sounds
require("lua-snd.TEsound")
require("lua-snd.msm")
require("lua-snd.music")
require("lua-snd.sound")

-- Class system and post processing
Class = require "libs.hump.class"
shine = require "libs.shine"
