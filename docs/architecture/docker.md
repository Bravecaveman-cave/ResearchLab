# Docker Architecture

## Goal

ResearchLab uses Docker to provide a reproducible development and research environment.

---

## Image Hierarchy

```text
base
   │
   ├── cantera
   ├── openfoam
   ├── pele
   └── visualization
```

---

## Design Principles

- One image, one responsibility.
- Keep images modular.
- Use Docker Compose to integrate multiple services.
- Persist research data through mounted host directories.

---

## Mounted Directories

```text
Host Workspace
        │
        ▼
Container /workspace
```

Research data should always remain on the host machine.

---

## Future Work

- CUDA image
- Multi-stage build
- CI image build
- Registry publishing