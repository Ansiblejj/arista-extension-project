import os
from switools.swi_lib import SwiFile

def verify_repo_assets(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".swix") or filename.endswith(".swi"):
            path = os.path.join(directory, filename)
            swi = SwiFile(path)
            if swi.verify_signature():
                print(f"PASS: {filename} is authentic.")
            else:
                print(f"FAIL: {filename} integrity check failed!")

if __name__ == "__main__":
    verify_repo_assets("./extensions")
