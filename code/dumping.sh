#!/bin/bash
#
# Dump the RAM that may contain private browsing session data
sudo dd if=/dev/mem of=d1.dump bs=1024 count=524283 skip=4 ibs=1024 # 00001000-1fffffff : System RAM
sudo dd if=/dev/mem of=d2.dump bs=1024 count=522239 skip=526336 ibs=1024 # 20200000-3fffffff : System RAM
sudo dd if=/dev/mem of=d3.dump bs=1024 count=225065 skip=1050625 ibs=1024 # 40200000-c97e8fff : System RAM
sudo dd if=/dev/mem of=d4.dump bs=1024 count=10667 skip=3310888 ibs=1024 # ca14a000-cabb4fff : System RAM
sudo dd if=/dev/mem of=d5.dump bs=1024 count=55 skip=3325896 ibs=1024 # caff2000-caffffff : System RAM
sudo dd if=/dev/mem of=d6.dump bs=1024 count=4970495 skip=4194304 ibs=1024 # 100000000-22f5fffff : System RAM
sudo dd if=/dev/mem of=d8.dump bs=1024 count=8191 skip=3325952 ibs=1024 # cb000000-cb7fffff : RAM buffer
sudo dd if=/dev/mem of=d9.dump bs=1024 count=10239 skip=9164800 ibs=1024 # 22f600000-22fffffff : RAM buffer
sudo dd if=/dev/mem of=d10.dump bs=$((0x00000fff)) count=1 # 00000000-00000fff : reserved
sudo dd if=/dev/mem of=d11.dump bs=$((0x0009ffff-0x0009d800)) count=1 skip=1 ibs=$((0x0009d800)) # 0009d800-0009ffff : reserved
sudo dd if=/dev/mem of=d12.dump bs=$((0x000fffff-0x000e0000)) count=1 skip=1 ibs=$((0x000e0000)) # 000e0000-000fffff : reserved
sudo dd if=/dev/mem of=d13.dump bs=$((0x201fffff-0x20000000)) count=1 skip=1 ibs=$((0x20000000)) # 20000000-201fffff : reserved
sudo dd if=/dev/mem of=d14.dump bs=$((0x401fffff-0x40000000)) count=1 skip=1 ibs=$((0x40000000)) # 40000000-401fffff : reserved
sudo dd if=/dev/mem of=d15.dump bs=$((0xc9e81fff-0xc97e9000)) count=1 skip=1 ibs=$((0xc97e9000)) # c97e9000-c9e81fff : reserved
sudo dd if=/dev/mem of=d16.dump bs=$((0xcaff1fff-0xcabb5000)) count=1 skip=1 ibs=$((0xcabb5000)) # cabb5000-caff1fff : reserved
sudo dd if=/dev/mem of=d17.dump bs=$((0xcf9fffff-0xcb800000)) count=1 skip=1 ibs=$((0xcb800000)) # cb800000-cf9fffff : reserved
sudo dd if=/dev/mem of=d18.dump bs=$((0xfbffffff-0xf8000000)) count=1 skip=1 ibs=$((0xf8000000)) # f8000000-fbffffff : reserved
sudo dd if=/dev/mem of=d19.dump bs=$((0xfec00fff-0xfec00000)) count=1 skip=1 ibs=$((0xfec00000)) # fec00000-fec00fff : reserved
sudo dd if=/dev/mem of=d20.dump bs=$((0xfed03fff-0xfed00000)) count=1 skip=1 ibs=$((0xfed00000)) # fed00000-fed03fff : reserved
sudo dd if=/dev/mem of=d21.dump bs=$((0xfed1ffff-0xfed1c000)) count=1 skip=1 ibs=$((0xfed1c000)) # fed1c000-fed1ffff : reserved
sudo dd if=/dev/mem of=d22.dump bs=$((0xfee00fff-0xfee00000)) count=1 skip=1 ibs=$((0xfee00000)) # fee00000-fee00fff : reserved
sudo dd if=/dev/mem of=d23.dump bs=$((0xffffffff-0xff000000)) count=1 skip=1 ibs=$((0xff000000)) # ff000000-ffffffff : reserved
sudo dd if=/dev/mem of=d24.dump skip=1 ibs=$((0x22ffffffd)) # the rest
echo "dd done."
