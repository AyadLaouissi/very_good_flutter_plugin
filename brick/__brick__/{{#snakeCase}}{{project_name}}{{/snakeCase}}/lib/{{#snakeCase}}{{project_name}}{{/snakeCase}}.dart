// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}_platform_interface/{{#snakeCase}}{{project_name}}{{/snakeCase}}_platform_interface.dart';

{{#pascalCase}}{{project_name}}{{/pascalCase}}Platform get _platform => {{#pascalCase}}{{project_name}}{{/pascalCase}}Platform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}