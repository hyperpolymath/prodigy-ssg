;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;;; PLAYBOOK.scm — prodigy-ssg
;;; Executable Plans Specification
;;; Defines HOW actions execute (derived from META rules and user intent)

(define-module (prodigy-ssg playbook)
  #:export (build-plans
            execution-pipeline
            rollback-procedures))

;;;============================================================================
;;; Build Plans
;;; Specifies execution methodology for site generation
;;;============================================================================

(define build-plans
  '((plan-001
     (name . "Standard Build")
     (trigger . "just build")
     (steps
      ((step-1 (action . "validate-config") (required . #t))
       (step-2 (action . "scan-content") (required . #t))
       (step-3 (action . "parse-frontmatter") (required . #t))
       (step-4 (action . "parse-markdown") (required . #t))
       (step-5 (action . "apply-templates") (required . #t))
       (step-6 (action . "write-output") (required . #t))
       (step-7 (action . "copy-assets") (required . #f))))
     (rollback . "Remove partial output directory"))

    (plan-002
     (name . "Development Build")
     (trigger . "just dev")
     (steps
      ((step-1 (action . "standard-build"))
       (step-2 (action . "start-watcher"))
       (step-3 (action . "start-server"))))
     (rollback . "Stop server and watcher"))

    (plan-003
     (name . "Test Execution")
     (trigger . "just test")
     (steps
      ((step-1 (action . "run-unit-tests") (required . #t))
       (step-2 (action . "run-e2e-tests") (required . #t))
       (step-3 (action . "report-coverage") (required . #f))))
     (rollback . "Clean test artifacts"))

    (plan-004
     (name . "Container Build")
     (trigger . "just container-build")
     (steps
      ((step-1 (action . "validate-containerfile"))
       (step-2 (action . "build-image"))
       (step-3 (action . "tag-image"))
       (step-4 (action . "verify-image"))))
     (rollback . "Remove failed image"))))

;;;============================================================================
;;; Execution Pipeline
;;; Order of operations for all builds
;;;============================================================================

(define execution-pipeline
  '((phases
     ((phase-1 (name . "Validation")
               (description . "META validation and config checks")
               (actions . ("validate-prolog-syntax" "validate-config" "check-dependencies")))

      (phase-2 (name . "Preparation")
               (description . "Environment setup")
               (actions . ("create-output-dir" "load-templates" "index-content")))

      (phase-3 (name . "Processing")
               (description . "Content transformation")
               (actions . ("parse-all-content" "apply-templates" "process-assets")))

      (phase-4 (name . "Output")
               (description . "Generate final files")
               (actions . ("write-html" "generate-sitemap" "copy-static")))

      (phase-5 (name . "Verification")
               (description . "Post-build checks")
               (actions . ("validate-output" "check-links" "accessibility-scan")))))

    (failure-handling
     ((on-error . "rollback-to-previous-state")
      (preserve-state . #t)
      (log-to . "build.log")))))

;;;============================================================================
;;; Rollback Procedures
;;; Recovery actions when builds fail
;;;============================================================================

(define rollback-procedures
  '((build-failure
     (actions
      ("Remove partial output directory"
       "Restore previous _site if exists"
       "Log failure details"
       "Notify user with error summary")))

    (test-failure
     (actions
      ("Clean test artifacts"
       "Reset test database if used"
       "Generate failure report")))

    (container-failure
     (actions
      ("Remove failed image layers"
       "Clean buildah/podman cache"
       "Report build log")))))

;;;============================================================================
;;; Authority Boundaries
;;; PLAYBOOK cannot introduce new decision-making power
;;;============================================================================

(define authority-boundaries
  '((constraints
     ("Must respect META language rules"
      "Cannot override AGENTIC gating decisions"
      "Must be deterministically derivable from META + user intent"
      "Cannot grant permissions beyond what META allows"))

    (derived-from
     ("META.scm architecture decisions"
      "User explicit commands (just/must)"
      "STATE.scm current context"))))

;;; End of PLAYBOOK.scm
