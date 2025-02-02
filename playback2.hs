-- scene 1
do
  hush
  d1 $ outside 6 (loopAt "<0>") $ fast "1"
        $ s "t(<[4 6] 9 3>,16,<-13 14 0!2>)"
        # n (36 + "{0 24 12 0!4 12 0!4}%16" + "[10 0!2 12 <13 9> [11 9]]")
        # legato "{1!2 1.5}%16"
        # amp (rev $ "{1 0.5!4}%16")
        # val1 (slow 0.6465675998331968 $ rand)
        # val2 (slow 0.7323084287404547 $ rand)
  d2 $ outside 5 loopFirst $ sew "0@2 1@4"
    (stack [s "{~ ~ ~ t ~ ~ ~ ~}%16" # amp 0.41713506233695585, s "{~ ~ ~ ~ t}%16"])
    (stack [s "{t ~ ~ ~ ~ ~ ~}%16" # amp 0.5204944201898516, s "{~ ~ ~ ~ ~ ~ t}%16"]) # n 36
  d4 $ outside 6 loopFirst $ sew "0@3 1@5"
    (stack [s "{~ ~ ~ t ~ ~ ~}%16" # amp 0.30481525695995004, s "{~ t}%16"])
    (stack [s "{t ~ ~ ~}%16" # amp 0.47059760722362715, s "{~ ~ ~ ~ ~ ~ t}%16"]) # n 36

-- scene 2
do
  hush
  let val1 = pF "val1"
      val2 = pF "val2"
  d1 $ s "bd*4" # n 36
  d2 $ id
    $ outside 4 (loopAt "0.5 [0.25 4 8 17] 10") -- button 4
    $ fast 2 -- button 3
    $ (sometimesBy 0.6 (ply 4)) $ (degrade . slow 2) -- button 2
    $ stack [
              distrib ["9",16,"3 7"] $ s "hdh" # n "36", -- button 1
              -- n "46(3,8)" # s "hvh",
              n "39(2,4,1)" # s "hhd",
              n "38(<0 0 0 1>,16,1)" # s "hsh",
              distrib ["9 11",16,"<5 3> 9"] $ n "42" # s "hrh"
              ]
  d3 $ s "sdklfjd" # n ("[55,62,69,76,83]" + "<0 0 2 5>")
  d4 $ outside 8 (loopFirst) $ fast 1 $ struct ("t({11 11 9 5 7}%16,16,{0 0 -1}%8)") $ s "sdfhk" # n (43 + "{0 0 0 12 0 -12 0}%16" + "0 5 -2 7") # legato "{1 0.2 2 1 1 3 0.5}%16" # amp "{0.2 0.2 1 0.2 0.2}%4" # val1 "{0 1 0 0.25 0.5}%8" # val2 (segment 16 $ rand)

-- scene 3
do
    hush
    d1 $ s "bd*5" # n 35
    d2 $ id
      -- $ slow 2 
      $ stack [
      struct (ascii "<h a [h a] [h,a]>") $ sound "bd" # n 36 # legato 0.5,
      -- struct ("t") $ sound "bd" # n 36,
      s ((<~) (4/16) $ distrib ["11 9",13,16,"<5 7>"] "bdd") # n 42 # legato 4,
      s "bd(1,4,2)" # n 38
      ]

-- scene 4
do
  hush
    d1 $ s "bd*5" # n 35
    d2 $ id
      -- $ slow 2 
      $ stack [
      struct (ascii "<h a [h a] [h,a]>") $ sound "bd" # n 36 # legato 0.5,
      -- struct ("t") $ sound "bd" # n 36,
      s ((<~) (4/16) $ distrib ["11 9",13,16,"<5 7>"] "bdd") # n 42 # legato 4,
      s "bd(1,4,2)" # n 38
      ]