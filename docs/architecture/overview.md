# ResearchLab Architecture

## Overview

ResearchLab is an open, reproducible and portable computational research platform for CFD, combustion, scientific AI, and high-performance computing (HPC).

The project is designed around a layered architecture that separates infrastructure, scientific software, workflows, and research outputs.

---

## Layered Architecture

```text
+----------------------------+
|        Research            |
+----------------------------+
|         Workflow           |
+----------------------------+
|   Scientific Software      |
+----------------------------+
|      Infrastructure        |
+----------------------------+
```

---

## Infrastructure

Infrastructure provides a reproducible execution environment.

Components include:

- Docker
- Docker Compose
- Dev Containers
- Ubuntu
- CUDA
- MPI

---

## Scientific Software

Research software is installed on top of the infrastructure.

Examples include:

- OpenFOAM
- Cantera
- Pele
- ParaView
- PyTorch

---

## Workflow

Typical research workflow:

Simulation

↓

Post-processing

↓

Dataset

↓

AI Training

↓

Publication

---

## Design Principles

- Reproducibility
- Portability
- Modularity
- Documentation First