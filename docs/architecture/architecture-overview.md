# Architecture Overview (Demo)

High-level architecture for the V6 Extension Engine:

- V6 calls **Adapter.dll** (COM entrypoint).
- Adapter collects frame data and builds a request.
- **Core.dll** orchestrates the calculation pipeline.
- **Rules.dll** reads rules.json and classifies members.
- **DataProviders.dll** provides section properties and MPA values.
- **Contracts.dll** holds shared DTOs / enums / schemas.
- **Infrastructure.dll** handles logging, config, etc.
