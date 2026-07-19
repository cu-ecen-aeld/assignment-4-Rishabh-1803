################################################################################
#
# aesd-assignments
#
################################################################################

AESD_ASSIGNMENTS_VERSION = 411dbba335df40021e58cb4030ac149520ffe12d
AESD_ASSIGNMENTS_SITE = https://github.com/cu-ecen-aeld/assignments-3-and-later-Rishabh-1803.git
AESD_ASSIGNMENTS_SITE_METHOD = git

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" -C $(@D)/finder-app
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 \
		$(@D)/finder-app/writer \
		$(TARGET_DIR)/usr/bin/writer

	$(INSTALL) -D -m 0755 \
		$(@D)/finder-app/finder.sh \
		$(TARGET_DIR)/usr/bin/finder.sh

	$(INSTALL) -D -m 0755 \
		$(@D)/finder-app/finder-test.sh \
		$(TARGET_DIR)/usr/bin/finder-test.sh

	mkdir -p $(TARGET_DIR)/etc/finder-app/conf

	cp $(@D)/finder-app/conf/* \
		$(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
