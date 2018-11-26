sudo echo "Enabling fan for safety..."
if [ ! -w /sys/kernel/debug/tegra_fan/target_pwm ] ; then
echo "Cannot set fan -- exiting..."
fi
echo 0 > /sys/kernel/debug/tegra_fan/target_pwm
