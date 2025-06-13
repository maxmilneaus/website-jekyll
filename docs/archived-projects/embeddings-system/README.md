# Archived Embeddings Recommendation System

This directory contains the archived components of the experimental embeddings recommendation system. This system was an attempt to implement semantic recommendations for notes but was never fully completed and was causing Jekyll build warnings and performance issues.

## Contents

- `plugins/`: Contains the Ruby plugins related to embeddings and Co-Pilot parsing.
  - `embeddings_recommendations.rb`: Main engine for embeddings.
  - `tag_based_recommendations.rb`: Original tag-based fallback system.
  - `copilot_parser.rb`: Experimental Co-Pilot data parser.
- `development-tools/`: Scripts used for development and debugging.
  - `debug_copilot.rb`: Debugging script for Co-Pilot integration.
  - `analyze_copilot_structure.py`: Python tool for analyzing Co-Pilot data.
- `documentation/`: Original planning and implementation documentation.
  - `EMBEDDINGS_RECOMMENDATIONS_PLAN.md`: Initial plan for the embeddings system.
- `configuration/`: Snippets of configuration related to the embeddings system.
  - `config-snippet.yml`: The `embeddings_recommendations` section removed from `_config.yml`.
- `ADR-20250613.md`: Architecture Decision Record for the archiving decision.
- `performance.md`: Document detailing the performance impact of removing the system.

## Decision to Archive

The decision to archive this system was made to:
- Eliminate Jekyll build warnings and errors.
- Improve build times by removing complex and incomplete parsing logic.
- Clean up the codebase by removing experimental and unused features.
- Reduce maintenance burden.

All original code and documentation have been preserved here for historical reference and in case any components are needed for future, simpler recommendation implementations.

## Rollback

To revert this cleanup, refer to the `Rollback Procedure` section in `docs/EMBEDDINGS_CLEANUP_EXECUTION_PLAN.md`.