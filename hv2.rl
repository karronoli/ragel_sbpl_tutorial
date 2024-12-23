def parse (data)

%%{
  machine hv2;

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

  main := STX (OPE_A OPE_H* OPE_V* OPE_Z)* ETX @ok;

  write data;
  write init;
  write exec;
}%%

end

require "debug/start"
1
