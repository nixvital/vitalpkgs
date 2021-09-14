import click
import os
import json

@click.group()
def main():
    pass


@main.command()
@click.option('clang_path', '--clang',
              help = 'The clang bin path',
              type = click.STRING,
              default= '/nix/store/p5w6pzixrxzikq4vjvkzg7xccwwbvanv-clang-wrapper-11.1.0/bin/clang')
def cpp_json(clang_path: str):
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
            "compilerPath": clang_path,
            "cStandard": "c17",
            "cppStandard": "c++20",
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