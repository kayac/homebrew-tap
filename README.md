# kayac Homebrew Tap

This is the official Homebrew tap for software distributed by KAYAC Inc.

## Available Packages

This tap provides Homebrew formulas for the following software packages. For the complete list of available packages, see the `*.rb` formula files in this repository.

### Installing Packages

You can install any package using:

```bash
brew install kayac/tap/<package-name>
```

Example:
```bash
brew install kayac/tap/ecspresso
```

## Development and Maintenance

### Prerequisites

- [aqua](https://aquaproj.github.io/) for dependency management
- [maltmill](https://github.com/Songmu/maltmill) for formula updates

### Setup

Install development dependencies:

```bash
aqua i
```

### Updating Formulas

Update a specific formula:
```bash
make update/<package-name>
```

Update all formulas:
```bash
make update-all
```

Create a new formula:
```bash
make create/<package-name>.rb
```

### Testing

Test a specific formula:
```bash
make test/<package-name>.rb
```

The CI automatically tests all formulas on both Ubuntu and macOS when changes are pushed to the master branch.

## Automated Maintenance

This repository uses GitHub Actions for automated maintenance:

- **Continuous Testing**: All formulas are tested on push to master and pull requests
- **Automatic Updates**: Formulas are automatically updated twice daily (00:29 and 09:29 UTC) via scheduled workflow
- **Pull Request Creation**: Updated formulas automatically create pull requests for review

## Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test your changes locally using `make test/<package-name>`
5. Submit a pull request

All formulas are automatically tested in CI on both Ubuntu and macOS platforms before merging.

## License

See individual software packages for their respective licenses.
