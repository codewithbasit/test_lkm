obj-m += test_lkm.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

test:
	# We put a — in front of the rmmod command to tell make to ignore
	# an error in case the module isn’t loaded.
	-sudo rmmod test_lkm
	# Clear the kernel log without echo
	sudo dmesg -C
	# Insert the module
	sudo insmod test_lkm.ko
	# Display the kernel log
	dmesg

remove_module:
	-sudo rmmod test_lkm

insert_module:
	sudo insmod test_lkm.ko
