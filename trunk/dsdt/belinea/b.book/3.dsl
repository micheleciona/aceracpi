/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20080514
 *
 * Disassembly of 3, Tue Sep 16 20:00:16 2008
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00004761 (18273)
 *     Revision         0x01 **** ACPI 1.0, no 64-bit math support
 *     Checksum         0x04
 *     OEM ID           "MSI   "
 *     OEM Table ID     "171B    "
 *     OEM Revision     0x00000B18 (2840)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20051117 (537202967)
 */
DefinitionBlock ("3.aml", "DSDT", 1, "MSI   ", "171B    ", 0x00000B18)
{
    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ICMS,   8, 
        DCMS,   8
    }

    IndexField (ICMS, DCMS, ByteAcc, NoLock, Preserve)
    {
                Offset (0x01), 
                Offset (0x04), 
                Offset (0x08), 
        BS_A,   32, 
        REV0,   8, 
        REV1,   8
    }

    OperationRegion (ACAF, SystemMemory, BS_A, 0x20)
    Field (ACAF, AnyAcc, NoLock, Preserve)
    {
        OCC0,   1, 
        OCC1,   1, 
        OCC2,   1, 
        OCC3,   1, 
        OCC4,   1, 
        OCC5,   1, 
        OCC6,   1, 
        OCC7,   1, 
        OCC8,   1, 
        OCC9,   1, 
                Offset (0x02), 
        TPMR,   1, 
        STHP,   1, 
        SHPG,   1, 
        OSCF,   1, 
                Offset (0x04), 
        PCIE,   32, 
        HPBS,   32, 
        OCM0,   4, 
        OCM1,   4, 
        OCM2,   4, 
        OCM3,   4, 
        OCM4,   4, 
        OCM5,   4, 
        OCM6,   4, 
        OCM7,   4, 
        OCM8,   4, 
        OCM9,   4, 
                Offset (0x14), 
        P92T,   8
    }

    OperationRegion (CMPT, SystemIO, 0x0C50, 0x03)
    Field (CMPT, ByteAcc, NoLock, Preserve)
    {
        CMID,   8, 
            ,   6, 
        GPCT,   2, 
        GP0I,   1, 
        GP1I,   1, 
        GP2I,   1, 
        GP3I,   1, 
        GP4I,   1, 
        GP5I,   1, 
        GP6I,   1, 
        GP7I,   1
    }

    OperationRegion (PCFG, SystemMemory, PCIE, 0x02000000)
    Field (PCFG, AnyAcc, NoLock, Preserve)
    {
                Offset (0x90024), 
        STB5,   32, 
                Offset (0x98042), 
        PT0D,   1, 
        PT1D,   1, 
        PT2D,   1, 
        PT3D,   1, 
        PT4D,   1, 
        PT5D,   1, 
        PT6D,   1, 
        PT7D,   1, 
        PT8D,   1, 
        PT9D,   1, 
                Offset (0xA0004), 
        SMIE,   1, 
        SMME,   1, 
                Offset (0xA0008), 
        RVID,   8, 
                Offset (0xA0014), 
        SMB1,   32, 
                Offset (0xA0078), 
            ,   14, 
        P92E,   1
    }

    OperationRegion (BAR, SystemMemory, STB5, 0x1000)
    Field (BAR, AnyAcc, NoLock, Preserve)
    {
                Offset (0x120), 
            ,   7, 
        PMBY,   1, 
                Offset (0x128), 
        PMS0,   4, 
                Offset (0x129), 
        PMS1,   4, 
                Offset (0x12C), 
        DET0,   4, 
                Offset (0x130), 
                Offset (0x132), 
        PRC0,   1, 
                Offset (0x1A0), 
            ,   7, 
        SMBY,   1, 
                Offset (0x1A8), 
        SMS0,   4, 
                Offset (0x1A9), 
        SMS1,   4, 
                Offset (0x1AC), 
        DET1,   4, 
                Offset (0x1B0), 
                Offset (0x1B2), 
        PRC1,   1, 
                Offset (0x220), 
            ,   7, 
        PSBY,   1, 
                Offset (0x228), 
        PSS0,   4, 
                Offset (0x229), 
        PSS1,   4, 
                Offset (0x22C), 
        DET2,   4, 
                Offset (0x230), 
                Offset (0x232), 
        PRC2,   1, 
                Offset (0x2A0), 
            ,   7, 
        SSBY,   1, 
                Offset (0x2A8), 
        SSS0,   4, 
                Offset (0x2A9), 
        SSS1,   4, 
                Offset (0x2AC), 
        DET3,   4, 
                Offset (0x2B0), 
                Offset (0x2B2), 
        PRC3,   1
    }

    OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        INPM,   8, 
        DAPM,   8
    }

    IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
    {
            ,   1, 
        TM1E,   1, 
        TM2E,   1, 
                Offset (0x01), 
            ,   1, 
        TM1S,   1, 
        TM2S,   1, 
                Offset (0x04), 
            ,   7, 
        SLPS,   1, 
                Offset (0x07), 
            ,   7, 
        CLPS,   1, 
                Offset (0x10), 
            ,   6, 
        PWDE,   1, 
                Offset (0x1C), 
            ,   3, 
        MKME,   1, 
        PI3E,   1, 
        PI2E,   1, 
        PI1E,   1, 
        PI0E,   1, 
            ,   3, 
        MKMS,   1, 
        PI3S,   1, 
        PI2S,   1, 
        PI1S,   1, 
        PI0S,   1, 
                Offset (0x20), 
        P1EB,   16, 
                Offset (0x36), 
            ,   6, 
        GV6P,   1, 
        GV7P,   1, 
            ,   3, 
        GM0P,   1, 
        GM1P,   1, 
        GM2P,   1, 
        GM3P,   1, 
        GM8P,   1, 
            ,   1, 
        GM4P,   1, 
        GM5P,   1, 
            ,   1, 
        GM6P,   1, 
        GM7P,   1, 
                Offset (0x3B), 
        GPX0,   1, 
        GPX4,   1, 
        GPX5,   1, 
        GPX1,   1, 
        GPX6,   1, 
        GPX7,   1, 
        GPX2,   1, 
        GPX3,   1, 
                Offset (0x55), 
        SPRE,   1, 
            ,   1, 
            ,   1, 
        EPNM,   1, 
        DPPF,   1, 
        FNGS,   1, 
                Offset (0x61), 
            ,   7, 
        R617,   1, 
                Offset (0x65), 
            ,   4, 
        RSTU,   1, 
                Offset (0x68), 
            ,   3, 
        TPDE,   1, 
            ,   1, 
                Offset (0x92), 
            ,   7, 
        GV7S,   1, 
                Offset (0x96), 
        GP8I,   1, 
        GP9I,   1, 
                Offset (0x9A), 
            ,   7, 
        HECO,   1, 
                Offset (0xA8), 
        PI4E,   1, 
        PI5E,   1, 
        PI6E,   1, 
        PI7E,   1, 
                Offset (0xA9), 
        PI4S,   1, 
        PI5S,   1, 
        PI6S,   1, 
        PI7S,   1
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    Method (C_OC, 0, NotSerialized)
    {
        Sleep (0x14)
        Store (0x13, CMID)
        Store (Zero, GPCT)
    }

    Method (U_OC, 2, NotSerialized)
    {
        If (LEqual (OCM0, Arg0))
        {
            Store (Arg1, PT0D)
        }

        If (LEqual (OCM1, Arg0))
        {
            Store (Arg1, PT1D)
        }

        If (LEqual (OCM2, Arg0))
        {
            Store (Arg1, PT2D)
        }

        If (LEqual (OCM3, Arg0))
        {
            Store (Arg1, PT3D)
        }

        If (LEqual (OCM4, Arg0))
        {
            Store (Arg1, PT4D)
        }

        If (LEqual (OCM5, Arg0))
        {
            Store (Arg1, PT5D)
        }

        If (LEqual (OCM6, Arg0))
        {
            Store (Arg1, PT6D)
        }

        If (LEqual (OCM7, Arg0))
        {
            Store (Arg1, PT7D)
        }

        If (LEqual (OCM8, Arg0))
        {
            Store (Arg1, PT8D)
        }

        If (LEqual (OCM9, Arg0))
        {
            Store (Arg1, PT9D)
        }
    }

    Method (SPTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, RSTU)
        }

        Store (One, CLPS)
        Store (One, SLPS)
        If (LLessEqual (RVID, 0x13))
        {
            Store (Zero, PWDE)
        }

        If (LEqual (P92T, Zero))
        {
            Store (Zero, PI0E)
        }

        If (LEqual (P92T, One))
        {
            Store (Zero, PI1E)
        }

        If (LEqual (P92T, 0x02))
        {
            Store (Zero, PI2E)
        }

        If (LEqual (P92T, 0x03))
        {
            Store (Zero, PI3E)
        }

        If (LEqual (P92T, 0x04))
        {
            Store (Zero, PI4E)
        }

        If (LEqual (P92T, 0x05))
        {
            Store (Zero, PI5E)
        }

        If (LEqual (P92T, 0x06))
        {
            Store (Zero, PI6E)
        }

        If (LEqual (P92T, 0x07))
        {
            Store (Zero, PI7E)
        }

        If (LLessEqual (P92T, 0x07))
        {
            Store (One, P92E)
        }
    }

    Method (SWAK, 1, NotSerialized)
    {
        Store (One, HECO)
        If (LEqual (Arg0, 0x03))
        {
            Store (One, RSTU)
        }

        Store (PEWS, PEWS)
        If (LLessEqual (P92T, 0x07))
        {
            Store (Zero, P92E)
        }

        If (LEqual (P92T, Zero))
        {
            Store (One, PI0E)
        }

        If (LEqual (P92T, One))
        {
            Store (One, PI1E)
        }

        If (LEqual (P92T, 0x02))
        {
            Store (One, PI2E)
        }

        If (LEqual (P92T, 0x03))
        {
            Store (One, PI3E)
        }

        If (LEqual (P92T, 0x04))
        {
            Store (One, PI4E)
        }

        If (LEqual (P92T, 0x05))
        {
            Store (One, PI5E)
        }

        If (LEqual (P92T, 0x06))
        {
            Store (One, PI6E)
        }

        If (LEqual (P92T, 0x07))
        {
            Store (One, PI7E)
        }
    }

    Method (TRMD, 1, NotSerialized)
    {
        Store (Arg0, SPRE)
        Store (Arg0, TPDE)
    }

    If (OCC0)
    {
        Scope (_GPE)
        {
            Method (_L13, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP0I, GM0P))
                {
                    Not (GM0P, GM0P)
                    U_OC (Zero, GM0P)
                }
            }
        }
    }

    If (OCC1)
    {
        Scope (_GPE)
        {
            Method (_L14, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP1I, GM1P))
                {
                    Not (GM1P, GM1P)
                    U_OC (One, GM1P)
                }
            }
        }
    }

    If (OCC2)
    {
        Scope (_GPE)
        {
            Method (_L15, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP2I, GM2P))
                {
                    Not (GM2P, GM2P)
                    U_OC (0x02, GM2P)
                }
            }
        }
    }

    If (OCC3)
    {
        Scope (_GPE)
        {
            Method (_L16, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP3I, GM3P))
                {
                    Not (GM3P, GM3P)
                    U_OC (0x03, GM3P)
                }
            }
        }
    }

    If (OCC4)
    {
        Scope (_GPE)
        {
            Method (_L19, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP4I, GM4P))
                {
                    Not (GM4P, GM4P)
                    U_OC (0x04, GM4P)
                }
            }
        }
    }

    If (OCC5)
    {
        Scope (_GPE)
        {
            Method (_L1A, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP5I, GM5P))
                {
                    Not (GM5P, GM5P)
                    U_OC (0x05, GM5P)
                }
            }
        }
    }

    If (OCC6)
    {
        Scope (_GPE)
        {
            Method (_L1C, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP6I, GM6P))
                {
                    Not (GV6P, GV6P)
                    U_OC (0x06, GV6P)
                }
            }
        }
    }

    If (OCC7)
    {
        Scope (_GPE)
        {
            Method (_L1D, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP7I, GM7P))
                {
                    Not (GV7P, GV7P)
                    U_OC (0x07, GV7P)
                }
            }
        }
    }

    If (OCC8)
    {
        Scope (_GPE)
        {
            Method (_L17, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP8I, GM8P))
                {
                    Not (GM8P, GM8P)
                    U_OC (0x08, GM8P)
                }
            }
        }
    }

    If (OCC9)
    {
        Scope (_GPE)
        {
            Method (_L0E, 0, NotSerialized)
            {
                C_OC ()
                If (LEqual (GP9I, Zero))
                {
                    U_OC (0x09, One)
                }
            }
        }
    }

    Name (DP80, 0x80)
    Name (DP90, 0x90)
    Name (UMRS, One)
    Name (APIC, One)
    Name (PMBS, 0x0800)
    Name (PMLN, 0xA0)
    Name (GPBS, Zero)
    Name (GPLN, Zero)
    Name (SMBB, 0x0B10)
    Name (SMBL, 0x10)
    Name (PCIB, 0xE0000000)
    Name (PCIL, 0x10000000)
    Name (HTTC, Zero)
    Name (CTID, 0x02)
    OperationRegion (BIOS, SystemMemory, 0x77FCE064, 0xFF)
    Field (BIOS, ByteAcc, NoLock, Preserve)
    {
        SS1,    1, 
        SS2,    1, 
        SS3,    1, 
        SS4,    1, 
                Offset (0x01), 
        IOST,   16, 
        TOPM,   32, 
        ROMS,   32, 
        MG1B,   32, 
        MG1L,   32, 
        MG2B,   32, 
        MG2L,   32, 
                Offset (0x1C), 
        DMAX,   8, 
        HPTA,   32, 
        CPB0,   32, 
        CPB1,   32, 
        CPB2,   32, 
        CPB3,   32, 
        ASSB,   8, 
        AOTB,   8, 
        AAXB,   32, 
        SMIF,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        MPEN,   8, 
        TPMF,   8
    }

    Method (RRIO, 4, NotSerialized)
    {
        Store ("RRIO", Debug)
    }

    Method (RDMA, 3, NotSerialized)
    {
        Store ("rDMA", Debug)
    }

    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)
    {
        If (Arg0)
        {
            Store (0xAA, DBG8)
            \_SB.IRQC ()
        }
        Else
        {
            Store (0xAC, DBG8)
        }

        Store (Arg0, PICM)
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR)
        }

        If (LEqual (PICM, Zero))
        {
            Store (0xAC, DBG8)
        }

        Store (One, OSVR)
        If (CondRefOf (_OSI, Local1))
        {
            If (_OSI ("Windows 2001"))
            {
                Store (Zero, OSVR)
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (0x04, OSVR)
            }
            Else
            {
                If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
                {
                    Store (0x02, OSVR)
                }

                If (MCTH (_OS, "Linux"))
                {
                    Store (0x03, OSVR)
                }
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (ShiftLeft (SS1, One), Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, DP80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, DP90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Scope (_PR)
    {
        Processor (P001, 0x01, 0x00000810, 0x06) {}
        Processor (P002, 0x02, 0x00000000, 0x00) {}
        Alias (P001, CPU1)
        Alias (P002, CPU2)
    }

    Scope (_SB)
    {
        Name (PR00, Package (0x21)
        {
            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR00, Package (0x21)
        {
            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0014FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0013FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0012FFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR01, Package (0x04)
        {
            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR01, Package (0x04)
        {
            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKD, 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKA, 
                Zero
            }
        })
        Name (AR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKB, 
                Zero
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (PR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LNKC, 
                Zero
            }
        })
        Name (AR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (PR0C, Package (0x01)
        {
            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKE, 
                Zero
            }
        })
        Name (AR0C, Package (0x01)
        {
            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x14
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Name (PRSF, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {9}
        })
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00180000)
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)
            Method (_PRT, 0, NotSerialized)
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Method (NPTS, 1, NotSerialized)
            {
            }

            Method (NWAK, 1, NotSerialized)
            {
            }

            Device (RS48)
            {
                Name (_ADR, Zero)
                OperationRegion (NB2, PCI_Config, Zero, 0x0100)
                Field (NB2, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x90), 
                    UMBS,   32, 
                            Offset (0x9B), 
                    UMSL,   8, 
                            Offset (0xE4), 
                    MCDA,   32, 
                    NCIN,   32
                }

                Device (UMAX)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x24)
                    Method (_STA, 0, NotSerialized)
                    {
                        Store (UMSL, Local0)
                        If (Local0)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y00)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (CRS, \_SB.PCI0.RS48.UMAX._Y00._BAS, BAS1)
                        CreateDWordField (CRS, \_SB.PCI0.RS48.UMAX._Y00._LEN, LEN1)
                        Store (UMBS, BAS1)
                        Store (ShiftLeft (UMSL, 0x18), LEN1)
                        Return (CRS)
                    }
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00050000)
                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, SWIT)
                    }

                    Name (_DOD, Package (0x04)
                    {
                        0x00010100, 
                        0x00010110, 
                        0x00010200, 
                        0x00010210
                    })
                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Name (_DCS, 0x1F)
                        Name (_DGS, Zero)
                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Name (_DCS, 0x1F)
                        Name (_DGS, One)
                        Method (_DSS, 1, NotSerialized)
                        {
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            If (_OSI ("Windows 2006"))
                            {
                                If (LEqual (Arg0, 0x14))
                                {
                                    Store (Zero, Local0)
                                }

                                If (LEqual (Arg0, 0x1E))
                                {
                                    Store (One, Local0)
                                }

                                If (LEqual (Arg0, 0x28))
                                {
                                    Store (0x02, Local0)
                                }

                                If (LEqual (Arg0, 0x32))
                                {
                                    Store (0x03, Local0)
                                }

                                If (LEqual (Arg0, 0x3C))
                                {
                                    Store (0x04, Local0)
                                }

                                If (LEqual (Arg0, 0x46))
                                {
                                    Store (0x05, Local0)
                                }

                                If (LEqual (Arg0, 0x50))
                                {
                                    Store (0x06, Local0)
                                }

                                If (LEqual (Arg0, 0x5A))
                                {
                                    Store (0x07, Local0)
                                }

                                If (LEqual (Arg0, 0x64))
                                {
                                    Store (0x08, Local0)
                                }

                                If (ECBF)
                                {
                                    Store (Local0, ^^^^SBRG.EC.GBQC)
                                }
                                Else
                                {
                                    Store (One, ECBF)
                                }
                            }
                        }

                        Name (PBCL, Package (0x0B)
                        {
                            0x50, 
                            0x14, 
                            0x14, 
                            0x1E, 
                            0x28, 
                            0x32, 
                            0x3C, 
                            0x46, 
                            0x50, 
                            0x5A, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)
                        {
                            If (_OSI ("Windows 2006"))
                            {
                                Return (PBCL)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            If (_OSI ("Windows 2006"))
                            {
                                Store (^^^^SBRG.EC.GBQC, Local0)
                                Multiply (Local0, 0x0A, Local1)
                                Add (Local1, 0x14, Local0)
                                Return (Local0)
                            }
                        }
                    }

                    Device (TV)
                    {
                        Name (_ADR, 0x0200)
                        Name (_DCS, 0x1F)
                        Name (_DGS, Zero)
                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (DFP2)
                    {
                        Name (_ADR, 0x0210)
                        Name (_DCS, 0x1F)
                        Name (_DGS, Zero)
                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Name (SWIT, Zero)
                    Name (GDCS, 0x02)
                    Name (GDGS, One)
                    Name (GDTS, Zero)
                    Name (GDFG, One)
                    Name (ECBF, One)
                }
            }

            Device (PCE2)
            {
                Name (_ADR, 0x00020000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }
            }

            Device (PCE3)
            {
                Name (_ADR, 0x00030000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR03)
                    }

                    Return (PR03)
                }
            }

            Device (PCE4)
            {
                Name (_ADR, 0x00040000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }
            }

            Device (PCE5)
            {
                Name (_ADR, 0x00050000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }
            }

            Device (PCE6)
            {
                Name (_ADR, 0x00060000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }

                Device (NEWC)
                {
                    Name (_ADR, Zero)
                    Scope (\_GPE)
                    {
                        Method (_L07, 0, NotSerialized)
                        {
                            If (GV7S)
                            {
                                Store (One, GM7P)
                                Store (Zero, GV7P)
                            }
                            Else
                            {
                                Store (One, GM7P)
                                Store (One, GV7P)
                            }

                            Sleep (0x64)
                            Notify (\_SB.PCI0, Zero)
                        }
                    }

                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (One)
                    }

                    Method (_INI, 0, NotSerialized)
                    {
                    }

                    OperationRegion (NESS, PCI_Config, 0x72, One)
                    Field (NESS, AnyAcc, NoLock, Preserve)
                    {
                            ,   5, 
                        SLST,   1, 
                            ,   1
                    }
                }
            }

            Device (IDEC)
            {
                Name (_ADR, 0x00140001)
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    0x0F, 
                    Zero
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    Zero
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    Zero
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, AnyAcc, NoLock, Preserve)
                {
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                            Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                            Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, One), Add (Local1, 
                        One))))
                }

                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, PIT1)
                    CreateByteField (Arg0, One, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        /* 0000 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0008 */    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        /* 0010 */    0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, Zero, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, One))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, One))
                    {
                        Or (FLAG, One, FLAG)
                        Store (DerefOf (Index (UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        Store (GETT (MDT0), DMA0)
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        Store (GETT (MDT1), DMA1)
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, Zero, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                        0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, Zero, PIT1)
                    CreateByteField (BUF, One, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (PIOT, MLE, PIO0, MTR, Zero, Zero), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (PIOT, MLE, PIO1, MTR, Zero, Zero), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (PITR, Local0)), PIT0)
                    Store (DerefOf (Index (PITR, Local1)), PIT1)
                    If (And (FLAG, One))
                    {
                        Store (Match (UDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, One, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, Ones))
                        {
                            Store (Match (MDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (UDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, Ones))
                        {
                            Store (Match (MDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, Zero, MDT1)
                    CreateByteField (Arg1, One, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, One, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x0E)
                    {
                        /* 0000 */    0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03, 
                        /* 0008 */    0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF
                    })
                    CreateByteField (BUF, One, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        Store (Match (MDMT, MLE, GETT (Local1), MTR, Zero, Zero), Local4)
                        If (LLess (Local4, 0x03))
                        {
                            Or (0x20, Local4, DMOD)
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (PPIT, VPIT)
                        Store (PMDT, VMDT)
                        Store (PPIC, VPIC)
                        Store (PUDC, VUDC)
                        Store (PUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, PPIT)
                        Store (VMDT, PMDT)
                        Store (VPIM, PPIM)
                        Store (VUDC, PUDC)
                        Store (VUDM, PUDM)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (PMDT, VMDT)
                            Store (PPIM, VPIM)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (PMDT, VMDT)
                            Store (PPIM, VPIM)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (SPIT, VPIT)
                        Store (SMDT, VMDT)
                        Store (SPIC, VPIC)
                        Store (SUDC, VUDC)
                        Store (SUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, SPIT)
                        Store (VMDT, SMDT)
                        Store (VPIM, SPIM)
                        Store (VUDC, SUDC)
                        Store (VUDM, SUDM)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (SMDT, VMDT)
                            Store (SPIM, VPIM)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (SMDT, VMDT)
                            Store (SPIM, VPIM)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                        }
                    }
                }

                Method (RATA, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, CMDN)
                    Multiply (CMDN, 0x38, Local0)
                    CreateField (Arg0, 0x08, Local0, RETB)
                    Store (RETB, Debug)
                    Return (RETB)
                }
            }

            Device (SBAZ)
            {
                Name (_ADR, 0x00140002)
                OperationRegion (PCI, PCI_Config, Zero, 0x0100)
                Field (PCI, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x42), 
                    DNSP,   1, 
                    DNSO,   1, 
                    ENSR,   1
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x1B, 0x04))
                }
            }

            Device (SBRG)
            {
                Name (_ADR, 0x00140003)
                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (DMAD)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RTC0)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CID, 0x0B03D041)
                    Method (_STA, 0, NotSerialized)
                    {
                        ShiftLeft (One, 0x0A, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03"))
                    Name (_CID, 0x130FD041)
                    Method (_STA, 0, NotSerialized)
                    {
                        ShiftLeft (One, 0x0C, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
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
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y01)
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (HPBS)
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (CRS, \_SB.PCI0.SBRG.HPET._Y01._BAS, HPT)
                        Store (HPBS, HPT)
                        Return (CRS)
                    }
                }

                Device (^PCIE)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x11)
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            _Y02)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (CRS, \_SB.PCI0.PCIE._Y02._BAS, BAS1)
                        CreateDWordField (CRS, \_SB.PCI0.PCIE._Y02._LEN, LEN1)
                        Store (PCIB, BAS1)
                        Store (PCIL, LEN1)
                        Return (CRS)
                    }
                }

                Device (OMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, Zero)
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y03)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y04)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (APIC)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.OMSC._Y03._LEN, ML01)
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.OMSC._Y03._BAS, MB01)
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.OMSC._Y04._LEN, ML02)
                            CreateDWordField (CRS, \_SB.PCI0.SBRG.OMSC._Y04._BAS, MB02)
                            Store (0xFEC00000, MB01)
                            Store (0x1000, ML01)
                            Store (0xFEE00000, MB02)
                            Store (0x1000, ML02)
                        }

                        Return (CRS)
                    }
                }

                Device (^^RMEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (_UID, One)
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x000A0000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y05)
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            _Y06)
                        Memory32Fixed (ReadWrite,
                            0x00100000,         // Address Base
                            0x00000000,         // Address Length
                            _Y07)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y08)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (CRS, \_SB.RMEM._Y05._BAS, BAS1)
                        CreateDWordField (CRS, \_SB.RMEM._Y05._LEN, LEN1)
                        CreateDWordField (CRS, \_SB.RMEM._Y06._BAS, BAS2)
                        CreateDWordField (CRS, \_SB.RMEM._Y06._LEN, LEN2)
                        CreateDWordField (CRS, \_SB.RMEM._Y07._LEN, LEN3)
                        CreateDWordField (CRS, \_SB.RMEM._Y08._BAS, BAS4)
                        CreateDWordField (CRS, \_SB.RMEM._Y08._LEN, LEN4)
                        If (OSFL ()) {}
                        Else
                        {
                            If (MG1B)
                            {
                                If (LGreater (MG1B, 0x000C0000))
                                {
                                    Store (0x000C0000, BAS1)
                                    Subtract (MG1B, BAS1, LEN1)
                                }
                            }
                            Else
                            {
                                Store (0x000C0000, BAS1)
                                Store (0x00020000, LEN1)
                            }

                            If (Add (MG1B, MG1L, Local0))
                            {
                                Store (Local0, BAS2)
                                Subtract (0x00100000, BAS2, LEN2)
                            }
                        }

                        Subtract (MG2B, 0x00100000, LEN3)
                        Add (MG2B, MG2L, BAS4)
                        Subtract (Zero, BAS4, LEN4)
                        Return (CRS)
                    }
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x10)
                    Name (CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x1C,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x00,               // Alignment
                            0x09,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00B1,             // Range Minimum
                            0x00B1,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C52,             // Range Minimum
                            0x0C52,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD2,             // Range Minimum
                            0x0CD2,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x00,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y09)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0A)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y0B)
                        IO (Decode16,
                            0x0900,             // Range Minimum
                            0x0900,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0910,             // Range Minimum
                            0x0910,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x00,               // Alignment
                            0xFF,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFB80000,         // Address Base
                            0x00080000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0C)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y09._MIN, GP00)
                        CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y09._MAX, GP01)
                        CreateByteField (CRS, \_SB.PCI0.SBRG.RMSC._Y09._LEN, GP0L)
                        Store (PMBS, GP00)
                        Store (PMBS, GP01)
                        Store (PMLN, GP0L)
                        If (SMBB)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y0A._MIN, GP10)
                            CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y0A._MAX, GP11)
                            CreateByteField (CRS, \_SB.PCI0.SBRG.RMSC._Y0A._LEN, GP1L)
                            Store (SMBB, GP10)
                            Store (SMBB, GP11)
                            Store (SMBL, GP1L)
                        }

                        If (GPBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y0B._MIN, GP20)
                            CreateWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y0B._MAX, GP21)
                            CreateByteField (CRS, \_SB.PCI0.SBRG.RMSC._Y0B._LEN, GP2L)
                            Store (GPBS, GP20)
                            Store (GPBS, GP21)
                            Store (GPLN, GP2L)
                        }

                        CreateDWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y0C._BAS, ROMB)
                        CreateDWordField (CRS, \_SB.PCI0.SBRG.RMSC._Y0C._LEN, ROML)
                        Store (ROMS, ROMB)
                        Subtract (Zero, ROMS, ROML)
                        Return (CRS)
                    }
                }

                Scope (\_TZ)
                {
                    Method (KELV, 1, NotSerialized)
                    {
                        And (Arg0, 0xFF, Local0)
                        Multiply (Local0, 0x0A, Local0)
                        Add (Local0, 0x0AAC, Local0)
                        Return (Local0)
                    }

                    ThermalZone (THRM)
                    {
                        Method (_TMP, 0, NotSerialized)
                        {
                            If (\_SB.PCI0.SBRG.EC.MYEC)
                            {
                                If (\_SB.PCI0.SBRG.EC.CTSD)
                                {
                                    Store (Zero, \_SB.PCI0.SBRG.EC.CTSD)
                                    Return (KELV (0x6E))
                                }
                                Else
                                {
                                    Store (\_SB.PCI0.SBRG.EC.CPUT, Local0)
                                    Add (Local0, 0x02, Local0)
                                    Return (KELV (Local0))
                                }
                            }
                            Else
                            {
                                Return (KELV (0x2D))
                            }
                        }

                        Method (_CRT, 0, NotSerialized)
                        {
                            Return (KELV (0x64))
                        }
                    }
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x06)
                    Name (MYEC, One)
                    Name (CTSD, Zero)
                    Name (PCOU, Zero)
                    Name (THRF, Zero)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, MYEC)
                        }

                        Store (Zero, CTSD)
                    }

                    OperationRegion (IO, SystemIO, 0x62, 0x05)
                    Field (IO, ByteAcc, Lock, Preserve)
                    {
                        DAT1,   8, 
                                Offset (0x04), 
                        CMD1,   8
                    }

                    Field (IO, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x04), 
                        OUTS,   1, 
                        INPS,   1
                    }

                    Method (IRDY, 0, Serialized)
                    {
                        Return (LNot (INPS))
                    }

                    Method (ORDY, 0, Serialized)
                    {
                        Return (OUTS)
                    }

                    Name (_CRS, ResourceTemplate ()
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
                    OperationRegion (EC, EmbeddedControl, Zero, 0xFF)
                    Field (EC, ByteAcc, NoLock, Preserve)
                    {
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   264, 
                        SMAA,   8, 
                                Offset (0x30), 
                        POWS,   1, 
                        LIDS,   1, 
                        KBCS,   1, 
                                Offset (0x31), 
                        MBTS,   1, 
                        MBCS,   1, 
                        MBDS,   1, 
                        MBFS,   1, 
                        MBWS,   1, 
                        MBLS,   1, 
                        MBCL,   1, 
                        MBFL,   1, 
                                Offset (0x38), 
                        MDCL,   8, 
                        MDCH,   8, 
                        MDVL,   8, 
                        MDVH,   8, 
                        MCAL,   8, 
                        MCAH,   8, 
                        MSTL,   8, 
                        MSTH,   8, 
                        MCCL,   8, 
                        MCCH,   8, 
                        MPOL,   8, 
                        MPOH,   8, 
                        MFCL,   8, 
                        MFCH,   8, 
                        MCUL,   8, 
                        MCUH,   8, 
                        MRCL,   8, 
                        MRCH,   8, 
                        MVOL,   8, 
                        MVOH,   8, 
                        MTEL,   8, 
                        MTEH,   8, 
                        RSV1,   8, 
                        RSV2,   8, 
                        SDCL,   8, 
                        SDCH,   8, 
                        SDVL,   8, 
                        SDVH,   8, 
                        SCAL,   8, 
                        SCAH,   8, 
                        SSTL,   8, 
                        SSTH,   8, 
                        SCCL,   8, 
                        SCCH,   8, 
                        SPOL,   8, 
                        SPOH,   8, 
                        SFCL,   8, 
                        SFCH,   8, 
                        SCUL,   8, 
                        SCUH,   8, 
                        SRCL,   8, 
                        SRCH,   8, 
                        SVOL,   8, 
                        SVOH,   8, 
                        STEL,   8, 
                        STEH,   8, 
                                Offset (0x68), 
                        CPUT,   8, 
                                Offset (0x70), 
                        SWCT,   8, 
                                Offset (0x7E), 
                            ,   3, 
                        THFG,   1, 
                            ,   1, 
                        CH77,   1, 
                            ,   3, 
                                Offset (0x80), 
                        SYST,   8, 
                                Offset (0xF1), 
                        GBQC,   8
                    }

                    OperationRegion (APMP, SystemIO, 0xB0, 0x02)
                    Field (APMP, ByteAcc, NoLock, Preserve)
                    {
                        APMC,   8, 
                        APMS,   8
                    }

                    Device (ADP1)
                    {
                        Name (_HID, "ACPI0003")
                        Name (BFLG, One)
                        Name (ACP, One)
                        Method (_PSR, 0, NotSerialized)
                        {
                            If (POWS)
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (_PCL, Package (0x01)
                        {
                            _SB
                        })
                    }

                    Name (BIF0, Package (0x0D)
                    {
                        One, 
                        0x1130, 
                        0x1130, 
                        One, 
                        0x39D0, 
                        Zero, 
                        Zero, 
                        One, 
                        One, 
                        "MS-171B", 
                        "1", 
                        "LION", 
                        "MSI Corp."
                    })
                    Name (STAT, Package (0x04)
                    {
                        0x02, 
                        0x0500, 
                        0x0800, 
                        0x03E8
                    })
                    Device (BAT1)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))
                        Name (_UID, One)
                        Name (_PCL, Package (0x01)
                        {
                            _SB
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (MYEC)
                            {
                                If (MBTS)
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
                            If (MYEC)
                            {
                                UPBI ()
                            }
                            Else
                            {
                                IVBI ()
                                Store (0x99, DBG8)
                                Sleep (0x03E8)
                            }

                            Return (BIF0)
                        }

                        Method (_BST, 0, NotSerialized)
                        {
                            If (MYEC)
                            {
                                UPBS ()
                            }
                            Else
                            {
                                IVBS ()
                            }

                            Return (STAT)
                        }

                        Method (IVBI, 0, NotSerialized)
                        {
                            Store (Ones, Index (BIF0, One))
                            Store (Ones, Index (BIF0, 0x02))
                            Store (Ones, Index (BIF0, 0x04))
                            Store ("Wrong", Index (BIF0, 0x09))
                            Store (" ", Index (BIF0, 0x0A))
                            Store ("Wrong", Index (BIF0, 0x0B))
                            Store ("Wrong", Index (BIF0, 0x0C))
                        }

                        Method (IVBS, 0, NotSerialized)
                        {
                            Store (Zero, Index (STAT, Zero))
                            Store (Ones, Index (STAT, One))
                            Store (Ones, Index (STAT, 0x02))
                            Store (0x2710, Index (STAT, 0x03))
                        }

                        Method (UPBI, 0, NotSerialized)
                        {
                            Store (Zero, Local0)
                            Store (Zero, Local1)
                            Store (Zero, Local2)
                            Store (Zero, Local3)
                            Store (MDCH, Local0)
                            Store (MDCL, Local1)
                            ShiftLeft (Local0, 0x08, Local0)
                            Or (Local0, Local1, Local0)
                            Store (Local0, Index (BIF0, One))
                            Store (MFCH, Local0)
                            Store (MFCL, Local1)
                            ShiftLeft (Local0, 0x08, Local0)
                            Or (Local0, Local1, Local1)
                            Store (Local1, Index (BIF0, 0x02))
                            Store (MDVH, Local0)
                            Store (MDVL, Local2)
                            ShiftLeft (Local0, 0x08, Local0)
                            Or (Local0, Local2, Local2)
                            Store (Local2, Index (BIF0, 0x04))
                            Store (CTID, Local0)
                            If (LEqual (Local0, 0x03))
                            {
                                Store (" MS-171BTL70\n", Index (BIF0, 0x0A))
                            }
                            Else
                            {
                                Store ("\n", Index (BIF0, 0x0A))
                            }

                            Store ("LION\n", Index (BIF0, 0x0B))
                            Store (CTID, Local0)
                            If (LEqual (Local0, Zero))
                            {
                                Store ("MS-171B\n", Index (BIF0, 0x09))
                                Store ("MSI Corp.\n", Index (BIF0, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    Store ("TL70\n", Index (BIF0, 0x09))
                                    Store ("MS-171B\n", Index (BIF0, 0x0C))
                                }
                                Else
                                {
                                    Store ("MS-171B\n", Index (BIF0, 0x09))
                                    Store ("MSI Corp.\n", Index (BIF0, 0x0C))
                                }
                            }
                        }

                        Method (UPBS, 0, NotSerialized)
                        {
                            Store (Zero, Local0)
                            Store (Zero, Local1)
                            Store (Zero, Local2)
                            Store (Zero, Local3)
                            Store (Zero, Local4)
                            Store (Zero, Local7)
                            Store (MBTS, Local0)
                            If (LEqual (Local0, One))
                            {
                                Store (POWS, Local0)
                                If (LEqual (Local0, One))
                                {
                                    Store (MBCS, Local1)
                                    If (LEqual (Local1, One))
                                    {
                                        Or (Local4, 0x02, Local4)
                                    }
                                }
                                Else
                                {
                                    Or (Local4, One, Local4)
                                    Store (MBLS, Local0)
                                    If (LEqual (Local0, One))
                                    {
                                        Or (Local4, 0x04, Local4)
                                    }
                                }

                                Store (POWS, Local0)
                                If (LEqual (Local0, One))
                                {
                                    Store (MBCS, Local0)
                                    If (LEqual (Local0, One))
                                    {
                                        Store (MCUH, Local0)
                                        Store (MCUL, Local1)
                                        ShiftLeft (Local0, 0x08, Local0)
                                        Or (Local0, Local1, Local1)
                                        If (LEqual (Local1, 0xFFFF))
                                        {
                                            Store (Ones, Local1)
                                        }

                                        Store (Local1, Index (STAT, One))
                                    }
                                    Else
                                    {
                                        Store (Zero, Index (STAT, One))
                                    }
                                }
                                Else
                                {
                                    Store (MCUH, Local0)
                                    Store (MCUL, Local1)
                                    ShiftLeft (Local0, 0x08, Local0)
                                    Or (Local0, Local1, Local1)
                                    XOr (Local1, 0xFFFF, Local1)
                                    If (LEqual (Local1, Zero))
                                    {
                                        Store (Ones, Local1)
                                    }

                                    Store (Local1, Index (STAT, One))
                                }

                                Store (MRCH, Local0)
                                Store (MRCL, Local2)
                                ShiftLeft (Local0, 0x08, Local0)
                                Or (Local0, Local2, Local2)
                                Store (Local2, Index (STAT, 0x02))
                                Store (MVOH, Local0)
                                Store (MVOL, Local3)
                                ShiftLeft (Local0, 0x08, Local0)
                                Or (Local0, Local3, Local3)
                                Store (Local3, Index (STAT, 0x03))
                                Store (Local4, Index (STAT, Zero))
                                Sleep (0x64)
                            }
                            Else
                            {
                                IVBS ()
                            }
                        }
                    }

                    Method (MPPC, 0, NotSerialized)
                    {
                        Store (THRF, Local0)
                        If (LEqual (Local0, One))
                        {
                            Return (Subtract (PCOU, One))
                        }
                        Else
                        {
                            Store (POWS, Local0)
                            If (LEqual (Local0, One))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Store (MDCH, Local0)
                                Store (MDCL, Local1)
                                ShiftLeft (Local0, 0x08, Local0)
                                Or (Local0, Local1, Local0)
                                If (LGreater (Local0, 0x0960))
                                {
                                    Return (Zero)
                                }
                                Else
                                {
                                    Return (Subtract (PCOU, One))
                                }
                            }
                        }
                    }

                    Device (LID0)
                    {
                        Name (_HID, EisaId ("PNP0C0D"))
                        Method (_LID, 0, NotSerialized)
                        {
                            If (MYEC)
                            {
                                Store (LIDS, Local0)
                            }
                            Else
                            {
                                Store (One, Local0)
                            }

                            Return (Local0)
                        }
                    }

                    Method (_Q77, 0, NotSerialized)
                    {
                        Store (0x77, DBG8)
                        Store (One, CH77)
                        Store (Zero, ^ADP1.BFLG)
                        Notify (BAT1, 0x81)
                        Notify (ADP1, 0x80)
                        Sleep (0x64)
                        Store (Zero, Local0)
                        Store (MBTS, Local0)
                        If (LEqual (Local0, One))
                        {
                            Store (One, ^ADP1.BFLG)
                            Notify (BAT1, 0x80)
                        }
                        Else
                        {
                            Store (Zero, ^ADP1.BFLG)
                            Notify (BAT1, 0x81)
                        }

                        Notify (ADP1, 0x80)
                    }

                    Method (_Q80, 0, NotSerialized)
                    {
                        Store (0x80, DBG8)
                    }

                    Method (_Q81, 0, NotSerialized)
                    {
                        Store (0x81, DBG8)
                        Store (One, THFG)
                        Store (One, THRF)
                        Notify (\_PR.P001, 0x80)
                        Notify (\_PR.P002, 0x80)
                    }

                    Method (_Q82, 0, NotSerialized)
                    {
                        Store (0x82, DBG8)
                        Store (One, THFG)
                        Store (Zero, THRF)
                        Notify (\_PR.P001, 0x80)
                        Notify (\_PR.P002, 0x80)
                    }

                    Method (_Q83, 0, NotSerialized)
                    {
                        Store (0x83, DBG8)
                        Store (Zero, Local0)
                        Store (POWS, Local0)
                        If (LEqual (Local0, One))
                        {
                            Store (One, ^ADP1.ACP)
                        }
                        Else
                        {
                            Store (Zero, ^ADP1.ACP)
                        }

                        Notify (ADP1, 0x80)
                        Notify (\_PR.P001, 0x80)
                        Notify (\_PR.P002, 0x80)
                    }

                    Method (_Q84, 0, NotSerialized)
                    {
                        Store (0x84, DBG8)
                        Notify (LID0, 0x80)
                    }

                    Method (_Q85, 0, NotSerialized)
                    {
                        Store (0x85, DBG8)
                        Store (One, CTSD)
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Method (_Q86, 0, NotSerialized)
                    {
                        Store (0x86, DBG8)
                    }

                    Method (_Q87, 0, NotSerialized)
                    {
                        Store (0x87, DBG8)
                        Store (Zero, Local0)
                        Store (MBTS, Local0)
                        If (LEqual (Local0, One))
                        {
                            Store (One, ^ADP1.BFLG)
                            Notify (BAT1, 0x80)
                        }
                        Else
                        {
                            Store (Zero, ^ADP1.BFLG)
                            Notify (ADP1, 0x80)
                            Sleep (0x19)
                            Notify (BAT1, 0x81)
                        }

                        Notify (ADP1, 0x80)
                    }

                    Method (_Q88, 0, NotSerialized)
                    {
                        Store (0x88, DBG8)
                    }

                    Method (_Q89, 0, NotSerialized)
                    {
                        Store (0x89, DBG8)
                    }

                    Method (_Q8A, 0, NotSerialized)
                    {
                        Store (0x8A, DBG8)
                        Store (One, CTSD)
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Method (_Q8B, 0, NotSerialized)
                    {
                        Store (0x8B, DBG8)
                    }

                    Method (_Q8C, 0, NotSerialized)
                    {
                        Store (0x8C, DBG8)
                    }

                    Method (_Q90, 0, NotSerialized)
                    {
                        Store (0x90, DBG8)
                    }

                    Method (_QB4, 0, NotSerialized)
                    {
                        Name (LCCR, Package (0x04)
                        {
                            0x02, 
                            0x03, 
                            One, 
                            0x02
                        })
                        Name (LCTV, Package (0x07)
                        {
                            0x02, 
                            0x02, 
                            0x04, 
                            0x02, 
                            0x06, 
                            0x02, 
                            0x02
                        })
                        Name (LRTV, Package (0x09)
                        {
                            0x02, 
                            0x04, 
                            One, 
                            0x06, 
                            0x03, 
                            0x02, 
                            0x05, 
                            0x02, 
                            0x02
                        })
                        Name (LCHD, Package (0x0B)
                        {
                            0x02, 
                            0x02, 
                            0x08, 
                            0x02, 
                            0x02, 
                            0x02, 
                            0x02, 
                            0x02, 
                            0x0A, 
                            0x02, 
                            0x02
                        })
                        Name (LHTV, Package (0x10)
                        {
                            0x02, 
                            0x02, 
                            0x08, 
                            0x02, 
                            0x0A, 
                            0x02, 
                            0x0C, 
                            0x02, 
                            0x04, 
                            0x02, 
                            0x06, 
                            0x02, 
                            0x02, 
                            0x02, 
                            0x02, 
                            0x02
                        })
                        Name (LCRH, Package (0x0E)
                        {
                            0x02, 
                            0x08, 
                            One, 
                            0x0A, 
                            0x02, 
                            0x02, 
                            0x02, 
                            0x02, 
                            0x03, 
                            0x02, 
                            0x09, 
                            0x02, 
                            0x02, 
                            0x02
                        })
                        Name (LRHV, Package (0x12)
                        {
                            0x02, 
                            0x08, 
                            One, 
                            0x0A, 
                            0x03, 
                            0x0C, 
                            0x09, 
                            0x0E, 
                            0x04, 
                            0x05, 
                            0x06, 
                            0x07, 
                            0x02, 
                            0x0F, 
                            0x0D, 
                            0x02, 
                            0x02, 
                            0x02
                        })
                        Store (0xB4, APMC)
                        Store (APMS, Local0)
                        Store (Local0, DBG8)
                        Store (ShiftRight (Local0, 0x04), Local1)
                        If (LEqual (Local1, 0x03))
                        {
                            And (Local0, 0x03, Local0)
                            Store (DerefOf (Index (LCCR, Local0)), Local1)
                        }
                        Else
                        {
                            If (LEqual (Local1, 0x06))
                            {
                                And (Local0, 0x06, Local0)
                                Store (DerefOf (Index (LCTV, Local0)), Local1)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x07))
                                {
                                    And (Local0, 0x07, Local0)
                                    Store (DerefOf (Index (LRTV, Local0)), Local1)
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x0A))
                                    {
                                        And (Local0, 0x0A, Local0)
                                        Store (DerefOf (Index (LCHD, Local0)), Local1)
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x0B))
                                        {
                                            And (Local0, 0x0B, Local0)
                                            Store (DerefOf (Index (LCRH, Local0)), Local1)
                                        }
                                        Else
                                        {
                                            If (LEqual (Local1, 0x0E))
                                            {
                                                And (Local0, 0x0E, Local0)
                                                Store (DerefOf (Index (LHTV, Local0)), Local1)
                                            }
                                            Else
                                            {
                                                If (LEqual (Local1, 0x0F))
                                                {
                                                    And (Local0, 0x0F, Local0)
                                                    Store (DerefOf (Index (LRHV, Local0)), Local1)
                                                }
                                                Else
                                                {
                                                    Store (0x02, Local1)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Store (And (Local1, One), Local0)
                        Store (Local0, ^^^P0P1.VGA.CRT._DGS)
                        Store (ShiftRight (Local1, One), Local1)
                        Store (And (Local1, One), Local0)
                        Store (Local0, ^^^P0P1.VGA.LCD._DGS)
                        Store (ShiftRight (Local1, One), Local1)
                        Store (And (Local1, One), Local0)
                        Store (Local0, ^^^P0P1.VGA.TV._DGS)
                        Store (ShiftRight (Local1, One), Local1)
                        Store (And (Local1, One), Local0)
                        Store (Local0, ^^^P0P1.VGA.DFP2._DGS)
                        Notify (^^^P0P1.VGA, 0x80)
                    }

                    Method (_QB5, 0, NotSerialized)
                    {
                        Store (0xB5, DBG8)
                    }

                    Method (_QB6, 0, NotSerialized)
                    {
                        Store (0xB6, DBG8)
                    }

                    Method (_QB7, 0, NotSerialized)
                    {
                        Store (0xB7, DBG8)
                        If (_OSI ("Windows 2006"))
                        {
                            Store (Zero, ^^^P0P1.VGA.ECBF)
                            Notify (^^^P0P1.VGA.LCD, 0x87)
                        }
                    }

                    Method (_QB8, 0, NotSerialized)
                    {
                        Store (0xB8, DBG8)
                        If (_OSI ("Windows 2006"))
                        {
                            Store (Zero, ^^^P0P1.VGA.ECBF)
                            Notify (^^^P0P1.VGA.LCD, 0x86)
                        }
                    }

                    Method (_QB9, 0, NotSerialized)
                    {
                        Store (0xB9, DBG8)
                    }
                }
            }

            Device (P0PC)
            {
                Name (_ADR, 0x00140004)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x04, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR0C)
                    }

                    Return (PR0C)
                }
            }

            Device (AC97)
            {
                Name (_ADR, 0x00140005)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0C, 0x04))
                }
            }

            Device (MC97)
            {
                Name (_ADR, 0x00140006)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0C, 0x04))
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x00130000)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x00130001)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (USB3)
            {
                Name (_ADR, 0x00130002)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (USB4)
            {
                Name (_ADR, 0x00130003)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (USB5)
            {
                Name (_ADR, 0x00130004)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (EUSB)
            {
                Name (_ADR, 0x00130005)
                Method (_S3D, 0, NotSerialized)
                {
                    If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x0B, 0x04))
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x00120000)
                Method (_INI, 0, NotSerialized)
                {
                    \_GPE._L1F ()
                }

                Name (SPTM, Buffer (0x14)
                {
                    /* 0000 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x1F, 0x00, 0x00, 0x00
                })
                Device (PRID)
                {
                    Name (_ADR, Zero)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                    }

                    Name (PRIS, Zero)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (OSFL (), 0x04))
                        {
                            Store (0x32, Local0)
                            While (LAnd (LEqual (PMBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }
                        }
                        Else
                        {
                            If (_OSI ("Windows 2006"))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (PMBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Store (Zero, PRIS)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, PRIS)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (PRIS)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (Not (LEqual (PMS1, Zero)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0x32, Local0)
                            While (LAnd (LEqual (PMBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }

                            Store (Zero, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            Return (S12P)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (Not (LEqual (PSS1, Zero)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0x32, Local0)
                            While (LAnd (LEqual (PSBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }

                            Store (Zero, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            Return (S12P)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                    }

                    Name (SECS, Zero)
                    Method (_PS0, 0, NotSerialized)
                    {
                        If (LEqual (OSFL (), 0x04))
                        {
                            Store (0x32, Local0)
                            While (LAnd (LEqual (SMBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }
                        }
                        Else
                        {
                            If (_OSI ("Windows 2006"))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (SMBY, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Store (Zero, SECS)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, SECS)
                    }

                    Method (_PSC, 0, NotSerialized)
                    {
                        Return (SECS)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (Not (LEqual (SMS1, Zero)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0x32, Local0)
                            While (LAnd (LEqual (SMBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }

                            Store (Zero, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            Return (S12P)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)
                        Method (_STA, 0, NotSerialized)
                        {
                            If (Not (LEqual (SSS1, Zero)))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (0x32, Local0)
                            While (LAnd (LEqual (SSBY, One), Local0))
                            {
                                Sleep (0xFA)
                                Decrement (Local0)
                            }

                            Store (Zero, S12P)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (0x03, S12P)
                        }

                        Method (_PSC, 0, NotSerialized)
                        {
                            Return (S12P)
                        }
                    }
                }

                Scope (\_GPE)
                {
                    Method (_L1F, 0, NotSerialized)
                    {
                        If (PRC0)
                        {
                            If (Not (LEqual (PMS1, Zero)))
                            {
                                Sleep (0x1E)
                            }

                            Notify (\_SB.PCI0.SATA.PRID.P_D0, One)
                            Store (One, PRC0)
                        }

                        If (PRC1)
                        {
                            If (Not (LEqual (SMS1, Zero)))
                            {
                                Sleep (0x1E)
                            }

                            Notify (\_SB.PCI0.SATA.SECD.S_D0, One)
                            Store (One, PRC1)
                        }

                        If (PRC2)
                        {
                            If (Not (LEqual (PSS1, Zero)))
                            {
                                Sleep (0x1E)
                            }

                            Notify (\_SB.PCI0.SATA.PRID.P_D1, One)
                            Store (One, PRC2)
                        }

                        If (PRC3)
                        {
                            If (Not (LEqual (SSS1, Zero)))
                            {
                                Sleep (0x1E)
                            }

                            Notify (\_SB.PCI0.SATA.SECD.S_D1, One)
                            Store (One, PRC3)
                        }
                    }
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (SMBS, PCI_Config, Zero, 0x0100)
                Field (SMBS, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x08), 
                    REV,    8
                }
            }

            Device (PCE7)
            {
                Name (_ADR, 0x00070000)
                Method (_PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x10, 0x04))
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR07)
                    }

                    Return (PR07)
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L18, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.PCE2, 0x02)
                Notify (\_SB.PCI0.PCE3, 0x02)
                Notify (\_SB.PCI0.PCE4, 0x02)
                Notify (\_SB.PCI0.PCE5, 0x02)
                Notify (\_SB.PCI0.PCE6, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L1B, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.SBAZ, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L04, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.P0PC, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0C, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.AC97, 0x02)
                Notify (\_SB.PCI0.MC97, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0B, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.USB1, 0x02)
                Notify (\_SB.PCI0.USB2, 0x02)
                Notify (\_SB.PCI0.USB3, 0x02)
                Notify (\_SB.PCI0.USB4, 0x02)
                Notify (\_SB.PCI0.USB5, 0x02)
                Notify (\_SB.PCI0.EUSB, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L10, 0, NotSerialized)
            {
                Notify (\_SB.PCI0.PCE7, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Name (_UID, 0xAA)
            Name (_STA, 0x0B)
        }
    }

    Scope (_SB)
    {
        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRS,   8, 
                    Offset (0x09), 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8
        }

        Method (IRQC, 0, NotSerialized)
        {
            Store (Zero, PIRA)
            Store (Zero, PIRB)
            Store (Zero, PIRC)
            Store (Zero, PIRD)
            Store (Zero, PIRE)
            Store (Zero, PIRF)
            Store (Zero, PIRG)
            Store (Zero, PIRH)
        }

        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Name (IPRA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRB, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRD, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, One)
            Method (_STA, 0, NotSerialized)
            {
                If (PIRA)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSA)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, PIRA)
            }

            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRA, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRA)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x02)
            Method (_STA, 0, NotSerialized)
            {
                If (PIRB)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSB)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, PIRB)
            }

            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRB, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRB)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x03)
            Method (_STA, 0, NotSerialized)
            {
                If (PIRC)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSC)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, PIRC)
            }

            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRC, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRC)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x04)
            Method (_STA, 0, NotSerialized)
            {
                If (PIRD)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSD)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, PIRD)
            }

            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRD, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRD)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x05)
            Method (_STA, 0, NotSerialized)
            {
                If (PIRE)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSE)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, PIRE)
            }

            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRE, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (PIRE, Local0)
                Decrement (Local0)
                Store (Local0, PIRE)
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x02)
            Method (_STA, 0, NotSerialized)
            {
                If (PIRF)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSF)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, PIRF)
            }

            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRF, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x03)
            Method (_STA, 0, NotSerialized)
            {
                If (PIRG)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSG)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, PIRG)
            }

            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRG, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x04)
            Method (_STA, 0, NotSerialized)
            {
                If (PIRH)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)
            {
                Return (PRSH)
            }

            Method (_DIS, 0, NotSerialized)
            {
                Store (Zero, PIRH)
            }

            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRH, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }
    }

    Scope (_SB)
    {
        Name (XCPD, Zero)
        Name (XNPT, One)
        Name (XCAP, 0x02)
        Name (XDCP, 0x04)
        Name (XDCT, 0x08)
        Name (XDST, 0x0A)
        Name (XLCP, 0x0C)
        Name (XLCT, 0x10)
        Name (XLST, 0x12)
        Name (XSCP, 0x14)
        Name (XSCT, 0x18)
        Name (XSST, 0x1A)
        Name (XRCT, 0x1C)
        Mutex (MUTE, 0x00)
        Method (RBPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (RWPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            And (Arg0, 0xFFFFFFFE, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (RDPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (WBPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0x0FFF)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (WWPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            And (Arg0, 0xFFFFFFFE, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (WDPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (RWDP, 3, NotSerialized)
        {
            Acquire (MUTE, 0x03E8)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            And (XCFG, Arg2, Local1)
            Or (Local1, Arg1, XCFG)
            Release (MUTE)
        }

        Method (RPME, 1, NotSerialized)
        {
            Add (Arg0, 0x84, Local0)
            Store (RDPE (Local0), Local1)
            If (LEqual (Local1, Ones))
            {
                Return (Zero)
            }
            Else
            {
                If (LAnd (Local1, 0x00010000))
                {
                    WDPE (Local0, And (Local1, 0x00010000))
                    Return (One)
                }

                Return (Zero)
            }
        }
    }

    Method (NPTS, 1, NotSerialized)
    {
    }

    Method (NWAK, 1, NotSerialized)
    {
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Name (CRS, ResourceTemplate ()
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
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0E, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (CRS, \_SB.PCI0._Y0D._MIN, MIN5)
            CreateDWordField (CRS, \_SB.PCI0._Y0D._MAX, MAX5)
            CreateDWordField (CRS, \_SB.PCI0._Y0D._LEN, LEN5)
            CreateDWordField (CRS, \_SB.PCI0._Y0E._MIN, MIN6)
            CreateDWordField (CRS, \_SB.PCI0._Y0E._MAX, MAX6)
            CreateDWordField (CRS, \_SB.PCI0._Y0E._LEN, LEN6)
            Method (_CRS, 0, NotSerialized)
            {
                Store (MG1L, Local0)
                If (Local0)
                {
                    Store (MG1B, MIN5)
                    Store (MG1L, LEN5)
                    Add (MIN5, Decrement (Local0), MAX5)
                }

                Store (MG2B, MIN6)
                Store (MG2L, LEN6)
                Store (MG2L, Local0)
                Add (MIN6, Decrement (Local0), MAX6)
                Return (CRS)
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)
    {
        Store (Arg0, DBG8)
        PTS (Arg0)
        Store (Zero, Index (WAKP, Zero))
        Store (Zero, Index (WAKP, One))
        If (LAnd (LEqual (Arg0, 0x04), LEqual (OSFL (), 0x02)))
        {
            Sleep (0x0BB8)
        }

        Store (ASSB, WSSB)
        Store (AOTB, WOTB)
        Store (AAXB, WAXB)
        Store (Arg0, ASSB)
        Store (OSFL (), AOTB)
        Store (Zero, AAXB)
    }

    Method (_WAK, 1, NotSerialized)
    {
        ShiftLeft (Arg0, 0x04, DBG8)
        WAK (Arg0)
        If (ASSB)
        {
            Store (WSSB, ASSB)
            Store (WOTB, AOTB)
            Store (WAXB, AAXB)
        }

        If (LEqual (Arg0, 0x04))
        {
            Notify (\_SB.PWRB, 0x02)
        }

        If (LEqual (Arg0, 0x03))
        {
            Notify (\_SB.PWRB, 0x02)
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }

        Return (WAKP)
    }

    If (OSCF)
    {
        Scope (_SB.PCI0)
        {
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)
            {
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */    0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40, 
                            /* 0008 */    0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E)
                    }

                    And (CTRL, 0x1D, CTRL)
                    If (Not (And (CDW1, One)))
                    {
                        If (And (CTRL, One)) {}
                        If (And (CTRL, 0x04))
                        {
                            Store (One, EPNM)
                            Store (One, DPPF)
                        }

                        If (And (CTRL, 0x10)) {}
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }
        }
    }

    Name (_S0, Package (0x04)
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)
        {
            0x03, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)
        {
            0x04, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            NPTS (Arg0)
            SPTS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        NWAK (Arg0)
        SWAK (Arg0)
    }
}

