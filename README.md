# Social Network Analysis Workshop

A practical introduction to Social Network Analysis (SNA), from foundational graph theory and social networks to computational methods and statistical modelling in R. Developed for the [Grand Union DTP](https://www.granduniondtp.ac.uk) two-day workshop at the University of Oxford, taught by [Dr Clemens Jarnach](https://clemensjarnach.github.io).

**Online book:** [clemensjarnach.github.io/social_network_analysis_workshop](https://clemensjarnach.github.io/social_network_analysis_workshop/)

---

## Repository Structure

```
.
├── index.qmd                          # Introduction and workshop overview
├── 1_what_are_networks.qmd            # Chapter 1: What are networks?
├── 2_slides.qmd                       # Chapter 2: Lecture slides
├── 3_r_fundamentals.qmd               # Chapter 3: R fundamentals
├── 4_creating_your_first_network.qmd  # Chapter 4: Creating your first network
├── 5_analysing_networks_in_R.qmd      # Chapter 5: Analysing networks in R
├── 6_network_data.qmd                 # Chapter 6: Network data
├── 7_statistical_models_for_networks.qmd  # Chapter 7: Statistical models
├── 8_design_your_network_project.qmd  # Chapter 8: Design your project
├── data/                              # Datasets used in the workshop
├── files/                             # Supplementary files (e.g. syllabus PDF)
├── media/                             # Images and media assets
├── docs/                              # Rendered HTML output (GitHub Pages)
├── _quarto.yml                        # Quarto book configuration
└── references.bib                     # Bibliography
```

---

## Getting Started

The workshop materials are written in [Quarto](https://quarto.org). To render the book locally:

1. Install [R](https://www.r-project.org) and [Quarto](https://quarto.org/docs/get-started/)
2. Install required R packages (listed in each chapter)
3. Clone the repository and open `social_network_analysis_workshop.Rproj` in RStudio
4. Run `quarto render` in the terminal to build the book into the `docs/` folder

Or simply read the book online at [clemensjarnach.github.io/social_network_analysis_workshop](https://clemensjarnach.github.io/social_network_analysis_workshop/).
