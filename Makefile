.PHONY: help skill-jdk21-assess skill-jdk21-implement skill-jdk21-code-fix skill-jdk21-validate ci-check rewrite-jakarta sample-scan

help:
	@echo "Available targets:"
	@echo "  make skill-jdk21-assess"
	@echo "  make skill-jdk21-implement"
	@echo "  make skill-jdk21-code-fix"
	@echo "  make skill-jdk21-validate"
	@echo "  make rewrite-jakarta"
	@echo "  make ci-check"
	@echo "  make sample-scan"

skill-jdk21-assess:
	mkdir -p .upgrade-output
	bash tools/upgrade/scan-dependencies.sh | tee .upgrade-output/dependency-scan.txt
	bash tools/upgrade/grep-javax.sh | tee .upgrade-output/javax-scan.txt
	bash tools/upgrade/grep-legacy-apis.sh | tee .upgrade-output/legacy-api-scan.txt
	python3 tools/upgrade/generate-upgrade-report.py \
	  --dependency-report .upgrade-output/dependency-scan.txt \
	  --javax-report .upgrade-output/javax-scan.txt \
	  --legacy-report .upgrade-output/legacy-api-scan.txt \
	  --output .upgrade-output/upgrade-report.md
	@echo "Generated .upgrade-output/upgrade-report.md"

skill-jdk21-implement:
	@echo "Review docs/upgrade/jdk21-upgrade-plan.md"
	@echo "Review docs/upgrade/compatibility-matrix.md"
	@echo "Review docs/upgrade/code-change-catalog.md"
	@echo "Apply staged pom/config/code changes in PRs"

skill-jdk21-code-fix:
	@echo "Use .github/prompts/jdk21-upgrade-code-fix.prompt.md with Copilot"
	@echo "Review error logs and classify into migration buckets"

skill-jdk21-validate:
	bash tools/upgrade/verify-runtime.sh
	bash tools/upgrade/run-upgrade-checks.sh

rewrite-jakarta:
	python3 tools/rewrite/rewrite-jakarta.py --root sample-project/src/main/java --apply

ci-check:
	bash tools/upgrade/ci-upgrade-check.sh

sample-scan:
	cd sample-project && ../tools/upgrade/scan-dependencies.sh
