# Base Image

The Base Image provides the common runtime environment for all ResearchLab Docker images.

## Purpose

This image contains only generic development tools.

Scientific software should **not** be installed here.

## Installed Software

- Ubuntu
- GCC
- CMake
- Git
- Python
- Pip

## Derived Images

```text
base
├── cantera
├── openfoam
├── pele
├── ai
└── visualization
```

## Design Principles

- Minimal
- Stable
- Reusable
- Easy to maintain