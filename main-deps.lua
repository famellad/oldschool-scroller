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
require("lua-part.bullet-system")            -- Bullet system class, for all your bullet needs
require("lua-part.bullet")                   -- A single individual bullet (Prototype)
require("lua-part.bullets.bullet-hammer")    -- Hammer bullets
require("lua-part.explosion")                -- Prototype explosion
require("lua-part.explosions.explosion-hit") -- Bullet hit
require("lua-part.explosions.explosion-med") -- Medium sized explosion
require("lua-part.emitter")                  -- Particle emitter
require("lua-part.particle")                 -- A single particle (prototype)

-- Load Emitters
require("lua-part.emitters.emitter-exhaust")   -- Fire-like emitter
require("lua-part.emitters.emitter-explosion") -- Hot red debris flying off in every direction

-- Load Particles
require("lua-part.particles.particle-small-fire") -- A small particle that goes from bright orange to dim red

-- Aditional Visual Elements
require("lua-bg.background")       -- The backdrop (prototype)
require("lua-bg.back-space-proto") -- Prototypical backdrop for space scenes
require("lua-bg.back-nebula")      -- Green nebula backdrop
require("lua-bg.back-eagle")       -- Red nebula backdrop
require("lua-bg.back-simu")        -- Simulation backdrop
require("lua-gui.gui")             -- The GUI-HUD thing
require("lua-gui.gui-fonts")       -- All them fonts
--require("shader")

-- Weapons
require("lua-we.weapon")        -- Prototype weapon
require("lua-we.weapon-hammer") -- Hammer weapon

-- Load sounds
require("lua-snd.TEsound") -- Class for controlling once-sounds
--require("lua-snd.msm")
require("lua-snd.music")   -- Class for musics
require("lua-snd.sound")   -- I don't know what this does TODO

-- Class system and post processing
Class = require "libs.hump.class" -- I don't think these do anything
shine = require "libs.shine"
