import argparse
import os

#replacement strings
WINDOWS_LINE_ENDING = b'\r\n'
UNIX_LINE_ENDING = b'\n'

def parse_args():
    parser = argparse.ArgumentParser(description='Replace file with lf.')
    parser.add_argument('-p','--path', dest='path', action='store')
    return parser.parse_args().path

def replace_clrf(input_file):
    with open(input_file, 'rb') as open_file:
        content = open_file.read()
    content = content.replace(WINDOWS_LINE_ENDING, UNIX_LINE_ENDING)
    with open(input_file, 'wb') as open_file:
        open_file.write(content)

if __name__ == '__main__':
    file_path = os.path.normpath(parse_args())
    if(file_path):
        print("Replacing files in %s"% (file_path))
        replace_clrf(file_path)
    
