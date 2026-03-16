.PHONY: skill-jdk21-assess skill-jdk21-validate

skill-jdk21-assess:
	bash tools/upgrade/scan-dependencies.sh
	bash tools/upgrade/grep-javax.sh

skill-jdk21-validate:
	bash tools/upgrade/verify-runtime.sh