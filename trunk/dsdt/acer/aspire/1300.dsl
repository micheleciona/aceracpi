/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080514
 *
 * Disassembly of 1300, Fri Aug  8 22:06:16 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000034CC (13516)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0xDA
 *     OEM ID           "INSYDE"
 *     OEM Table ID     "VT8362"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x0100000D (16777229)
 */
DefinitionBlock ("1300.aml", "DSDT", 1, "INSYDE", "VT8362", 0x00001000)
{
    Name (VERS, Package (0x03)
    {
        "Project: ET2S", 
        "Date: 8/30/2001", 
        "Vers: 1.01.01"
    })
    Scope (\_PR)
    {
        Processor (CPU0, 0x01, 0x00001010, 0x06)
        {
            Name (_PCT, Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x00,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000001DFE89D, // Address
                        ,)
                }, 

                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x00,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000001DFE8B2, // Address
                        ,)
                }
            })
            Name (_PSS, Package (0x05)
            {
                Package (0x06)
                {
                    0x0514, 
                    0x88B8, 
                    0x7D, 
                    0x7D, 
                    0x009C4154, 
                    0x0154
                }, 

                Package (0x06)
                {
                    0x044C, 
                    0x6C19, 
                    0x7D, 
                    0x7D, 
                    0x009C4160, 
                    0x0160
                }, 

                Package (0x06)
                {
                    0x0384, 
                    0x4CAA, 
                    0x7D, 
                    0x7D, 
                    0x009C41AC, 
                    0x01AC
                }, 

                Package (0x06)
                {
                    0x02BC, 
                    0x331F, 
                    0x7D, 
                    0x7D, 
                    0x009C4228, 
                    0x0228
                }, 

                Package (0x06)
                {
                    0x01F4, 
                    0x21A7, 
                    0x7D, 
                    0x7D, 
                    0x009C4264, 
                    0x0264
                }
            })
            Method (_PPC, 0, NotSerialized)
            {
                Return (0x00)
            }
        }
    }

    Scope (\_GPE)
    {
        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0, 0x02)
        }

        Method (_L08, 0, NotSerialized)
        {
            Notify (\_SB.PCI0, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Store ("_GPE._L0E - USB", Debug)
            Notify (\_SB.PCI0.USB0, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Store (0x00, Local0)
            Not (LPOL, LPOL)
            Notify (\_SB.LID, 0x80)
            Sleep (0xC8)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MODM, 0x02)
        }

        Method (_L10, 0, NotSerialized)
        {
            \_SB.GSMI (0x0C)
        }

        Method (_L12, 0, NotSerialized)
        {
            If (LEqual (GI18, 0x00))
            {
                Store (0x01, \_SB.PCI0.AGPB.VGA0.CRT0._DGS)
                Store (0x00, \_SB.PCI0.AGPB.VGA0.LCD0._DGS)
                Store (0x1F, \_SB.PCI0.AGPB.VGA0.LCD0._DCS)
                Store (0x0F, \_SB.PCI0.AGPB.VGA0.CRT0._DCS)
                Store (0x01, \_SB.PCI0.AGPB.VGA0.CDCS)
                Store (0x01, \_SB.PCI0.AGPB.VGA0.LDCS)
                Store (0x01, \_SB.PCI0.PM.CRTI)
            }
            Else
            {
                Store (0x00, \_SB.PCI0.AGPB.VGA0.CRT0._DGS)
                Store (0x01, \_SB.PCI0.AGPB.VGA0.LCD0._DGS)
                Store (0x1D, \_SB.PCI0.AGPB.VGA0.LCD0._DCS)
                Store (0x0F, \_SB.PCI0.AGPB.VGA0.CRT0._DCS)
                Store (0x00, \_SB.PCI0.AGPB.VGA0.CDCS)
                Store (0x00, \_SB.PCI0.AGPB.VGA0.LDCS)
                Store (0x00, \_SB.PCI0.PM.CRTI)
            }

            If (LEqual (\_SB.PCI0.AGPB.VGA0.DOSA, 0x00))
            {
                Notify (\_SB.PCI0.AGPB.VGA0, 0x80)
            }

            If (LEqual (\_SB.PCI0.AGPB.VGA0.DOSA, 0x01))
            {
                \_SB.PCI0.AGPB.VGA0.SWIT ()
            }
        }
    }

    OperationRegion (PM48, SystemIO, 0x1048, 0x04)
    Field (PM48, DWordAcc, NoLock, Preserve)
    {
        GI00,   1, 
        GI01,   1, 
        GI02,   1, 
        GI03,   1, 
        LIDS,   1, 
        GI05,   1, 
        GI06,   1, 
        GI07,   1, 
        GI08,   1, 
        GI09,   1, 
        GI10,   1, 
        GI11,   1, 
        GI12,   1, 
        GI13,   1, 
        GI14,   1, 
        GI15,   1, 
        GI16,   1, 
        GI17,   1, 
        GI18,   1, 
                Offset (0x04)
    }

    OperationRegion (PM4C, SystemIO, 0x104C, 0x04)
    Field (PM4C, DWordAcc, NoLock, Preserve)
    {
        GO00,   1, 
        GO01,   1, 
        GO02,   1, 
        GO03,   1, 
        GO04,   1, 
        GO05,   1, 
        GO06,   1, 
        GO07,   1, 
        GO08,   1, 
        GO09,   1, 
        GO10,   1, 
        GO11,   1, 
        GO12,   1, 
        GO13,   1, 
        GO14,   1, 
        GO15,   1, 
        GO16,   1, 
        GO17,   1, 
        GO18,   1, 
        GO19,   1, 
        GO20,   1, 
        GO21,   1, 
        GO22,   1, 
        GO23,   1, 
                Offset (0x04)
    }

    OperationRegion (PMIO, SystemIO, 0x1000, 0x50)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        TMRS,   1, 
            ,   3, 
        BMST,   1, 
        GBLS,   1, 
                Offset (0x01), 
        PBST,   1, 
        SBST,   1, 
        RTCS,   1, 
            ,   1, 
            ,   1, 
            ,   1, 
            ,   1, 
        WAKS,   1, 
        TMRE,   1, 
            ,   4, 
        GBLE,   1, 
                Offset (0x03), 
        PBEN,   1, 
        SBEN,   1, 
        PMRT,   1, 
                Offset (0x04), 
                Offset (0x05), 
            ,   10, 
        SLPT,   4, 
                Offset (0x10), 
        TRDC,   4, 
        TREN,   1, 
                Offset (0x20), 
        GPS0,   1, 
        GPS1,   1, 
        GPS2,   1, 
        GPS3,   1, 
        GPS4,   1, 
        GPS5,   1, 
        GPS6,   1, 
        GPS7,   1, 
        GPS8,   1, 
        GPS9,   1, 
            ,   4, 
        GPSE,   1, 
                Offset (0x22), 
        GI0C,   1, 
        GI1C,   1, 
            ,   1, 
            ,   1, 
        EXTC,   1, 
        PMEC,   1, 
            ,   1, 
                Offset (0x23), 
        RIC,    1, 
        USBC,   1, 
        THMC,   1, 
        LIDC,   1, 
        BLC,    1, 
        WAKC,   1, 
                Offset (0x24), 
            ,   1, 
            ,   1, 
            ,   1, 
            ,   1, 
        EXSM,   1, 
        PMEM,   1, 
            ,   1, 
                Offset (0x25), 
        RIM,    1, 
        USBM,   1, 
        THMM,   1, 
        LIDM,   1, 
        BLM,    1, 
        WAKM,   1, 
                Offset (0x26), 
                Offset (0x28), 
            ,   7, 
        PIRS,   1, 
                Offset (0x2A), 
            ,   7, 
        IRQR,   1, 
                Offset (0x2C), 
        SMEN,   1, 
            ,   6, 
        LPOL,   1, 
                Offset (0x2F), 
        SWCM,   8, 
                Offset (0x44), 
        EXS0,   1, 
        EXS1,   1, 
        EXS2,   1, 
        EXS3,   1, 
        EXS4,   1, 
        EXS5,   1, 
        EXS6,   1, 
        EXS7,   1
    }

    OperationRegion (PT80, SystemIO, 0x80, 0x01)
    Field (PT80, ByteAcc, NoLock, Preserve)
    {
        P80T,   8
    }

    OperationRegion (SM00, SystemIO, 0x1400, 0x02)
    Field (SM00, ByteAcc, NoLock, Preserve)
    {
        HBSY,   1, 
        INTR,   1, 
        DERR,   1, 
        BERR,   1, 
        FAIL,   1, 
                Offset (0x01), 
        SSTS,   8
    }

    OperationRegion (SM02, SystemIO, 0x1402, 0x01)
    Field (SM02, ByteAcc, NoLock, Preserve)
    {
            ,   2, 
        SCMD,   3, 
            ,   1, 
        STRT,   1, 
                Offset (0x01)
    }

    OperationRegion (SM03, SystemIO, 0x1403, 0x01)
    Field (SM03, ByteAcc, NoLock, Preserve)
    {
        SMCD,   8
    }

    OperationRegion (SM04, SystemIO, 0x1404, 0x01)
    Field (SM04, ByteAcc, NoLock, Preserve)
    {
        SADR,   8
    }

    OperationRegion (SM05, SystemIO, 0x1405, 0x01)
    Field (SM05, ByteAcc, NoLock, Preserve)
    {
        SDA0,   8
    }

    OperationRegion (SM06, SystemIO, 0x1406, 0x01)
    Field (SM06, ByteAcc, NoLock, Preserve)
    {
        SDA1,   8
    }

    OperationRegion (GPS, SystemIO, 0x1000, 0x3C)
    Field (GPS, WordAcc, NoLock, Preserve)
    {
        PMST,   16, 
                Offset (0x20), 
        GPST,   16, 
        SCIE,   16, 
        SMIE,   16, 
                Offset (0x2A), 
        GLEN,   16, 
        GLCO,   16
    }

    Name (BBIF, Package (0x0D)
    {
        0x01, 
        0xFFFFFFFF, 
        0xFFFFFFFF, 
        0x01, 
        0xFFFFFFFF, 
        0xFFFFFFFF, 
        0xFFFFFFFF, 
        0xFFFFFFFF, 
        0xFFFFFFFF, 
        "QT07", 
        "         ", 
        "NiMH ", 
        "SANYO"
    })
    Name (BBST, Package (0x04)
    {
        0x00, 
        0xFFFFFFFF, 
        0xFFFFFFFF, 
        0x00010000
    })
    OperationRegion (NVSM, SystemMemory, 0x000F0000, 0x84)
    Field (NVSM, AnyAcc, NoLock, Preserve)
    {
                Offset (0x01), 
        HGT2,   392, 
                Offset (0x33), 
        CGT2,   392, 
        PNLR,   32
    }

    Name (IDEB, Buffer (0x32) {})
    Name (ACIN, 0x00)
    Name (BTIN, 0x00)
    OperationRegion (HDIO, SystemIO, 0x01F0, 0x08)
    Field (HDIO, ByteAcc, NoLock, Preserve)
    {
                Offset (0x01), 
                Offset (0x02), 
                Offset (0x03), 
                Offset (0x04), 
                Offset (0x05), 
                Offset (0x06), 
        HDSL,   8, 
        HDCM,   8
    }

    Name (\_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)
    {
        0x01, 
        0x01, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)
    {
        0x02, 
        0x02, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)
    {
        0x02, 
        0x02, 
        0x00, 
        0x00
    })
    Method (\_PTS, 1, NotSerialized)
    {
        Store (GLEN, \_SB.P_2A)
        Store (GLCO, \_SB.P_2C)
        Store (0x01, PBST)
        While (PBST)
        {
            Store (0x01, PBST)
        }

        If (LEqual (Arg0, 0x01))
        {
            Store ("GO S1", Debug)
            Store (0x51, P80T)
            Noop
        }
        Else
        {
            If (LEqual (Arg0, 0x02))
            {
                Store ("GO S2", Debug)
                Store (0x52, P80T)
                Noop
            }
            Else
            {
                Store (0x00, \_SB.PCI0.PM.THME)
                If (LEqual (Arg0, 0x03))
                {
                    Store ("GO S3", Debug)
                    Store (0x01, GO04)
                    Store (0xE4, SWCM)
                    Store (0x53, P80T)
                    Store (0x01, \_SB.PCI0.CSCN)
                    Noop
                }
                Else
                {
                    If (LEqual (Arg0, 0x04))
                    {
                        Store ("GO S4", Debug)
                        Store (0x54, P80T)
                        Noop
                    }
                    Else
                    {
                        Store ("GO S5", Debug)
                        Store (0x55, P80T)
                        Noop
                    }
                }
            }
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Store (\_SB.P_2A, GLEN)
        Store (\_SB.P_2C, GLCO)
        Store (One, \_SB.PCI0.PM.GPO4)
        If (LEqual (GI18, 0x00))
        {
            If (LNotEqual (\_SB.PCI0.AGPB.VGA0.LCD0._DCS, 0x1D))
            {
                If (LEqual (\_SB.PCI0.AGPB.VGA0.CRT0._DCS, 0x0D))
                {
                    Store (0x01, \_SB.PCI0.AGPB.VGA0.CRT0._DGS)
                    Store (0x00, \_SB.PCI0.AGPB.VGA0.LCD0._DGS)
                    Store (0x1F, \_SB.PCI0.AGPB.VGA0.LCD0._DCS)
                    Store (0x0F, \_SB.PCI0.AGPB.VGA0.CRT0._DCS)
                    Store (0x01, \_SB.PCI0.AGPB.VGA0.CDCS)
                    Store (0x01, \_SB.PCI0.AGPB.VGA0.LDCS)
                }
            }
        }

        Store (LIDS, LPOL)
        If (LEqual (Arg0, 0x01))
        {
            Store ("Wake from S1", Debug)
            Store (0xE1, P80T)
            Return (0x00)
        }
        Else
        {
            If (LEqual (Arg0, 0x02))
            {
                Store ("Wake from S2", Debug)
                Store (0xE2, P80T)
                Return (0x00)
            }
            Else
            {
                If (LEqual (Arg0, 0x03))
                {
                    If (LEqual (Or (Or (GPSE, GPS8), GPS3), 0x01))
                    {
                        Notify (\_SB.PBTN, 0x02)
                    }

                    Store (0xE5, SWCM)
                    Store ("Wake from S3", Debug)
                    Store (0xE3, P80T)
                    Store (0x00, \_SB.PCI0.CSCN)
                    Return (0x00)
                }
                Else
                {
                    If (LEqual (Arg0, 0x04))
                    {
                        Store ("Wake from S4", Debug)
                        Store (0xE4, P80T)
                        Return (0x00)
                    }
                    Else
                    {
                        Store ("Wake from S5", Debug)
                        Store (0xE5, P80T)
                        Return (0x00)
                    }
                }
            }
        }
    }

    Scope (\_TZ)
    {
        Name (TPL, 0x0CD2)
        Name (TACT, 0x0D36)
        Name (TPAS, 0x0E30)
        Name (SPAS, 0x0DFE)
        Name (TPC, 0x0EC6)
        Name (TPTM, 0x0CA0)
        Name (TBSE, 0x0AAC)
        Name (PLCY, 0x00)
        ThermalZone (THRM)
        {
            Name (_TSP, 0x28)
            Method (_TZP, 0, NotSerialized)
            {
                If (TREN)
                {
                    Return (0x012C)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (TPC)
            }

            Name (INBT, 0x00)
            Method (_TMP, 0, NotSerialized)
            {
                If (\_SB.ECON)
                {
                    Store (\_SB.TCPU, Local0)
                    Store ("Current Temperature C is ----------- ", Debug)
                    Store (Local0, Debug)
                    Store (Local0, Local2)
                    Multiply (Local0, 0x0A, Local1)
                    Add (Local1, TBSE, Local0)
                    Store ("Current Temperature K is ----------- ", Debug)
                    Store (Local0, Debug)
                    CHTR (Local0)
                    Return (Local0)
                }
                Else
                {
                    Return (TPTM)
                }
            }

            Method (_PSV, 0, NotSerialized)
            {
                Return (TPAS)
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Name (_TC1, 0x02)
            Name (_TC2, 0x03)
            Method (_SCP, 1, NotSerialized)
            {
                Store (Arg0, PLCY)
            }

            Name (TRP2, 0x00)
            Method (CHTR, 1, NotSerialized)
            {
                If (LLessEqual (Arg0, SPAS))
                {
                    Store (0x00, TREN)
                    Store (0x00, TRP2)
                }
                Else
                {
                    If (LEqual (TRP2, 0x00))
                    {
                        If (LAnd (LGreaterEqual (Arg0, SPAS), LLess (Arg0, TPAS)))
                        {
                            Store (0x0C, TRDC)
                            Store (0x01, TREN)
                        }
                        Else
                        {
                            If (LGreaterEqual (Arg0, TPAS))
                            {
                                Store (0x01, TRP2)
                                Store (0x07, TRDC)
                                Store (0x01, TREN)
                            }
                        }
                    }
                    Else
                    {
                        If (LLessEqual (Arg0, SPAS))
                        {
                            Store (0x00, TRP2)
                            Store (0x0C, TRDC)
                            Store (0x01, TREN)
                        }
                    }
                }
            }
        }
    }

    Scope (\_SB)
    {
        Name (DFEC, 0x00)
        Name (CBON, 0x00)
        Name (ECON, 0x00)
        Name (MYOS, Ones)
        Name (P_2A, 0x00)
        Name (P_2C, 0x00)
        Method (_INI, 0, NotSerialized)
        {
            Store (LIDS, LPOL)
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (ECON)
                {
                    If (LEqual (LIDE, 0x01))
                    {
                        Return (0x00)
                    }

                    Return (0x01)
                }
            }

            Name (_PRW, Package (0x02)
            {
                0x0B, 
                0x03
            })
            Method (_PSW, 1, NotSerialized)
            {
            }
        }

        Device (ADP0)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Method (_PSR, 0, NotSerialized)
            {
                If (LEqual (\_SB.DFEC, 0x01))
                {
                    Return (One)
                }

                If (ECON)
                {
                    Store (\_SB.ACST, Local0)
                    Return (Local0)
                }
                Else
                {
                    Return (One)
                }
            }
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 0x00)
            Name (_PCL, Package (0x01)
            {
                \_SB
            })
            Name (_PRW, Package (0x02)
            {
                0x0C, 
                0x04
            })
            Method (_PSW, 1, NotSerialized)
            {
            }

            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (\_SB.DFEC, 0x01))
                {
                    Return (0x0F)
                }

                If (ECON)
                {
                    Store (\_SB.BTST, Local0)
                    If (LEqual (Local0, 0x01))
                    {
                        Return (0x1F)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)
            {
                If (LEqual (\_SB.DFEC, 0x01))
                {
                    Return (BBIF)
                }

                If (LEqual (\_SB.MYOS, Ones))
                {
                    Store (One, Index (BBIF, 0x00))
                }
                Else
                {
                    Store (Zero, Index (BBIF, 0x00))
                }

                Store (0x2580, Local0)
                Store (Local0, Index (BBIF, 0x04))
                Store (0x0FB0, Local1)
                Store (0x0FAB, Local2)
                If (LEqual (\_SB.MYOS, Zero))
                {
                    Multiply (Local0, Local1, Local1)
                    Divide (Local1, 0x03E8, Local5, Local1)
                    Multiply (Local0, Local2, Local2)
                    Divide (Local2, 0x03E8, Local5, Local2)
                }

                Store (Local1, Index (BBIF, 0x01))
                Store (Local2, Index (BBIF, 0x02))
                Multiply (Local1, 0x0F, Local0)
                Divide (Local0, 0x64, Local0, Local3)
                Store (Local3, Index (BBIF, 0x05))
                Multiply (Local1, 0x0A, Local0)
                Divide (Local0, 0x64, Local0, Local4)
                Store (Local4, Index (BBIF, 0x06))
                Subtract (Local3, Local4, Local0)
                Store (Local0, Index (BBIF, 0x07))
                Subtract (Local2, Local3, Local0)
                Store (Local0, Index (BBIF, 0x08))
                If (\_SB.BTYP)
                {
                    Store ("QT08", Index (BBIF, 0x09))
                    Store ("", Index (BBIF, 0x0A))
                    Store ("NiMH ", Index (BBIF, 0x0B))
                    Store ("SANYO", Index (BBIF, 0x0C))
                }
                Else
                {
                    Store ("QT07", Index (BBIF, 0x09))
                    Store ("", Index (BBIF, 0x0A))
                    Store ("LION", Index (BBIF, 0x0B))
                    Store ("SANYO", Index (BBIF, 0x0C))
                }

                Return (BBIF)
            }

            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (\_SB.DFEC, 0x01))
                {
                    Return (BBST)
                }

                Store (\_SB.BATD, Local0)
                Store (\_SB.BATC, Local1)
                Store (\_SB.DBAT, Local2)
                ShiftLeft (Local1, 0x01, Local1)
                ShiftLeft (Local2, 0x02, Local2)
                Or (Local0, Local1, Local3)
                Or (Local3, Local2, Local3)
                Store (Local3, Index (BBST, 0x00))
                Store (\_SB.BCAP, Local0)
                If (LLess (Local0, 0x0F))
                {
                    Or (Local3, 0x04, Index (BBST, 0x00))
                }

                Store (DerefOf (Index (BBIF, 0x02)), Local1)
                Multiply (Local1, Local0, Local2)
                Divide (Local2, 0x64, Local3, Local2)
                Store (Local2, Index (BBST, 0x02))
                Store (DerefOf (Index (BBIF, 0x04)), Local3)
                Store (Local3, Index (BBST, 0x03))
                Return (BBST)
            }
        }

        Device (PBTN)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }

            Name (_PRW, Package (0x02)
            {
                0x08, 
                0x04
            })
        }

        Device (PCI0)
        {
            Method (_INI, 0, NotSerialized)
            {
            }

            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            OperationRegion (NB00, PCI_Config, 0x00, 0x0100)
            Field (NB00, ByteAcc, NoLock, Preserve)
            {
                        Offset (0x52), 
                    ,   7, 
                LSTP,   1, 
                        Offset (0x5F), 
                EADD,   8, 
                        Offset (0x70), 
                    ,   5, 
                VIA0,   1, 
                        Offset (0x71), 
                        Offset (0xB3), 
                CSCN,   1, 
                        Offset (0xB4), 
                        Offset (0xF0), 
                APMD,   8, 
                SDCS,   8, 
                HPXX,   8, 
                TXXX,   8, 
                ACON,   1, 
                S2KC,   1, 
                NIMH,   1, 
                        Offset (0xF5), 
                        Offset (0xFB), 
                    ,   4, 
                FBSZ,   2, 
                VGAR,   1, 
                VGAE,   1
            }

            Name (CRES, ResourceTemplate ()
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
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceConsumer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0xFFFC0000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00040000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x02000000,         // Range Minimum
                    0xFEDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFCE00000,         // Length
                    ,, _Y00, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, RAMT)
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, RAMR)
                Multiply (EADD, 0x01000000, Local1)
                ShiftLeft (0x01, FBSZ, Local2)
                Multiply (Local2, 0x00100000, Local2)
                Subtract (Local1, Local2, RAMT)
                Subtract (0xFEE00000, RAMT, RAMR)
                Return (CRES)
            }

            Name (_PRT, Package (0x0A)
            {
                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x01, 
                    \_SB.PCI0.LNKB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x02, 
                    \_SB.PCI0.LNKC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x03, 
                    \_SB.PCI0.LNKD, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.LNKA, 
                    0x00
                }
            })
            Device (AUDI)
            {
                Name (_ADR, 0x00110005)
                OperationRegion (SBC0, PCI_Config, 0x00, 0x85)
                Field (SBC0, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x3C), 
                    MIRR,   4
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x04
                })
            }

            Device (MODM)
            {
                Name (_ADR, 0x00110006)
                OperationRegion (SBB0, PCI_Config, 0x00, 0x85)
                Field (SBB0, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x3C), 
                    MIRL,   4
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.EMDM)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x04
                })
            }

            Device (USB0)
            {
                Name (_ADR, 0x00110002)
                OperationRegion (SB72, PCI_Config, 0x00, 0xC2)
                Field (SB72, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x3C), 
                    UIRR,   4
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
            }

            Device (USB1)
            {
                Name (_ADR, 0x00110003)
                OperationRegion (SB73, PCI_Config, 0x00, 0xC2)
                Field (SB73, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x3C), 
                    UBRR,   4
                }

                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
            }

            Device (CARD)
            {
                Name (_ADR, 0x000A0000)
                OperationRegion (PCRD, PCI_Config, 0x00, 0xD8)
                Field (PCRD, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x44), 
                    OZ44,   16
                }
            }

            OperationRegion (\ECAD, SystemIO, 0x03E0, 0x02)
            Field (\ECAD, ByteAcc, NoLock, Preserve)
            {
                ECAX,   8, 
                ECAD,   8
            }

            IndexField (ECAX, ECAD, ByteAcc, NoLock, Preserve)
            {
                        Offset (0x01), 
                CD00,   8
            }

            Device (LAN0)
            {
                Name (_ADR, 0x00120000)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x04
                })
            }

            Device (IDE0)
            {
                Name (_ADR, 0x00110001)
                OperationRegion (SB71, PCI_Config, 0x00, 0xC7)
                Field (SB71, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x40), 
                    SECE,   1, 
                    PRCE,   1, 
                            Offset (0x41), 
                            Offset (0x48), 
                    SSTC,   8, 
                    SMTC,   8, 
                    PSTC,   8, 
                    PMTC,   8, 
                            Offset (0x50), 
                    SSUD,   8, 
                    SMUD,   8, 
                    PSUD,   8, 
                    PMUD,   8
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (\_SB.PCI0.EIDE)
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Device (PRI)
                {
                    Name (_ADR, 0x00)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PRCE)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x0D)
                        }
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (Buffer (0x14)
                            {
                                0x00
                            }, Local0)
                        CreateDWordField (Local0, 0x00, PIO0)
                        CreateDWordField (Local0, 0x04, DMA0)
                        CreateDWordField (Local0, 0x08, PIO1)
                        Store (0xFFFFFFFF, PIO1)
                        CreateDWordField (Local0, 0x0C, DMA1)
                        Store (0xFFFFFFFF, DMA1)
                        CreateDWordField (Local0, 0x10, FLAG)
                        If (And (^^PMUD, 0x40))
                        {
                            Store (And (^^PMUD, 0x07), Local1)
                            Add (Local1, 0x02, Local1)
                            Multiply (Local1, 0x0A, DMA0)
                            Or (FLAG, 0x01, FLAG)
                        }

                        ShiftRight (And (^^PMTC, 0xF0), 0x04, Local1)
                        Store (And (^^PMTC, 0x0F), Local2)
                        Add (Local1, Local2, Local1)
                        Add (Local1, 0x02, Local1)
                        Multiply (Local1, 0x0A, Local1)
                        Store (Local1, PIO0)
                        If (LNotEqual (And (^^PMUD, 0x40), 0x40))
                        {
                            Store (Local1, DMA0)
                        }

                        Or (FLAG, 0x12, FLAG)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        If (And (FLAG, 0x01))
                        {
                            If (LLessEqual (DMA0, 0x14))
                            {
                                And (^^PMUD, 0xF8, ^^PMUD)
                            }
                            Else
                            {
                                If (LLessEqual (DMA0, 0x1E))
                                {
                                    And (^^PMUD, 0xF8, ^^PMUD)
                                    Or (^^PMUD, 0x01, ^^PMUD)
                                }
                                Else
                                {
                                    If (LLessEqual (DMA0, 0x28))
                                    {
                                        And (^^PMUD, 0xF8, ^^PMUD)
                                        Or (^^PMUD, 0x02, ^^PMUD)
                                    }
                                    Else
                                    {
                                        If (LLessEqual (DMA0, 0x3C))
                                        {
                                            And (^^PMUD, 0xF8, ^^PMUD)
                                            Or (^^PMUD, 0x04, ^^PMUD)
                                        }
                                        Else
                                        {
                                            And (^^PMUD, 0xF8, ^^PMUD)
                                            Or (^^PMUD, 0x06, ^^PMUD)
                                        }
                                    }
                                }
                            }

                            Or (^^PMUD, 0xE0, ^^PMUD)
                        }
                        Else
                        {
                            If (LLessEqual (PIO0, 0x78))
                            {
                                Store (0x20, ^^PMTC)
                            }
                            Else
                            {
                                If (LLessEqual (PIO0, 0xB4))
                                {
                                    Store (0x31, ^^PMTC)
                                }
                                Else
                                {
                                    If (LLessEqual (PIO0, 0x0186))
                                    {
                                        Store (0x65, ^^PMTC)
                                    }
                                    Else
                                    {
                                        Store (0xA8, ^^PMTC)
                                    }
                                }
                            }

                            And (^^PMUD, 0x60, ^^PMUD)
                        }
                    }

                    Device (HDD)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            If (LEqual (\_SB.MYOS, Zero))
                            {
                                Store (0xA0, HDSL)
                                While (And (HDCM, 0x80))
                                {
                                    Stall (0xFF)
                                }
                            }

                            Name (BUFF, Buffer (0x07) {})
                            Store (HGT2, BUFF)
                            Return (BUFF)
                        }
                    }
                }

                Device (SEC)
                {
                    Name (_ADR, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (SECE)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x0D)
                        }
                    }

                    Method (_GTM, 0, NotSerialized)
                    {
                        Store (Buffer (0x14)
                            {
                                0x00
                            }, Local0)
                        CreateDWordField (Local0, 0x00, PIO0)
                        CreateDWordField (Local0, 0x04, DMA0)
                        CreateDWordField (Local0, 0x08, PIO1)
                        Store (0xFFFFFFFF, PIO1)
                        CreateDWordField (Local0, 0x0C, DMA1)
                        Store (0xFFFFFFFF, DMA1)
                        CreateDWordField (Local0, 0x10, FLAG)
                        If (And (^^SMUD, 0x40))
                        {
                            Store (And (^^SMUD, 0x07), Local1)
                            Add (Local1, 0x02, Local1)
                            Multiply (Local1, 0x0A, DMA0)
                            Or (FLAG, 0x01, FLAG)
                        }

                        ShiftRight (And (^^SMTC, 0xF0), 0x04, Local1)
                        Store (And (^^SMTC, 0x0F), Local2)
                        Add (Local1, Local2, Local1)
                        Add (Local1, 0x02, Local1)
                        Multiply (Local1, 0x0A, Local1)
                        Store (Local1, PIO0)
                        If (LNotEqual (And (^^SMUD, 0x40), 0x40))
                        {
                            Store (Local1, DMA0)
                        }

                        Or (FLAG, 0x12, FLAG)
                        Return (Local0)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        CreateDWordField (Arg0, 0x00, PIO0)
                        CreateDWordField (Arg0, 0x04, DMA0)
                        CreateDWordField (Arg0, 0x08, PIO1)
                        CreateDWordField (Arg0, 0x0C, DMA1)
                        CreateDWordField (Arg0, 0x10, FLAG)
                        If (And (FLAG, 0x01))
                        {
                            If (LLessEqual (DMA0, 0x14))
                            {
                                And (^^SMUD, 0xF8, ^^SMUD)
                            }
                            Else
                            {
                                If (LLessEqual (DMA0, 0x1E))
                                {
                                    And (^^SMUD, 0xF8, ^^SMUD)
                                    Or (^^SMUD, 0x01, ^^SMUD)
                                }
                                Else
                                {
                                    If (LLessEqual (DMA0, 0x28))
                                    {
                                        And (^^SMUD, 0xF8, ^^SMUD)
                                        Or (^^SMUD, 0x02, ^^SMUD)
                                    }
                                    Else
                                    {
                                        If (LLessEqual (DMA0, 0x3C))
                                        {
                                            And (^^SMUD, 0xF8, ^^SMUD)
                                            Or (^^SMUD, 0x04, ^^SMUD)
                                        }
                                        Else
                                        {
                                            And (^^SMUD, 0xF8, ^^SMUD)
                                            Or (^^SMUD, 0x06, ^^SMUD)
                                        }
                                    }
                                }
                            }

                            Or (^^SMUD, 0xE0, ^^SMUD)
                        }
                        Else
                        {
                            If (LLessEqual (PIO0, 0x78))
                            {
                                Store (0x20, ^^SMTC)
                            }
                            Else
                            {
                                If (LLessEqual (PIO0, 0xB4))
                                {
                                    Store (0x31, ^^SMTC)
                                }
                                Else
                                {
                                    If (LLessEqual (PIO0, 0x0186))
                                    {
                                        Store (0x65, ^^SMTC)
                                    }
                                    Else
                                    {
                                        Store (0xA8, ^^SMTC)
                                    }
                                }
                            }

                            And (^^SMUD, 0x60, ^^SMUD)
                        }
                    }

                    Device (CDD)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUFF, Buffer (0x07) {})
                            Store (CGT2, BUFF)
                            Return (BUFF)
                        }
                    }
                }
            }

            Device (AGPB)
            {
                Name (_ADR, 0x00010000)
                Method (_PS0, 0, NotSerialized)
                {
                }

                Method (_PS3, 0, NotSerialized)
                {
                }

                Device (VGA0)
                {
                    Name (_ADR, 0x00)
                    Name (DOSA, 0x01)
                    Name (_DOD, Package (0x02)
                    {
                        0x00010100, 
                        0x00010110
                    })
                    Name (LDCS, 0x00)
                    Name (CDCS, 0x00)
                    Name (_STA, 0x0F)
                    Method (_INI, 0, NotSerialized)
                    {
                        GSMI (0x03)
                        Store (\_SB.PCI0.SDCS, Local0)
                        Store (Local0, Local1)
                        And (Local1, 0x01, Local1)
                        ShiftLeft (Local1, 0x01, Local1)
                        And (^LCD0._DCS, 0xFFFFFFFD, ^LCD0._DCS)
                        And (Local0, 0x02, Local0)
                        And (^CRT0._DCS, 0xFFFFFFFD, ^CRT0._DCS)
                        Store (0x02, Local0)
                        Or (^CRT0._DCS, Local0, ^CRT0._DCS)
                        EDGS ()
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, DOSA)
                    }

                    Method (EDGS, 0, NotSerialized)
                    {
                        If (And (^LCD0._DCS, 0x02))
                        {
                            If (And (^CRT0._DCS, 0x02))
                            {
                                Store (Zero, ^LCD0._DGS)
                                Store (One, ^CRT0._DGS)
                            }
                            Else
                            {
                                Store (One, ^LCD0._DGS)
                                Store (One, ^CRT0._DGS)
                            }
                        }
                        Else
                        {
                            Store (One, ^LCD0._DGS)
                            Store (Zero, ^CRT0._DGS)
                        }
                    }

                    Method (USTS, 0, NotSerialized)
                    {
                        And (^LCD0._DCS, 0xFFFFFFFD, ^LCD0._DCS)
                        Or (^LCD0._DCS, ShiftLeft (LDCS, 0x01), ^LCD0._DCS)
                        And (^CRT0._DCS, 0xFFFFFFFD, ^CRT0._DCS)
                        Or (^CRT0._DCS, ShiftLeft (CDCS, 0x01), ^CRT0._DCS)
                        EDGS ()
                    }

                    Method (SWIT, 0, NotSerialized)
                    {
                        USTS ()
                        Or (CDCS, ShiftLeft (LDCS, 0x01), Local0)
                        Store (Local0, \_SB.PCI0.SDCS)
                        GSMI (0x04)
                    }

                    Device (LCD0)
                    {
                        Name (_ADR, 0x0110)
                        Name (_DCS, 0x1F)
                        Name (_DGS, 0x00)
                        Method (_DSS, 1, NotSerialized)
                        {
                            And (Arg0, 0x01, LDCS)
                            If (And (Arg0, 0x40000000))
                            {
                                ^^USTS ()
                            }
                            Else
                            {
                                If (And (Arg0, 0x80000000))
                                {
                                    ^^SWIT ()
                                }
                            }
                        }
                    }

                    Device (CRT0)
                    {
                        Name (_ADR, 0x0100)
                        Name (_DCS, 0x0F)
                        Name (_DGS, 0x00)
                        Method (_DSS, 1, NotSerialized)
                        {
                            And (Arg0, 0x01, CDCS)
                            If (And (Arg0, 0x40000000))
                            {
                                ^^USTS ()
                            }
                            Else
                            {
                                If (And (Arg0, 0x80000000))
                                {
                                    ^^SWIT ()
                                }
                            }
                        }
                    }
                }
            }

            Device (PM)
            {
                Name (_ADR, 0x00110004)
                OperationRegion (SB74, PCI_Config, 0x00, 0x0100)
                Field (SB74, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x44), 
                    PIR0,   8, 
                    PIR8,   8, 
                            Offset (0x4C), 
                        ,   3, 
                    THME,   1, 
                            Offset (0x4D), 
                            Offset (0x55), 
                    USBW,   1, 
                    GPO4,   1, 
                            Offset (0xE0), 
                        ,   2, 
                    CRTI,   1
                }
            }

            Device (PIB)
            {
                Name (_ADR, 0x00110000)
                OperationRegion (PIRQ, PCI_Config, 0x00, 0x89)
                Name (FRIO, 0x00)
                OperationRegion (SB31, PCI_Config, 0x00, 0x0100)
                Field (SB31, DWordAcc, NoLock, Preserve)
                {
                            Offset (0x67), 
                    FIRC,   8, 
                    FIRB,   16
                }

                OperationRegion (SBFR, SystemIO, FRIO, 0x80)
                Field (SBFR, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x10), 
                    FR10,   8, 
                    FR11,   8, 
                            Offset (0x15), 
                    FR15,   8
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (FIRB, Local0)
                    And (Local0, 0xFFFE, Local0)
                    Store (Local0, FRIO)
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                }

                Device (KBC)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {1}
                        FixedIO (
                            0x0060,             // Address
                            0x01,               // Length
                            )
                        FixedIO (
                            0x0064,             // Address
                            0x01,               // Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0048,             // Range Minimum
                            0x0048,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                }

                Device (SPKR)
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
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFFFC0000,         // Address Base
                            0x00040000,         // Address Length
                            )
                    })
                }

                Device (PIC)
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
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (MAD)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0094,             // Range Minimum
                            0x0094,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (PNP)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x01)
                    Name (PCRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x1600,             // Range Minimum
                            0x1600,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x02C8,             // Range Minimum
                            0x02C8,             // Range Maximum
                            0x00,               // Alignment
                            0x08,               // Length
                            )
                        FixedIO (
                            0x0092,             // Address
                            0x01,               // Length
                            )
                        FixedIO (
                            0x0074,             // Address
                            0x02,               // Length
                            )
                        FixedIO (
                            0x00A8,             // Address
                            0x02,               // Length
                            )
                        FixedIO (
                            0x04D0,             // Address
                            0x02,               // Length
                            )
                        FixedIO (
                            0x1000,             // Address
                            0x60,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x000D4000,         // Address Base
                            0x00004000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x07800000,         // Address Base
                            0x00800000,         // Address Length
                            _Y01)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (PCRS, \_SB.PCI0.PIB.PNP._Y01._BAS, PBAS)
                        CreateDWordField (PCRS, \_SB.PCI0.PIB.PNP._Y01._LEN, PLEN)
                        Multiply (EADD, 0x01000000, Local1)
                        ShiftLeft (0x01, FBSZ, Local2)
                        Multiply (Local2, 0x00100000, Local2)
                        Subtract (Local1, Local2, PBAS)
                        Store (Local2, PLEN)
                        Return (PCRS)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (COPR)
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
                        IRQ (Level, ActiveHigh, Shared, )
                            {13}
                    })
                }

                OperationRegion (SPIO, SystemIO, 0x03F0, 0x02)
                Field (SPIO, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                            Offset (0xF0), 
                    CRC0,   8, 
                    CRC1,   8, 
                    CRC2,   8, 
                    CRC3,   8, 
                    CRC4,   8, 
                    CRC5,   8, 
                    CRC6,   8, 
                    CRC7,   8, 
                    CRC8,   8, 
                    CRC9,   8, 
                        ,   4, 
                    EPPV,   1, 
                    ECPE,   1, 
                        ,   1, 
                    PS2P,   1, 
                    CRCB,   8, 
                    CRCC,   8, 
                    CRCD,   8, 
                            Offset (0xFF), 
                    CRCF,   8
                }

                Method (ENFG, 0, NotSerialized)
                {
                    Store (One, \_SB.PCI0.EN3C)
                }

                Method (EXFG, 0, NotSerialized)
                {
                    Store (Zero, \_SB.PCI0.EN3C)
                }

                Device (FDC0)
                {
                    Name (_HID, EisaId ("PNP0700"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Store ("FDC_STA", Debug)
                        ENFG ()
                        Store (CRC2, Local0)
                        And (Local0, 0x10, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Store (0x0D, Local1)
                        }
                        Else
                        {
                            Store (0x0F, Local1)
                        }

                        EXFG ()
                        Return (Local1)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (CRC2, Local0)
                        And (Local0, 0xEF, Local0)
                        Store (Local0, CRC2)
                        EXFG ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFF, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F0,             // Range Minimum
                                0x03F0,             // Range Maximum
                                0x00,               // Alignment
                                0x06,               // Length
                                _Y02)
                            IO (Decode16,
                                0x03F7,             // Range Minimum
                                0x03F7,             // Range Maximum
                                0x00,               // Alignment
                                0x01,               // Length
                                _Y03)
                            IRQNoFlags (_Y04)
                                {6}
                            DMA (Compatibility, BusMaster, Transfer8, )
                                {2}
                        })
                        Store ("FDC_CRS", Debug)
                        CreateWordField (BUFF, \_SB.PCI0.PIB.FDC0._CRS._Y02._MIN, FAD0)
                        CreateWordField (BUFF, \_SB.PCI0.PIB.FDC0._CRS._Y02._MAX, FAD1)
                        CreateWordField (BUFF, \_SB.PCI0.PIB.FDC0._CRS._Y03._MIN, FAD2)
                        CreateWordField (BUFF, \_SB.PCI0.PIB.FDC0._CRS._Y03._MAX, FAD3)
                        CreateByteField (BUFF, \_SB.PCI0.PIB.FDC0._CRS._Y04._INT, FDCI)
                        ENFG ()
                        ShiftLeft (CRC7, 0x02, FAD0)
                        Store (FAD0, FAD1)
                        Or (And (FAD0, 0x0FF0, FAD2), 0x07, FAD2)
                        Store (FAD2, FAD3)
                        ShiftLeft (0x01, FLIR, FDCI)
                        EXFG ()
                        Store (BUFF, Local0)
                        Return (BUFF)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x03F0,             // Range Minimum
                            0x03F0,             // Range Maximum
                            0x00,               // Alignment
                            0x06,               // Length
                            )
                        IO (Decode16,
                            0x03F7,             // Range Minimum
                            0x03F7,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {6}
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {2}
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x11, IRQ0)
                        CreateByteField (Arg0, 0x14, DMA0)
                        Store ("FDC_SRS", Debug)
                        ENFG ()
                        Store (CRC2, Local0)
                        And (Local0, 0xEF, Local1)
                        Store (Local1, CRC2)
                        Store (IOLO, Local0)
                        ShiftRight (Local0, 0x02, Local0)
                        And (Local0, 0xFC, Local0)
                        Store (IOHI, Local1)
                        ShiftLeft (Local1, 0x06, Local1)
                        Or (Local0, Local1, Local0)
                        Store (Local0, CRC7)
                        FindSetRightBit (IRQ0, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.FLIR)
                        FindSetRightBit (DMA0, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.FLDA)
                        Store (CRC2, Local0)
                        Or (Local0, 0x10, Local1)
                        Store (Local1, CRC2)
                        EXFG ()
                    }
                }

                Device (ECP)
                {
                    Name (_HID, EisaId ("PNP0401"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Store ("ECP_STA", Debug)
                        ENFG ()
                        Store (CRC2, Local0)
                        And (Local0, 0x03, Local0)
                        If (LEqual (Local0, 0x01))
                        {
                            Store (0x0F, Local1)
                        }
                        Else
                        {
                            Store (0x0D, Local1)
                        }

                        EXFG ()
                        Return (Local1)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG ()
                        Store (CRC2, Local0)
                        Or (Local0, 0x03, Local0)
                        Store (Local0, CRC2)
                        EXFG ()
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (BUFE, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                _Y05)
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                _Y06)
                            IRQNoFlags (_Y07)
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8, _Y08)
                                {3}
                        })
                        CreateWordField (BUFE, \_SB.PCI0.PIB.ECP._CRS._Y05._MIN, IMI1)
                        CreateWordField (BUFE, \_SB.PCI0.PIB.ECP._CRS._Y05._MAX, IMA1)
                        CreateByteField (BUFE, \_SB.PCI0.PIB.ECP._CRS._Y05._ALN, ALN1)
                        CreateByteField (BUFE, \_SB.PCI0.PIB.ECP._CRS._Y05._LEN, LEN1)
                        CreateWordField (BUFE, \_SB.PCI0.PIB.ECP._CRS._Y06._MIN, IMI2)
                        CreateWordField (BUFE, \_SB.PCI0.PIB.ECP._CRS._Y06._MAX, IMA2)
                        CreateWordField (BUFE, \_SB.PCI0.PIB.ECP._CRS._Y07._INT, IRQ0)
                        CreateByteField (BUFE, \_SB.PCI0.PIB.ECP._CRS._Y08._DMA, DMA0)
                        Store ("ECP_CRS", Debug)
                        ENFG ()
                        Store (CRC6, Local0)
                        EXFG ()
                        Store (Local0, Local1)
                        And (Local1, 0xC0, Local1)
                        ShiftLeft (Local1, 0x02, Local1)
                        ShiftLeft (Local0, 0x02, Local0)
                        Or (Local0, Local1, Local0)
                        Store (Local0, IMI1)
                        Store (Local0, IMA1)
                        Add (Local0, 0x0400, Local0)
                        Store (Local0, IMI2)
                        Store (Local0, IMA2)
                        If (LEqual (IMI1, 0x03BC))
                        {
                            Store (0x04, LEN1)
                        }
                        Else
                        {
                            Store (0x08, LEN1)
                        }

                        Store (\_SB.PCI0.LPIR, Local0)
                        Store (0x01, Local1)
                        ShiftLeft (Local1, Local0, IRQ0)
                        Store (\_SB.PCI0.LPDA, Local0)
                        And (Local0, 0x03, Local0)
                        Store (0x01, Local1)
                        ShiftLeft (Local1, Local0, DMA0)
                        Return (BUFE)
                    }

                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0678,             // Range Minimum
                                0x0678,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {5}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x07BC,             // Range Minimum
                                0x07BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0678,             // Range Minimum
                                0x0678,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {5}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x07BC,             // Range Minimum
                                0x07BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {1}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0378,             // Range Minimum
                                0x0378,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0778,             // Range Minimum
                                0x0778,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x0278,             // Range Minimum
                                0x0278,             // Range Maximum
                                0x00,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0678,             // Range Minimum
                                0x0678,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {5}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {3}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03BC,             // Range Minimum
                                0x03BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IO (Decode16,
                                0x07BC,             // Range Minimum
                                0x07BC,             // Range Maximum
                                0x00,               // Alignment
                                0x04,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {3}
                        }
                        EndDependentFn ()
                    })
                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateByteField (Arg0, 0x02, IOLO)
                        CreateByteField (Arg0, 0x03, IOHI)
                        CreateWordField (Arg0, 0x11, IRQ0)
                        CreateByteField (Arg0, 0x14, DMA0)
                        ENFG ()
                        Store (CRC2, Local0)
                        Or (Local0, 0x03, Local0)
                        Store (Local0, CRC2)
                        Store (IOLO, Local0)
                        ShiftRight (Local0, 0x02, Local0)
                        Store (IOHI, Local1)
                        ShiftLeft (Local1, 0x06, Local1)
                        Or (Local0, Local1, Local0)
                        Store (Local0, CRC6)
                        FindSetRightBit (IRQ0, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.LPIR)
                        FindSetRightBit (DMA0, Local0)
                        If (LGreater (Local0, 0x00))
                        {
                            Decrement (Local0)
                        }

                        Store (Local0, \_SB.PCI0.LPDA)
                        Store (CRC2, Local0)
                        And (Local0, 0xFC, Local0)
                        Or (Local0, 0x01, Local0)
                        Store (Local0, CRC2)
                        Store (0x01, ECPE)
                        EXFG ()
                    }
                }
            }

            Device (EC0)
            {
                Name (_HID, EisaId ("PNP0C09"))
                Name (_GPE, 0x01)
                Name (_STA, 0x0F)
                Method (_PS0, 0, NotSerialized)
                {
                    Store (0x00, \_SB.DFEC)
                }

                Method (_PS3, 0, NotSerialized)
                {
                    Store (0x01, \_SB.DFEC)
                }

                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0062,             // Range Minimum
                        0x0062,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                    IO (Decode16,
                        0x0066,             // Range Minimum
                        0x0066,             // Range Maximum
                        0x01,               // Alignment
                        0x01,               // Length
                        )
                })
                Method (_REG, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, ECON)
                    }
                    Else
                    {
                        Store (Zero, ECON)
                    }
                }

                OperationRegion (ECOR, EmbeddedControl, 0x00, 0xF0)
                Scope (\_SB)
                {
                    Field (\_SB.PCI0.EC0.ECOR, ByteAcc, NoLock, Preserve)
                    {
                        SPRO,   8, 
                        SMST,   8, 
                        SADD,   8, 
                        SMBC,   8, 
                        SD00,   8, 
                        SD01,   8, 
                        SD02,   8, 
                        SD03,   8, 
                        SD04,   8, 
                        SD05,   8, 
                        SD06,   8, 
                        SD07,   8, 
                        SD08,   8, 
                                Offset (0x24), 
                        SBCN,   8, 
                        SALA,   8, 
                        SAD0,   8, 
                        SAD1,   8, 
                                Offset (0x30), 
                        ACST,   1, 
                                Offset (0x31), 
                                Offset (0x3C), 
                        BTST,   1, 
                            ,   5, 
                        BATD,   1, 
                        DBAT,   1, 
                                Offset (0x3F), 
                            ,   3, 
                        BTYP,   1, 
                            ,   1, 
                        BATC,   1, 
                                Offset (0x40), 
                                Offset (0x5A), 
                        BLOW,   8, 
                                Offset (0x61), 
                        BWAR,   8, 
                                Offset (0x65), 
                        BCAP,   8, 
                                Offset (0x86), 
                        BPV0,   8, 
                        BPV1,   8, 
                                Offset (0x8A), 
                        BPR0,   8, 
                        BPR1,   8, 
                                Offset (0xA8), 
                        B5V0,   8, 
                        B5V1,   8, 
                                Offset (0xB0), 
                        TCPU,   8, 
                        CPUW,   8, 
                                Offset (0xDD), 
                        BEEP,   8, 
                                Offset (0xE5), 
                        LIDE,   8
                    }

                    Field (\_SB.PCI0.EC0.ECOR, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x04), 
                        DTDW,   16
                    }

                    Field (\_SB.PCI0.EC0.ECOR, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x04), 
                        BLOK,   256, 
                        BCNT,   8
                    }
                }

                Mutex (MUT0, 0x00)
                Method (SWWD, 3, NotSerialized)
                {
                    Store (Arg0, SADD)
                    Store (Arg1, SMBC)
                    Store (Arg2, DTDW)
                    Store (0x08, SPRO)
                    Stall (0x0A)
                    Store (SMST, Local0)
                    If (LNotEqual (Local0, 0x80))
                    {
                        Store (Arg0, SADD)
                        Store (Arg1, SMBC)
                        Store (Arg2, DTDW)
                        Store (0x08, SPRO)
                    }

                    Stall (0x0A)
                }

                Method (SRWD, 2, NotSerialized)
                {
                    Store (One, Local0)
                    Store (Zero, Local4)
                    While (LNotEqual (Local0, 0x80))
                    {
                        Increment (Local4)
                        Store (Zero, SMST)
                        Store (Arg0, SADD)
                        Store (Arg1, SMBC)
                        Store (0x09, SPRO)
                        Stall (0x0A)
                        While (LNotEqual (SPRO, Zero))
                        {
                            Stall (0xFF)
                            Stall (0xFF)
                            Stall (0xFF)
                            Stall (0xFF)
                        }

                        Store (SMST, Local0)
                        If (LNotEqual (Local0, 0x80))
                        {
                            Store (Arg0, SADD)
                            Store (Arg1, SMBC)
                            Store (0x09, SPRO)
                        }

                        Stall (0x0A)
                        Stall (0xFF)
                        Stall (0xFF)
                        Stall (0xFF)
                        Stall (0xFF)
                        Store (DTDW, Local5)
                        If (LEqual (Local4, 0x0A))
                        {
                            Return (0xFFFFFFFF)
                        }
                    }

                    Return (Local5)
                }

                Method (SRBK, 2, NotSerialized)
                {
                    Store (0x00, BLOK)
                    Store (Arg0, SADD)
                    Store (Arg1, SMBC)
                    Store (0x0B, SPRO)
                    Stall (0x0A)
                    Store (SMST, Local0)
                    If (LNotEqual (Local0, 0x80))
                    {
                        Store (Arg0, SADD)
                        Store (Arg1, SMBC)
                        Store (0x0B, SPRO)
                    }

                    Stall (0x0A)
                    Return (BLOK)
                }

                Method (_Q80, 0, NotSerialized)
                {
                    Store ("Q80 ", Debug)
                    \_SB.GSMI (0x07)
                }

                Method (_Q81, 0, NotSerialized)
                {
                    Store ("Q81 ", Debug)
                    \_SB.GSMI (0x08)
                }

                Method (_Q82, 0, NotSerialized)
                {
                    Store ("Q82 ", Debug)
                }

                Method (_Q83, 0, NotSerialized)
                {
                    Store ("Q83 ", Debug)
                }

                Method (_Q84, 0, NotSerialized)
                {
                    Store ("Q84 ", Debug)
                    If (LEqual (\_SB.PCI0.AGPB.VGA0.DOSA, 0x00))
                    {
                        Notify (\_SB.PCI0.AGPB.VGA0, 0x80)
                    }

                    If (LEqual (\_SB.PCI0.AGPB.VGA0.DOSA, 0x01))
                    {
                        \_SB.PCI0.AGPB.VGA0.SWIT ()
                    }
                }

                Method (_Q85, 0, NotSerialized)
                {
                    Store ("Q85 ", Debug)
                }

                Method (_Q86, 0, NotSerialized)
                {
                    Store ("Q86 ", Debug)
                }

                Method (_Q87, 0, NotSerialized)
                {
                    Store ("Q87 ", Debug)
                }

                Method (_Q88, 0, NotSerialized)
                {
                    Store ("Q88 ", Debug)
                }

                Method (_Q89, 0, NotSerialized)
                {
                    Store ("Q89 ", Debug)
                }

                Method (_Q8A, 0, NotSerialized)
                {
                }

                Method (_Q8B, 0, NotSerialized)
                {
                    Store ("Q8B ", Debug)
                    Store (0x03E1, \_SB.PCI0.CARD.OZ44)
                    Store (CD00, Local0)
                    And (Local0, 0x0C, Local0)
                    If (LEqual (Local0, 0x0C))
                    {
                        \_SB.GSMI (0x10)
                    }

                    If (LEqual (\_SB.ACST, 0x01))
                    {
                        Store (0x00, \_SB.PCI0.VIA0)
                    }
                    Else
                    {
                        Store (0x01, \_SB.PCI0.VIA0)
                    }
                }

                Method (_Q09, 0, NotSerialized)
                {
                    Notify (\_PR.CPU0, 0x80)
                    Store (\_SB.ACST, Local0)
                    Store (\_SB.BTST, Local1)
                    Store (\_SB.BATD, Local2)
                    If (LNotEqual (Local0, ACIN))
                    {
                        Store (0x00, \_SB.PCI0.VIA0)
                        Store (0x01, \_SB.PCI0.ACON)
                        If (LEqual (S2KC, 0x01))
                        {
                            Store (Zero, \_SB.PCI0.LSTP)
                        }

                        Store (Local0, ACIN)
                        Store (0x15, \_SB.PCI0.HPXX)
                        Sleep (0x64)
                        \_SB.GSMI (0x06)
                        Notify (\_SB.ADP0, 0x00)
                    }
                    Else
                    {
                        If (LEqual (Local2, 0x01))
                        {
                            Store (0x01, \_SB.PCI0.VIA0)
                            Store (0x00, \_SB.PCI0.ACON)
                            Store (\_SB.BTYP, \_SB.PCI0.NIMH)
                            If (LEqual (S2KC, 0x01))
                            {
                                Store (One, \_SB.PCI0.LSTP)
                            }

                            Store (0x15, \_SB.PCI0.HPXX)
                            Sleep (0x64)
                            \_SB.GSMI (0x06)
                            Notify (\_SB.ADP0, 0x00)
                            Notify (\_SB.BAT0, 0x00)
                            Notify (\_SB.BAT0, 0x80)
                            Notify (\_SB.BAT0, 0x81)
                        }
                        Else
                        {
                            Notify (\_SB.ADP0, 0x00)
                            Notify (\_SB.BAT0, 0x00)
                            Notify (\_SB.BAT0, 0x80)
                            Notify (\_SB.BAT0, 0x81)
                        }
                    }
                }

                Method (_Q0A, 0, NotSerialized)
                {
                }

                Method (_Q0B, 0, NotSerialized)
                {
                }

                Method (_Q0C, 0, NotSerialized)
                {
                    Store ("_Q0C Active", Debug)
                }

                Method (_Q0D, 0, NotSerialized)
                {
                    Store ("_Q0D Active", Debug)
                }

                Method (_Q0E, 0, NotSerialized)
                {
                    Store ("_Q0E Active", Debug)
                    Notify (\_TZ.THRM, 0x80)
                }

                Method (_Q0F, 0, NotSerialized)
                {
                    Store ("_Q0F Active", Debug)
                    Notify (\_TZ.THRM, 0x80)
                }

                Method (_Q13, 0, NotSerialized)
                {
                    Notify (\_SB.LID, 0x80)
                    \_SB.GSMI (0x05)
                }
            }

            Field (\_SB.PCI0.PIB.PIRQ, ByteAcc, NoLock, Preserve)
            {
                        Offset (0x44), 
                FLDA,   2, 
                LPDA,   2, 
                FDMA,   2, 
                FDA1,   2, 
                FLIR,   4, 
                LPIR,   4, 
                U1IR,   4, 
                        Offset (0x47), 
                U2IR,   4, 
                        Offset (0x48), 
                        Offset (0x50), 
                    ,   1, 
                EP3C,   1, 
                EN3C,   1, 
                EIDE,   1, 
                EUSB,   1, 
                ESB1,   1, 
                EAUD,   1, 
                EMDM,   1, 
                    ,   4, 
                ELAN,   1, 
                        Offset (0x55), 
                    ,   4, 
                PIRA,   4, 
                PIRB,   4, 
                PIRC,   4, 
                    ,   4, 
                PIRD,   4, 
                        Offset (0x6D), 
                MIDI,   3, 
                GPRT,   1, 
                DLPT,   2, 
                PLPT,   1, 
                PFDD,   1
            }

            Device (LNKA)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x01)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Method (_STA, 0, NotSerialized)
                {
                    Store ("LINK-A STA", Debug)
                    If (LEqual (PIRA, 0x00))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store ("LINK-A DIS", Debug)
                    Store (0x00, PIRA)
                    Store (PIRA, Debug)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUFA, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y09)
                            {}
                    })
                    CreateWordField (BUFA, \_SB.PCI0.LNKA._CRS._Y09._INT, IRB1)
                    If (LNotEqual (PIRA, 0x00))
                    {
                        ShiftLeft (One, PIRA, IRB1)
                    }

                    Store ("LINKA-CRS", Debug)
                    Store (BUFA, Debug)
                    Return (BUFA)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRB1)
                    FindSetLeftBit (IRB1, Local0)
                    If (LGreater (Local0, 0x00))
                    {
                        Decrement (Local0)
                    }

                    Store (Local0, PIRA)
                    Store ("LINKA-SRS", Debug)
                    Store (PIRA, Debug)
                }
            }

            Device (LNKB)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x02)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Method (_STA, 0, NotSerialized)
                {
                    Store ("LINK-B STA", Debug)
                    If (LEqual (PIRB, 0x00))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store ("LINK-B DIS", Debug)
                    Store (0x00, PIRB)
                    Store (PIRB, Debug)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUFB, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y0A)
                            {}
                    })
                    CreateWordField (BUFB, \_SB.PCI0.LNKB._CRS._Y0A._INT, IRB1)
                    If (LNotEqual (PIRB, 0x00))
                    {
                        ShiftLeft (One, PIRB, IRB1)
                    }

                    Store ("LINK-B-CRS", Debug)
                    Store (BUFB, Debug)
                    Return (BUFB)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRB1)
                    FindSetLeftBit (IRB1, Local0)
                    If (LGreater (Local0, 0x00))
                    {
                        Decrement (Local0)
                    }

                    Store (Local0, PIRB)
                    Store ("LINK-B-SRS", Debug)
                    Store (PIRB, Debug)
                }
            }

            Device (LNKC)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x03)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10}
                })
                Method (_STA, 0, NotSerialized)
                {
                    Store ("LINK-C-STA", Debug)
                    If (LEqual (PIRC, 0x00))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store ("LINK-C-DIS", Debug)
                    Store (0x00, PIRC)
                    Store (PIRC, Debug)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUFC, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y0B)
                            {}
                    })
                    CreateWordField (BUFC, \_SB.PCI0.LNKC._CRS._Y0B._INT, IRB1)
                    If (LNotEqual (PIRC, 0x00))
                    {
                        ShiftLeft (One, PIRC, IRB1)
                    }

                    Store ("LINKA-CRS", Debug)
                    Store (BUFC, Debug)
                    Return (BUFC)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRB1)
                    FindSetLeftBit (IRB1, Local0)
                    If (LGreater (Local0, 0x00))
                    {
                        Decrement (Local0)
                    }

                    Store (Local0, PIRC)
                    Store ("LINKC-SRS", Debug)
                    Store (PIRC, Debug)
                }
            }

            Device (LNKD)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x04)
                Name (_PRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Method (_STA, 0, NotSerialized)
                {
                    Store ("LINK-D-STA", Debug)
                    If (LEqual (PIRD, 0x00))
                    {
                        Return (0x09)
                    }
                    Else
                    {
                        Return (0x0B)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store ("LINK-D-DIS", Debug)
                    Store (0x00, PIRD)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUFD, ResourceTemplate ()
                    {
                        IRQ (Level, ActiveLow, Shared, _Y0C)
                            {}
                    })
                    CreateWordField (BUFD, \_SB.PCI0.LNKD._CRS._Y0C._INT, IRB1)
                    If (LNotEqual (PIRD, 0x00))
                    {
                        ShiftLeft (One, PIRD, IRB1)
                    }

                    Store ("LINK-D-CRS", Debug)
                    Store (BUFD, Debug)
                    Return (BUFD)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    CreateWordField (Arg0, 0x01, IRB1)
                    FindSetLeftBit (IRB1, Local0)
                    If (LGreater (Local0, 0x00))
                    {
                        Decrement (Local0)
                    }

                    Store (Local0, PIRD)
                    Store ("LINK-D-SRS", Debug)
                    Store (PIRD, Debug)
                }
            }
        }

        Mutex (VSMX, 0x00)
        Method (\_SB.GSMI, 1, Serialized)
        {
            Acquire (VSMX, 0xFFFF)
            Store (Arg0, \_SB.PCI0.APMD)
            Store (0xE3, SWCM)
            Release (VSMX)
        }

        Method (D378, 1, NotSerialized)
        {
            Store (Arg0, \_SB.PCI0.TXXX)
            \_SB.GSMI (0x0A)
        }
    }

    OperationRegion (\P378, SystemIO, 0x0378, 0x02)
    Field (\P378, ByteAcc, NoLock, Preserve)
    {
        O378,   8, 
        I379,   8
    }

    Method (DBGS, 1, Serialized)
    {
        ROMC (Arg0, 0x1009)
    }

    Method (DBGT, 1, Serialized)
    {
        ROMC (Arg0, 0x100A)
    }

    Method (DBGC, 1, Serialized)
    {
        PHDB (Arg0)
        P1CH (0x20)
    }

    Method (P1CH, 1, Serialized)
    {
        ROMC (Arg0, 0x100E)
    }

    Method (PDDB, 1, Serialized)
    {
        ROMC (Arg0, 0x0300)
    }

    Method (PHDB, 1, Serialized)
    {
        ROMC (Arg0, 0x0200)
    }

    Method (PHDW, 1, Serialized)
    {
        ROMC (Arg0, 0x0201)
    }

    Method (PHDD, 1, Serialized)
    {
        ROMC (Arg0, 0x0202)
    }

    Method (ROMC, 2, Serialized)
    {
        And (I379, 0xF8, Local0)
        If (LEqual (Local0, 0xB0))
        {
            FODW (0xAA55)
            FODW (Arg1)
            If (LEqual (Arg1, 0x0200))
            {
                CHDB (Arg0)
            }
            Else
            {
                If (LEqual (Arg1, 0x0201))
                {
                    CHDW (Arg0)
                }
                Else
                {
                    If (LEqual (Arg1, 0x0202))
                    {
                        CHDD (Arg0)
                    }
                    Else
                    {
                        If (LEqual (Arg1, 0x0300))
                        {
                            CHDB (Arg0)
                        }
                        Else
                        {
                            If (LEqual (Arg1, 0x1009))
                            {
                                CSTR (Arg0)
                            }
                            Else
                            {
                                If (LEqual (Arg1, 0x100A))
                                {
                                    CSTR (Arg0)
                                }
                                Else
                                {
                                    If (LEqual (Arg1, 0x100E))
                                    {
                                        C1CH (Arg0)
                                    }
                                    Else
                                    {
                                    }
                                }
                            }
                        }
                    }
                }
            }

            FODB (0x66)
        }
    }

    Method (CSTR, 1, Serialized)
    {
        Store (SizeOf (Arg0), Local1)
        Name (BUFF, Buffer (Local1) {})
        Store (Arg0, BUFF)
        Store (Zero, Local2)
        FODW (0x0D0A)
        While (LNotEqual (Local2, Local1))
        {
            Store (DerefOf (Index (BUFF, Local2)), Local3)
            Increment (Local2)
            FODB (Local3)
        }

        FODB (0x00)
    }

    Method (C1CH, 1, Serialized)
    {
        FODB (Arg0)
        FODB (0x07)
    }

    Method (CHDB, 1, Serialized)
    {
        FODB (Arg0)
    }

    Method (CHDW, 1, Serialized)
    {
        FODW (Arg0)
    }

    Method (CHDD, 1, Serialized)
    {
        FODD (Arg0)
    }

    Method (\FODD, 1, NotSerialized)
    {
        Store (Arg0, Local0)
        ShiftRight (Local0, 0x10, Local1)
        And (Local1, 0xFFFF, Local1)
        And (Local0, 0xFFFF, Local0)
        FODW (Local0)
        FODW (Local1)
    }

    Method (\FODW, 1, NotSerialized)
    {
        Store (Arg0, Local0)
        ShiftRight (Local0, 0x08, Local1)
        And (Local1, 0xFF, Local1)
        And (Local0, 0xFF, Local0)
        FODB (Local0)
        FODB (Local1)
    }

    Method (\FODB, 1, NotSerialized)
    {
        Or (Arg0, 0x10, Local0)
        Store (Local0, O378)
        Store (0x01, Local3)
        While (Local3)
        {
            If (LEqual (And (I379, 0x80, Local3), 0x00))
            {
                ShiftRight (I379, 0x03, Local0)
                And (Local0, 0x0F, Local0)
                ShiftRight (Arg0, 0x04, Local1)
                Store (Local1, O378)
                Store (0x01, Local2)
                While (Local2)
                {
                    If (And (I379, 0x80, Local2))
                    {
                        Store (I379, Local1)
                        Store (0x00, Local2)
                    }
                    Else
                    {
                        Store (0x01, Local2)
                    }
                }

                ShiftLeft (Local1, 0x01, Local1)
                And (Local1, 0xF0, Local1)
                Or (Local1, Local0, Local0)
                Store (0x00, Local3)
            }
        }
    }
}

