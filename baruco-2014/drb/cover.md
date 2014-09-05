!SLIDE smbullets incremental

## number of pairs

* binominal coefficient
* number of ‘choose k from n’ combinations
* n! ÷ (k! × (n-k)!)
* k = 2
* n! ÷ (2! × (n-2)!) = n × (n-1) ÷ 2
* let’s assume 2378 authors
* 2378 × 2377 ÷ 2 = 2,826,253 pairs
* (that’s `2_826_253` in Ruby)

!SLIDE bullets incremental

## let’s distribute!

* <span class='quote'>So Google has the 4.3.2.0/24 IP allocation and they’re not using a single address. I’d give 4.3.2.1 to NASA for rocket launch livestreams.<br />— Jonty Wareing</span>
* let’s assume that we have the 4.3.2.0/24 subnet
* that’s 254 server addresses
* how can we run services on them?
