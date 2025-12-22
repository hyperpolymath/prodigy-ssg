;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;;; NEUROSYM.scm — prodigy-ssg
;;; Symbolic Semantics and Operational Algebra
;;; Defines semantic meaning (NOT permission granting)

(define-module (prodigy-ssg neurosym)
  #:export (operation-semantics
            composition-rules
            proof-obligations))

;;;============================================================================
;;; Core Principle
;;; NEUROSYM defines meaning. It does not grant permission.
;;;============================================================================

(define core-principle
  '((axiom . "NEUROSYM defines meaning. It does not grant permission.")
    (scope . ("Operation semantics" "Composition rules" "Proof obligations"))
    (excludes . ("Constitutional hierarchy (META)"
                 "Operational gating (AGENTIC)"
                 "Plan generation (PLAYBOOK)"
                 "State persistence (STATE)"))))

;;;============================================================================
;;; Operation Semantics
;;; Bidirectional definitions for all operations
;;;============================================================================

(define operation-semantics
  '((op-parse-markdown
     (name . "parse_markdown/2")
     (forward . "Markdown string → HTML string")
     (inverse . "HTML string → Markdown string (lossy)")
     (claim . "verified")
     (determinism . "deterministic")
     (entropy . 0)
     (composition . ("elem_to_html/2" "parse_inline/2")))

    (op-parse-frontmatter
     (name . "parse_frontmatter/3")
     (forward . "Content → (Frontmatter dict, Body)")
     (inverse . "None (destructive parsing)")
     (claim . "verified")
     (determinism . "deterministic")
     (entropy . 0))

    (op-apply-template
     (name . "apply_template/3")
     (forward . "Template + Context → Rendered HTML")
     (inverse . "None (information loss)")
     (claim . "verified")
     (determinism . "deterministic for same context")
     (entropy . 0))

    (op-build-site
     (name . "build_site/2")
     (forward . "Config + InputDir → OutputDir with files")
     (inverse . "None (file system effect)")
     (claim . "unverified-until-complete")
     (determinism . "deterministic for same inputs")
     (entropy . "high (file I/O)")
     (side-effects . ("Creates directories" "Writes files")))

    (op-shell-exec
     (name . "runCommand/2")
     (forward . "Command string → CommandResult")
     (inverse . "None (external effect)")
     (claim . "irreversible")
     (determinism . "non-deterministic (external system)")
     (entropy . "very-high")
     (security . "Requires input validation"))))

;;;============================================================================
;;; Composition Rules
;;; How operations combine with typing
;;;============================================================================

(define composition-rules
  '((rule-001
     (name . "Parse-then-Template")
     (composition . "parse_markdown ∘ apply_template")
     (type . "String → Dict → String")
     (invariant . "Template variables bound from frontmatter")
     (entropy-accumulation . "additive"))

    (rule-002
     (name . "Batch Processing")
     (composition . "maplist(process_file, Files, Results)")
     (type . "[File] → [Result]")
     (invariant . "Order independent, parallelizable")
     (entropy-accumulation . "multiplicative with file count"))

    (rule-003
     (name . "Validation Chain")
     (composition . "validate_config ∘ validate_content ∘ build")
     (type . "Config → Content → Output")
     (invariant . "Fails fast on first validation error")
     (entropy-accumulation . "zero until build phase"))))

;;;============================================================================
;;; Proof Obligations
;;; Requirements for verified claims
;;;============================================================================

(define proof-obligations
  '((obligation-001
     (operation . "parse_markdown")
     (claim . "Produces valid HTML")
     (proof-type . "Property-based testing")
     (discharge . "plunit tests with generators"))

    (obligation-002
     (operation . "apply_template")
     (claim . "All variables substituted or defaulted")
     (proof-type . "Static analysis")
     (discharge . "Template validation before render"))

    (obligation-003
     (operation . "build_site")
     (claim . "Output matches expected structure")
     (proof-type . "E2E testing")
     (discharge . "e2e_runner.pl verification"))

    (obligation-004
     (operation . "MCP query")
     (claim . "No command injection possible")
     (proof-type . "Input validation")
     (discharge . "Shell metacharacter rejection"))))

;;;============================================================================
;;; Claim Classifications
;;;============================================================================

(define claim-classifications
  '((verified
     (definition . "Proven correct through testing or formal methods")
     (operations . ("parse_markdown" "parse_frontmatter" "apply_template")))

    (unverified
     (definition . "Believed correct but not proven")
     (operations . ("incremental_build" "plugin_execution")))

    (irreversible
     (definition . "Cannot be undone; requires explicit confirmation")
     (operations . ("file_write" "shell_exec" "network_request")))))

;;;============================================================================
;;; Entropy Patterns
;;;============================================================================

(define entropy-patterns
  '((zero-entropy
     (description . "Pure computation, no side effects")
     (examples . ("Parsing" "Template rendering (in memory)")))

    (low-entropy
     (description . "Minimal side effects, easily reversible")
     (examples . ("Creating empty directories")))

    (medium-entropy
     (description . "File system modifications")
     (examples . ("Writing output files" "Copying assets")))

    (high-entropy
     (description . "External system interaction")
     (examples . ("Shell commands" "Network requests")))

    (critical-entropy
     (description . "Irreversible external effects")
     (examples . ("Deployment" "Publishing" "Database modifications")))))

;;; End of NEUROSYM.scm
