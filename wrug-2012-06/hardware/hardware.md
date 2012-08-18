!SLIDE transition=scrollLeft
    @@@ C
    #include "nf2util.h"

    unsigned get_register(unsigned reg) {
      struct nf2device nf2;
      unsigned val;

      nf2.device_name = "nf2c0";
      check_iface(&nf2);
      openDescriptor(&nf2);

      readReg(&nf2, reg, &val);

      closeDescriptor(&nf2);

      return val;
    }

!SLIDE transition=scrollLeft
    @@@ C
    #include "nf2util.h"

    void set_register(unsigned reg, unsigned val) {
      struct nf2device nf2;

      nf2.device_name = "nf2c0";
      check_iface(&nf2);
      openDescriptor(&nf2);

      writeReg(&nf2, reg, val);

      closeDescriptor(&nf2);
    }

!SLIDE
    @@@ Ruby
    require 'ffi'

    class NetFPGA::Bridge
      extend FFI::Library
      ffi_lib "regset.so"

      attach_function :get_register, [:uint],        :uint
      attach_function :set_register, [:uint, :uint], :void
    end

    bridge = NetFPGA::Bridge.new
    bridge.get_register 0x2000200               #=> 0xbaadf00d
    bridge.set_register 0x2000204, 0xdeadbeef   #=> nil
