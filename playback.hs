-- scene 1
do
  hush
  d1 $ outside 4 loopFirst $ sew "0@3 1@3"
    (stack [s "{t ~ ~}%16" # amp 0.26906435173630144, s "{~ ~ ~ ~ ~ ~ t ~}%16"])
    (stack [s "{~ ~ ~ t}%16" # amp 0.5368693229529086, s "{~ ~ ~ ~ ~ ~ t}%16"]) # n 36
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
  d2 $ stack [
              distrib ["9",16,"3 7"] $ s "hdh" # n "36",
              n "46(3,8)" # s "hvh",
              n "39(2,4,1)" # s "hhd",
              n "38(<0 0 0 1>,16,1)" # s "hsh",
              distrib ["9 11",16,"<5 3> 9"] $ n "42" # s "hrh"
              ]
  d3 $ s "sdklfjd" # n ("[55,62,69,76,83]" + "<0 0 2 5>")
  d4 $ outside 8 (loopFirst) $ fast 1 $ struct ("t({11 11 9 5 7}%16,16,{0 0 -1}%8)") $ s "sdfhk" # n (43 + "{0 0 0 12 0 -12 0}%16" + "0 5 -2 7") # legato "{1 0.2 2 1 1 3 0.5}%16" # amp "{0.2 0.2 1 0.2 0.2}%4" # val1 "{0 1 0 0.25 0.5}%8" # val2 (segment 16 $ rand)

-- scene 3
do
    hush
    let val1 = pF "val1"
        val2 = pF "val2"
        val3 = pF "val3"
        val4 = pF "val4"
    let pat = slow 1 $
              sometimesBy 0.0 (ply (irand 4)) $ outside 2 (degradeBy 0.3) 
              $ inside 8 palindrome $ fast 2 $ every "<2!8 4!8>" (rev) $ "t(3,8)"
    d1 $ stack [
              struct pat $ s "bd" # n "<30!3 <50 20>>" # legato 1.5 # amp "0.5 1 0.8",
              struct (inv pat) $ s "bd" # n "37" # legato 0.5 # amp "1 0.5" # val4 "0.5 0.1 1" # val1 "<0.1 0.3 0.8>" # val2 "0.5 <0.0 0.9 0.1 0.5 -0.44> 1.0" # val3 (segment 32 rand)
              ]
    d2 $ every 0 (struct pat) $ s "bd*4" # n "36" # amp 1 # velocity 127
    d3 $ s "bd/4" # n ("[60,67,75]" + (slow 4 "<0 5 -2 7>" - 12))
    d4 $ fast 4 $ degradeBy 0.2 $ bite 8 (slow 2 $ (markovPat 8 1 [[3,5,2,1], [4,4,2,1], [0,1,0,1],[3,2,2,0]]) + "<0 1>") $ s "sdhjh(7,8,<0 -4>)" # n (30 + ((run 8) * 5)) # amp "{0.4 2 0.3}%8" # legato "{0.2 1 0.3 2 1 1}%8" # val1 (rand) # val2 (1 <~ rand)

-- scene 4
do
  hush
  d1 $ s "bd*8" # amp 0.2
  d3 $ s "bd/2" # n ("[60,67,75]" + (slow 4 "<0 5 -2 2 7>" - 24))

-- scene 5
do
  hush
  d2 $ outside 7 loopFirst $ sew "0@4 1@4"
    (stack [s "{t ~ ~ ~}%16" # amp 0.24592306875027478, s "{~ ~ t}%16"])
    (stack [s "{t ~}%16" # amp 0.5191145694531487, s "{~ t ~ ~ ~}%16"]) # n 36

-- scene 6
do
  hush      
  d2 $ outside 4 loopFirst $ sew "0@5 1@4"
    (stack [s "{~ t ~}%16" # amp 0.3427267873623736, s "{~ t ~ ~ ~ ~ ~}%16"])
    (stack [s "{t ~}%16" # amp 0.61361717931587, s "{~ t ~}%16"]) # n 36

-- scene 7
do
  hush
  d2 $  outside 2 loopFirst $ sew "1!3 0@5" 
      (stack [s "{~ ~ ~ t ~}%16" # amp 0.4849015719889291, s "{~ ~ ~ t ~ ~ ~ ~}%16"]) 
      (stack [s "{~ ~ ~ t}%16" # amp 0.5135587075762597, s "{~ ~ ~ ~ t ~}%16"]) # n 36

-- scene 8
do
  hush
  d2 $ outside 2 loopFirst $ sew "0@4 1@2"
    (stack [s "{~ ~ ~ ~ t ~ ~}%16" # amp 0.43740445586724097, s "{t ~ ~}%16"])
    (stack [s "{t ~ ~ ~}%16" # amp 0.5916629945284048, s "{~ ~ t ~ ~ ~ ~ ~}%16"]) # n 36