# JDK 21 Upgrade Checklist

## Baseline
- [ ] current Java version captured
- [ ] current framework versions captured
- [ ] dependency tree exported
- [ ] Docker / CI runtime Java version verified
- [ ] release and rollback points identified

## Framework alignment
- [ ] build plugins compatible with Java 21
- [ ] Spring family aligned
- [ ] obsolete Swagger libraries removed
- [ ] queue / DB / cache libraries reviewed

## Code migration
- [ ] `javax` usage reviewed
- [ ] internal JDK API usage reviewed
- [ ] Spring Security config reviewed
- [ ] startup configuration updated

## Validation
- [ ] build passes
- [ ] startup passes
- [ ] DB init passes
- [ ] Redis init passes
- [ ] MQ init passes
- [ ] SQS init passes
- [ ] smoke tests pass

## Rollout
- [ ] canary plan written
- [ ] rollback triggers written
- [ ] dashboards ready
- [ ] on-call handoff ready
