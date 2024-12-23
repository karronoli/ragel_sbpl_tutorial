%%{
  machine az;

  STX = 0x02;
  ETX = 0x03;
  ESC = 0x1b;
  OPE_A = ESC "A";
  OPE_Z = ESC "Z";
  main := STX (OPE_A OPE_Z)* ETX;
}%%
