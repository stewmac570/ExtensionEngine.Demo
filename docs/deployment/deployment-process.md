# Deployment Process (Demo)

1. Developer works on a feature branch.
2. Pull Request into main; GitHub builds the solution and runs tests.
3. When approved and merged, a release tag (e.g. v1.0.0) is created.
4. GitHub builds all DLLs in Release mode and creates a bundle ZIP:
   - Engine DLLs
   - Adapter DLL
   - rules.json
   - mpa.json
   - version.txt
5. The bundle is copied into the Citrix master image at a fixed path.
6. Citrix image is promoted through dev / test / prod.
