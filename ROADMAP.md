                         ResearchLab Architecture
================================================================================

                               ┌──────────────────────┐
                               │         base         │
                               ├──────────────────────┤
                               │ Ubuntu LTS           │
                               │ Python               │
                               │ Git                  │
                               │ SSH                  │
                               │ code-server          │
                               │ CMake                │
                               │ 基础开发工具          │
                               └──────────┬───────────┘
                                          │
                                          ▼
                               ┌──────────────────────┐
                               │       cpu-dev        │
                               ├──────────────────────┤
                               │ MPI                  │
                               │ Cantera              │
                               │ NumPy / SciPy        │
                               │ HDF5 / NetCDF        │
                               │ Debug Tools          │
                               │ Scientific Libraries │
                               └──────────┬───────────┘
                                          │
                                          ▼
                               ┌──────────────────────┐
                               │      cuda-dev        │
                               ├──────────────────────┤
                               │ CUDA Toolkit         │
                               │ NCCL                 │
                               │ CUDA-aware MPI       │
                               │ Nsight               │
                               │ GPU Toolchain        │
                               └──────────┬───────────┘


================================================================================
                           Application Layer
================================================================================

                    CPU Applications                 GPU Applications
              ───────────────────────────      ───────────────────────────

               OpenFOAM                        PeleSuite (CUDA)

               PeleSuite (CPU)                 AI (PyTorch CUDA)

               AI (CPU)                        Visualization (GPU)

               Visualization                  LAMMPS (GPU)

               SU2                            OpenMC (GPU)

               LAMMPS (CPU)

               其他 CPU 软件                  其他 GPU 软件


================================================================================
                           Workspace Layer
================================================================================

workspace/
├── Projects/
├── Datasets/
├── Models/
├── Papers/
└── Shared/


================================================================================
                           Design Principles
================================================================================

Capability Layer
    base
      ↓
    cpu-dev
      ↓
    cuda-dev

Application Layer
    所有科研软件互相独立
    只依赖能力层
    不互相继承

Workspace Layer
    所有镜像共享统一工作目录
    保证源码、数据、结果一致