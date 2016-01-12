-- Load libs
require("libs.AnAL") -- Library for animations (is there another one?)

-- Base classes
require("game")        -- Basic game handling
require("static")      -- Static functions and variables
require("console")     -- Game console TODO
require("debug-print") -- Debug output functions

-- Load Controller classes
require("lua-ctl/controller")      -- General controller class
require("lua-ctl/controller-xbox") -- Xbox gamepad compat

-- States and scenes
require("game-state")
require("lua-scenes.scene-title")

-- Load Player
require("lua-player.player")
require("lua-player.player-weapons")
require("lua-player.player-movement")

-- Load Entities
require("lua-ent.director")
require("lua-ent.entity")
require("lua-ent.enemy")
require("lua-ent.enemies.enemy-asteroid")
require("lua-ent.enemies.enemy-asteroid-small")
require("lua-ent.enemies.enemy-medium")
require("lua-ent.enemies.enemy-mine")
require("lua-ent.powerup")
require("lua-ent.powerups.powerup-hp")
require("lua-ent.powerups.powerup-hp-full")
require("lua-ent.powerups.powerup-sp")
require("lua-ent.powerups.powerup-sp-full")
require("lua-ent.powerups.powerup-pp")
require("lua-ent.powerups.powerup-pp-full")

-- Load Ships
require("lua-ent.ship")
require("lua-ent.ships.arrow")
require("lua-ent.ships.dart")
require("lua-ent.ships.javelin")

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
