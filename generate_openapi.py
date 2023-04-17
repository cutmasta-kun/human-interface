import os
import prance
import yaml

def write_yaml_file(filename, content):
    with open(filename, 'w') as file:
        yaml.dump(content, file, sort_keys=False)

def main():
    base_path = os.path.dirname(os.path.abspath(__file__))
    parser = prance.ResolvingParser(os.path.join(base_path, 'openapi.yaml'))
    openapi_resolved = parser.specification

    # Write the consolidated content to a new file
    write_yaml_file('generated_openapi.yaml', openapi_resolved)

if __name__ == '__main__':
    main()
