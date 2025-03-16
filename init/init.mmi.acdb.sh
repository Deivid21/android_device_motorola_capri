#!/vendor/bin/sh

notice()
{
	echo "$*"
	echo "$scriptname: $*" > /dev/kmsg
}

path=/vendor/etc/acdbdata

# For capri power, use seprate parameter files.
if [ "`getprop ro.vendor.hw.batt`" == "6000" ]; then
	path=/vendor/etc/acdbdata/power
fi

index=0
for file in $(ls $path/); do
    setprop persist.vendor.audio.calfile$index $path/$file
    index=$((index+1))
done
notice "hw.batt: [`getprop ro.vendor.hw.batt`], calfile6: [`getprop persist.vendor.audio.calfile6`]"
