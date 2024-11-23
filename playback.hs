-- section 1
do
  hush
  d1 $ "bd sd"

-- section 2
do
  hush
  d1 $ "bd(3,8)"
  d2 $ "hh(6,16,1)"

-- section 3

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
              struct pat $ s "bd" # n "<30!3 <50 20>>" # legato 1.5 # amp "0.5 1",
              struct (inv pat) $ s "bd" # n "37" # legato 0.5 # amp "1 0.5" # val4 "0.5 0.1 1" # val1 "<0.1 0.3 0.8>" # val2 "0.5 <0.0 0.9 0.1 0.5 -0.44> 1.0" # val3 (segment 32 rand)
              ]
    d2 $ every 8 (struct pat) $ s "bd*4" # n "36" # amp 1 # velocity 127
    d3 $ s "bd/4" # n ("[60,67,75]" + (slow 4 "<0 5 -2 7>" - 12))
    
-- section 4

do
  hush
  d1 $ s "bd*8"
  d3 $ s "bd/2" # n ("[60,67,75]" + (slow 4 "<0 5 -2 7>" - 24))

-- section 5

do
  hush

-- section 6

do
  hush