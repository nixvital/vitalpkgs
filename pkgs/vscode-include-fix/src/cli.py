import click
import os
import json
from pathlib import Path

@click.command()
@click.option('version', '-v', '--version',
              help = 'The version of clang.',
              type = click.STRING,
              default= '16')
def main(version:str):
    def _search_clang_from_nix_store(version:str):
      paths = Path('/nix/store').glob(f'*clang-wrapper-{version}*')
      clang =  { path.name.split("-")[-1]: str(path) for path in paths if path.is_dir() }
      if len(clang) == 0 and version != "16":
        print(f'clang-wrapper-{version} not found.')
        return _search_clang_from_nix_store("16")
      print(clang)
      max_version = max(clang.keys())
      return clang[max_version]
    
    include_path_env = os.getenv('CMAKE_INCLUDE_PATH')
    if include_path_env == None:
      print("CMAKE_INCLUDE_PATH has no content.")
      return 
    include_paths = list(set(include_path_env.split(':')))
    print(include_paths)
    
    js = {
      "configurations": [
          {
            "name": "Linux",
            "includePath": [
              "${workspaceFolder}/**"
            ],
            "defines": [
              "SPDLOG_FMT_EXTERNAL"
            ],
            "compilerPath": _search_clang_from_nix_store(version) + "/bin/clang",
            "cStandard": "c17",
            "cppStandard": "c++23",
            "intelliSenseMode": "linux-clang-x64"
          }
      ],
      "version": 4
    }
    print(js)
    for e in include_paths:
      js['configurations'][0]['includePath'].append(e)

    if not os.path.exists('.vscode'):
      os.makedirs('.vscode')

    with open('.vscode/c_cpp_properties.json', 'w') as fp:
      json.dump(js, fp, indent=4)


if __name__ == '__main__':
    main()