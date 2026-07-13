# Documentation TODO

Tasks to complete before Version 1.0 is considered finished.

---

## Documentation Organization

### Reorganize Documentation Chapters

Move the documentation chapters into a dedicated folder to better reflect the structure of the technical manual.

Current:

docs/
    01_executive_summary.md
    02_project_overview.md
    ...

Target:

```text
docs/
│
├── book/
│   ├── COVER.md
│   ├── 00_documentation_index.md
│   ├── 01_executive_summary.md
│   ├── 02_project_overview.md
│   ├── 03_business_problem.md
│   ├── 04_business_processes.md
│   ├── 05_solution_architecture.md
│   ├── 06_data_flow_architecture.md
│   ├── 07_data_model.md
│   ├── 08_etl_design.md
│   ├── 09_data_dictionary.md
│   ├── 10_data_validation.md
│   ├── 11_reporting.md
│   └── 12_future_enhancements.md
```

Update any internal links after the move.

Status: Waiting until home development environment (macOS).
