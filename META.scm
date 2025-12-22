;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;;; META.scm — prodigy-ssg
;;; Architecture Decisions and Development Practices

(define-module (prodigy-ssg meta)
  #:export (architecture-decisions
            development-practices
            design-rationale
            language-rules))

;;;============================================================================
;;; Language Rules (CRITICAL)
;;;============================================================================

(define language-rules
  '((mandatory-language . "Prolog")
    (enforcement-level . "absolute")
    (interpreter . "SWI-Prolog 8.0+")
    (rationale . "Each SSG satellite is the DEFINITIVE implementation for its language. prodigy-ssg IS the Prolog SSG.")
    (violations
     ("Python implementation" . "FORBIDDEN - defeats purpose")
     ("JavaScript/TypeScript" . "FORBIDDEN - use noteg-ssg for JS")
     ("Ruby implementation" . "FORBIDDEN - use jekyll")
     ("Go implementation" . "FORBIDDEN - use hugo")
     ("Any non-Prolog language" . "FORBIDDEN"))
    (exceptions
     (mcp-adapter . "ReScript allowed ONLY in adapters/ directory")
     (nickel-config . "Nickel allowed ONLY in ncl/ for configuration"))))

;;;============================================================================
;;; Architecture Decision Records (ADR)
;;;============================================================================

(define architecture-decisions
  '((adr-001
     (title . "Prolog-Only Implementation")
     (status . "accepted")
     (date . "2025-01-01")
     (context . "SSG satellites must embody their target language philosophy")
     (decision . "prodigy-ssg engine written entirely in Prolog using DCG, pattern matching, and logical inference")
     (consequences . ("Language-specific elegance" "Idiomatic patterns" "Backtracking for template matching")))

    (adr-002
     (title . "RSR Gold Compliance")
     (status . "accepted")
     (date . "2025-01-01")
     (context . "Part of hyperpolymath ecosystem requiring standardization")
     (decision . "Follow Rhodium Standard Repository guidelines at Gold level")
     (consequences . ("SHA-pinned GitHub Actions" "SPDX headers on all files" "OpenSSF Scorecard compliance" "CodeQL enabled")))

    (adr-003
     (title . "DCG-Based Parsing")
     (status . "accepted")
     (date . "2025-01-01")
     (context . "Need elegant markdown/frontmatter parsing")
     (decision . "Use Definite Clause Grammars (DCG) for all parsing tasks")
     (consequences . ("Declarative grammar definitions" "Composable parsers" "Prolog-native approach")))

    (adr-004
     (title . "Mustache-Compatible Templates")
     (status . "accepted")
     (date . "2025-01-01")
     (context . "Need familiar template syntax for users")
     (decision . "Implement {{ variable }} syntax with Prolog pattern matching backend")
     (consequences . ("Low learning curve" "Powerful Prolog evaluation" "Section/inverted section support")))

    (adr-005
     (title . "MCP Adapter Architecture")
     (status . "accepted")
     (date . "2025-01-01")
     (context . "Integration with poly-ssg-mcp hub required")
     (decision . "ReScript adapter in adapters/ directory as sole exception to Prolog-only rule")
     (consequences . ("Clean separation" "Adapter is thin shim" "All logic remains in Prolog")))

    (adr-006
     (title . "44-Component Structure")
     (status . "accepted")
     (date . "2025-12-22")
     (context . "Standardization with hyperpolymath project templates")
     (decision . "Adopt full 44-component structure adapted for Prolog")
     (consequences . ("Comprehensive testing" "Full accessibility support" "LSP integration")))))

;;;============================================================================
;;; Development Practices
;;;============================================================================

(define development-practices
  '((code-style
     (primary-language . "Prolog")
     (secondary-languages . ("ReScript (adapters only)" "Nickel (config only)"))
     (formatter . "SWI-Prolog conventions")
     (line-length . 100)
     (indent . "spaces")
     (indent-size . 2)
     (predicate-naming . "snake_case")
     (module-naming . "prodigy_*"))

    (security
     (sast . "CodeQL for workflow scanning")
     (dependency-scanning . "Dependabot enabled")
     (credentials . "Environment variables only, never committed")
     (input-validation . "Whitelist shell metacharacters for MCP queries")
     (command-injection . "Strict validation before shell execution")
     (license-compliance . "AGPL-3.0-or-later"))

    (testing
     (framework . "SWI-Prolog plunit")
     (coverage-minimum . 70)
     (unit-tests . "tests/unit/*.pl")
     (e2e-tests . "tests/e2e/*.pl"))

    (versioning
     (scheme . "Semantic Versioning 2.0.0")
     (changelog . "Keep a Changelog format")
     (release-process . "GitHub releases with auto-generated notes"))

    (documentation
     (format . "AsciiDoc primary, Markdown accepted")
     (api-docs . "Prolog doc comments with pldoc")
     (adr-location . "META.scm")
     (cookbook . "cookbook.adoc"))

    (ci-cd
     (primary . "GitHub Actions")
     (platforms . ("ubuntu-latest"))
     (prolog-version . "9.0+"))

    (branching
     (strategy . "GitHub Flow")
     (main-branch . "main")
     (pr-required . #t))))

;;;============================================================================
;;; Design Rationale
;;;============================================================================

(define design-rationale
  '((why-prolog
     "Prolog's logical inference and pattern matching make it ideal for:
      - Declarative site structure definition (facts about pages)
      - Backtracking for template alternatives
      - DCG for elegant parsing
      - Query-based content discovery
      This is THE Prolog SSG. No other language is acceptable.")

    (why-dcg
     "Definite Clause Grammars provide:
      - Composable grammar rules
      - Bidirectional parsing (parsing and generation)
      - Native Prolog integration
      - No external parser dependencies")

    (why-mustache-like
     "{{ variable }} syntax chosen because:
      - Familiar to web developers
      - Simple to parse with DCG
      - Prolog evaluation provides powerful features
      - Sections map naturally to Prolog predicates")))

;;; End of META.scm
