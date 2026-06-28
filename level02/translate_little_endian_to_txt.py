import sys

def main():
    if len(sys.argv) != 2:
        print("Only one argument is required")
        exit(1)

    res = ""

    for string in sys.argv[1].split("0x"):
        # traduction hex
        b = bytes.fromhex(string)
        # little to big endian
        b = b[::-1]
        #decodage utf-8
        res  += b.decode('utf-8')
    
    print(res)
main()
