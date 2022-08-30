# Decompresses suttehakkun compression format to 2bpp

def decompress():
        global j
        i = 0x400
        decoded_byte = 0

        while i != 0:
            byte = int.from_bytes(baserom.read(1), 'little')

            if byte < 0x40:
                if byte == 0x00:
                    decoded_byte = int.from_bytes(baserom.read(1), 'little')
                    # print("a 0x%04x: command $00 wrote $%02x" % (baserom.tell(), directbyte))
                    data[j] = decoded_byte
                    # print('direct address: $%04x, byte: $%02x, decoded: $%02x' % (baserom.tell(), byte, decoded_byte))
                    i-=1
                    j+=2
                elif byte < 0x05:
                    # print("wtf 0x%04x: command $%02x" % (baserom.tell(), byte))
                    temp = (byte - 0x05) & 0xff
                    temp = 0x100 - (temp << 2) & 0xff
                    # print('$%02x' % data[j - temp])
                    data[j] = data[j - temp]
                    j+=2
                    i-=1
                    if i <= 0:
                            break
                    # print('$%02x' % data[j - temp])
                    data[j] = data[j - temp]
                    decoded_byte = data[j]
                    j+=2
                    i-=1
                    
                elif byte >= 0x05:
                    count = byte - 4
                    for x in range(count):
                        if i <= 0:
                            break
                        # print("a 0x%04x: command $%02x wrote $%02x" % (baserom.tell(), byte, decoded_byte))
                        # print('j: $%04x, addr: $%04x' % (j, baserom.tell()))
                        data[j] = decoded_byte
                        # print('loop address: $%04x, byte: $%02x, decoded: $%02x' % (baserom.tell(), byte, decoded_byte))
                        i-=1
                        j+=2
                    
            else:
                decoded_byte = table[byte]
                data[j] = decoded_byte
                # print('normal address: $%04x, byte: $%02x, decoded: $%02x' % (baserom.tell(), byte, decoded_byte))
                i-=1
                j+=2

bank = 0x08 # 0x08
addr = 0x4100 # 0x4100
data = [0] * 0x800

start_addr = 0
end_addr = 0

with open("table.hex", "rb") as f:
    table = f.read()

with open("suttehakkun.gb", "rb") as baserom:
        print("Reading encoded data...")
        baserom.seek((bank * 0x4000) + (addr - 0x4000))
        start_addr = baserom.tell()
        print("Start address: $%04x" % start_addr)
        j = 0
        decompress()
        j = 1
        decompress()
        end_addr = baserom.tell()
        print("End address:   $%04x" % end_addr)
        with open("encoded_%02x_%04x.sf" % (bank, addr), "wb") as ofile:
                baserom.seek(start_addr)
                ofile.write(baserom.read(end_addr - start_addr))
                

with open("decoded_%02x_%04x.w128.2bpp" % (bank, addr), "wb") as f:
        print("Writing 2bpp data...")
        f.write(bytearray(data))

# Convert 2bpp to png here

print("Done!")
