.PHONY: skill-jdk21-assess skill-jdk21-implement skill-jdk21-code-fix skill-jdk21-validate skill-spring-boot-cloud-align skill-middleware-compatibility-review ci-check rewrite-jakarta-preview rewrite-jakarta generate-pr-comment middleware-smoke-template

skill-jdk21-assess:
	mkdir -p .upgrade-output
	bash tools/upgrade/scan-dependencies.sh . | tee .upgrade-output/dependency-scan.txt
	bash tools/upgrade/grep-javax.sh . | tee .upgrade-output/javax-scan.txt
	bash tools/upgrade/grep-legacy-apis.sh . | tee .upgrade-output/legacy-api-scan.txt
	bash tools/upgrade/scan-middleware.sh . | tee .upgrade-output/middleware-scan.txt
	bash tools/upgrade/check-docker-jenkins-runtime.sh . | tee .upgrade-output/runtime-hints.txt
	python3 tools/upgrade/generate-upgrade-report.py \
	  --dependency-report .upgrade-output/dependency-scan.txt \
	  --javax-report .upgrade-output/javax-scan.txt \
	  --legacy-report .upgrade-output/legacy-api-scan.txt \
	  --middleware-report .upgrade-output/middleware-scan.txt \
	  --runtime-report .upgrade-output/runtime-hints.txt \
	  --output .upgrade-output/upgrade-report.md

skill-jdk21-implement:
	@echo "Review templates/maven/customized-service-pom.xml"
	@echo "Review templates/config/application-jdk21-custom.yml"
	@echo "Review templates/java/config and templates/java/sqs"
	@echo "Review docs/upgrade/custom-implementation-runbook.md"

skill-jdk21-code-fix:
	@echo "Use .github/prompts/jdk21-upgrade-code-fix.prompt.md"

skill-jdk21-validate:
	bash tools/upgrade/verify-runtime.sh
	bash tools/upgrade/run-upgrade-checks.sh
	bash tools/upgrade/check-docker-jenkins-runtime.sh .
	bash tools/upgrade/middleware-smoke-template.sh

skill-spring-boot-cloud-align:
	mkdir -p .upgrade-output
	python3 tools/upgrade/generate-version-alignment-matrix.py --output .upgrade-output/version-alignment.md

skill-middleware-compatibility-review:
	mkdir -p .upgrade-output
	bash tools/upgrade/scan-middleware.sh . | tee .upgrade-output/middleware-scan.txt
	python3 tools/upgrade/generate-middleware-report.py --input .upgrade-output/middleware-scan.txt --output .upgrade-output/middleware-report.md

rewrite-jakarta-preview:
	python3 tools/rewrite/rewrite-jakarta.py --root sample-service/src/main/java

rewrite-jakarta:
	python3 tools/rewrite/rewrite-jakarta.py --root sample-service/src/main/java --apply

generate-pr-comment:
	python3 tools/reporting/generate-pr-comment.py --report .upgrade-output/upgrade-report.md --output .upgrade-output/pr-comment.md

ci-check:
	bash tools/upgrade/ci-upgrade-check.sh

middleware-smoke-template:
	bash tools/upgrade/middleware-smoke-template.sh
