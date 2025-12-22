;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;;; AGENTIC.scm — prodigy-ssg
;;; Operational Gating Policy Framework
;;; Defines WHEN actions may proceed (subordinate to META)

(define-module (prodigy-ssg agentic)
  #:export (gating-policies
            risk-thresholds
            override-mechanics))

;;;============================================================================
;;; Gating Policies
;;; Determines whether an action may proceed presently
;;;============================================================================

(define gating-policies
  '((gate-001
     (name . "Build Safety Gate")
     (description . "Ensures safe conditions before build")
     (conditions
      ((required . ("Output directory writable"
                    "No concurrent builds running"
                    "Config file valid"))
       (recommended . ("Tests passing"
                       "No uncommitted changes"))))
     (action-on-fail . "Block with explanation"))

    (gate-002
     (name . "Deployment Gate")
     (description . "Checks before container/system deployment")
     (conditions
      ((required . ("All tests pass"
                    "Security audit clean"
                    "Version tagged"))
       (recommended . ("Documentation up to date"))))
     (action-on-fail . "Require explicit override"))

    (gate-003
     (name . "MCP Query Gate")
     (description . "Security gate for external queries")
     (conditions
      ((required . ("No shell metacharacters in query"
                    "Query length under limit"
                    "Valid Prolog syntax"))))
     (action-on-fail . "Reject with error message"))

    (gate-004
     (name . "Release Gate")
     (description . "Checks before creating releases")
     (conditions
      ((required . ("All tests pass"
                    "No critical security issues"
                    "Changelog updated"
                    "Version bumped"))
       (recommended . ("README current"
                       "Examples working"))))
     (action-on-fail . "Block release"))))

;;;============================================================================
;;; Risk Thresholds
;;; Quantified risk levels for gating decisions
;;;============================================================================

(define risk-thresholds
  '((entropy-budget
     (low . 10)
     (medium . 50)
     (high . 100)
     (description . "Accumulated entropy from operations"))

    (operation-limits
     (file-writes-per-build . 1000)
     (shell-commands-per-session . 50)
     (network-requests-per-build . 10))

    (security-thresholds
     (max-query-length . 500)
     (forbidden-characters . ("'" "\"" "`" "$" ";" "|" "&" ">" "<" "\\"))
     (max-path-depth . 10))))

;;;============================================================================
;;; Override Mechanics
;;; When and how gates can be bypassed
;;;============================================================================

(define override-mechanics
  '((override-conditions
     ("META explicitly defines the override possibility"
      "User provides explicit present intent"
      "Override is logged and recorded"))

    (override-types
     ((force-build
       (requires . "User flag: --force")
       (bypasses . ("Test failures" "Uncommitted changes"))
       (logged . #t))

      (skip-audit
       (requires . "User flag: --skip-audit")
       (bypasses . ("Security scan"))
       (logged . #t)
       (warning . "Security audit skipped - use with caution"))

      (allow-dirty
       (requires . "User flag: --dirty")
       (bypasses . ("Uncommitted changes check"))
       (logged . #t))))

    (never-overridable
     ("META language rules (Prolog only)"
      "AGPL license requirements"
      "Command injection protections"
      "Critical security vulnerabilities"))))

;;;============================================================================
;;; Decision Documentation
;;; All gating decisions must be recorded
;;;============================================================================

(define decision-documentation
  '((requirements
     ("All overrides logged with timestamp"
      "Denied executions must be side-effect-free"
      "User memories/inferred goals not treated as explicit intent"))

    (log-format
     ((timestamp . "ISO8601")
      (gate . "Gate identifier")
      (decision . "allowed|blocked|overridden")
      (reason . "Explanation")
      (user-intent . "Explicit command if override")))))

;;; End of AGENTIC.scm
