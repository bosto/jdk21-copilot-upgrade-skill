# skill:jdk21-assess

## Purpose
Assess scope and risk of migrating a Java service from JDK 8 to JDK 21.

## Use when
- planning the upgrade
- estimating impacted modules
- identifying incompatible libraries
- preparing a migration roadmap

## Inputs
- pom.xml files
- source tree
- config files
- CI and Docker hints

## Commands
- make skill-jdk21-assess
- bash tools/upgrade/scan-dependencies.sh
- bash tools/upgrade/grep-javax.sh
- bash tools/upgrade/grep-legacy-apis.sh

## Output
- executive summary
- dependency risk list
- code hotspots
- phased migration plan
