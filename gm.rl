def parse (data)
  stack = []

%%{
  machine gm;

  action ok {
    puts("ok");
  }

  STX = 0x02;
  ETX = 0x03;
  ESC = 0x1b;

  OPE_A = ESC "A";
  OPE_Z = ESC "Z";
  OPE_H = ESC "H" [0-9]{4};
  OPE_V = ESC "V" [0-9]{4};

  OPE_GM_data := |*
    [0-9]{5} => {
      length = data[ts, te - ts].to_i;
      raise ', not found' unless data[p + 1] == ','
      p += 1
      image_bin = data[p, length];
      p += length
      fret;
    };
  *|;
  action call_GM_data { fcall OPE_GM_data; }
  OPE_GM = ESC "GM" @call_GM_data;

  main := STX
    (
      OPE_A OPE_H* OPE_V* OPE_GM* OPE_Z
    )*
    ETX @ok;

  write data;
  write init;
  write exec;
}%%

end

require "debug/start"
1
