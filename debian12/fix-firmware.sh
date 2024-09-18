#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi


# source: https://forums.debian.net/viewtopic.php?t=156314
path="/tmp/firmware/amdgpu"
mkdir -p $path
url="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/amdgpu/"
files="aldebaran_cap.bin gc_11_0_0_mes_2.bin gc_11_0_0_toc.bin gc_11_0_1_mes_2.bin gc_11_0_2_mes_2.bin gc_11_0_3_imu.bin gc_11_0_3_me.bin gc_11_0_3_mec.bin gc_11_0_3_mes1.bin gc_11_0_3_mes_2.bin gc_11_0_3_mes.bin gc_11_0_3_pfp.bin gc_11_0_3_rlc.bin gc_11_0_4_me.bin gc_11_0_4_mec.bin gc_11_0_4_mes1.bin gc_11_0_4_mes_2.bin gc_11_0_4_mes.bin gc_11_0_4_pfp.bin gc_11_0_4_rlc.bin ip_discovery.bin navi10_mes.bin navi12_cap.bin psp_13_0_10_sos.bin psp_13_0_10_ta.bin psp_13_0_11_ta.bin psp_13_0_11_toc.bin sdma_6_0_3.bin sienna_cichlid_cap.bin sienna_cichlid_mes1.bin sienna_cichlid_mes.bin smu_13_0_10.bin vega10_cap.bin"
for file in $files ; do
   cmd="wget $url$file -P $path"
   $cmd
done

echo "Now copy files to /lib/firmware/amdgpu"
# source: https://askubuntu.com/questions/1124253/missing-firmware-for-amdgpu
sudo cp $path/* /lib/firmware/amdgpu
sudo update-initramfs -k all -u -v

# remove downloaded
sudo rm -rf $path
