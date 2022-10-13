import glob
import os
import shutil

ROOT_PATH = "/Users/nakamurahekikai/Desktop/binnacle-icse2020/datasets/jessfraz"

def _get_file_paths(root_path: str):
    return glob.glob("/Users/nakamurahekikai/Desktop/binnacle-icse2020/datasets/jessfraz/**/*", recursive=True)

def main():
    file_paths = _get_file_paths(ROOT_PATH)
    for file_path in file_paths:
        if os.path.basename(file_path) != "Dockerfile":
            continue
        file_path_token = file_path.split("/"); new_file_name = "{token_2}.Dockerfile".format(token_2=file_path_token[-2])
        dst_file_path = "{root_path}/_patch/{file_name}".format(root_path=ROOT_PATH, file_name=new_file_name)
        shutil.copyfile(file_path, dst_file_path)


if __name__ == "__main__":
    main()