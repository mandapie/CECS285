mov p1, #0x00 ;configure Port1 as output
L1: mov p1, p0 ;read Port0 value and write to Poart1
sjmp L1 ;repeat the previous instruction forever
end