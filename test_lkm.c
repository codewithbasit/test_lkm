#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Basit Ali");
MODULE_DESCRIPTION("A simple Linux kernel module.");
MODULE_VERSION("0.01");

static int __init test_lkm_init(void) {
    printk(KERN_INFO "Hello, World!\n");
    return 0;
}

static void __exit test_lkm_exit(void) {
    printk(KERN_INFO "Goodbye, World!\n");
}

module_init(test_lkm_init);
module_exit(test_lkm_exit);
