# The Fallacy of Layered Abstractions: Why Software Security Mandates a Return to Proven Primitives and the Void Architecture™

This repository contains the LaTeX source code and build automation for the research paper authored by **xsigil** (`xsigil@section-9.sh`), Infrastructure Research Division at Section-9.sh.

## Abstract
Modern software engineering has unreservedly embraced excessive layered abstractions in pursuit of developer velocity. However, this stacking of opaque abstraction layers inevitably obscures execution semantics, leading to impedance mismatches across boundaries, vast supply-chain attack surfaces, and protocol drift.

This paper formally demonstrates the systemic failure of black-box security paradigms reliant on perimeter defenses (WAFs, dynamic scanners) and proposes **Void Architecture™**—constructed solely upon decades-proven primitives (Unix philosophy, direct Linux kernel primitives, and deterministic state machines)—as the sole viable path to verifiable white-box systems.

## Key Primitives
* **Kernel Sandbox**: Direct invocation of `unshare(2)`, `chroot(2)`, and volatile in-memory storage (`tmpfs`).
* **Runtime**: Pure static binaries compiled with `CGO_ENABLED=0` to eliminate dynamic shared library vulnerabilities.
* **Deterministic Transitions**: Hash-projected state mappings over embedded relational engines without opaque ORMs.

## Building the Paper

Prerequisites: `lualatex`, `luatexja`, and `latexmk`.

```bash
# Build both Japanese and English PDF versions
make all

# Build Japanese version only (build/the_fallacy_of_layered_abstractions_ja.pdf)
make ja

# Build English version only (build/the_fallacy_of_layered_abstractions_en.pdf)
make en

# Clean intermediate artifacts
make clean

```

## Author

* **xsigil** (`xsigil@section-9.sh`)
* Section-9.sh Infrastructure Research Division
