#!/usr/bin/env python2
 
import binascii

f = (open("onion2-full.hex", "rb")).read()

def xor_c(a):
	c = binascii.a2b_hex(a)
	return bytearray([b^0xff for b in bytearray(c)])

outdata = xor_c(f)

unhexout = open("onion2invert.bin", "wb")
unhexout.write(outdata)
unhexout.close()

revString = "".join(map(str.__add__, f[-2::-2], f[-1::-2]))

revoutdata = xor_c(revString)

revout = open("onion2invert-rev.bin", "wb")
revout.write(revoutdata)
revout.close()