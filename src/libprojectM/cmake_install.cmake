# Install script for directory: /Users/clangen/src/projectM-musikcube/src/libprojectM

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/Resources/fonts/VeraMono.ttf")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/Resources/fonts" TYPE FILE FILES "/Users/clangen/src/projectM-musikcube/src/libprojectM/fonts/VeraMono.ttf")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/Resources/fonts/VeraMono.ttf")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/Resources/fonts" TYPE FILE FILES "/Users/clangen/src/projectM-musikcube/src/libprojectM/fonts/VeraMono.ttf")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/projectM/presets/Aderrasi - Agitator.milk;/usr/local/share/projectM/presets/Aderrasi - Aimless (Gravity Directive Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Aimless (Spirogravity Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Airhandler (Menagerie Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Airs (Windy Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Airs.milk;/usr/local/share/projectM/presets/Aderrasi - Anchorpulse (Pulse Of A Ghast II Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Anchorpulse (Verified Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Anomalous Material Science (Pure Splinter Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Antidote (Aqualung Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Antidote (Side Effects Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Antidote.milk;/usr/local/share/projectM/presets/Aderrasi - Antique Abyss.milk;/usr/local/share/projectM/presets/Aderrasi - Arise! (Padded Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Ashes Of Air (Remix).milk;/usr/local/share/projectM/presets/Aderrasi - Bitterfeld (Crystal Border Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Blender.milk;/usr/local/share/projectM/presets/Aderrasi - Bow To Gravity.milk;/usr/local/share/projectM/presets/Aderrasi - Brakefreak.milk;/usr/local/share/projectM/presets/Aderrasi - Candy Avian.milk;/usr/local/share/projectM/presets/Aderrasi - Causeway Of Dreams (Nightmare Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Causeway Of Dreams (REMix).milk;/usr/local/share/projectM/presets/Aderrasi - Causeway Of Dreams.milk;/usr/local/share/projectM/presets/Aderrasi - Chromatic Abyss (The Other Side).milk;/usr/local/share/projectM/presets/Aderrasi - Circlefacade.milk;/usr/local/share/projectM/presets/Aderrasi - Contortion (Xenomorph Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Contortion.milk;/usr/local/share/projectM/presets/Aderrasi - Crystal Storm.milk;/usr/local/share/projectM/presets/Aderrasi - Dark Matter (Converse Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Elastoid.milk;/usr/local/share/projectM/presets/Aderrasi - Floater Society.milk;/usr/local/share/projectM/presets/Aderrasi - Flowing Form.milk;/usr/local/share/projectM/presets/Aderrasi - Making Time (Swamp Mix).milk;/usr/local/share/projectM/presets/Aderrasi - Multiviola.milk;/usr/local/share/projectM/presets/Aderrasi - Negative Sun III.milk;/usr/local/share/projectM/presets/Bmelgren & Krash - Rainbow Orb Peacock (Centred Journey Mix.milk;/usr/local/share/projectM/presets/Bmelgren & Krash - Rainbow Orb Peacock (Lonely Signal Gone .milk;/usr/local/share/projectM/presets/Bmelgren - Pentultimate Nerual Slipstream (Tweak 2).milk;/usr/local/share/projectM/presets/CatalystTheElder - Electric Rosebud_Phat_texture_edit.milk;/usr/local/share/projectM/presets/Che - Escape.milk;/usr/local/share/projectM/presets/Che - Terracarbon Stream.milk;/usr/local/share/projectM/presets/CrystalHigh - mad ravetriping.milk;/usr/local/share/projectM/presets/EMPR - Random - Changing Polyevolution.milk;/usr/local/share/projectM/presets/Eo.S. - skylight a3 [trip colors flux2]_phat_Multi_shaped2_zoe_colours5.milk;/usr/local/share/projectM/presets/Eo.S.+Phat Cool Bug_arm.milk;/usr/local/share/projectM/presets/Eo.S.+Phat Cool Bug_arm_textured.milk;/usr/local/share/projectM/presets/Eo.S.+Phat Fractical_dancer - pulsate B.milk;/usr/local/share/projectM/presets/Eo.S.+Phat Fractical_dancer - pulsate box_mix.milk;/usr/local/share/projectM/presets/Eo.S.+Phat Fractical_dancer_Peacock.milk;/usr/local/share/projectM/presets/Eo.s and PieturP - Starfield.milk;/usr/local/share/projectM/presets/EvilJim - Follow the ball.milk;/usr/local/share/projectM/presets/EvilJim - Ice Drops.milk;/usr/local/share/projectM/presets/Fvese - 0 To 60.milk;/usr/local/share/projectM/presets/Fvese - A Blur.milk;/usr/local/share/projectM/presets/Fvese - Lifesavor Anyone.milk;/usr/local/share/projectM/presets/Fvese - New meetings.milk;/usr/local/share/projectM/presets/Fvese - Quicksand.milk;/usr/local/share/projectM/presets/Fvese - Stand Still!.milk;/usr/local/share/projectM/presets/Fvese - The Tunnel (Final Stage Mix).milk;/usr/local/share/projectM/presets/Fvese - Window Reflection 6.milk;/usr/local/share/projectM/presets/Fvese - simple.milk;/usr/local/share/projectM/presets/Geiss & Rovastar - Notions Of Tonality 2.milk;/usr/local/share/projectM/presets/Geiss & Rovastar - Tokamak (Naked Intrusion Mix).milk;/usr/local/share/projectM/presets/Geiss - Blasto.milk;/usr/local/share/projectM/presets/Geiss - Cosmic Dust 2.milk;/usr/local/share/projectM/presets/Geiss - Cruzin'.milk;/usr/local/share/projectM/presets/Geiss - Downward Spiral.milk;/usr/local/share/projectM/presets/Geiss - Dynamic Swirls 1.milk;/usr/local/share/projectM/presets/Geiss - Dynamic Swirls 2.milk;/usr/local/share/projectM/presets/Geiss - Eddies 2.milk;/usr/local/share/projectM/presets/Geiss - Eggs.milk;/usr/local/share/projectM/presets/Geiss - El Cubismo.milk;/usr/local/share/projectM/presets/Geiss - Feedback 2.milk;/usr/local/share/projectM/presets/Geiss - High Dynamic Range.milk;/usr/local/share/projectM/presets/Geiss - Nautilus.milk;/usr/local/share/projectM/presets/Geiss - Octopus Ever Changing.milk;/usr/local/share/projectM/presets/Geiss - Octopus Gold.milk;/usr/local/share/projectM/presets/Geiss - Octopus.milk;/usr/local/share/projectM/presets/Geiss - Oldskool Mellowstyle.milk;/usr/local/share/projectM/presets/Geiss - Swirlie 1.milk;/usr/local/share/projectM/presets/Geiss - Swirlie 2.milk;/usr/local/share/projectM/presets/Geiss - Swirlie 3.milk;/usr/local/share/projectM/presets/Geiss - Swirlie 4.milk;/usr/local/share/projectM/presets/Geiss - Swirlie 5.milk;/usr/local/share/projectM/presets/Geiss - The Fatty Lumpkin Sunkle Tweaker.milk;/usr/local/share/projectM/presets/Geiss and Rovastar - The Chaos Of Colours (sprouting dimentia mix).milk;/usr/local/share/projectM/presets/Idiot & Rovastar - Altars Of Madness 2 (X.42 Mix).milk;/usr/local/share/projectM/presets/Idiot - MOTIVATION!.milk;/usr/local/share/projectM/presets/Idiot - Texture Boxes (Remix 2).milk;/usr/local/share/projectM/presets/Idiot - Texture Boxes (Remix).milk;/usr/local/share/projectM/presets/Idiot24-7 - Ascending to heaven 2.milk;/usr/local/share/projectM/presets/Illusion & Che - Return Of The King.milk;/usr/local/share/projectM/presets/Illusion & Che - The Piper.milk;/usr/local/share/projectM/presets/Illusion & Rovastar - Clouded Bottle.milk;/usr/local/share/projectM/presets/Illusion & Unchained - Frozen Eye 1.milk;/usr/local/share/projectM/presets/Illusion & Unchained - Invade My Mind.milk;/usr/local/share/projectM/presets/Illusion - Figure Eight.milk;/usr/local/share/projectM/presets/Jess - Trying To Trap A Twister.milk;/usr/local/share/projectM/presets/Krash & Illusion - Spiral Movement.milk;/usr/local/share/projectM/presets/Krash & Rovastar - Altars of Madness (Mad Ocean Mix).milk;/usr/local/share/projectM/presets/Krash & Rovastar - Cerebral Demons - Phat + Eo.S. Killer Death Bunny Remix.milk;/usr/local/share/projectM/presets/Krash & TEcHNO - Rhythmic Mantas.milk;/usr/local/share/projectM/presets/Krash - 3D Shapes Demo 2.milk;/usr/local/share/projectM/presets/Krash - 3D Shapes Demo.milk;/usr/local/share/projectM/presets/Krash - Digital Flame.milk;/usr/local/share/projectM/presets/Krash - Dynamic Borders 1.milk;/usr/local/share/projectM/presets/Krash - Framed Geometry.milk;/usr/local/share/projectM/presets/Krash - Interwoven (Nightmare Weft Mix).milk;/usr/local/share/projectM/presets/Krash - War Machine (Shifting Complexity Mix).milk;/usr/local/share/projectM/presets/Krash - Windowframe To Mega Swirl 2.milk;/usr/local/share/projectM/presets/Krash and Rovastar - Rainbow Orb 2 Peacock (Bmelgren's Comp.milk;/usr/local/share/projectM/presets/Krash and Rovastar - Rainbow Orb.milk;/usr/local/share/projectM/presets/Mstress & Darius - Pursuing The Sunset.milk;/usr/local/share/projectM/presets/Mstress & Juppy - Dancer.milk;/usr/local/share/projectM/presets/Mstress & Juppy - Dancers In The Dark.milk;/usr/local/share/projectM/presets/Phat_Eo.S. - our own personal demon.milk;/usr/local/share/projectM/presets/Phat_Eo.S._Algorithm.milk;/usr/local/share/projectM/presets/Phat_Eo.S_shoot_em_up.milk;/usr/local/share/projectM/presets/Phat_Rovastar - What_does_your_soul_look_like.milk;/usr/local/share/projectM/presets/Phat_Rovastar_Eo.S. spiral_faces.milk;/usr/local/share/projectM/presets/Pithlit & Illusion - Symetric pattern.milk;/usr/local/share/projectM/presets/Reenen - phoenix.milk;/usr/local/share/projectM/presets/Reenen Geiss - Triple Feedback.milk;/usr/local/share/projectM/presets/Reenen Geiss - Triple Feedback_phat+eos_edit.milk;/usr/local/share/projectM/presets/Rovastar & Aderrasi - Clockwork Organism.milk;/usr/local/share/projectM/presets/Rovastar & Fvese - Deadly Flower.milk;/usr/local/share/projectM/presets/Rovastar & Fvese - Stranger Minds (Astral Mix).milk;/usr/local/share/projectM/presets/Rovastar & Fvese - Stranger Minds.milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Broken Destiny Mix).milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Mysticial Awakening Mi.milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Poltergiest Mix).milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Twisted Truth Mix).milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Voyage Of Twisted Souls Mix).milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Hurricane Nightmare.milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Ice Planet.milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Notions Of Tonality.milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Octoplasm.milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Octotrip (MultiTrip Mix).milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Octotrip.milk;/usr/local/share/projectM/presets/Rovastar & Geiss - Surface (Vectrip Mix).milk;/usr/local/share/projectM/presets/Rovastar & Idiot24-7 - Balk Acid.milk;/usr/local/share/projectM/presets/Rovastar & Krash - Flowing Synergy.milk;/usr/local/share/projectM/presets/Rovastar & Krash - Interwoven (Contra Mix).milk;/usr/local/share/projectM/presets/Rovastar & Rocke - Headspin.milk;/usr/local/share/projectM/presets/Rovastar & Rocke - Sugar Spun Sister.milk;/usr/local/share/projectM/presets/Rovastar & StudioMusic - More Cherished Desires.milk;/usr/local/share/projectM/presets/Rovastar & StudioMusic - Twisted Spider Web.milk;/usr/local/share/projectM/presets/Rovastar & Telek - Altars of Madness (Rolling Oceans Mix).milk;/usr/local/share/projectM/presets/Rovastar & Telek - Cosmic Fireworks.milk;/usr/local/share/projectM/presets/Rovastar & Unchained - Centre Of Gravity.milk;/usr/local/share/projectM/presets/Rovastar - A Million Miles from Earth (Pathfinder Mix).milk;/usr/local/share/projectM/presets/Rovastar - A Million Miles from Earth.milk;/usr/local/share/projectM/presets/Rovastar - Altars Of Harlequin's Madness (Dark Disorder Mix.milk;/usr/local/share/projectM/presets/Rovastar - Altars Of Madness (A Million Miles From Earth Mi.milk;/usr/local/share/projectM/presets/Rovastar - Altars Of Madness (Duel Mix).milk;/usr/local/share/projectM/presets/Rovastar - Altars Of Madness (Surealist Mix).milk;/usr/local/share/projectM/presets/Rovastar - Altars Of Madness 4 (Spirit Of Twisted Madness Mix).milk;/usr/local/share/projectM/presets/Rovastar - Altars Of Madness.milk;/usr/local/share/projectM/presets/Rovastar - Attacking Freedom.milk;/usr/local/share/projectM/presets/Rovastar - Bellanova (New Wave Mix).milk;/usr/local/share/projectM/presets/Rovastar - Chapel Of Ghouls.milk;/usr/local/share/projectM/presets/Rovastar - Cosmic Echoes 1.milk;/usr/local/share/projectM/presets/Rovastar - Cosmic Echoes 2.milk;/usr/local/share/projectM/presets/Rovastar - Cosmic Mosaic (Active Mix).milk;/usr/local/share/projectM/presets/Rovastar - Decreasing Dreams (Extended Movement Mix).milk;/usr/local/share/projectM/presets/Rovastar - Decreasing Dreams (Increasing Memory Mix) .milk;/usr/local/share/projectM/presets/Rovastar - Explosive Minds.milk;/usr/local/share/projectM/presets/Rovastar - Eye On Reality (Mega 3 Mix)_phat_edit.milk;/usr/local/share/projectM/presets/Rovastar - Forgotten Moon.milk;/usr/local/share/projectM/presets/Rovastar - Fractopia (Fantic Dancing Lights Mix).milk;/usr/local/share/projectM/presets/Rovastar - Fractopia (Focused Childhood Mix ).milk;/usr/local/share/projectM/presets/Rovastar - Fractopia (Fractal Havok Mix).milk;/usr/local/share/projectM/presets/Rovastar - Fractopia (Upspoken Mix).milk;/usr/local/share/projectM/presets/Rovastar - Frozen Rapture .milk;/usr/local/share/projectM/presets/Rovastar - Future Speakers.milk;/usr/local/share/projectM/presets/Rovastar - Hallucinogenic Pyramids (Beat Time Mix).milk;/usr/local/share/projectM/presets/Rovastar - Harlequin's Dynamic Fractal (Crazed Spiral Mix).milk;/usr/local/share/projectM/presets/Rovastar - Harlequin's Fractal Encounter.milk;/usr/local/share/projectM/presets/Rovastar - Hyperspace (Frozen Rapture Mix).milk;/usr/local/share/projectM/presets/Rovastar - Hyperspace.milk;/usr/local/share/projectM/presets/Rovastar - Inner Thoughts (Clouded Judgement Mix).milk;/usr/local/share/projectM/presets/Rovastar - Inner Thoughts (Dark Secret Mix).milk;/usr/local/share/projectM/presets/Rovastar - Inner Thoughts (Distant Memories Mix).milk;/usr/local/share/projectM/presets/Rovastar - Inner Thoughts (Frantic Thoughts Mix).milk;/usr/local/share/projectM/presets/Rovastar - Inner Thoughts (Strange Cargo Mix).milk;/usr/local/share/projectM/presets/Rovastar - Kalideostars (Altars Of Madness MIx).milk;/usr/local/share/projectM/presets/Rovastar - Kalideostars (Round  Round Mix).milk;/usr/local/share/projectM/presets/Rovastar - Kalideostars.milk;/usr/local/share/projectM/presets/Rovastar - Magic Carpet.milk;/usr/local/share/projectM/presets/Rovastar - Multiverse Starfield 1.milk;/usr/local/share/projectM/presets/Rovastar - Multiverse Starfield 3.milk;/usr/local/share/projectM/presets/Rovastar - Omnipresence Resurrection.milk;/usr/local/share/projectM/presets/Rovastar - Pandora's Volcano.milk;/usr/local/share/projectM/presets/Rovastar - Parallel Universe.milk;/usr/local/share/projectM/presets/Rovastar - Sea Shells.milk;/usr/local/share/projectM/presets/Rovastar - Solarized Space (Space DNA Mix).milk;/usr/local/share/projectM/presets/Rovastar - Solarized Space.milk;/usr/local/share/projectM/presets/Rovastar - Space (Twisted Dimension Mix).milk;/usr/local/share/projectM/presets/Rovastar - Space.milk;/usr/local/share/projectM/presets/Rovastar - Sunflower Passion (Enlightment Mix)_Phat_edit.milk;/usr/local/share/projectM/presets/Rovastar - Sunflower Passion (Simple Mix).milk;/usr/local/share/projectM/presets/Rovastar - Sunflower Passion.milk;/usr/local/share/projectM/presets/Rovastar - The Awakening.milk;/usr/local/share/projectM/presets/Rovastar - The Chaos Of Colours (Drifting Mix).milk;/usr/local/share/projectM/presets/Rovastar - The Chaos Of Colours.milk;/usr/local/share/projectM/presets/Rovastar - The Shroomery.milk;/usr/local/share/projectM/presets/Rovastar - Timeless Voyage.milk;/usr/local/share/projectM/presets/Rovastar - Torrid Tales.milk;/usr/local/share/projectM/presets/Rovastar - Twilight Tunnel.milk;/usr/local/share/projectM/presets/Rovastar and Krash - Hallucinogenic Pyramids (Extra Beat Ti.milk;/usr/local/share/projectM/presets/Rovastar and Unchained - Braindance Visions.milk;/usr/local/share/projectM/presets/Rozzer & Neuro - Starover (Semicolon Mix).milk;/usr/local/share/projectM/presets/Rozzor & Aderrasi - Canon.milk;/usr/local/share/projectM/presets/Rozzor & Che - Inside The House Of Nil.milk;/usr/local/share/projectM/presets/Rozzor & Rovastar - Oozing Resistance (Waveform Mod).milk;/usr/local/share/projectM/presets/Rozzor & Shreyas - Deeper Aesthetics.milk;/usr/local/share/projectM/presets/Studio Music and Unchained - Rapid Alteration.milk;/usr/local/share/projectM/presets/StudioMusic & Unchained - Entity.milk;/usr/local/share/projectM/presets/StudioMusic & Unchained - Minor Alteration.milk;/usr/local/share/projectM/presets/StudioMusic & Unchained - Remembering How You Were (Perceived Mix).milk;/usr/local/share/projectM/presets/StudioMusic & Unchained - So Much Love.milk;/usr/local/share/projectM/presets/StudioMusic & Unchained - State Of Discretion.milk;/usr/local/share/projectM/presets/StudioMusic & Unchained - Wrenched Fate.milk;/usr/local/share/projectM/presets/StudioMusic - It's Only Make Believe.milk;/usr/local/share/projectM/presets/StudioMusic - Numerosity.milk;/usr/local/share/projectM/presets/Telek - Flicker.milk;/usr/local/share/projectM/presets/Telek - Slow Shift Matrix (bb4.5).milk;/usr/local/share/projectM/presets/Unchained & Illusion - Logic Morph.milk;/usr/local/share/projectM/presets/Unchained & Rovastar - For The Seagull.milk;/usr/local/share/projectM/presets/Unchained & Rovastar - Luckless.milk;/usr/local/share/projectM/presets/Unchained & Rovastar - Slow Solstice.milk;/usr/local/share/projectM/presets/Unchained & Rovastar - Triptionary.milk;/usr/local/share/projectM/presets/Unchained & Rovastar - Wormhole Pillars (Hall of Shadows mi.milk;/usr/local/share/projectM/presets/Unchained & Rovastar - Wormhole Pillars.milk;/usr/local/share/projectM/presets/Unchained & Rovastar - Xen Traffic.milk;/usr/local/share/projectM/presets/Unchained - A Matter Of Taste (Remix).milk;/usr/local/share/projectM/presets/Unchained - Beat Demo 1.0.milk;/usr/local/share/projectM/presets/Unchained - Beat Demo 2.0.milk;/usr/local/share/projectM/presets/Unchained - Beat Demo 2.1.milk;/usr/local/share/projectM/presets/Unchained - Beat Demo 2.2.milk;/usr/local/share/projectM/presets/Unchained - Beat Demo 2.3.milk;/usr/local/share/projectM/presets/Unchained - Cartoon Factory.milk;/usr/local/share/projectM/presets/Unchained - Cranked On Failure.milk;/usr/local/share/projectM/presets/Unchained - Deeper Logic.milk;/usr/local/share/projectM/presets/Unchained - Goo Kung Fu.milk;/usr/local/share/projectM/presets/Unchained - Goofy Beat Detection.milk;/usr/local/share/projectM/presets/Unchained - In Memory Of Peg.milk;/usr/local/share/projectM/presets/Unchained - Jaded Emotion.milk;/usr/local/share/projectM/presets/Unchained - Morat's Final Voyage.milk;/usr/local/share/projectM/presets/Unchained - Painful Plasma (Multi-Wave Mirrored Rage) -- Rozzor triangle tweak.milk;/usr/local/share/projectM/presets/Unchained - Perverted Dialect.milk;/usr/local/share/projectM/presets/Unchained - ReAwoke.milk;/usr/local/share/projectM/presets/Unchained - Ribald Ballad.milk;/usr/local/share/projectM/presets/Unchained - Shaping The Grid.milk;/usr/local/share/projectM/presets/Unchained - Subjective Experience Of The Manifold.milk;/usr/local/share/projectM/presets/Unchained - Working the Grid.milk;/usr/local/share/projectM/presets/bmelgren - Godhead.milk;/usr/local/share/projectM/presets/bmelgren - Take this highway.milk;/usr/local/share/projectM/presets/fiShbRaiN - brainstem activation.milk;/usr/local/share/projectM/presets/fiShbRaiN - crazy diamond.milk;/usr/local/share/projectM/presets/fiShbRaiN - cthulhus asshole (bad breakfast remix).milk;/usr/local/share/projectM/presets/fiShbRaiN - cthulhus asshole.milk;/usr/local/share/projectM/presets/fiShbRaiN - plasma temptation.milk;/usr/local/share/projectM/presets/fiShbRaiN - quark matrix.milk;/usr/local/share/projectM/presets/nil - Can't Stop the Blithering.milk;/usr/local/share/projectM/presets/nil - Can't Stop the Cramming.milk;/usr/local/share/projectM/presets/nil - Cid and Lucy.milk;/usr/local/share/projectM/presets/phat_CloseIncouneters.milk;/usr/local/share/projectM/presets/phat_CloseIncounetersV2.milk;/usr/local/share/projectM/presets/shifter - feathers (angel wings)_phat_remix.milk;/usr/local/share/projectM/presets/shifter - flashburn.milk;/usr/local/share/projectM/presets/shifter - pinwheel.milk;/usr/local/share/projectM/presets/shifter - pulsar.milk;/usr/local/share/projectM/presets/shifter - snow.milk;/usr/local/share/projectM/presets/Geiss & Sperl - Cruzin' (Moody).prjm;/usr/local/share/projectM/presets/Geiss & Sperl - Feedback (projectM idle HDR mix).prjm;/usr/local/share/projectM/presets/Rovastar & Sperl - Tuxflower.prjm;/usr/local/share/projectM/presets/M.tga;/usr/local/share/projectM/presets/Tux.tga;/usr/local/share/projectM/presets/headphones.tga;/usr/local/share/projectM/presets/project.tga")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/projectM/presets" TYPE FILE FILES
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Agitator.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Aimless (Gravity Directive Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Aimless (Spirogravity Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Airhandler (Menagerie Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Airs (Windy Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Airs.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Anchorpulse (Pulse Of A Ghast II Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Anchorpulse (Verified Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Anomalous Material Science (Pure Splinter Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Antidote (Aqualung Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Antidote (Side Effects Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Antidote.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Antique Abyss.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Arise! (Padded Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Ashes Of Air (Remix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Bitterfeld (Crystal Border Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Blender.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Bow To Gravity.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Brakefreak.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Candy Avian.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Causeway Of Dreams (Nightmare Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Causeway Of Dreams (REMix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Causeway Of Dreams.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Chromatic Abyss (The Other Side).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Circlefacade.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Contortion (Xenomorph Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Contortion.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Crystal Storm.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Dark Matter (Converse Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Elastoid.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Floater Society.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Flowing Form.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Making Time (Swamp Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Multiviola.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Aderrasi - Negative Sun III.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Bmelgren & Krash - Rainbow Orb Peacock (Centred Journey Mix.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Bmelgren & Krash - Rainbow Orb Peacock (Lonely Signal Gone .milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Bmelgren - Pentultimate Nerual Slipstream (Tweak 2).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/CatalystTheElder - Electric Rosebud_Phat_texture_edit.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Che - Escape.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Che - Terracarbon Stream.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/CrystalHigh - mad ravetriping.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/EMPR - Random - Changing Polyevolution.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Eo.S. - skylight a3 [trip colors flux2]_phat_Multi_shaped2_zoe_colours5.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Eo.S.+Phat Cool Bug_arm.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Eo.S.+Phat Cool Bug_arm_textured.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Eo.S.+Phat Fractical_dancer - pulsate B.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Eo.S.+Phat Fractical_dancer - pulsate box_mix.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Eo.S.+Phat Fractical_dancer_Peacock.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Eo.s and PieturP - Starfield.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/EvilJim - Follow the ball.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/EvilJim - Ice Drops.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - 0 To 60.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - A Blur.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - Lifesavor Anyone.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - New meetings.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - Quicksand.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - Stand Still!.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - The Tunnel (Final Stage Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - Window Reflection 6.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Fvese - simple.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss & Rovastar - Notions Of Tonality 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss & Rovastar - Tokamak (Naked Intrusion Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Blasto.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Cosmic Dust 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Cruzin'.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Downward Spiral.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Dynamic Swirls 1.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Dynamic Swirls 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Eddies 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Eggs.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - El Cubismo.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Feedback 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - High Dynamic Range.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Nautilus.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Octopus Ever Changing.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Octopus Gold.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Octopus.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Oldskool Mellowstyle.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Swirlie 1.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Swirlie 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Swirlie 3.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Swirlie 4.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - Swirlie 5.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss - The Fatty Lumpkin Sunkle Tweaker.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss and Rovastar - The Chaos Of Colours (sprouting dimentia mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Idiot & Rovastar - Altars Of Madness 2 (X.42 Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Idiot - MOTIVATION!.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Idiot - Texture Boxes (Remix 2).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Idiot - Texture Boxes (Remix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Idiot24-7 - Ascending to heaven 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Illusion & Che - Return Of The King.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Illusion & Che - The Piper.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Illusion & Rovastar - Clouded Bottle.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Illusion & Unchained - Frozen Eye 1.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Illusion & Unchained - Invade My Mind.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Illusion - Figure Eight.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Jess - Trying To Trap A Twister.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash & Illusion - Spiral Movement.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash & Rovastar - Altars of Madness (Mad Ocean Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash & Rovastar - Cerebral Demons - Phat + Eo.S. Killer Death Bunny Remix.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash & TEcHNO - Rhythmic Mantas.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash - 3D Shapes Demo 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash - 3D Shapes Demo.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash - Digital Flame.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash - Dynamic Borders 1.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash - Framed Geometry.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash - Interwoven (Nightmare Weft Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash - War Machine (Shifting Complexity Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash - Windowframe To Mega Swirl 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash and Rovastar - Rainbow Orb 2 Peacock (Bmelgren's Comp.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Krash and Rovastar - Rainbow Orb.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Mstress & Darius - Pursuing The Sunset.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Mstress & Juppy - Dancer.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Mstress & Juppy - Dancers In The Dark.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Phat_Eo.S. - our own personal demon.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Phat_Eo.S._Algorithm.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Phat_Eo.S_shoot_em_up.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Phat_Rovastar - What_does_your_soul_look_like.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Phat_Rovastar_Eo.S. spiral_faces.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Pithlit & Illusion - Symetric pattern.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Reenen - phoenix.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Reenen Geiss - Triple Feedback.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Reenen Geiss - Triple Feedback_phat+eos_edit.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Aderrasi - Clockwork Organism.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Fvese - Deadly Flower.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Fvese - Stranger Minds (Astral Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Fvese - Stranger Minds.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Broken Destiny Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Mysticial Awakening Mi.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Poltergiest Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Twisted Truth Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Dynamic Swirls 3 (Voyage Of Twisted Souls Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Hurricane Nightmare.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Ice Planet.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Notions Of Tonality.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Octoplasm.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Octotrip (MultiTrip Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Octotrip.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Geiss - Surface (Vectrip Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Idiot24-7 - Balk Acid.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Krash - Flowing Synergy.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Krash - Interwoven (Contra Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Rocke - Headspin.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Rocke - Sugar Spun Sister.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & StudioMusic - More Cherished Desires.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & StudioMusic - Twisted Spider Web.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Telek - Altars of Madness (Rolling Oceans Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Telek - Cosmic Fireworks.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Unchained - Centre Of Gravity.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - A Million Miles from Earth (Pathfinder Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - A Million Miles from Earth.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Altars Of Harlequin's Madness (Dark Disorder Mix.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Altars Of Madness (A Million Miles From Earth Mi.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Altars Of Madness (Duel Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Altars Of Madness (Surealist Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Altars Of Madness 4 (Spirit Of Twisted Madness Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Altars Of Madness.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Attacking Freedom.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Bellanova (New Wave Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Chapel Of Ghouls.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Cosmic Echoes 1.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Cosmic Echoes 2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Cosmic Mosaic (Active Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Decreasing Dreams (Extended Movement Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Decreasing Dreams (Increasing Memory Mix) .milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Explosive Minds.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Eye On Reality (Mega 3 Mix)_phat_edit.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Forgotten Moon.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Fractopia (Fantic Dancing Lights Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Fractopia (Focused Childhood Mix ).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Fractopia (Fractal Havok Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Fractopia (Upspoken Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Frozen Rapture .milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Future Speakers.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Hallucinogenic Pyramids (Beat Time Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Harlequin's Dynamic Fractal (Crazed Spiral Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Harlequin's Fractal Encounter.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Hyperspace (Frozen Rapture Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Hyperspace.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Inner Thoughts (Clouded Judgement Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Inner Thoughts (Dark Secret Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Inner Thoughts (Distant Memories Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Inner Thoughts (Frantic Thoughts Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Inner Thoughts (Strange Cargo Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Kalideostars (Altars Of Madness MIx).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Kalideostars (Round  Round Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Kalideostars.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Magic Carpet.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Multiverse Starfield 1.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Multiverse Starfield 3.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Omnipresence Resurrection.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Pandora's Volcano.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Parallel Universe.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Sea Shells.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Solarized Space (Space DNA Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Solarized Space.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Space (Twisted Dimension Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Space.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Sunflower Passion (Enlightment Mix)_Phat_edit.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Sunflower Passion (Simple Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Sunflower Passion.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - The Awakening.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - The Chaos Of Colours (Drifting Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - The Chaos Of Colours.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - The Shroomery.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Timeless Voyage.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Torrid Tales.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar - Twilight Tunnel.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar and Krash - Hallucinogenic Pyramids (Extra Beat Ti.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar and Unchained - Braindance Visions.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rozzer & Neuro - Starover (Semicolon Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rozzor & Aderrasi - Canon.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rozzor & Che - Inside The House Of Nil.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rozzor & Rovastar - Oozing Resistance (Waveform Mod).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rozzor & Shreyas - Deeper Aesthetics.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Studio Music and Unchained - Rapid Alteration.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/StudioMusic & Unchained - Entity.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/StudioMusic & Unchained - Minor Alteration.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/StudioMusic & Unchained - Remembering How You Were (Perceived Mix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/StudioMusic & Unchained - So Much Love.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/StudioMusic & Unchained - State Of Discretion.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/StudioMusic & Unchained - Wrenched Fate.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/StudioMusic - It's Only Make Believe.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/StudioMusic - Numerosity.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Telek - Flicker.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Telek - Slow Shift Matrix (bb4.5).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained & Illusion - Logic Morph.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained & Rovastar - For The Seagull.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained & Rovastar - Luckless.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained & Rovastar - Slow Solstice.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained & Rovastar - Triptionary.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained & Rovastar - Wormhole Pillars (Hall of Shadows mi.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained & Rovastar - Wormhole Pillars.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained & Rovastar - Xen Traffic.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - A Matter Of Taste (Remix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Beat Demo 1.0.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Beat Demo 2.0.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Beat Demo 2.1.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Beat Demo 2.2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Beat Demo 2.3.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Cartoon Factory.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Cranked On Failure.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Deeper Logic.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Goo Kung Fu.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Goofy Beat Detection.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - In Memory Of Peg.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Jaded Emotion.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Morat's Final Voyage.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Painful Plasma (Multi-Wave Mirrored Rage) -- Rozzor triangle tweak.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Perverted Dialect.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - ReAwoke.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Ribald Ballad.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Shaping The Grid.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Subjective Experience Of The Manifold.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Unchained - Working the Grid.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/bmelgren - Godhead.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/bmelgren - Take this highway.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/fiShbRaiN - brainstem activation.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/fiShbRaiN - crazy diamond.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/fiShbRaiN - cthulhus asshole (bad breakfast remix).milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/fiShbRaiN - cthulhus asshole.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/fiShbRaiN - plasma temptation.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/fiShbRaiN - quark matrix.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/nil - Can't Stop the Blithering.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/nil - Can't Stop the Cramming.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/nil - Cid and Lucy.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/phat_CloseIncouneters.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/phat_CloseIncounetersV2.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/shifter - feathers (angel wings)_phat_remix.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/shifter - flashburn.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/shifter - pinwheel.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/shifter - pulsar.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/shifter - snow.milk"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss & Sperl - Cruzin' (Moody).prjm"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Geiss & Sperl - Feedback (projectM idle HDR mix).prjm"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Rovastar & Sperl - Tuxflower.prjm"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/M.tga"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/Tux.tga"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/headphones.tga"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/presets/project.tga"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/projectM/shaders/projectM.cg;/usr/local/share/projectM/shaders/blur.cg")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/projectM/shaders" TYPE FILE FILES
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/Renderer/projectM.cg"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/Renderer/blur.cg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/share/projectM/config.inp")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local/share/projectM" TYPE FILE FILES "/Users/clangen/src/projectM-musikcube/src/libprojectM/config.inp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libprojectM" TYPE FILE FILES
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/projectM.hpp"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/event.h"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/dlldefs.h"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/fatal.h"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/PCM.hpp"
    "/Users/clangen/src/projectM-musikcube/src/libprojectM/Common.hpp"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/clangen/src/projectM-musikcube/src/libprojectM/libprojectM.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprojectM.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprojectM.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libprojectM.a")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/clangen/src/projectM-musikcube/src/libprojectM/MilkdropPresetFactory/cmake_install.cmake")
  include("/Users/clangen/src/projectM-musikcube/src/libprojectM/Renderer/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/clangen/src/projectM-musikcube/src/libprojectM/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
