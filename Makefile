.PHONY: skill-jdk21-assess skill-jdk21-implement skill-jdk21-code-fix skill-jdk21-validate

skill-jdk21-assess:
	bash tools/upgrade/scan-dependencies.sh
	bash tools/upgrade/grep-javax.sh
	bash tools/upgrade/grep-legacy-apis.sh

skill-jdk21-implement:
	@echo "Generate pom/config/code migration plan"
	@echo "Review docs/upgrade/jdk21-upgrade-plan.md and compatibility-matrix.md"

skill-jdk21-code-fix:
	@echo "Analyze compile/runtime failures after upgrade"
	@echo "Check javax/jakarta, swagger migration, aws sdk migration, spring boot 3 code adjustments"

skill-jdk21-validate:
	bash tools/upgrade/verify-runtime.sh
	bash tools/upgrade/run-upgrade-checks.sh
