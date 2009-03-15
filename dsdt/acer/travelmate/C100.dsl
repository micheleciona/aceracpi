/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20081031
 *
 * Disassembly of C100, Sun Mar 15 08:55:43 2009
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00003E26 (15910)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0x2C
 *     OEM ID           "Acer"
 *     OEM Table ID     "AN100 "
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000E (16777230)
 */
DefinitionBlock ("C100.aml", "DSDT", 1, "Acer", "AN100 ", 0x00001000)
{
    Scope (\)
    {
        Name (LIDS, 0x01)
        Name (LIDF, 0x00)
        Name (LIDX, 0x00)
        Name (DAT4, 0x00)
        Name (PCRD, 0x00)
        Name (USBD, 0x00)
        Name (VGAS, 0x00)
        Name (CRTS, 0x00)
        Name (LCDS, 0x00)
        Name (BRTS, 0x00)
        Name (OSIT, 0x00)
        OperationRegion (PM00, SystemIO, 0xF030, 0x04)
        Field (PM00, ByteAcc, NoLock, Preserve)
        {
            PM30,   8, 
            PM31,   8, 
            PM32,   8, 
            PM33,   8
        }

        OperationRegion (PM01, SystemIO, 0xF00D, 0x01)
        Field (PM01, ByteAcc, NoLock, Preserve)
        {
            PM0D,   8
        }

        OperationRegion (PM02, SystemIO, 0xF024, 0x01)
        Field (PM02, ByteAcc, NoLock, Preserve)
        {
            PM24,   8
        }

        OperationRegion (MEM1, SystemMemory, 0x04F0, 0x01)
        Field (MEM1, ByteAcc, NoLock, Preserve)
        {
            DAT0,   8
        }

        OperationRegion (MEM2, SystemMemory, 0x04F1, 0x01)
        Field (MEM2, ByteAcc, NoLock, Preserve)
        {
            DAT1,   8
        }

        OperationRegion (MEM3, SystemMemory, 0x04F2, 0x01)
        Field (MEM3, ByteAcc, NoLock, Preserve)
        {
            DAT2,   8
        }

        OperationRegion (MEM4, SystemMemory, 0x04F3, 0x01)
        Field (MEM4, ByteAcc, NoLock, Preserve)
        {
            DAT3,   8
        }

        OperationRegion (MEM5, SystemMemory, 0x04F4, 0x01)
        Field (MEM5, ByteAcc, NoLock, Preserve)
        {
            DAT5,   8
        }

        OperationRegion (MEM6, SystemMemory, 0x04F5, 0x01)
        Field (MEM6, ByteAcc, NoLock, Preserve)
        {
            DAT6,   8
        }
    }

    Scope (\_PR)
    {
        Processor (\_PR.CPU0, 0x01, 0x0000F050, 0x06)
        {
            Method (_CST, 0, NotSerialized)
            {
                Store (0x03, IOB3)
                Store (0x33, IOB2)
                If (LEqual (DAT5, 0x01))
                {
                    Return (Package (0x04)
                    {
                        0x03, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000001E47A70, // Address
                                    ,)
                            }, 

                            0x01, 
                            0x01, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000001E47A8F, // Address
                                    ,)
                            }, 

                            0x02, 
                            0x01, 
                            0x01F4
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000001E47AAE, // Address
                                    ,)
                            }, 

                            0x03, 
                            0x50, 
                            0xFA
                        }
                    })
                }
                Else
                {
                    Return (Package (0x05)
                    {
                        0x04, 
                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000001E47AD6, // Address
                                    ,)
                            }, 

                            0x01, 
                            0x01, 
                            0x03E8
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000001E47AF5, // Address
                                    ,)
                            }, 

                            0x02, 
                            0x01, 
                            0x01F4
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000001E47B14, // Address
                                    ,)
                            }, 

                            0x03, 
                            0x50, 
                            0xFA
                        }, 

                        Package (0x04)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x08,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000001E47B32, // Address
                                    ,)
                            }, 

                            0x03, 
                            0xB4, 
                            0x64
                        }
                    })
                }
            }

            Name (_PCT, Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000001E47B55, // Address
                        ,)
                }, 

                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000001E47B6A, // Address
                        ,)
                }
            })
            Method (_PPC, 0, NotSerialized)
            {
                Return (0x00)
            }

            Name (_PSS, Package (0x02)
            {
                Package (0x06)
                {
                    0x0382, 
                    0x55F0, 
                    0x01F4, 
                    0x00, 
                    0x83, 
                    0x00
                }, 

                Package (0x06)
                {
                    0x018F, 
                    0x2710, 
                    0x01F4, 
                    0x00, 
                    0x84, 
                    0x01
                }
            })
        }
    }

    OperationRegion (BDAC, SystemMemory, 0x04EB, 0x02)
    Field (BDAC, ByteAcc, NoLock, Preserve)
    {
        CIND,   8, 
        CDAT,   8
    }

    Name (PMOS, 0x11)
    Name (EXLP, 0x13)
    Name (CS1C, 0x1C)
    Name (CMHI, 0x2E)
    Name (CMLO, 0x2F)
    Name (DMAC, 0x33)
    Name (OBC1, 0x37)
    Name (SMIO, 0x39)
    Name (OBC2, 0x3A)
    Name (LLBW, 0x43)
    Name (EXML, 0x46)
    Name (EXMH, 0x47)
    Name (CS4A, 0x4A)
    Name (FNF4, 0x4C)
    Name (CS58, 0x58)
    Name (IDEP, 0x65)
    Name (IDES, 0x66)
    OperationRegion (CSMI, SystemIO, 0xB1, 0x03)
    Field (CSMI, ByteAcc, NoLock, Preserve)
    {
        IOB1,   8, 
        IOB2,   8, 
        IOB3,   8
    }

    Method (RCMS, 1, NotSerialized)
    {
        Store (Arg0, IOB3)
        Store (0x7B, IOB2)
        Return (IOB3)
    }

    Method (WCMS, 2, NotSerialized)
    {
        Store (Arg1, CDAT)
        Store (Arg0, IOB3)
        Store (0x7C, IOB2)
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x01)
    Field (DBG1, ByteAcc, NoLock, Preserve)
    {
        PX80,   8
    }

    OperationRegion (DEL0, SystemIO, 0xED, 0x01)
    Field (DEL0, ByteAcc, NoLock, Preserve)
    {
        PXED,   8
    }

    OperationRegion (BDAD, SystemMemory, 0x04ED, 0x02)
    Field (BDAD, ByteAcc, NoLock, Preserve)
    {
        C4ED,   8, 
        C4EE,   8
    }

    Name (\_S0, Package (0x02)
    {
        0x05, 
        0x05
    })
    Name (\_S3, Package (0x02)
    {
        0x01, 
        0x01
    })
    Name (\_S4, Package (0x02)
    {
        Zero, 
        Zero
    })
    Name (\_S5, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (\_PTS, 1, NotSerialized)
    {
        Store (Arg0, PX80)
        Store (0x0D, IOB3)
        Store (0x32, IOB2)
        If (LNotEqual (Arg0, 0x03))
        {
            Store (0x01, \LIDF)
            If (LEqual (SizeOf (\_OS), 0x11))
            {
                Store (0x03, \_SB.PCI0.PX40.PXB3)
                Store (0x32, \_SB.PCI0.PX40.PXB2)
            }
            Else
            {
                Store (0x04, \_SB.PCI0.PX40.PXB3)
                Store (0x32, \_SB.PCI0.PX40.PXB2)
            }
        }

        If (LEqual (Arg0, 0x01))
        {
            Or (PM24, 0x01, PM24)
            Or (\_SB.PCI0.OZ68.PMES, 0x01, \_SB.PCI0.OZ68.PMES)
            If (LEqual (SizeOf (\_OS), 0x11))
            {
                Store (0x00, \_SB.PCI0.PX40.PXB3)
            }
            Else
            {
                Store (0x06, \_SB.PCI0.PX40.PXB3)
            }

            Store (0x32, \_SB.PCI0.PX40.PXB2)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x0B, \_SB.PCI0.PX40.PXB3)
            Store (0x32, \_SB.PCI0.PX40.PXB2)
            Store (0x00, \_SB.PCI0.PX40.PXB3)
            Store (0x37, \_SB.PCI0.PX40.PXB2)
            Store (RCMS (CS4A), Local0)
            And (Local0, 0xDF, Local0)
            WCMS (CS4A, Local0)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (LEqual (\LIDX, 0x01))
            {
                Store (0x9F, \_SB.PCI0.PX40.EC0.P54T)
            }

            Store (0x01, \_SB.PCI0.PX40.PXB3)
            Store (0x32, \_SB.PCI0.PX40.PXB2)
            Store (0x07, \_SB.PCI0.PX40.PXB3)
            Store (0x32, \_SB.PCI0.PX40.PXB2)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x01, \_SB.PCI0.PX40.PXB3)
            Store (0x32, \_SB.PCI0.PX40.PXB2)
            Store (0x05, \_SB.PCI0.PX40.PXB3)
            Store (0x32, \_SB.PCI0.PX40.PXB2)
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Store (Arg0, PX80)
        Store (0x01, \BRTS)
        If (LEqual (Arg0, 0x01))
        {
            Store (0x00, \LIDF)
            Or (\_SB.PCI0.OZ68.PMES, 0x80, \_SB.PCI0.OZ68.PMES)
            Sleep (0x64)
            Store (0x02, \_SB.PCI0.PX40.PXB3)
            Store (0x32, \_SB.PCI0.PX40.PXB2)
            Sleep (0x0A)
            Store (0x34, \_SB.PCI0.PX40.PXB2)
            Sleep (0x64)
            Notify (\_SB.AC, 0x81)
            Notify (\_SB.BAT0, 0x81)
            Store (0x0D, \_SB.PCI0.PX40.PXB3)
            Store (0x31, \_SB.PCI0.PX40.PXB2)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (OSCP (\_OS, "Microsoft Windows"))
            {
                Store (0x00, OSTP)
            }
            Else
            {
                If (OSCP (\_OS, "Microsoft Windows NT"))
                {
                    Store (0x01, OSTP)
                }
                Else
                {
                    If (OSCP (\_OS, "Microsoft WindowsME: Millennium Edition"))
                    {
                        Store (0x02, OSTP)
                    }
                    Else
                    {
                        Store (0x07, OSTP)
                    }
                }
            }

            Notify (\_SB.BAT0, 0x81)
            Store (0x08, \_SB.PCI0.PX40.PXB3)
            Store (0x32, \_SB.PCI0.PX40.PXB2)
            Store (0x0D, \_SB.PCI0.PX40.PXB3)
            Store (0x31, \_SB.PCI0.PX40.PXB2)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x0C, \_SB.PCI0.PX40.PXB3)
            Store (0x32, \_SB.PCI0.PX40.PXB2)
            Store (RCMS (CS4A), Local0)
            And (Local0, 0x20, Local0)
            If (LNotEqual (Local0, 0x20))
            {
                Notify (\_SB.SLPB, 0x02)
                Notify (\_SB.AC, 0x80)
                Notify (\_SB.BAT0, 0x80)
            }
            Else
            {
                If (LEqual (OSTP, 0x00))
                {
                    Notify (\_SB.SLPB, 0x02)
                }
            }
        }
        Else
        {
            And (PM33, 0x01, Local1)
            If (LEqual (Local1, 0x00))
            {
                Store (0x00, \LIDS)
            }
            Else
            {
                Store (0x01, \LIDS)
            }

            If (LEqual (DAT6, 0x00))
            {
                Notify (\_SB.SLPB, 0x02)
            }
            Else
            {
                If (LEqual (SizeOf (\_OS), 0x11))
                {
                    Notify (\_SB.SLPB, 0x02)
                }
            }
        }

        Store (0x0E, IOB3)
        Store (0x32, IOB2)
    }

    Scope (\_SI)
    {
        Method (_SST, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x00))
            {
                Store (0x02, \_SB.PCI0.PX40.PXB3)
                Store (0x30, \_SB.PCI0.PX40.PXB2)
            }

            If (LOr (LEqual (Arg0, 0x01), LEqual (Arg0, 0x02)))
            {
                Store (0x02, \_SB.PCI0.PX40.PXB3)
                Store (0x30, \_SB.PCI0.PX40.PXB2)
            }

            If (LEqual (Arg0, 0x03))
            {
                Store (0x00, \_SB.PCI0.PX40.PXB3)
                Store (0x30, \_SB.PCI0.PX40.PXB2)
            }

            If (LEqual (Arg0, 0x04))
            {
                Store (0x01, \_SB.PCI0.PX40.PXB3)
                Store (0x30, \_SB.PCI0.PX40.PXB2)
            }
        }
    }

    Method (TPC1, 0, NotSerialized)
    {
        Store (0x00, DW01)
        Store (\_SB.PCI0.PX40.TPCP, DB00)
        Decrement (DB00)
        Multiply (DB00, 0x0A, DW01)
        Add (DW01, 0x0AAC, DW01)
        Return (DW01)
    }

    Method (TPS2, 0, NotSerialized)
    {
        Store (0x00, DW03)
        Store (\_SB.PCI0.PX40.TPSP, DB01)
        Decrement (DB01)
        Multiply (DB01, 0x0A, DW03)
        Add (DW03, 0x0AAC, DW03)
        Return (DW03)
    }

    Name (FANS, 0xFF)
    Name (TBUF, Buffer (0x08)
    {
        /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    CreateByteField (TBUF, 0x00, DB00)
    CreateByteField (TBUF, 0x01, DB01)
    CreateWordField (TBUF, 0x00, DW00)
    CreateWordField (TBUF, 0x02, DW01)
    CreateWordField (TBUF, 0x04, DW02)
    CreateWordField (TBUF, 0x06, DW03)
    CreateDWordField (TBUF, 0x00, DATD)
    Name (DBUF, Buffer (0x06)
    {
        0xA0, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    CreateByteField (DBUF, 0x00, RDTP)
    CreateByteField (DBUF, 0x01, DAB1)
    CreateByteField (DBUF, 0x02, DAB2)
    CreateByteField (DBUF, 0x03, DAB3)
    CreateByteField (DBUF, 0x04, DAB4)
    CreateByteField (DBUF, 0x05, DAB5)
    CreateWordField (DBUF, 0x01, DAW0)
    CreateWordField (DBUF, 0x03, DAW3)
    CreateDWordField (DBUF, 0x01, DAD1)
    OperationRegion (SMB0, SystemIO, 0xF100, 0x01)
    Field (SMB0, ByteAcc, NoLock, Preserve)
    {
        SM00,   8
    }

    OperationRegion (SMB2, SystemIO, 0xF102, 0x01)
    Field (SMB2, ByteAcc, NoLock, Preserve)
    {
        SM02,   8
    }

    OperationRegion (SMB3, SystemIO, 0xF103, 0x01)
    Field (SMB3, ByteAcc, NoLock, Preserve)
    {
        SM03,   8
    }

    OperationRegion (SMB4, SystemIO, 0xF104, 0x01)
    Field (SMB4, ByteAcc, NoLock, Preserve)
    {
        SM04,   8
    }

    OperationRegion (SMB5, SystemIO, 0xF105, 0x01)
    Field (SMB5, ByteAcc, NoLock, Preserve)
    {
        SM05,   8
    }

    OperationRegion (SMB6, SystemIO, 0xF106, 0x01)
    Field (SMB6, ByteAcc, NoLock, Preserve)
    {
        SM06,   8
    }

    Scope (\_TZ)
    {
        Method (SWFS, 0, NotSerialized)
        {
            And (SM00, 0x02, Local0)
            Store (0xC8, Local1)
            While (LAnd (LEqual (Local0, Zero), LNotEqual (Local1, Zero)))
            {
                Stall (0x01)
                And (SM00, 0x02, Local0)
            }

            Store (0xFF, SM00)
        }

        Method (WBYT, 3, NotSerialized)
        {
            Store (0xFF, SM00)
            Store (Arg0, SM04)
            Store (Arg1, SM03)
            Store (Arg2, SM05)
            Store (0x48, SM02)
            Sleep (0xC8)
            SWFS ()
        }

        Method (WWRD, 4, NotSerialized)
        {
            Store (0xFF, SM00)
            Store (Arg0, SM04)
            Store (Arg1, SM03)
            Store (Arg2, SM05)
            Store (Arg3, SM06)
            Store (0x4C, SM02)
            SWFS ()
        }

        Method (RBYT, 2, NotSerialized)
        {
            Store (0xFF, SM00)
            Or (Arg0, 0x01, SM04)
            Store (Arg1, SM03)
            Store (0x48, SM02)
            SWFS ()
            Store (SM05, DB00)
            Return (DB00)
        }

        Method (RWRD, 2, NotSerialized)
        {
            Store (0xFF, SM00)
            Or (Arg0, 0x01, SM04)
            Store (Arg1, SM03)
            Store (0x4C, SM02)
            SWFS ()
            Store (SM05, DB00)
            Store (SM06, DB01)
            Return (DW00)
        }

        ThermalZone (THR1)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Notify (\_SB.BAT0, 0x80)
                Store (0x04, \_SB.PCI0.PX40.PXB3)
                Store (0x33, \_SB.PCI0.PX40.PXB2)
                Store (\_SB.PCI0.PX40.C223, Local1)
                And (Local1, 0x80, Local2)
                If (LEqual (Local2, 0x80))
                {
                    Store (0x1E, Local1)
                }
                Else
                {
                    If (LLessEqual (Local1, 0x10))
                    {
                        Store (0x11, Local1)
                    }
                }

                Multiply (Local1, 0x0A, DW00)
                Add (DW00, 0x0AAC, DW00)
                Return (DW00)
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (TPC1 ())
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x03)
            Name (_TSP, 0x0258)
        }

        ThermalZone (THR2)
        {
            Method (_TMP, 0, NotSerialized)
            {
                Notify (\_SB.BAT0, 0x80)
                Store (0x05, \_SB.PCI0.PX40.PXB3)
                Store (0x33, \_SB.PCI0.PX40.PXB2)
                Store (\_SB.PCI0.PX40.C224, Local1)
                And (Local1, 0x80, Local2)
                If (LEqual (Local2, 0x80))
                {
                    Store (0x1E, Local1)
                }
                Else
                {
                    If (LLessEqual (Local1, 0x10))
                    {
                        Store (0x11, Local1)
                    }
                }

                Multiply (Local1, 0x0A, DW02)
                Add (DW02, 0x0AAC, DW02)
                Return (DW02)
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (TPS2 ())
            }

            Name (_TC1, 0x02)
            Name (_TC2, 0x03)
            Name (_TSP, 0x0258)
        }
    }

    Scope (\_GPE)
    {
        Method (_L00, 0, NotSerialized)
        {
            Sleep (0xC8)
            Store (0x34, \_SB.PCI0.PX40.PXB2)
            If (LEqual (SizeOf (\_OS), 0x11)) {}
            Else
            {
                Notify (\_TZ.THR1, 0x80)
                Notify (\_TZ.THR2, 0x80)
            }
        }

        Method (_L0B, 0, NotSerialized)
        {
            Store (0x88, \_SB.PCI0.PX40.EC0.P54S)
            Store (0x80, \_SB.PCI0.PX40.EC0.P54T)
            Store (0x35, \_SB.PCI0.PX40.PXB2)
            Or (PM0D, 0x08, PM0D)
            Store (0x01, \LIDS)
            Notify (\_SB.LID, 0x80)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Or (\_SB.PCI0.OZ68.PMES, 0x80, \_SB.PCI0.OZ68.PMES)
            And (\_SB.PCI0.OZ68.PWRS, 0xFC, \_SB.PCI0.OZ68.PWRS)
            Notify (\_SB.SLPB, 0x02)
        }
    }

    OperationRegion (OSBT, SystemMemory, 0x04EA, 0x01)
    Field (OSBT, ByteAcc, NoLock, Preserve)
    {
        OSTP,   3
    }

    Method (OSCP, 2, NotSerialized)
    {
        If (LNotEqual (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (0x00)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (TMB0, Buffer (Local0) {})
        Name (TMB1, Buffer (Local0) {})
        Store (Arg0, TMB0)
        Store (Arg1, TMB1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (TMB0, Local0)), DerefOf (Index (
                TMB1, Local0))))
            {
                Return (0x00)
            }
        }

        Return (0x01)
    }

    Scope (\_SB)
    {
        Device (PILA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x01)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (\_SB.PCI0.PX40.INTA, 0x80, \_SB.PCI0.PX40.INTA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y00)
                        {}
                })
                CreateWordField (BUF0, \_SB.PILA._CRS._Y00._INT, IRQW)
                Store (\_SB.PCI0.PX40.INTA, Local1)
                And (Local1, 0x80, Local1)
                If (LNotEqual (Local1, 0x80))
                {
                    And (\_SB.PCI0.PX40.INTA, 0x0F, Local0)
                    Store (0x01, Local2)
                    ShiftLeft (Local2, Local0, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                FindSetLeftBit (IRQW, Local0)
                Decrement (Local0)
                And (\_SB.PCI0.PX40.INTA, 0x70, Local1)
                Or (Local1, Local0, \_SB.PCI0.PX40.INTA)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.PX40.INTA, 0x80, Local0)
                If (LEqual (Local0, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILB)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x02)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {11,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (\_SB.PCI0.PX40.INTB, 0x80, \_SB.PCI0.PX40.INTB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y01)
                        {}
                })
                CreateWordField (BUF0, \_SB.PILB._CRS._Y01._INT, IRQW)
                Store (\_SB.PCI0.PX40.INTB, Local1)
                And (Local1, 0x80, Local1)
                If (LNotEqual (Local1, 0x80))
                {
                    And (\_SB.PCI0.PX40.INTB, 0x0F, Local0)
                    Store (0x01, Local2)
                    ShiftLeft (Local2, Local0, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                FindSetLeftBit (IRQW, Local0)
                Decrement (Local0)
                And (\_SB.PCI0.PX40.INTB, 0x70, Local1)
                Or (Local1, Local0, \_SB.PCI0.PX40.INTB)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.PX40.INTB, 0x80, Local0)
                If (LEqual (Local0, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (PILD)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x04)
            Method (_PRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,15}
                })
                Return (BUF0)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Or (\_SB.PCI0.PX40.INTD, 0x80, \_SB.PCI0.PX40.INTD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, _Y02)
                        {}
                })
                CreateWordField (BUF0, \_SB.PILD._CRS._Y02._INT, IRQW)
                Store (\_SB.PCI0.PX40.INTD, Local1)
                And (Local1, 0x80, Local1)
                If (LNotEqual (Local1, 0x80))
                {
                    And (\_SB.PCI0.PX40.INTD, 0x0F, Local0)
                    Store (0x01, Local2)
                    ShiftLeft (Local2, Local0, IRQW)
                }

                Return (BUF0)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQW)
                FindSetLeftBit (IRQW, Local0)
                Decrement (Local0)
                And (\_SB.PCI0.PX40.INTD, 0x70, Local1)
                Or (Local1, Local0, \_SB.PCI0.PX40.INTD)
            }

            Method (_STA, 0, NotSerialized)
            {
                And (\_SB.PCI0.PX40.INTD, 0x80, Local0)
                If (LEqual (Local0, 0x80))
                {
                    Return (0x09)
                }
                Else
                {
                    Return (0x0B)
                }
            }
        }

        Device (\_SB.SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
                If (OSCP (\_OS, "Microsoft Windows"))
                {
                    Store (0x00, OSTP)
                }
                Else
                {
                    If (OSCP (\_OS, "Microsoft Windows NT"))
                    {
                        Store (0x01, OSTP)
                    }
                    Else
                    {
                        If (OSCP (\_OS, "Microsoft WindowsME: Millennium Edition"))
                        {
                            Store (0x02, OSTP)
                        }
                        Else
                        {
                            Store (0x07, OSTP)
                        }
                    }
                }
            }

            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (PBRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFFDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFDFC0000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (PBRS, \_SB.PCI0._Y03._MIN, MEML)
                CreateDWordField (PBRS, \_SB.PCI0._Y03._LEN, LENM)
                ShiftLeft (C4EE, 0x08, Local1)
                Store (C4ED, Local2)
                Add (Local1, Local2, Local1)
                ShiftRight (Local1, 0x02, Local1)
                Add (Local1, 0x01, Local1)
                ShiftLeft (Local1, 0x14, MEML)
                Subtract (0xFFE00000, MEML, LENM)
                Return (PBRS)
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Name (_PRT, Package (0x09)
            {
                Package (0x04)
                {
                    0xFFFF, 
                    0x01, 
                    \_SB.PILB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.PILA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x00, 
                    \_SB.PILA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x01, 
                    \_SB.PILA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x00, 
                    \_SB.PILD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x00, 
                    \_SB.PILD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    \_SB.PILD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x01, 
                    \_SB.PILD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x03, 
                    \_SB.PILD, 
                    0x00
                }
            })
            Device (OBLN)
            {
                Name (_ADR, 0x00040000)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x05
                })
                OperationRegion (SBLN, PCI_Config, 0x00, 0xFF)
                Field (SBLN, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x54), 
                    PWRS,   8, 
                    PMES,   8
                }
            }

            Device (OZ68)
            {
                Name (_ADR, 0x00030000)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
                OperationRegion (SB68, PCI_Config, 0x00, 0xFF)
                Field (SB68, ByteAcc, NoLock, Preserve)
                {
                            Offset (0xA4), 
                    PWRS,   8, 
                    PMES,   8
                }
            }

            Device (OBMO)
            {
                Name (_ADR, 0x02)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (USB0)
            {
                Name (_ADR, 0x00070002)
            }

            Device (PX40)
            {
                Name (_ADR, 0x00070000)
                OperationRegion (SB40, PCI_Config, 0x60, 0x04)
                Field (SB40, ByteAcc, NoLock, Preserve)
                {
                    INTA,   8, 
                    INTB,   8, 
                    INTC,   8, 
                    INTD,   8
                }

                Device (MBRS)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (MSBF, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0xF000,             // Range Minimum
                            0xF000,             // Range Maximum
                            0x01,               // Alignment
                            0x40,               // Length
                            )
                        IO (Decode16,
                            0xF100,             // Range Minimum
                            0xF100,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xF050,             // Range Minimum
                            0xF050,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x03BD,             // Range Minimum
                            0x03BD,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        Memory32 (ReadWrite,
                            0xF7DFB100,         // Range Minimum
                            0xF7DFB100,         // Range Maximum
                            0x00000001,         // Alignment
                            0x00000F00,         // Length
                            )
                        Memory32 (ReadOnly,
                            0xFFFF0000,         // Range Minimum
                            0xFFFF0000,         // Range Maximum
                            0x00000000,         // Alignment
                            0x00010000,         // Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        Return (MSBF)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Name (JKB1, 0x3B)
                OperationRegion (ECMS, SystemIO, 0x72, 0x02)
                Field (ECMS, ByteAcc, NoLock, Preserve)
                {
                    EIND,   8, 
                    EDAT,   8
                }

                IndexField (EIND, EDAT, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x19), 
                    C219,   8, 
                            Offset (0x1C), 
                    TPCP,   8, 
                            Offset (0x1F), 
                    TPSP,   8, 
                            Offset (0x23), 
                    C223,   8, 
                    C224,   8, 
                            Offset (0x4E), 
                    C24E,   8, 
                            Offset (0x7B), 
                    TBUT,   8
                }

                OperationRegion (DBG1, SystemIO, 0x80, 0x01)
                Field (DBG1, ByteAcc, NoLock, Preserve)
                {
                    PX80,   8
                }

                OperationRegion (DEL0, SystemIO, 0xED, 0x01)
                Field (DEL0, ByteAcc, NoLock, Preserve)
                {
                    DLAY,   8
                }

                OperationRegion (SMI1, SystemIO, 0xB2, 0x02)
                Field (SMI1, ByteAcc, NoLock, Preserve)
                {
                    PXB2,   8, 
                    PXB3,   8
                }

                Device (PIC0)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (DMA0)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8, )
                            {4}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (TMR0)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (SPK0)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (RCMS (JKB1), 0x10, Local1)
                        If (LEqual (Local1, 0x10))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (KBC1)
                {
                    Name (_HID, EisaId ("PNP0320"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        And (RCMS (JKB1), 0x10, Local1)
                        If (LEqual (Local1, 0x10))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                OperationRegion (NSIO, SystemIO, 0x2E, 0x02)
                Field (NSIO, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                    FER,    8, 
                    FAR,    8, 
                    PTR,    8, 
                            Offset (0x04), 
                    PCR,    8, 
                            Offset (0x18), 
                    SCF1,   8, 
                            Offset (0x1B), 
                    PNP0,   8, 
                    PNP1,   8, 
                            Offset (0x40), 
                    SCF2,   8, 
                    FIRQ,   4, 
                    FDMA,   3, 
                            Offset (0x42), 
                    PBAL,   8, 
                    PBAH,   8, 
                    U1BL,   8, 
                    U1BH,   8, 
                    U2BL,   8, 
                    U2BH,   8, 
                    FBAL,   8, 
                    FBAH,   8, 
                    SBAL,   8, 
                    SBAH,   8, 
                            Offset (0x4F), 
                    PNP3,   8
                }

                Device (IR1)
                {
                    Name (_HID, EisaId ("NSC6001"))
                    Name (_CID, EisaId ("PNP0511"))
                    Method (_STA, 0, NotSerialized)
                    {
                        And (FER, 0x04, Local0)
                        If (LEqual (Local0, 0x04))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x0D)
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (FER, 0xFB, FER)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x92F8,             // Range Minimum
                                0x92F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                _Y04)
                            IRQNoFlags (_Y05)
                                {3}
                            DMA (Compatibility, NotBusMaster, Transfer8_16, _Y06)
                                {3}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.PX40.IR1._CRS._Y04._MIN, IOW1)
                        CreateWordField (BUF0, \_SB.PCI0.PX40.IR1._CRS._Y04._MAX, IOW2)
                        CreateWordField (BUF0, \_SB.PCI0.PX40.IR1._CRS._Y05._INT, IRQW)
                        CreateByteField (BUF0, \_SB.PCI0.PX40.IR1._CRS._Y06._DMA, DMAV)
                        And (FER, 0x04, Local0)
                        If (LEqual (Local0, 0x04))
                        {
                            And (U2BL, 0xFE, Local0)
                            ShiftLeft (Local0, 0x02, Local0)
                            Store (U2BH, Local1)
                            And (Local1, 0xFC, Local1)
                            ShiftLeft (Local1, 0x08, Local1)
                            Or (Local1, Local0, Local1)
                            Store (Local1, IOW1)
                            Store (Local1, IOW2)
                            And (PNP1, 0xF0, Local0)
                            ShiftRight (Local0, 0x04, Local0)
                            Store (0x01, Local1)
                            ShiftLeft (Local1, Local0, IRQW)
                            And (PNP3, 0x07, Local1)
                            Decrement (Local1)
                            Store (0x01, Local0)
                            ShiftLeft (Local0, Local1, DMAV)
                        }

                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x93F8,             // Range Minimum
                                0x93F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5}
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x92F8,             // Range Minimum
                                0x92F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5}
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x93E8,             // Range Minimum
                                0x93E8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5}
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {0,1,3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x92E8,             // Range Minimum
                                0x92E8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5}
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {0,1,3}
                        }
                        EndDependentFn ()
                        /*** Disassembler: inserted missing EndDependentFn () ***/
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x02, IOW)
                        CreateWordField (Arg0, 0x09, IRQW)
                        CreateByteField (Arg0, 0x0C, DMAV)
                        ShiftRight (IOW, 0x02, Local0)
                        And (U2BL, 0x01, Local1)
                        Or (Local1, Local0, Local0)
                        Store (Local0, U2BL)
                        And (IOW, 0xFC00, Local0)
                        ShiftRight (Local0, 0x08, Local0)
                        And (U2BH, 0x03, Local1)
                        Or (Local1, Local0, Local1)
                        Store (Local1, U2BH)
                        FindSetRightBit (IRQW, Local0)
                        Decrement (Local0)
                        ShiftLeft (Local0, 0x04, Local0)
                        And (PNP1, 0x0F, Local1)
                        Or (Local1, Local0, PNP1)
                        FindSetRightBit (DMAV, Local0)
                        And (PNP3, 0xF8, Local1)
                        Or (Local1, Local0, PNP3)
                        Or (SCF2, 0x80, SCF2)
                        Or (FER, 0x04, FER)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        And (FER, 0x04, Local0)
                        If (LEqual (Local0, 0x04))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        Or (FER, 0x04, FER)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        And (FER, 0xFB, FER)
                    }
                }

                Device (WAC1)
                {
                    Name (_HID, "WACF004")
                    Method (_STA, 0, NotSerialized)
                    {
                        And (FER, 0x02, Local0)
                        If (LEqual (Local0, 0x02))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            And (U1BL, 0xFE, Local0)
                            And (U1BH, 0xFC, Local1)
                            If (LOr (Local0, Local1))
                            {
                                Return (0x0D)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        And (FER, 0xFD, FER)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x93F8,             // Range Minimum
                                0x93F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                _Y07)
                            IRQNoFlags (_Y08)
                                {4}
                        })
                        CreateWordField (BUF0, \_SB.PCI0.PX40.WAC1._CRS._Y07._MIN, IOW1)
                        CreateWordField (BUF0, \_SB.PCI0.PX40.WAC1._CRS._Y07._MAX, IOW2)
                        CreateWordField (BUF0, \_SB.PCI0.PX40.WAC1._CRS._Y08._INT, IRQW)
                        And (FER, 0x02, Local0)
                        If (LEqual (Local0, 0x02))
                        {
                            And (U1BL, 0xFE, Local0)
                            ShiftLeft (Local0, 0x02, Local0)
                            Store (U1BH, Local1)
                            And (Local1, 0xFC, Local1)
                            ShiftLeft (Local1, 0x08, Local1)
                            Or (Local1, Local0, Local1)
                            Store (Local1, IOW1)
                            Store (Local1, IOW2)
                            And (PNP1, 0x0F, Local0)
                            Store (0x01, Local1)
                            ShiftLeft (Local1, Local0, IRQW)
                        }
                        Else
                        {
                            Store (0x00, IOW1)
                            Store (0x00, IOW2)
                            Store (0x00, IRQW)
                        }

                        Return (BUF0)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x93F8,             // Range Minimum
                                0x93F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x92F8,             // Range Minimum
                                0x92F8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x93E8,             // Range Minimum
                                0x93E8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x92E8,             // Range Minimum
                                0x92E8,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5}
                        }
                        EndDependentFn ()
                        /*** Disassembler: inserted missing EndDependentFn () ***/
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x02, IOW)
                        CreateWordField (Arg0, 0x09, IRQW)
                        ShiftRight (IOW, 0x02, Local0)
                        And (U1BL, 0x01, Local1)
                        Or (Local1, Local0, Local0)
                        Store (Local0, U1BL)
                        And (IOW, 0xFC00, Local0)
                        ShiftRight (Local0, 0x08, Local0)
                        And (U1BH, 0x03, Local1)
                        Or (Local1, Local0, Local1)
                        Store (Local1, U1BH)
                        FindSetRightBit (IRQW, Local0)
                        Decrement (Local0)
                        And (PNP1, 0xF0, Local1)
                        Or (Local1, Local0, PNP1)
                        Or (FER, 0x02, FER)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        And (FER, 0x02, Local0)
                        If (LEqual (Local0, 0x02))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x03)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)
                    {
                        Or (FER, 0x02, FER)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        And (FER, 0xFD, FER)
                    }
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x18)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (ECRS, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0062,             // Range Minimum
                                0x0062,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                            IO (Decode16,
                                0x0066,             // Range Minimum
                                0x0066,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                )
                        })
                        Return (ECRS)
                    }

                    OperationRegion (RAM, EmbeddedControl, 0x00, 0x7F)
                    Field (RAM, AnyAcc, Lock, Preserve)
                    {
                                Offset (0x01), 
                        SCIC,   8, 
                                Offset (0x04), 
                        CMCD,   8, 
                        DAT1,   8, 
                        DAT2,   8, 
                        DAT3,   8, 
                                Offset (0x48), 
                        P54S,   8, 
                        P55S,   8, 
                        P54T,   8, 
                        P55T,   8, 
                        P54D,   8, 
                        P55D,   8, 
                            ,   4, 
                        P54,    1, 
                        P55,    1, 
                                Offset (0x4F), 
                                Offset (0x53), 
                        P63S,   8, 
                                Offset (0x57), 
                        P67S,   8, 
                                Offset (0x78), 
                            ,   3, 
                        P63,    1, 
                        P64,    1, 
                            ,   2, 
                        P67,    1
                    }

                    OperationRegion (ECO1, SystemIO, 0x62, 0x01)
                    Field (ECO1, ByteAcc, Lock, Preserve)
                    {
                        PX62,   8
                    }

                    OperationRegion (ECO2, SystemIO, 0x66, 0x01)
                    Field (ECO2, ByteAcc, Lock, Preserve)
                    {
                        PX66,   8
                    }

                    Method (_Q01, 0, NotSerialized)
                    {
                        Store (0x01, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q02, 0, NotSerialized)
                    {
                        Store (0x02, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q0F, 0, NotSerialized)
                    {
                        Store (0x14, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q03, 0, NotSerialized)
                    {
                        Store (0x04, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                        Notify (\_SB.SLPB, 0x80)
                        Store (0x0D, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q04, 0, NotSerialized)
                    {
                        Store (0x07, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q10, 0, NotSerialized)
                    {
                        Store (0x15, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q11, 0, NotSerialized)
                    {
                        Store (0x17, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q12, 0, NotSerialized)
                    {
                        Store (0x18, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q13, 0, NotSerialized)
                    {
                        Store (0x19, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q14, 0, NotSerialized)
                    {
                        Store (0x1A, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q0A, 0, NotSerialized)
                    {
                        Store (0x1B, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q0B, 0, NotSerialized)
                    {
                        Store (0x1C, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q0C, 0, NotSerialized)
                    {
                        Store (0x1D, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Store (0x1E, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        Store (0x1F, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q2E, 0, NotSerialized)
                    {
                        And (PM33, 0x01, Local1)
                        If (LEqual (Local1, 0x00))
                        {
                            Store (0x01, \LIDX)
                            Store (0x98, \_SB.PCI0.PX40.EC0.P54S)
                            Store (0xB9, \_SB.PCI0.PX40.EC0.P54T)
                            Store (0x00, \LIDS)
                            Store (0x15, \_SB.PCI0.PX40.PXB3)
                            Store (0x31, \_SB.PCI0.PX40.PXB2)
                        }
                        Else
                        {
                            Store (0x00, \LIDX)
                            Store (0x01, \LIDS)
                        }

                        Store (0x35, \_SB.PCI0.PX40.PXB2)
                        Notify (\_SB.LID, 0x80)
                    }

                    Method (_Q2F, 0, NotSerialized)
                    {
                        Store (0x02, \BRTS)
                        Sleep (0xC8)
                        Store (0x03, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                        Notify (\_SB.AC, 0x80)
                        Notify (\_SB.BAT0, 0x80)
                        Store (0x0D, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                    }

                    Method (_Q33, 0, NotSerialized)
                    {
                        Store (0x02, \BRTS)
                        Sleep (0xC8)
                        Store (0x00, \_SB.PCI0.PX40.PXB3)
                        Store (0x31, \_SB.PCI0.PX40.PXB2)
                        If (LEqual (\_SB.PCI0.PX40.EC0.P63, 0x01))
                        {
                            Store (0x80, \_SB.PCI0.PX40.EC0.P63S)
                        }
                        Else
                        {
                            Store (0x90, \_SB.PCI0.PX40.EC0.P63S)
                        }

                        Notify (\_SB.BAT0, 0x81)
                        Store (0x35, \_SB.PCI0.PX40.PXB2)
                        Sleep (0x64)
                    }

                    Method (_Q34, 0, NotSerialized)
                    {
                        Store (0x34, \_SB.PCI0.PX40.PX80)
                        If (LEqual (\_SB.PCI0.PX40.EC0.P64, 0x01))
                        {
                            Store (0x25, \_SB.PCI0.PX40.PXB3)
                            Store (0x31, \_SB.PCI0.PX40.PXB2)
                        }
                        Else
                        {
                            Store (0x26, \_SB.PCI0.PX40.PXB3)
                            Store (0x31, \_SB.PCI0.PX40.PXB2)
                        }

                        Notify (\_SB.BAT0, 0x80)
                    }

                    Method (_Q37, 0, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.PX40.EC0.P67, 0x01))
                        {
                            Store (0x80, \_SB.PCI0.PX40.EC0.P67S)
                            Store (0x27, IOB3)
                            Store (0x31, IOB2)
                        }
                        Else
                        {
                            Store (0x90, \_SB.PCI0.PX40.EC0.P67S)
                            Store (0x28, IOB3)
                            Store (0x31, IOB2)
                        }
                    }

                    Method (_Q42, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0, 0x01)
                    }

                    Method (ECC5, 1, NotSerialized)
                    {
                        Store (Arg0, \_SB.PCI0.PX40.EC0.DAT1)
                        Store (0xC5, \_SB.PCI0.PX40.EC0.CMCD)
                    }

                    Method (ECC9, 1, NotSerialized)
                    {
                        Store (Arg0, \_SB.PCI0.PX40.EC0.DAT1)
                        Store (0xC9, \_SB.PCI0.PX40.EC0.CMCD)
                    }

                    Method (ECBB, 3, NotSerialized)
                    {
                        Store (Arg0, \_SB.PCI0.PX40.EC0.DAT1)
                        Store (Arg1, \_SB.PCI0.PX40.EC0.DAT2)
                        Store (Arg2, \_SB.PCI0.PX40.EC0.DAT3)
                        Store (0xBB, \_SB.PCI0.PX40.EC0.CMCD)
                    }
                }
            }

            Device (ISA)
            {
                Name (_ADR, 0x00070003)
                OperationRegion (SB43, PCI_Config, 0x00, 0xFF)
                Field (SB43, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x64), 
                    PMIO,   16, 
                        ,   6, 
                    DV10,   1
                }
            }

            Device (BTNS)
            {
                Name (_HID, "MSTabletPCButtons")
                Method (_INI, 0, NotSerialized)
                {
                    Store (0x7D, IOB2)
                }

                Name (_PRS, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x9450,             // Range Minimum
                            0x9450,             // Range Maximum
                            0x04,               // Alignment
                            0x04,               // Length
                            )
                        IRQ (Level, ActiveLow, Exclusive, )
                            {6,7}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x9454,             // Range Minimum
                            0x9454,             // Range Maximum
                            0x04,               // Alignment
                            0x04,               // Length
                            )
                        IRQ (Level, ActiveLow, Exclusive, )
                            {6,7}
                    }
                    EndDependentFn ()
                    /*** Disassembler: inserted missing EndDependentFn () ***/
                })
                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, \_SB.PCI0.ISA.DV10)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x9450,             // Range Minimum
                            0x9450,             // Range Maximum
                            0x04,               // Alignment
                            0x04,               // Length
                            _Y09)
                        IRQ (Level, ActiveLow, Exclusive, _Y0A)
                            {7}
                    })
                    CreateWordField (BUF0, \_SB.PCI0.BTNS._CRS._Y09._MIN, IOW1)
                    CreateWordField (BUF0, \_SB.PCI0.BTNS._CRS._Y09._MAX, IOW2)
                    CreateWordField (BUF0, \_SB.PCI0.BTNS._CRS._Y0A._INT, IRQW)
                    Store (\_SB.PCI0.ISA.PMIO, IOW1)
                    Store (\_SB.PCI0.PX40.INTC, Local1)
                    And (Local1, 0x80, Local1)
                    If (LNotEqual (Local1, 0x80))
                    {
                        And (\_SB.PCI0.PX40.INTC, 0x0F, Local0)
                        Store (0x01, Local2)
                        ShiftLeft (Local2, Local0, IRQW)
                    }

                    Return (BUF0)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x02, IOW1)
                    CreateWordField (Arg0, 0x04, IOW2)
                    CreateWordField (Arg0, 0x09, IRQW)
                    Store (IOW1, \_SB.PCI0.ISA.PMIO)
                    Store (0x01, \_SB.PCI0.ISA.DV10)
                    FindSetLeftBit (IRQW, Local0)
                    Decrement (Local0)
                    And (\_SB.PCI0.PX40.INTC, 0x70, Local1)
                    Or (Local1, Local0, \_SB.PCI0.PX40.INTC)
                    Store (\_SB.PCI0.PX40.INTC, \_SB.PCI0.PX40.TBUT)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.ISA.DV10)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (0x0D)
                    }
                }
            }

            Device (VGA0)
            {
                Name (_ADR, 0x00020000)
                Method (_DOD, 0, NotSerialized)
                {
                    If (LEqual (VGAS, 0x00))
                    {
                        Store (0x93, \_SB.PCI0.PX40.PXB2)
                        If (LEqual (\_SB.PCI0.PX40.C24E, 0x00))
                        {
                            Store (0x02, CRTS)
                            Store (0x02, LCDS)
                        }

                        Store (0x43, \_SB.PCI0.PX40.PXB3)
                        Store (0x7B, \_SB.PCI0.PX40.PXB2)
                        Store (\_SB.PCI0.PX40.PXB3, Local0)
                        And (Local0, 0x01, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x01, CRTS)
                            Store (0x01, LCDS)
                        }

                        Store (0x01, VGAS)
                    }

                    Return (Package (0x02)
                    {
                        0x00010100, 
                        0x00010110
                    })
                }

                Device (CRT0)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0100)
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (0x1F)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Divide (CRTS, 0x03, Local0, Local1)
                        Add (CRTS, 0x01, CRTS)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x01)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            Return (0x00)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            Return (0x01)
                        }
                    }
                }

                Device (LCD0)
                {
                    Method (_ADR, 0, NotSerialized)
                    {
                        Return (0x0110)
                    }

                    Name (_BCL, Package (0x0A)
                    {
                        0x0A, 
                        0x08, 
                        0x02, 
                        0x04, 
                        0x06, 
                        0x08, 
                        0x0A, 
                        0x0C, 
                        0x0E, 
                        0x10
                    })
                    Method (_BCM, 1, NotSerialized)
                    {
                        If (LEqual (\BRTS, 0x02))
                        {
                            Store (Zero, \BRTS)
                        }
                        Else
                        {
                            If (LOr (LEqual (\BRTS, 0x01), LEqual (\OSIT, 0x00)))
                            {
                                Store (0x08, IOB3)
                                Store (0x33, IOB2)
                                Store (Zero, \BRTS)
                                Store (One, \OSIT)
                            }
                            Else
                            {
                                Store (Arg0, \_SB.PCI0.PX40.C219)
                            }

                            Store (0x06, IOB3)
                            Store (0x33, IOB2)
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        Return (0x1F)
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        Divide (LCDS, 0x03, Local0, Local1)
                        Add (LCDS, 0x01, LCDS)
                        If (LEqual (Local0, 0x00))
                        {
                            Return (0x01)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            Return (0x01)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            Return (0x00)
                        }
                    }

                    Method (_DDC, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (0x43, \_SB.PCI0.PX40.PXB3)
                            Store (0x7B, \_SB.PCI0.PX40.PXB2)
                            Store (\_SB.PCI0.PX40.PXB3, Local0)
                            And (Local0, 0x3C, Local0)
                            If (LEqual (Local0, 0x24))
                            {
                                Return (\_SB.PCI0.VGA0.DDC1)
                            }

                            If (LEqual (Local0, 0x08))
                            {
                                Return (\_SB.PCI0.VGA0.DDC2)
                            }

                            If (LEqual (Local0, 0x0C))
                            {
                                Return (\_SB.PCI0.VGA0.DDC3)
                            }

                            Return (0x00)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Store (0x43, \_SB.PCI0.PX40.PXB3)
                            Store (0x7B, \_SB.PCI0.PX40.PXB2)
                            Store (\_SB.PCI0.PX40.PXB3, Local0)
                            And (Local0, 0x3C, Local0)
                            If (LEqual (Local0, 0x24))
                            {
                                Concatenate (\_SB.PCI0.VGA0.DDC1, \_SB.PCI0.VGA0.DDC0, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Local0, 0x08))
                            {
                                Concatenate (\_SB.PCI0.VGA0.DDC2, \_SB.PCI0.VGA0.DDC0, Local0)
                                Return (Local0)
                            }

                            If (LEqual (Local0, 0x0C))
                            {
                                Concatenate (\_SB.PCI0.VGA0.DDC3, \_SB.PCI0.VGA0.DDC0, Local0)
                                Return (Local0)
                            }
                        }

                        Return (0x00)
                    }
                }

                Name (DDC0, Buffer (0x80)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0038 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0040 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0048 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0050 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0058 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0060 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0068 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DDC1, Buffer (0x80)
                {
                    /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                    /* 0008 */    0x24, 0x4D, 0x55, 0x0A, 0x01, 0x01, 0x01, 0x01, 
                    /* 0010 */    0x23, 0x09, 0x01, 0x02, 0x80, 0x21, 0x18, 0x00, 
                    /* 0018 */    0xEA, 0x0D, 0xFB, 0xA0, 0x57, 0x47, 0x98, 0x27, 
                    /* 0020 */    0x12, 0x4D, 0x51, 0xA1, 0x08, 0x00, 0x00, 0x00, 
                    /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x19, 
                    /* 0038 */    0x00, 0x40, 0x41, 0x00, 0x26, 0x30, 0x18, 0x88, 
                    /* 0040 */    0x36, 0x00, 0x0E, 0xCB, 0x10, 0x00, 0x00, 0x1A, 
                    /* 0048 */    0x00, 0x00, 0x00, 0xFC, 0x00, 0x54, 0x68, 0x69, 
                    /* 0050 */    0x6E, 0x6B, 0x50, 0x61, 0x64, 0x20, 0x4C, 0x43, 
                    /* 0058 */    0x44, 0x20, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x31, 
                    /* 0060 */    0x30, 0x32, 0x34, 0x78, 0x37, 0x36, 0x38, 0x20, 
                    /* 0068 */    0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 
                    /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33
                })
                Name (DDC2, Buffer (0x80)
                {
                    /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                    /* 0008 */    0x24, 0x4D, 0x4B, 0x0A, 0x01, 0x01, 0x01, 0x01, 
                    /* 0010 */    0x23, 0x09, 0x01, 0x02, 0x80, 0x21, 0x18, 0x00, 
                    /* 0018 */    0xEA, 0x0D, 0xFB, 0xA0, 0x57, 0x47, 0x98, 0x27, 
                    /* 0020 */    0x12, 0x4D, 0x51, 0xA1, 0x08, 0x00, 0x00, 0x00, 
                    /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x01, 
                    /* 0038 */    0x20, 0x00, 0x31, 0x58, 0x1C, 0x20, 0x28, 0x80, 
                    /* 0040 */    0x01, 0x00, 0xF6, 0xB8, 0x00, 0x00, 0x00, 0x1A, 
                    /* 0048 */    0x00, 0x00, 0x00, 0xFC, 0x00, 0x54, 0x68, 0x69, 
                    /* 0050 */    0x6E, 0x6B, 0x50, 0x61, 0x64, 0x20, 0x4C, 0x43, 
                    /* 0058 */    0x44, 0x20, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x38, 
                    /* 0060 */    0x30, 0x30, 0x78, 0x36, 0x30, 0x30, 0x20, 0x20, 
                    /* 0068 */    0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 
                    /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA1
                })
                Name (DDC3, Buffer (0x80)
                {
                    /* 0000 */    0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 
                    /* 0008 */    0x24, 0x4D, 0x50, 0x0A, 0x01, 0x01, 0x01, 0x01, 
                    /* 0010 */    0x23, 0x09, 0x01, 0x02, 0x80, 0x21, 0x18, 0x00, 
                    /* 0018 */    0xEA, 0x0D, 0xFB, 0xA0, 0x57, 0x47, 0x98, 0x27, 
                    /* 0020 */    0x12, 0x4D, 0x51, 0xA1, 0x08, 0x00, 0x00, 0x00, 
                    /* 0028 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0030 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x01, 
                    /* 0038 */    0x20, 0x00, 0x31, 0x58, 0x1C, 0x20, 0x28, 0x80, 
                    /* 0040 */    0x01, 0x00, 0xF6, 0xB8, 0x00, 0x00, 0x00, 0x1A, 
                    /* 0048 */    0x00, 0x00, 0x00, 0xFC, 0x00, 0x54, 0x68, 0x69, 
                    /* 0050 */    0x6E, 0x6B, 0x50, 0x61, 0x64, 0x20, 0x4C, 0x43, 
                    /* 0058 */    0x44, 0x20, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x38, 
                    /* 0060 */    0x30, 0x30, 0x78, 0x36, 0x30, 0x30, 0x20, 0x20, 
                    /* 0068 */    0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 
                    /* 0070 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0078 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9C
                })
            }

            Device (IIDE)
            {
                Name (_ADR, 0x00070001)
                OperationRegion (CF41, PCI_Config, 0x40, 0x19)
                Field (CF41, DWordAcc, NoLock, Preserve)
                {
                    PTIM,   16, 
                    STIM,   16, 
                    PSLA,   4, 
                    SSLA,   4, 
                            Offset (0x08), 
                    UDMP,   2, 
                    UDMS,   2, 
                            Offset (0x0A), 
                    DMTP,   6, 
                            Offset (0x0B), 
                    DMTS,   6
                }

                Name (TIM0, Package (0x06)
                {
                    Package (0x04)
                    {
                        0x0384, 
                        0xF0, 
                        0xB4, 
                        0x78
                    }, 

                    Package (0x04)
                    {
                        0x00, 
                        0x10, 
                        0x21, 
                        0x23
                    }, 

                    Package (0x04)
                    {
                        0x00, 
                        0x04, 
                        0x09, 
                        0x0B
                    }, 

                    Package (0x03)
                    {
                        0x78, 
                        0x5A, 
                        0x3C
                    }, 

                    Package (0x03)
                    {
                        0x00, 
                        0x01, 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        0x00, 
                        0x02, 
                        0x03, 
                        0x04
                    }
                })
                Name (AT01, Buffer (0x07)
                {
                    0x03, 0x08, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT02, Buffer (0x07)
                {
                    0x03, 0x40, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT03, Buffer (0x07)
                {
                    0x03, 0x20, 0x00, 0x00, 0x00, 0x00, 0xEF
                })
                Name (AT04, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90
                })
                Name (AT05, Buffer (0x07)
                {
                    0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0xC6
                })
                Name (AT06, Buffer (0x07)
                {
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x91
                })
                Name (ATP0, Buffer (0x24) {})
                Name (ATP1, Buffer (0x24) {})
                Name (ATS0, Buffer (0x24) {})
                Name (ATS1, Buffer (0x24) {})
                Name (TMD0, Buffer (0x14) {})
                CreateDWordField (TMD0, 0x00, PIO0)
                CreateDWordField (TMD0, 0x04, DMA0)
                CreateDWordField (TMD0, 0x08, PIO1)
                CreateDWordField (TMD0, 0x0C, DMA1)
                CreateDWordField (TMD0, 0x10, FLAG)
                Method (GTMM, 4, Serialized)
                {
                    Store (Arg0, Local0)
                    Store (Arg1, Local1)
                    Store (Arg2, Local2)
                    Store (Arg3, Local3)
                    Store (0xFFFFFFFF, Local5)
                    Store (Local5, PIO0)
                    Store (Local5, PIO1)
                    Store (Local5, DMA0)
                    Store (Local5, DMA1)
                    Store (0x00, FLAG)
                    If (And (Local0, 0x02))
                    {
                        Or (FLAG, 0x02, FLAG)
                    }

                    ShiftRight (And (Local0, 0x3300), 0x08, Local5)
                    Store (Match (DerefOf (Index (TIM0, 0x01)), MLE, Local5, MTR, 
                        0x00, 0x00), Local6)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, 0x00)), Local6)), 
                        Local7)
                    Store (Local7, DMA0)
                    If (And (Local0, 0x08)) {}
                    Else
                    {
                        Store (Local7, PIO0)
                    }

                    If (And (Local0, 0x20))
                    {
                        Or (FLAG, 0x08, FLAG)
                    }

                    If (And (Local0, 0x4000))
                    {
                        Or (FLAG, 0x10, FLAG)
                        Store (Match (DerefOf (Index (TIM0, 0x02)), MLE, Local1, MTR, 
                            0x00, 0x00), Local5)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x00)), Local5)), 
                            Local6)
                        Store (Local6, DMA1)
                        If (And (Local0, 0x80)) {}
                        Else
                        {
                            Store (Local6, PIO1)
                        }
                    }

                    If (And (Local2, 0x01))
                    {
                        And (Local3, 0x03, Local5)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA0)
                        Or (FLAG, 0x01, FLAG)
                    }

                    If (And (Local2, 0x02))
                    {
                        And (ShiftRight (Local3, 0x04), 0x03, Local5)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x03)), Local5)), 
                            DMA1)
                        Or (FLAG, 0x04, FLAG)
                    }

                    Return (TMD0)
                }

                Method (STMP, 5, Serialized)
                {
                    Store (Arg0, TMD0)
                    And (Arg1, 0x8044, Arg1)
                    And (Arg3, 0xFC, Arg3)
                    And (Arg4, 0xCC, Arg4)
                    If (And (FLAG, 0x01))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                            0x00, 0x00), Local0)
                        If (LGreater (Local0, 0x02))
                        {
                            Store (0x02, Local0)
                        }

                        Or (Arg4, DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0
                            )), Arg4)
                        Or (Arg3, 0x01, Arg3)
                    }
                    Else
                    {
                        If (Or (LEqual (PIO0, Ones), LEqual (PIO0, 0x00)))
                        {
                            If (And (LLess (DMA0, Ones), LGreater (DMA0, 0x00)))
                            {
                                Store (DMA0, PIO0)
                                Or (Arg1, 0x08, Arg1)
                            }
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                            0x00, 0x00), Local0)
                        If (LGreater (Local0, 0x02))
                        {
                            Store (0x02, Local0)
                        }

                        Or (Arg4, ShiftLeft (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), 
                            Local0)), 0x04), Arg4)
                        Or (Arg3, 0x02, Arg3)
                    }
                    Else
                    {
                        If (Or (LEqual (PIO1, Ones), LEqual (PIO1, 0x00)))
                        {
                            If (And (LLess (DMA1, Ones), LGreater (DMA1, 0x00)))
                            {
                                Store (DMA1, PIO1)
                                Or (Arg1, 0x80, Arg1)
                            }
                        }
                    }

                    If (And (FLAG, 0x02))
                    {
                        Or (Arg1, 0x03, Arg1)
                    }

                    If (And (FLAG, 0x08))
                    {
                        Or (Arg1, 0x30, Arg1)
                    }

                    And (Match (DerefOf (Index (TIM0, 0x00)), MGE, PIO0, MTR, 
                        0x00, 0x00), 0x03, Local0)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, 0x01)), Local0)), 
                        Local1)
                    ShiftLeft (Local1, 0x08, Local2)
                    Or (Arg1, Local2, Arg1)
                    If (And (FLAG, 0x10))
                    {
                        Or (Arg1, 0x4000, Arg1)
                        And (Match (DerefOf (Index (TIM0, 0x00)), MGE, PIO1, MTR, 
                            0x00, 0x00), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0)), 
                            Local1)
                        Or (Arg2, Local1, Arg2)
                    }

                    Store (Arg1, PTIM)
                    Store (Arg2, PSLA)
                    Store (Arg3, UDMP)
                    Store (Arg4, DMTP)
                }

                Method (STMS, 5, Serialized)
                {
                    Store (Arg0, TMD0)
                    And (Arg1, 0x8044, Arg1)
                    And (Arg3, 0xFC, Arg3)
                    And (Arg4, 0xCC, Arg4)
                    If (And (FLAG, 0x01))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                            0x00, 0x00), Local0)
                        If (LGreater (Local0, 0x02))
                        {
                            Store (0x02, Local0)
                        }

                        Or (Arg4, DerefOf (Index (DerefOf (Index (TIM0, 0x04)), Local0
                            )), Arg4)
                        Or (Arg3, 0x01, Arg3)
                    }
                    Else
                    {
                        If (Or (LEqual (PIO0, Ones), LEqual (PIO0, 0x00)))
                        {
                            If (And (LLess (DMA0, Ones), LGreater (DMA0, 0x00)))
                            {
                                Store (DMA0, PIO0)
                                Or (Arg1, 0x08, Arg1)
                            }
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, DMA0, MTR, 
                            0x00, 0x00), Local0)
                        If (LGreater (Local0, 0x02))
                        {
                            Store (0x02, Local0)
                        }

                        Or (Arg4, ShiftLeft (DerefOf (Index (DerefOf (Index (TIM0, 0x04)), 
                            Local0)), 0x04), Arg4)
                        Or (Arg3, 0x02, Arg3)
                    }
                    Else
                    {
                        If (Or (LEqual (PIO1, Ones), LEqual (PIO1, 0x00)))
                        {
                            If (And (LLess (DMA1, Ones), LGreater (DMA1, 0x00)))
                            {
                                Store (DMA1, PIO1)
                                Or (Arg1, 0x80, Arg1)
                            }
                        }
                    }

                    If (And (FLAG, 0x02))
                    {
                        Or (Arg1, 0x03, Arg1)
                    }

                    If (And (FLAG, 0x08))
                    {
                        Or (Arg1, 0x30, Arg1)
                    }

                    And (Match (DerefOf (Index (TIM0, 0x00)), MGE, PIO0, MTR, 
                        0x00, 0x00), 0x03, Local0)
                    Store (DerefOf (Index (DerefOf (Index (TIM0, 0x01)), Local0)), 
                        Local1)
                    ShiftLeft (Local1, 0x08, Local2)
                    Or (Arg1, Local2, Arg1)
                    If (And (FLAG, 0x10))
                    {
                        Or (Arg1, 0x4000, Arg1)
                        And (Match (DerefOf (Index (TIM0, 0x00)), MGE, PIO1, MTR, 
                            0x00, 0x00), 0x03, Local0)
                        Store (DerefOf (Index (DerefOf (Index (TIM0, 0x02)), Local0)), 
                            Local1)
                        Or (Arg2, Local1, Arg2)
                    }

                    Store (Arg1, STIM)
                    Store (Arg2, SSLA)
                    Store (Arg3, UDMS)
                    Store (Arg4, DMTS)
                }

                Method (GTFM, 4, Serialized)
                {
                    Name (TMBF, Buffer (0x07)
                    {
                        0x00
                    })
                    Name (ATBF, Buffer (0x24)
                    {
                        0x01
                    })
                    If (Arg1)
                    {
                        If (LEqual (Arg3, 0x00))
                        {
                            Return (ATBF)
                        }
                    }
                    Else
                    {
                        Return (ATBF)
                    }

                    Store (Arg2, TMD0)
                    CreateByteField (TMBF, 0x01, A001)
                    CreateByteField (TMBF, 0x05, A005)
                    CreateByteField (ATBF, 0x00, CMNO)
                    CreateField (ATBF, 0x08, 0x40, CMD1)
                    Store (0xA0, Local7)
                    If (Arg0)
                    {
                        Store (0xB0, Local7)
                    }

                    If (Arg3)
                    {
                        Store (AT06, TMBF)
                        Store (0x3F, A001)
                        Store (Local7, A005)
                        Or (A005, 0x0F, A005)
                        Store (TMBF, CMD1)
                    }
                    Else
                    {
                        Store (AT04, CMD1)
                    }

                    Store (0x01, CMNO)
                    Store (0x00, Local0)
                    Store (0x00, Local1)
                    If (Arg0)
                    {
                        If (And (FLAG, 0x10))
                        {
                            Store (DMA1, Local0)
                        }
                    }
                    Else
                    {
                        If (And (FLAG, 0x01))
                        {
                            Store (DMA0, Local0)
                        }
                    }

                    If (Local0)
                    {
                        Store (Match (DerefOf (Index (TIM0, 0x03)), MLE, Local0, MTR, 
                            0x00, 0x00), Local0)
                        If (LGreater (Local0, 0x02))
                        {
                            Store (0x02, Local0)
                        }

                        Multiply (CMNO, 0x38, Local5)
                        Add (Local5, 0x08, Local6)
                        CreateField (ATBF, Local6, 0x38, CMD2)
                        Store (AT02, TMBF)
                        Or (A001, Local0, A001)
                        Store (Local7, A005)
                        Store (TMBF, CMD2)
                        Store (0x01, Local1)
                        Increment (CMNO)
                    }

                    Store (0x00, Local0)
                    If (Arg0)
                    {
                        If (And (FLAG, 0x08))
                        {
                            Store (PIO1, Local0)
                        }
                    }
                    Else
                    {
                        If (And (FLAG, 0x02))
                        {
                            Store (PIO0, Local0)
                        }
                    }

                    If (Local0)
                    {
                        Multiply (CMNO, 0x38, Local5)
                        Add (Local5, 0x08, Local6)
                        CreateField (ATBF, Local6, 0x38, CMD3)
                        Store (AT01, TMBF)
                        And (Match (DerefOf (Index (TIM0, 0x00)), MGE, Local0, MTR, 
                            0x00, 0x00), 0x03, Local0)
                        Or (A001, DerefOf (Index (DerefOf (Index (TIM0, 0x05)), Local0
                            )), A001)
                        Store (Local7, A005)
                        Store (TMBF, CMD3)
                        Increment (CMNO)
                    }

                    If (Local1)
                    {
                        Multiply (CMNO, 0x38, Local5)
                        Add (Local5, 0x08, Local6)
                        CreateField (ATBF, Local6, 0x38, CMD4)
                        Store (AT05, TMBF)
                        Store (Local7, A005)
                        Store (TMBF, CMD4)
                        Increment (CMNO)
                    }

                    Return (ATBF)
                }

                Method (GTFB, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x00, CMNO)
                    Multiply (CMNO, 0x07, Local0)
                    Multiply (Local0, 0x08, Local1)
                    Name (BUFF, Buffer (Local0) {})
                    CreateField (BUFF, 0x00, Local1, DST0)
                    CreateField (Arg0, 0x08, Local1, SRC0)
                    Store (SRC0, DST0)
                    Return (BUFF)
                }

                Device (IDE0)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (GTMM (PTIM, PSLA, UDMP, DMTP))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        STMP (Arg0, PTIM, PSLA, UDMP, DMTP)
                        And (RCMS (IDEP), 0x0F, Local5)
                        ShiftRight (IOB3, 0x04, Local6)
                        Store (0x00, Local1)
                        Store (0x00, Local0)
                        Store (Local5, Local1)
                        If (LEqual (Local5, 0x01))
                        {
                            Store (0x01, Local2)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }

                        Store (GTFM (Local0, Local1, Arg0, Local2), ATP0)
                        Store (0x01, Local0)
                        Store (Local6, Local1)
                        If (LEqual (Local6, 0x01))
                        {
                            Store (0x01, Local2)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }

                        Store (GTFM (Local0, Local1, Arg0, Local2), ATP1)
                    }

                    Device (DRVM)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTFB (ATP0))
                        }
                    }

                    Device (DRVS)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTFB (ATP1))
                        }
                    }
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (LEqual (\LIDS, 0x00))
                {
                    Store (0x00, \LIDF)
                    Return (0x00)
                }
                Else
                {
                    If (LEqual (\LIDF, 0x01))
                    {
                        Store (0x00, \LIDF)
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x01)
                    }
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x0B, 
                0x03
            })
        }

        Device (AC)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_PSR, 0, NotSerialized)
            {
                Store (0x03, \_SB.PCI0.PX40.PXB3)
                Store (0x33, \_SB.PCI0.PX40.PXB2)
                If (LEqual (DAT5, 0x01))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                Store (0x00, \_SB.PCI0.PX40.PXB3)
                Store (0x33, \_SB.PCI0.PX40.PXB2)
                If (LEqual (DAT1, 0x01))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                Store (0x0708, Local0)
                Store (0x0708, Local1)
                Name (BUF0, Package (0x0D) {})
                Store (0x01, Index (BUF0, 0x00))
                Store (Local0, Index (BUF0, 0x01))
                Store (Local0, Index (BUF0, 0x02))
                Store (0x01, Index (BUF0, 0x03))
                Store (0x39D0, Index (BUF0, 0x04))
                Divide (Local0, 0x0A, Local1, Local2)
                Store (Local2, Index (BUF0, 0x05))
                Divide (Local0, 0x64, Local1, Local3)
                Store (Local3, Index (BUF0, 0x06))
                Subtract (Local2, Local3, Local4)
                Store (Local4, Index (BUF0, 0x07))
                Subtract (Local0, Local2, Local4)
                Store (Local4, Index (BUF0, 0x08))
                Name (MDL, Buffer (0x04)
                {
                    "ANA"
                })
                Store (MDL, Index (BUF0, 0x09))
                Name (SRLN, Buffer (0x04)
                {
                    "110"
                })
                Store (SRLN, Index (BUF0, 0x0A))
                Name (BTYP, Buffer (0x05)
                {
                    "LION"
                })
                Store (BTYP, Index (BUF0, 0x0B))
                Store (0x00, Index (BUF0, 0x0C))
                Return (BUF0)
            }

            Method (_BST, 0, NotSerialized)
            {
                Name (BUF0, Package (0x04) {})
                Store (0x01, \_SB.PCI0.PX40.PXB3)
                Store (0x33, \_SB.PCI0.PX40.PXB2)
                Store (0x07, \_SB.PCI0.PX40.PXB3)
                Store (0x33, \_SB.PCI0.PX40.PXB2)
                Store (0x03, \_SB.PCI0.PX40.PXB3)
                Store (0x33, \_SB.PCI0.PX40.PXB2)
                If (LEqual (DAT5, 0x01))
                {
                    Store (0x0E, \_SB.PCI0.PX40.PXB3)
                    Store (0x32, \_SB.PCI0.PX40.PXB2)
                    Store (0x00, \_SB.PCI0.PX40.PXB3)
                    Store (0x33, \_SB.PCI0.PX40.PXB2)
                    If (LEqual (DAT1, 0x01))
                    {
                        Store (0x02, \_SB.PCI0.PX40.PXB3)
                        Store (0x33, \_SB.PCI0.PX40.PXB2)
                        And (DAT3, 0x20, Local1)
                        If (LEqual (Local1, 0x20))
                        {
                            Store (0x01, Index (BUF0, 0x00))
                        }
                        Else
                        {
                            Store (0x02, Index (BUF0, 0x00))
                        }
                    }
                    Else
                    {
                        Store (0x00, Index (BUF0, 0x00))
                        Store (0xFFFFFFFF, Index (BUF0, 0x01))
                        Store (0xFFFFFFFF, Index (BUF0, 0x02))
                        Store (0xFFFFFFFF, Index (BUF0, 0x03))
                        Return (BUF0)
                    }
                }
                Else
                {
                    If (LLessEqual (DAT2, 0x05))
                    {
                        Store (0x05, Index (BUF0, 0x00))
                    }
                    Else
                    {
                        Store (0x01, Index (BUF0, 0x00))
                    }

                    And (PM32, 0x04, Local1)
                    If (LEqual (Local1, 0x00))
                    {
                        Store (0x04, \_SB.PCI0.PX40.PXB3)
                        Store (0x30, \_SB.PCI0.PX40.PXB2)
                    }
                }

                Multiply (DAT2, 0x12, Local2)
                Store (0x0202, Index (BUF0, 0x01))
                Store (Local2, Index (BUF0, 0x02))
                Store (0x0202, Index (BUF0, 0x03))
                Return (BUF0)
            }
        }
    }
}

