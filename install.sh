#!/bin/bash
set -e

echo "=== Cai dat 11 plugins ==="
pnpm add -w opencode-chrome-devtools@latest opencode-pty @prevalentware/opencode-goal-plugin opencode-swarm @zenobius/opencode-skillful opencode-goal-plugin opencode-kiro-auth @hueyexe/opencode-ensemble@0.16.0 @morphllm/opencode-morph-plugin opencode-gemini-auth

echo "=== Cai dat 200 skills ==="

# Swarm (39)
for s in brainstorm clarify clarify-spec codebase-review-swarm commit-pr consult council critic-gate deep-dive deep-research design-docs discover engineering-conventions execute fork-pr-operations gate-attribution issue-ingest issue-tracer loop merge-queue-readiness parallel-work-check phase-wrap plan pre-phase-briefing resume running-tests specify swarm swarm-ci-monitor swarm-implement swarm-pr-feedback swarm-pr-review swarm-pr-subscribe test-file-split worktree-retry-cleanup writing-tests ci-failure-batching ci-fix-monitor skill-edit-validation; do
  npx skills@latest add opencode-ai/opencode-swarm --skill "$s" 2>/dev/null
done

# Anthropic (18)
for s in algorithmic-art brand-guidelines canvas-design claude-api doc-coauthoring docx frontend-design internal-comms mcp-builder pdf pptx slack-gif-creator template-skill theme-factory web-artifacts-builder webapp-testing xlsx skill-creator; do
  npx skills@latest add anthropic/skills --skill "$s" 2>/dev/null
done

# Vercel (7)
for s in deploy-to-vercel vercel-cli-with-tokens vercel-optimize vercel-react-best-practices vercel-react-native-skills vercel-react-view-transitions web-design-guidelines; do
  npx skills@latest add vercel-labs/agent-skills --skill "$s" 2>/dev/null
done

# Stripe (6)
for s in connect-recommend stripe-best-practices stripe-directory stripe-docs stripe-projects upgrade-stripe; do
  npx skills@latest add stripe/ai --skill "$s" 2>/dev/null
done

# Netlify (15)
for s in netlify-access-control netlify-agent-runner netlify-ai-gateway netlify-blobs netlify-caching netlify-config netlify-database netlify-deploy netlify-edge-functions netlify-forms netlify-frameworks netlify-functions netlify-identity netlify-image-cdn netlify-mcp-servers; do
  npx skills@latest add netlify/context-and-tools --skill "$s" 2>/dev/null
done

# Supabase (2)
for s in supabase supabase-postgres-best-practices; do
  npx skills@latest add supabase/agent-skills --skill "$s" 2>/dev/null
done

# Angular (10)
for s in angular-component angular-di angular-directives angular-forms angular-http angular-routing angular-signals angular-ssr angular-testing angular-tooling; do
  npx skills@latest add analogjs/angular-skills --skill "$s" 2>/dev/null
done

# HashiCorp (17)
for s in azure-verified-modules terraform-search-import terraform-style-guide terraform-test refactor-module terraform-stacks new-terraform-provider provider-actions provider-docs provider-resources provider-test-patterns run-acceptance-tests terraform-policy aws-ami-builder azure-image-builder windows-builder push-to-registry; do
  npx skills@latest add hashicorp/agent-skills --skill "$s" 2>/dev/null
done

# OpenAI curated (36)
for s in aspnet-core bug-fixing chatgpt-apps cli-creator cloudflare-deploy define-goal figma figma-code-connect-components figma-create-design-system-rules figma-create-new-file figma-generate-design figma-generate-library figma-implement-design figma-use gh-address-comments gh-fix-ci hatch-pet jupyter-notebook linear migrate-to-codex notion-knowledge-capture notion-meeting-intelligence notion-research-documentation notion-spec-to-implementation openai-docs playwright playwright-interactive render-deploy screenshot security-best-practices security-ownership-map security-threat-model sentry speech test-driven-development transcribe; do
  npx skills@latest add openai/skills --skill "$s" 2>/dev/null
done

# Other
npx skills@latest add opencode-ai/opencode-chrome-devtools --skill browser-automation 2>/dev/null
npx skills@latest add opencode-ai/opencode-plugin-creator --skill plugin-creator 2>/dev/null
npx skills@latest add vercel-labs/skills --skill find-skills 2>/dev/null
npx skills@latest add voltagent/skills --skill create-voltagent 2>/dev/null
npx skills@latest add voltagent/skills --skill voltagent-best-practices 2>/dev/null
npx skills@latest add voltagent/skills --skill voltagent-docs-bundle 2>/dev/null

echo "=== Tao opencode.json ==="
cat > opencode.json << 'EOF'
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": [
    "opencode-chrome-devtools@latest",
    "opencode-pty",
    "@prevalentware/opencode-goal-plugin",
    "opencode-swarm",
    "@zenobius/opencode-skillful",
    "opencode-goal-plugin",
    "opencode-kiro-auth",
    "@hueyexe/opencode-ensemble@0.16.0",
    "@morphllm/opencode-morph-plugin",
    "opencode-gemini-auth"
  ]
}
EOF

echo "=== DONE! Gõ 'opencode' de bat dau ==="
