# Flugger

Flugger is a powerful command-line interface (CLI) tool designed to streamline the development process in Flutter applications by automatically generating Dart models from Swagger API definitions. It ensures a quick and error-free integration of complex APIs into Flutter projects by parsing Swagger API documents and creating ready-to-use Dart models.

## Features

- **Automatic Model Generation**: Generate Dart models directly from Swagger API definitions (>= 3.0).
- **Custom Configuration**: Utilize `flugger.yaml` to customize generation processes based on your project needs.
- **CLI Support**: Easy-to-use CLI for generating models on-the-go.

## Installation

To install Flugger, add it as a dev_dependency in your Flutter project's `pubspec.yaml`:

```yaml
dev_dependencies:
  flugger: <latest_version>
```

Then, run the following command to install the package:

```bash
flutter pub get
```

## Configuration

Configure Flugger by creating a `flugger.yaml` file in your project root. Below is a sample configuration:

```yaml
generic_imports:
  - '../_all.dart'
url: 'https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/examples/v3.0/petstore.json'
models_output_path: './lib/gen/'
enums_output_path: './lib/gen/'
extensions_output_path: './lib/gen/'
structure: structured # options: structured, one_folder, one_file
request:
  name_sufix: 'RequestModel' 
  name_part_to_remove: 'Request' 
  parent_folder_name: 'request_models' 
  copyWith: true
  fromJson: false
  toJson: true
response:
  name_sufix: 'ResponseModel' 
  name_part_to_remove: 'Response' 
  parent_folder_name: 'response_models' 
  copyWith: false
  fromJson: true
  toJson: false
search:
  name_sufix: 'SearchModel' 
  name_part_to_remove: 'Search' 
  parent_folder_name: 'search_models' 
  copyWith: true
  fromJson: false
  toJson: true
model:
  name_sufix: 'Model' 
  name_part_to_remove: 'Model' 
  parent_folder_name: 'models' 
  copyWith: true
  fromJson: true
  toJson: true
enums:
  name_sufix: ''
  name_part_to_remove: ''
  parent_folder_name: 'enums'
logging: true
```

## Usage

To generate models, run the following command in your terminal:

```bash
dart run flugger
```

This will fetch the Swagger API definition from the specified URL and generate Dart models in the specified output directory.

## Contribution

Contributions are welcome! If you'd like to improve Flugger, please fork the repository and submit a pull request.

## License

Flugger is released under the MIT License. See the LICENSE file for more details.
