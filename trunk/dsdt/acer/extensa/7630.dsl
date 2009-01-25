/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20081031
 *
 * Disassembly of 7630, Sun Jan 25 10:38:53 2009
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00008528 (34088)
 *     Revision         0x02
 *     Checksum         0xA4
 *     OEM ID           "Intel "
 *     OEM Table ID     "CANTIGA "
 *     OEM Revision     0x06040000 (100925440)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20061109 (537268489)
 */
DefinitionBlock ("7630.aml", "DSDT", 2, "Intel ", "CANTIGA ", 0x06040000)
{
    External (PDC1)
    External (PDC0)
    External (CFGD)
    External (\_PR_.CPU0._PPC)
    External (\_SB_.PCI0.TMEM.GPEH, MethodObj)    // 0 Arguments

    Name (SP2O, 0x4E)
    Name (SP1O, 0x164E)
    Name (IO1B, 0x0600)
    Name (IO1L, 0x70)
    Name (IO2B, 0x06B0)
    Name (IO2L, 0x20)
    Name (IO3B, 0x0290)
    Name (IO3L, 0x10)
    Name (MCHB, 0xFED10000)
    Name (MCHL, 0x4000)
    Name (EGPB, 0xFED19000)
    Name (EGPL, 0x1000)
    Name (DMIB, 0xFED18000)
    Name (DMIL, 0x1000)
    Name (IFPB, 0xFED13000)
    Name (IFPL, 0x1000)
    Name (PEBS, 0xE0000000)
    Name (PELN, 0x10000000)
    Name (TTTB, 0xFED20000)
    Name (TTTL, 0x00020000)
    Name (SMBS, 0x18C0)
    Name (PBLK, 0x0410)
    Name (PMBS, 0x0400)
    Name (PMLN, 0x80)
    Name (LVL2, 0x0414)
    Name (LVL3, 0x0415)
    Name (LVL4, 0x0416)
    Name (SMIP, 0xB2)
    Name (GPBS, 0x1180)
    Name (GPLN, 0x80)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (PM30, 0x0430)
    Name (SRCB, 0xFED1C000)
    Name (SRCL, 0x4000)
    Name (SUSW, 0xFF)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (PEHP, One)
    Name (SHPC, One)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (TRTP, One)
    Name (TRTD, 0x02)
    Name (TRTI, 0x03)
    Name (GCDD, One)
    Name (DSTA, 0x0A)
    Name (DSLO, 0x0C)
    Name (DSLC, 0x0E)
    Name (PITS, 0x10)
    Name (SBCS, 0x12)
    Name (SALS, 0x13)
    Name (LSSS, 0x2A)
    Name (PSSS, 0x2B)
    Name (SOOT, 0x35)
    Name (ESCS, 0x48)
    Name (PDBR, 0x4D)
    Name (SMBL, 0x10)
    OperationRegion (GNVS, SystemMemory, 0x7BB9EC4C, 0x0100)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
        THOF,   8, 
        ACT1,   8, 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
                Offset (0x28), 
        APIC,   8, 
        MPEN,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
                Offset (0x3C), 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        KSV0,   32, 
        KSV1,   8, 
        BDSP,   8, 
        PTY1,   8, 
        PTY2,   8, 
        PSCL,   8, 
        TVF1,   8, 
        TVF2,   8, 
        GETM,   8, 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
                Offset (0x6E), 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
                Offset (0x74), 
        MEFE,   8, 
        DSTS,   8, 
                Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
                Offset (0x82), 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
                Offset (0xAA), 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IDMM,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        PAVP,   8, 
                Offset (0xEB), 
        DSEN,   8, 
        ECON,   8, 
        GPIC,   8, 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8
    }

    Name (BRTN, Zero)
    Name (BOWN, Zero)
    OperationRegion (NV1, SystemIO, 0x72, 0x02)
    Field (NV1, ByteAcc, NoLock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
    {
                Offset (0x6E), 
        INS4,   1
    }

    Scope (_SB)
    {
        Method (VTOB, 1, NotSerialized)
        {
            Store (One, Local0)
            ShiftLeft (Local0, Arg0, Local0)
            Return (Local0)
        }

        Method (BTOV, 1, NotSerialized)
        {
            ShiftRight (Arg0, One, Local0)
            Store (Zero, Local1)
            While (Local0)
            {
                Increment (Local1)
                ShiftRight (Local0, One, Local0)
            }

            Return (Local1)
        }

        Method (MKWD, 2, NotSerialized)
        {
            If (And (Arg1, 0x80))
            {
                Store (0xFFFF0000, Local0)
            }
            Else
            {
                Store (Zero, Local0)
            }

            Or (Local0, Arg0, Local0)
            Or (Local0, ShiftLeft (Arg1, 0x08), Local0)
            Return (Local0)
        }

        Method (POSW, 1, NotSerialized)
        {
            If (And (Arg0, 0x8000))
            {
                If (LEqual (Arg0, 0xFFFF))
                {
                    Return (0xFFFFFFFF)
                }
                Else
                {
                    Not (Arg0, Local0)
                    Increment (Local0)
                    And (Local0, 0xFFFF, Local0)
                    Return (Local0)
                }
            }
            Else
            {
                Return (Arg0)
            }
        }

        Method (GBFE, 3, NotSerialized)
        {
            CreateByteField (Arg0, Arg1, TIDX)
            Store (TIDX, Arg2)
        }

        Method (PBFE, 3, NotSerialized)
        {
            CreateByteField (Arg0, Arg1, TIDX)
            Store (Arg2, TIDX)
        }

        Method (ITOS, 1, NotSerialized)
        {
            Store (Buffer (0x09)
                {
                    /* 0000 */    0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00
                }, Local0)
            Store (Buffer (0x11)
                {
                    "0123456789ABCDEF"
                }, Local7)
            Store (0x08, Local1)
            Store (Zero, Local2)
            Store (Zero, Local3)
            While (Local1)
            {
                Decrement (Local1)
                And (ShiftRight (Arg0, ShiftLeft (Local1, 0x02)), 0x0F, Local4)
                If (Local4)
                {
                    Store (Ones, Local3)
                }

                If (Local3)
                {
                    GBFE (Local7, Local4, RefOf (Local5))
                    PBFE (Local0, Local2, Local5)
                    Increment (Local2)
                }
            }

            Return (Local0)
        }

        OperationRegion (SMI0, SystemIO, 0x0000FE00, 0x00000002)
        Field (SMI0, AnyAcc, NoLock, Preserve)
        {
            SMIC,   8
        }

        OperationRegion (SMI1, SystemMemory, 0x7BB9ED4D, 0x00000200)
        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
            BCMD,   8, 
            DID,    32, 
            INF,    8
        }

        Field (SMI1, AnyAcc, NoLock, Preserve)
        {
                    Offset (0x50), 
            BLK0,   64, 
            BLK1,   64, 
            BLK2,   64, 
            BLK3,   64, 
            BLK4,   64, 
                    Offset (0x110), 
            BTEN,   1, 
            WLAN,   1, 
            DOCK,   1, 
            IDEC,   1, 
            TPMS,   1, 
            EX3G,   1, 
            CIRI,   1, 
                    Offset (0x111), 
            MODL,   8
        }

        Mutex (PSMX, 0x00)
        Name (SMIQ, Zero)
        Method (PHSR, 2, NotSerialized)
        {
            Acquire (PSMX, 0xFFFF)
            Store (0x90, BCMD)
            Store (Arg0, DID)
            Store (Arg1, INF)
            Store (SMIC, SMIQ)
            Store (INF, Local0)
            Release (PSMX)
            Return (Local0)
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (ACST, Zero)
            Method (_INI, 0, NotSerialized)
            {
                If (LGreaterEqual (OSYS, 0x07D6))
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.ACDF, ACST)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (One, ACST)
                    }

                    Store (ACST, PWRS)
                }
            }

            Method (_PSR, 0, NotSerialized)
            {
                If (ECOK)
                {
                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (^^PCI0.LPCB.EC0.ACDF, ACST)
                    Release (^^PCI0.LPCB.EC0.MUT1)
                }
                Else
                {
                    Store (One, ACST)
                }

                If (ACST)
                {
                    Store (One, Local0)
                    Store (Zero, ^^BAT1.BCRI)
                }
                Else
                {
                    Store (Zero, Local0)
                }

                If (LEqual (LIDP, Zero))
                {
                    Notify (LID, 0x80)
                }

                Store (ACST, PWRS)
                Return (Local0)
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, One)
            Name (CBTI, Zero)
            Name (PBTI, Zero)
            Name (BTIN, Zero)
            Name (BTCH, Zero)
            Name (BIFI, Zero)
            Name (SEL0, Zero)
            Name (BCRI, Zero)
            Name (PBIF, Package (0x0D)
            {
                One, 
                0x1130, 
                0x1130, 
                One, 
                0x2B5C, 
                0x012C, 
                0x84, 
                0x20, 
                0x20, 
                "BAT1      ", 
                "11        ", 
                "11        ", 
                "11        "
            })
            Name (PBST, Package (0x04)
            {
                Zero, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x2710
            })
            Name (ERRC, Zero)
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Method (_STA, 0, NotSerialized)
            {
                If (BTIN)
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
                If (LEqual (BIFI, Zero))
                {
                    UBIF ()
                    Store (One, BIFI)
                }

                Return (PBIF)
            }

            Name (LFCC, 0x1130)
            Method (UBIF, 0, NotSerialized)
            {
                Name (_T_0, Zero)
                If (ECOK)
                {
                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (^^PCI0.LPCB.EC0.BTDC, Local0)
                    Store (^^PCI0.LPCB.EC0.LFCC, Local1)
                    Store (^^PCI0.LPCB.EC0.BTDV, Local2)
                    Store (^^PCI0.LPCB.EC0.BTMD, Local3)
                    Store (^^PCI0.LPCB.EC0.BTMN, Local4)
                    Store (^^PCI0.LPCB.EC0.BTSN, Local5)
                    Store (^^PCI0.LPCB.EC0.LION, Local6)
                    Release (^^PCI0.LPCB.EC0.MUT1)
                    Store (Local0, Index (PBIF, One))
                    Store (Local1, Index (PBIF, 0x02))
                    Store (Local2, Index (PBIF, 0x04))
                    Store (Local1, LFCC)
                    Multiply (Local1, 0x04, Local7)
                    Divide (Local7, 0x64, , Local7)
                    Store (Local7, Index (PBIF, 0x06))
                    If (Local6)
                    {
                        Store ("NiMH", Index (PBIF, 0x0B))
                    }
                    Else
                    {
                        Store ("LION", Index (PBIF, 0x0B))
                    }

                    And (Local3, 0x0F, Local3)
                    Store (Local3, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Store ("AS07B31", Index (PBIF, 0x09))
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Store ("AS07B32", Index (PBIF, 0x09))
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Store ("AS07B41", Index (PBIF, 0x09))
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Store ("AS07B42", Index (PBIF, 0x09))
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Store ("AS07B51", Index (PBIF, 0x09))
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x06))
                                        {
                                            Store ("AS07B52", Index (PBIF, 0x09))
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x07))
                                            {
                                                Store ("AS07B71", Index (PBIF, 0x09))
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x08))
                                                {
                                                    Store ("AS07B72", Index (PBIF, 0x09))
                                                }
                                                Else
                                                {
                                                    Store ("xxxxxxx", Index (PBIF, 0x09))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (Local4, 0x08))
                    {
                        Store ("MOTOROLA", Index (PBIF, 0x0C))
                    }
                    Else
                    {
                        If (LEqual (Local4, 0x07))
                        {
                            Store ("SIMPLO", Index (PBIF, 0x0C))
                        }
                        Else
                        {
                            If (LEqual (Local4, 0x03))
                            {
                                Store ("SANYO", Index (PBIF, 0x0C))
                            }
                            Else
                            {
                                If (LEqual (Local4, 0x04))
                                {
                                    Store ("SONY", Index (PBIF, 0x0C))
                                }
                                Else
                                {
                                    If (LEqual (Local4, 0x05))
                                    {
                                        Store ("PANASONIC", Index (PBIF, 0x0C))
                                    }
                                    Else
                                    {
                                        Store ("UNKNOWN", Index (PBIF, 0x0C))
                                    }
                                }
                            }
                        }
                    }

                    Store (ITOS (ToBCD (Local5)), Index (PBIF, 0x0A))
                }
            }

            Name (RCAP, Zero)
            Method (_BST, 0, NotSerialized)
            {
                If (LEqual (BTIN, Zero))
                {
                    Store (Zero, Index (PBST, Zero))
                    Store (0xFFFFFFFF, Index (PBST, One))
                    Store (0xFFFFFFFF, Index (PBST, 0x02))
                    Store (0xFFFFFFFF, Index (PBST, 0x03))
                    Return (PBST)
                }

                If (ECOK)
                {
                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (^^PCI0.LPCB.EC0.MBTC, Local0)
                    Store (^^PCI0.LPCB.EC0.MBRM, Local1)
                    Store (^^PCI0.LPCB.EC0.MBVG, Local2)
                    Store (^^PCI0.LPCB.EC0.MCUR, Local3)
                    Store (^^PCI0.LPCB.EC0.BTST, Local4)
                    Store (^^PCI0.LPCB.EC0.MBTF, Local5)
                    Store (^^PCI0.LPCB.EC0.ACDF, Local6)
                    Release (^^PCI0.LPCB.EC0.MUT1)
                    If (Local6)
                    {
                        If (LEqual (Local5, One))
                        {
                            Store (Zero, Local7)
                            Store (LFCC, Local1)
                        }
                        Else
                        {
                            If (LEqual (Local0, One))
                            {
                                Store (0x02, Local7)
                            }
                            Else
                            {
                                Store (Zero, Local7)
                            }
                        }
                    }
                    Else
                    {
                        If (LAnd (Local4, One))
                        {
                            Store (One, Local7)
                        }
                        Else
                        {
                            Store (Zero, Local7)
                        }
                    }

                    And (Local4, 0x04, Local4)
                    If (LEqual (Local4, 0x04))
                    {
                        Or (Local7, Local4, Local7)
                    }

                    Store (Local7, Index (PBST, Zero))
                    If (LNot (And (Local1, 0x8000)))
                    {
                        Store (Local1, Index (PBST, 0x02))
                    }

                    If (LNot (And (Local2, 0x8000)))
                    {
                        Store (Local2, Index (PBST, 0x03))
                    }

                    If (LAnd (Local3, 0x8000))
                    {
                        If (LNotEqual (Local3, 0xFFFF))
                        {
                            Not (Local3, Local3)
                            Increment (Local3)
                            And (Local3, 0xFFFF, Local3)
                        }
                    }

                    Store (Local3, Index (PBST, One))
                }

                Return (PBST)
            }

            Method (Z000, 0, NotSerialized)
            {
                If (ECOK)
                {
                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (^^PCI0.LPCB.EC0.MBTS, Local0)
                    Release (^^PCI0.LPCB.EC0.MUT1)
                    If (LEqual (Local0, One))
                    {
                        If (LEqual (BTIN, Zero))
                        {
                            Store (One, BTCH)
                            Store (Zero, BIFI)
                        }

                        Store (One, BTIN)
                    }
                    Else
                    {
                        If (LEqual (BTIN, One))
                        {
                            Store (One, BTCH)
                            Store (Zero, BIFI)
                        }

                        Store (Zero, BTIN)
                    }
                }
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_INI, 0, NotSerialized)
            {
                Store (One, SLID)
            }

            Method (_LID, 0, NotSerialized)
            {
                Store (One, SLID)
                If (SLID)
                {
                    If (LIDP)
                    {
                        Store (Zero, Local0)
                    }
                    Else
                    {
                        Store (One, Local0)
                    }

                    XOr (LIDP, One, LIDP)
                }
                Else
                {
                    Store (LIDP, Local0)
                }

                Return (Local0)
            }

            Scope (\_GPE)
            {
                Method (_L16, 0, NotSerialized)
                {
                    Notify (\_SB.LID, 0x80)
                }
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Scope (\_SB)
        {
            Device (WMID)
            {
                Name (_HID, "PNP0C14")
                Name (_UID, Zero)
                Name (WMIQ, Zero)
                Name (ERRD, 0x00010000)
                Name (BUFF, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BUFF, Zero, BF00)
                CreateByteField (BUFF, One, BF01)
                CreateByteField (BUFF, 0x02, BF02)
                CreateByteField (BUFF, 0x03, BF03)
                Name (AADS, Buffer (0x04)
                {
                    0x00
                })
                CreateField (AADS, Zero, 0x04, AS00)
                CreateField (AADS, 0x04, One, AS01)
                CreateField (AADS, 0x05, One, AS02)
                CreateField (AADS, 0x10, 0x10, AS03)
                CreateField (AADS, Zero, 0x10, AS04)
                Name (BAEF, Zero)
                Name (BADF, Zero)
                Name (BADG, Package (0x03)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BADS, Package (0x04)
                {
                    One, 
                    One, 
                    One, 
                    One
                })
                Name (WLDS, Zero)
                Name (WLED, Zero)
                Name (BTDS, Zero)
                Name (BTED, Zero)
                Name (BLDS, Zero)
                Name (BLED, Zero)
                Name (NTDC, Zero)
                Name (WLSD, 0x0100)
                Name (WLSE, 0x0101)
                Name (BLTD, 0x0200)
                Name (BLTE, 0x0201)
                Name (LBL0, 0x0300)
                Name (LBL1, 0x0301)
                Name (LBL2, 0x0302)
                Name (LBL3, 0x0303)
                Name (LBL4, 0x0304)
                Name (LBL5, 0x0305)
                Name (LBL6, 0x0306)
                Name (LBL7, 0x0307)
                Name (LBL8, 0x0308)
                Name (LBL9, 0x0309)
                Name (LBLA, 0x030A)
                Name (LBLB, 0x030B)
                Name (LBLC, 0x030C)
                Name (LBLD, 0x030D)
                Name (LBLE, 0x030E)
                Name (LBLF, 0x030F)
                Name (CADI, 0x0401)
                Name (CADO, 0x0400)
                Name (LOWG, 0x0501)
                Name (HIHG, 0x0502)
                Name (VAPO, 0x0600)
                Name (VAPI, 0x0601)
                Name (WBAT, 0x0700)
                Name (WADA, 0x0701)
                Name (DS3G, 0x0800)
                Name (EN3G, 0x0801)
                Name (LANI, 0x0900)
                Name (LANO, 0x0901)
                Name (MNOF, 0x0A00)
                Name (MNON, 0x0A01)
                Name (BBSB, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BBSB, Zero, 0x10, BBD0)
                CreateField (BBSB, 0x10, 0x10, BBD1)
                Name (TLS0, Zero)
                Name (TLS1, One)
                Name (TLS2, 0x02)
                Name (TLS3, 0x03)
                Name (TLS4, 0x04)
                Name (TLS5, 0x05)
                Name (TLS6, 0x06)
                Name (TLS7, 0x07)
                Name (BBPD, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BBPD, Zero, BBP0)
                CreateByteField (BBPD, 0x04, BBP1)
                CreateByteField (BBPD, 0x08, BBP2)
                CreateByteField (BBPD, 0x0C, BBP3)
                CreateByteField (BBPD, 0x10, BBP4)
                Name (BBAR, Buffer (0x08)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateByteField (BBAR, Zero, BBA0)
                CreateByteField (BBAR, 0x04, BBA1)
                Name (BCDS, Package (0x0D)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (BDDS, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (BDDS, Zero, 0x10, BDD0)
                CreateField (BDDS, 0x10, 0x10, BDD1)
                Name (DSY0, Buffer (0x28)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY1, Buffer (0x18)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY2, Buffer (0x10)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY3, Buffer (0x18)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY4, Buffer (0x10)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DSY5, Buffer (0x28)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0018 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0020 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY0, Zero, 0x40, DY00)
                CreateField (DSY0, 0x40, 0x40, DY01)
                CreateField (DSY0, 0x80, 0x40, DY02)
                CreateField (DSY0, 0xC0, 0x40, DY03)
                CreateField (DSY0, 0x0100, 0x40, DY04)
                CreateField (DSY1, Zero, 0x40, DY10)
                CreateField (DSY1, 0x40, 0x40, DY11)
                CreateField (DSY1, 0x80, 0x40, DY12)
                CreateField (DSY2, Zero, 0x40, DY20)
                CreateField (DSY2, 0x40, 0x10, DY21)
                CreateField (DSY2, 0x50, 0x10, DY22)
                CreateField (DSY0, Zero, 0xC0, DSX4)
                Name (BEDS, Package (0x10)
                {
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000, 
                    0x00010000
                })
                Name (WIT0, Zero)
                Name (DSY6, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (DSY6, Zero, 0x20, DY60)
                CreateField (DSY6, 0x20, 0x20, DY61)
                CreateField (DSY6, 0x40, 0x20, DY62)
                CreateField (DSY6, 0x60, 0x20, DY63)
                CreateField (DSY6, 0x80, 0x20, DY64)
                Name (WPRW, Buffer (0x14)
                {
                    /* 0000 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0008 */    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                    /* 0010 */    0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPRW, Zero, 0x08, WWD0)
                CreateField (WPRW, 0x08, 0x08, WWD1)
                CreateField (WPRW, 0x10, 0x08, WWD2)
                CreateField (WPRW, 0x18, 0x08, WWD3)
                CreateField (WPRW, 0x20, 0x08, WWD4)
                CreateField (WPRW, 0x28, 0x20, WWD5)
                Name (WPCI, Buffer (0x04)
                {
                    0x00, 0x00, 0x00, 0x00
                })
                CreateField (WPCI, Zero, 0x08, WPIR)
                CreateField (WPCI, 0x08, 0x03, WPIF)
                CreateField (WPCI, 0x0B, 0x05, WPID)
                CreateField (WPCI, 0x10, 0x08, WPIB)
                Name (BFDS, Package (0x04)
                {
                    0x02, 
                    0x02, 
                    0x02, 
                    0x02
                })
                Name (GSTS, Zero)
                Name (BFEF, Zero)
                Name (BGEF, Zero)
                Name (BGDS, Package (0x01)
                {
                    One
                })
                Method (PHSR, 2, NotSerialized)
                {
                    Acquire (PSMX, 0xFFFF)
                    Store (0x91, BCMD)
                    Store (Arg0, DID)
                    Store (Arg1, INF)
                    Store (SMIC, SMIQ)
                    Store (DID, Local0)
                    Release (PSMX)
                    Return (Local0)
                }

                Method (AAF1, 0, NotSerialized)
                {
                    Store (PHSR (Zero, Zero), AS04)
                    Store (Zero, AS03)
                }

                Method (Z001, 1, NotSerialized)
                {
                    Name (_T_0, Zero)
                    And (Arg0, 0x00FFFFFF, Local0)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Store (PHSR (One, Zero), BUFF)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Store (PHSR (One, One), BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Store (BRTN, Local0)
                                Store (Local0, BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x08))
                                {
                                    Store (PHSR (One, 0x03), BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x09))
                                    {
                                        Store (PHSR (One, 0x04), BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0A))
                                        {
                                            Store (PHSR (One, 0x05), BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x0C))
                                            {
                                                Store (Zero, Local0)
                                                If (ECOK)
                                                {
                                                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                                                    Store (^^PCI0.LPCB.EC0.LANC, Local0)
                                                    Release (^^PCI0.LPCB.EC0.MUT1)
                                                }

                                                Store (And (Local0, One), BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x0D))
                                                {
                                                    If (ECOK)
                                                    {
                                                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                                                        Store (^^PCI0.LPCB.EC0.MNST, Local0)
                                                        Release (^^PCI0.LPCB.EC0.MUT1)
                                                    }

                                                    Store (And (Local0, One), BUFF)
                                                }
                                                Else
                                                {
                                                    Store (0x00010000, BUFF)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (Z002, 2, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg1, BUFF)
                    If (LEqual (BF00, Zero))
                    {
                        Store (Zero, Local0)
                    }
                    Else
                    {
                        Store (One, Local0)
                    }

                    And (Arg0, 0x00FFFFFF, Local1)
                    Store (Local1, _T_0)
                    If (LEqual (_T_0, 0x04))
                    {
                        Or (Local0, 0x10, Local0)
                        Store (PHSR (0x02, Local0), BUFF)
                        Store (Zero, BUFF)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x05))
                        {
                            Or (Local0, 0x20, Local0)
                            Store (PHSR (0x02, Local0), BUFF)
                            Store (Zero, BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x06))
                            {
                                If (LLess (OSYS, 0x07D6))
                                {
                                    Store (BF00, Local0)
                                    Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                                    Store (Local0, ^^PCI0.LPCB.EC0.BLVL)
                                    Release (^^PCI0.LPCB.EC0.MUT1)
                                    Store (Local0, BRTN)
                                }
                                Else
                                {
                                    If (LEqual (BOWN, Zero))
                                    {
                                        Store (BF00, Local1)
                                        Or (BF00, 0x40, Local0)
                                        Store (PHSR (0x02, Local0), BUFF)
                                        Store (0x02, BOWN)
                                        Store (Local1, Local0)
                                        Sleep (0x01F4)
                                        Z003 (Local0)
                                        Store (Local0, BRTN)
                                    }
                                    Else
                                    {
                                        Store (Zero, BOWN)
                                    }
                                }

                                Store (Zero, BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x0B))
                                {
                                    Or (Local0, 0x80, Local0)
                                    Store (PHSR (0x02, Local0), BUFF)
                                    Store (Zero, BUFF)
                                }
                                Else
                                {
                                    Store (0x00010000, BUFF)
                                }
                            }
                        }
                    }
                }

                Method (Z004, 0, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (WMIQ, Local0)
                    Store (Zero, WMIQ)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Return (WLSE)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Return (WLSD)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Return (BLTE)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Return (BLTD)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Store (PHSR (One, 0x02), Local1)
                                        And (Local1, 0x0F, Local1)
                                        And (LBL0, 0x0F00, LBL0)
                                        Or (Local1, LBL0, LBL0)
                                        Store (LBL0, P80H)
                                        Return (LBL0)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x06))
                                        {
                                            Store (LOWG, BUFF)
                                            Return (BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x07))
                                            {
                                                Store (HIHG, BUFF)
                                                Return (BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x08))
                                                {
                                                    Return (VAPO)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x09))
                                                    {
                                                        Return (VAPI)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x0A))
                                                        {
                                                            Store (LOWG, BUFF)
                                                            Return (BUFF)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x0B))
                                                            {
                                                                Store (LANI, BUFF)
                                                                Return (BUFF)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_0, 0x0C))
                                                                {
                                                                    Store (LANO, BUFF)
                                                                    Return (BUFF)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_0, 0x0D))
                                                                    {
                                                                        Store (EN3G, BUFF)
                                                                        Return (BUFF)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_0, 0x0E))
                                                                        {
                                                                            Store (DS3G, BUFF)
                                                                            Return (BUFF)
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (_T_0, 0x0F))
                                                                            {
                                                                                Store (MNON, BUFF)
                                                                                Return (BUFF)
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (_T_0, 0x10))
                                                                                {
                                                                                    Store (MNOF, BUFF)
                                                                                    Return (BUFF)
                                                                                }
                                                                                Else
                                                                                {
                                                                                    Return (0xFFFF)
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (Z005, 2, NotSerialized)
                {
                    Store (Arg1, BUFF)
                    And (BF00, 0x0F, Local0)
                    If (LEqual (Arg0, 0x02))
                    {
                        ShiftLeft (Local0, One, Local0)
                        Or (Local0, 0x10, Local0)
                    }

                    Store (PHSR (0x03, Local0), BBSB)
                }

                Method (Z006, 1, NotSerialized)
                {
                    Store (PHSR (0x10, Arg0), BUFF)
                    Store (BF00, BBP0)
                    Store (BF01, BBP1)
                    Store (BF02, BBP2)
                    Store (And (BF03, 0x0F), BBP3)
                    Store (ShiftRight (And (BF03, 0xF0), 0x04), BBP4)
                }

                Method (Z007, 2, NotSerialized)
                {
                }

                Method (Z008, 1, NotSerialized)
                {
                    PHSR (0x04, Arg0)
                    Store (BLK0, DY00)
                    Store (BLK1, DY01)
                    Store (BLK2, DY02)
                    Store (BLK3, DY03)
                    Store (Zero, DY04)
                }

                Method (Z009, 1, NotSerialized)
                {
                    Store (DY10, BLK0)
                    If (LEqual (Arg0, 0x03))
                    {
                        Store (DY11, BLK1)
                        Store (DY12, BLK2)
                    }

                    Store (PHSR (0x05, Arg0), Local0)
                    Store (BLK0, DY10)
                    Store (BLK1, DY11)
                    If (Local0)
                    {
                        Store (One, DY12)
                    }
                    Else
                    {
                        Store (Zero, DY12)
                    }
                }

                Method (Z00A, 1, NotSerialized)
                {
                    Store (PHSR (0x06, Arg0), BUFF)
                }

                Method (Z00B, 0, NotSerialized)
                {
                }

                Method (Z00C, 2, NotSerialized)
                {
                    Store (DSY4, DSY2)
                    Store (One, DY22)
                    If (LEqual (Arg0, 0x08)) {}
                    Else
                    {
                    }
                }

                Method (Z00D, 0, NotSerialized)
                {
                    Store (PHSR (0x07, Zero), BUFF)
                }

                Method (Z00E, 1, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg0, Local0)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Store (^^BAT1._STA (), Local0)
                        If (And (Local0, 0x10))
                        {
                            Store (Zero, BUFF)
                        }
                        Else
                        {
                            Store (0x00020000, BUFF)
                        }
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Store (0x00010000, BUFF)
                        }
                        Else
                        {
                            Store (0x00010000, BUFF)
                        }
                    }
                }

                Method (Z00F, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.MTMP, Local0)
                        Store (^^PCI0.LPCB.EC0.ATMP, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (0x1388, Local0)
                        Store (0x1388, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00H, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.MCUR, Local0)
                        Store (^^PCI0.LPCB.EC0.ABCR, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00I, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.MBVG, Local0)
                        Store (^^PCI0.LPCB.EC0.ABVG, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00J, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.MBRM, Local0)
                        Store (^^PCI0.LPCB.EC0.ABRM, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00K, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.LFCC, Local0)
                        Store (^^PCI0.LPCB.EC0.AFCC, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00L, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.MCYC, Local0)
                        Store (^^PCI0.LPCB.EC0.ACYC, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00M, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.BTDC, Local0)
                        Store (^^PCI0.LPCB.EC0.ABDC, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00N, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.BTDV, Local0)
                        Store (^^PCI0.LPCB.EC0.ABDV, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00O, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.MDAT, Local0)
                        Store (^^PCI0.LPCB.EC0.ADAT, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00P, 1, NotSerialized)
                {
                    If (ECOK)
                    {
                        Acquire (^^PCI0.LPCB.EC0.MUT1, 0xFFFF)
                        Store (^^PCI0.LPCB.EC0.BTSN, Local0)
                        Store (^^PCI0.LPCB.EC0.ABSN, Local1)
                        Release (^^PCI0.LPCB.EC0.MUT1)
                    }
                    Else
                    {
                        Store (Zero, Local0)
                        Store (Zero, Local1)
                    }

                    Z00G (Arg0, Local0, Local1)
                }

                Method (Z00Q, 1, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg0, BBAR)
                    And (BBA1, 0xFF, Local0)
                    And (BBA0, 0xFF, Local1)
                    Store (Local1, _T_0)
                    If (LEqual (_T_0, 0x03))
                    {
                        Store (0x02, BUFF)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x08))
                        {
                            Z00F (Local0)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x09))
                            {
                                Z00I (Local0)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x0A))
                                {
                                    Z00H (Local0)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x0F))
                                    {
                                        Z00J (Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x10))
                                        {
                                            Z00K (Local0)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x17))
                                            {
                                                Z00L (Local0)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x18))
                                                {
                                                    Z00M (Local0)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x19))
                                                    {
                                                        Z00N (Local0)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x1B))
                                                        {
                                                            Z00O (Local0)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x1C))
                                                            {
                                                                Z00P (Local0)
                                                            }
                                                            Else
                                                            {
                                                                Store (0x00010000, BUFF)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (Z00G, 3, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg0, Local0)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Store (^^BAT1._STA (), Local2)
                        If (And (Local2, 0x10))
                        {
                            Store (Arg1, Local3)
                        }
                        Else
                        {
                            Store (0xFFFF, Local3)
                        }
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Store (^^BAT1._STA (), Local2)
                            If (And (Local2, 0x10))
                            {
                                Store (Arg2, Local3)
                            }
                            Else
                            {
                                Store (0xFFFF, Local3)
                            }
                        }
                        Else
                        {
                            Store (Arg1, Local3)
                        }
                    }

                    If (LEqual (Local3, 0xFFFF))
                    {
                        Store (0x00020000, BUFF)
                    }
                    Else
                    {
                        Store (Local3, Index (BEDS, One))
                        Store (DerefOf (Index (BEDS, One)), BUFF)
                    }
                }

                Method (Z00R, 1, NotSerialized)
                {
                    Store (And (Arg0, One), Local0)
                    If (LLessEqual (Local0, One))
                    {
                        Store (PHSR (0x08, Arg0), BUFF)
                    }
                    Else
                    {
                        Store (0x02, BUFF)
                    }
                }

                Method (Z00S, 1, NotSerialized)
                {
                    Store (PHSR (0x09, Arg0), BUFF)
                }

                Method (Z00T, 1, NotSerialized)
                {
                    Store (And (Arg0, One), Local0)
                    If (LLessEqual (Local0, One))
                    {
                        Store (PHSR (0x0A, Arg0), BUFF)
                    }
                    Else
                    {
                        Store (0x02, BUFF)
                    }
                }

                Method (Z00U, 1, NotSerialized)
                {
                    Store (PHSR (0x0B, Arg0), BUFF)
                }

                Method (Z00V, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LEqual (Local0, One))
                    {
                        PHSR (0x0D, Local0)
                    }

                    Store (Zero, BUFF)
                }

                Method (Z00W, 1, NotSerialized)
                {
                    Store (PHSR (0x0E, Arg0), BUFF)
                }

                Method (Z00X, 0, NotSerialized)
                {
                    Store (PHSR (0x0F, Zero), BUFF)
                }

                Method (Z003, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    If (LGreater (Local0, BRTN))
                    {
                        If (^^PCI0.PEGA)
                        {
                            Notify (^^PCI0.PEGP.VGA.LCD, 0x86)
                        }
                        Else
                        {
                            Notify (^^PCI0.GFX0.DD04, 0x86)
                        }
                    }
                    Else
                    {
                        If (LLess (Local0, BRTN))
                        {
                            If (^^PCI0.PEGA)
                            {
                                Notify (^^PCI0.PEGP.VGA.LCD, 0x87)
                            }
                            Else
                            {
                                Notify (^^PCI0.GFX0.DD04, 0x87)
                            }
                        }
                    }
                }

                Name (_WDG, Buffer (0xDC)
                {
                    /* 0000 */    0x09, 0x4E, 0x76, 0x95, 0x56, 0xFB, 0x83, 0x4E, 
                    /* 0008 */    0xB3, 0x1A, 0x37, 0x76, 0x1F, 0x60, 0x99, 0x4A, 
                    /* 0010 */    0x41, 0x41, 0x01, 0x01, 0x58, 0xF2, 0xF4, 0x6A, 
                    /* 0018 */    0x01, 0xB4, 0xFD, 0x42, 0xBE, 0x91, 0x3D, 0x4A, 
                    /* 0020 */    0xC2, 0xD7, 0xC0, 0xD3, 0x42, 0x41, 0x01, 0x02, 
                    /* 0028 */    0xAC, 0x61, 0x1A, 0xCC, 0x56, 0x42, 0xA3, 0x41, 
                    /* 0030 */    0xB9, 0xE0, 0x05, 0xA4, 0x45, 0xAD, 0xE2, 0xF5, 
                    /* 0038 */    0x80, 0x00, 0x01, 0x08, 0x53, 0x44, 0x8C, 0xE7, 
                    /* 0040 */    0x27, 0x02, 0x61, 0x48, 0x9E, 0xDE, 0xF5, 0x60, 
                    /* 0048 */    0x0B, 0x4A, 0x3D, 0x39, 0x42, 0x42, 0x01, 0x02, 
                    /* 0050 */    0x7B, 0x4F, 0xE0, 0xAA, 0xC5, 0xB3, 0x65, 0x48, 
                    /* 0058 */    0x95, 0xD6, 0x9F, 0xAC, 0x7F, 0xF3, 0xE9, 0x2B, 
                    /* 0060 */    0x42, 0x43, 0x01, 0x02, 0x79, 0x4C, 0xF9, 0xCF, 
                    /* 0068 */    0x77, 0x6C, 0xF7, 0x4A, 0xAC, 0x56, 0x7D, 0xD0, 
                    /* 0070 */    0xCE, 0x01, 0xC9, 0x97, 0x42, 0x44, 0x01, 0x02, 
                    /* 0078 */    0xC5, 0x2E, 0x77, 0x79, 0xB1, 0x04, 0xFD, 0x4B, 
                    /* 0080 */    0x84, 0x3C, 0x61, 0xE7, 0xF7, 0x7B, 0x6C, 0xC9, 
                    /* 0088 */    0x42, 0x45, 0x01, 0x02, 0xB7, 0xA0, 0xC9, 0xA7, 
                    /* 0090 */    0x9D, 0x4C, 0x72, 0x4C, 0x83, 0xBB, 0x53, 0xA3, 
                    /* 0098 */    0x45, 0x91, 0x71, 0xDF, 0x42, 0x46, 0x01, 0x02, 
                    /* 00A0 */    0x4F, 0x06, 0x3A, 0x65, 0x3A, 0xA2, 0x5F, 0x48, 
                    /* 00A8 */    0xB3, 0xD9, 0x13, 0xF6, 0x53, 0x2A, 0x01, 0x82, 
                    /* 00B0 */    0x42, 0x47, 0x01, 0x02, 0xA7, 0xB1, 0x85, 0xDB, 
                    /* 00B8 */    0x9A, 0x06, 0xBB, 0x4A, 0xA2, 0xB5, 0xD1, 0x86, 
                    /* 00C0 */    0xA2, 0x1B, 0x80, 0xF1, 0x81, 0x00, 0x01, 0x08, 
                    /* 00C8 */    0x91, 0x6B, 0x91, 0x36, 0x64, 0x1A, 0x83, 0x45, 
                    /* 00D0 */    0x84, 0xD0, 0x53, 0x83, 0x0F, 0xB9, 0x10, 0x8D, 
                    /* 00D8 */    0x82, 0x00, 0x01, 0x08
                })
                Method (WQAA, 1, NotSerialized)
                {
                    AAF1 ()
                    Store (AADS, BUFF)
                    Return (BUFF)
                }

                Method (WMBA, 3, NotSerialized)
                {
                    If (LOr (LEqual (Arg1, 0x0C), LEqual (Arg1, 0x0D)))
                    {
                        Z001 (Arg1)
                        Return (BUFF)
                    }

                    If (LLess (Arg1, 0x04))
                    {
                        Z001 (Arg1)
                        Return (BUFF)
                    }

                    If (LAnd (LGreaterEqual (Arg1, 0x08), LLessEqual (Arg1, 0x0A)))
                    {
                        Z001 (Arg1)
                        Return (BUFF)
                    }

                    If (LEqual (Arg1, 0x07))
                    {
                        Store (Arg2, BUFF)
                        If (BF00)
                        {
                            Store (One, BAEF)
                        }
                        Else
                        {
                            Store (Zero, BAEF)
                        }

                        Store (Zero, BUFF)
                        Return (BUFF)
                    }

                    Z002 (Arg1, Arg2)
                    Return (BUFF)
                }

                Method (_WED, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x81))
                    {
                        Return (Z004 ())
                    }
                    Else
                    {
                        If (LEqual (BAEF, One))
                        {
                            If (LOr (LEqual (Arg0, 0x80), LEqual (Arg0, 0x82)))
                            {
                                Return (Z004 ())
                            }
                        }
                    }

                    Return (0xFFFF)
                }

                Method (WMBB, 3, NotSerialized)
                {
                    Name (_T_0, Zero)
                    And (Arg1, 0x00FFFFFF, Local0)
                    Store (Local0, _T_0)
                    If (LNotEqual (Match (Package (0x02)
                                    {
                                        One, 
                                        0x02
                                    }, MEQ, _T_0, MTR, Zero, Zero), Ones))
                    {
                        Z005 (Arg1, Arg2)
                        Store (BBSB, BUFF)
                        Return (BUFF)
                    }
                    Else
                    {
                        Store (0x1000, BUFF)
                        Return (BUFF)
                    }
                }

                Method (WMBC, 3, NotSerialized)
                {
                    Z007 (Arg1, Arg2)
                    If (LLess (Arg1, 0x0A))
                    {
                        Subtract (Arg1, One, Local0)
                        Store (DerefOf (Index (BCDS, Subtract (Arg1, One))), BUFF)
                    }
                    Else
                    {
                        ShiftRight (DerefOf (Index (BCDS, Subtract (Arg1, 0x0A))), 0x10, 
                            BUFF)
                    }

                    Return (BUFF)
                }

                Method (WMBD, 3, NotSerialized)
                {
                    Name (_T_0, Zero)
                    And (Arg1, 0x00FFFFFF, Local0)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Store (Arg2, BUFF)
                        Z008 (BF00)
                        Return (DSY0)
                    }
                    Else
                    {
                        If (LNotEqual (Match (Package (0x02)
                                        {
                                            0x02, 
                                            0x03
                                        }, MEQ, _T_0, MTR, Zero, Zero), Ones))
                        {
                            If (LEqual (Arg1, 0x02))
                            {
                                Store (Arg2, DY10)
                            }
                            Else
                            {
                                Store (Arg2, DSY1)
                            }

                            Z009 (Arg1)
                            Return (DSY1)
                        }
                        Else
                        {
                            If (LNotEqual (Match (Package (0x02)
                                            {
                                                0x04, 
                                                0x05
                                            }, MEQ, _T_0, MTR, Zero, Zero), Ones))
                            {
                                Store (Arg1, Local0)
                                If (LEqual (Local0, 0x04))
                                {
                                    Store (Arg2, BUFF)
                                    If (LEqual (BF00, One))
                                    {
                                        Or (Local0, 0x10, Local0)
                                    }
                                }

                                Z00A (Local0)
                                If (LNotEqual (BF01, Zero))
                                {
                                    If (LEqual (Arg1, 0x04))
                                    {
                                        Store (One, BUFF)
                                    }
                                }

                                Return (BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x07))
                                {
                                    Store (\_TZ.THRM._TMP (), Local0)
                                    Divide (Local0, 0x0A, , Local0)
                                    Store (Local0, Index (BCDS, 0x0B))
                                    Store (DerefOf (Index (BCDS, 0x0B)), BUFF)
                                    Return (BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x0A))
                                    {
                                        Z00D ()
                                        Return (BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x0B))
                                        {
                                            Store (Arg2, BBAR)
                                            Store (ShiftLeft (And (BBA1, 0x0F), 0x04), Local1)
                                            Or (And (BBA0, 0x0F), Local1, Local1)
                                            Z006 (Local1)
                                            Return (BBPD)
                                        }
                                        Else
                                        {
                                            Return (Zero)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (WMBE, 3, NotSerialized)
                {
                    Name (_T_0, Zero)
                    And (Arg1, 0x00FFFFFF, Local0)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Z00E (Arg2)
                        Return (BUFF)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Z00F (Arg2)
                            Return (BUFF)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Z00I (Arg2)
                                Return (BUFF)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Z00H (Arg2)
                                    Return (BUFF)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Z00J (Arg2)
                                        Return (BUFF)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x06))
                                        {
                                            Z00K (Arg2)
                                            Return (BUFF)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x07))
                                            {
                                                Z00L (Arg2)
                                                Return (BUFF)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x08))
                                                {
                                                    Z00M (Arg2)
                                                    Return (BUFF)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x09))
                                                    {
                                                        Z00N (Arg2)
                                                        Return (BUFF)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x0A))
                                                        {
                                                            Z00O (Arg2)
                                                            Return (BUFF)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x0B))
                                                            {
                                                                Z00P (Arg2)
                                                                Return (BUFF)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_0, 0x11))
                                                                {
                                                                    Store (PHSR (0x0C, Zero), BUFF)
                                                                    Return (BUFF)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_0, 0x12))
                                                                    {
                                                                        Store (PHSR (0x0C, One), BUFF)
                                                                        Return (BUFF)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_0, 0x13))
                                                                        {
                                                                            Z00Q (Arg2)
                                                                            Return (BUFF)
                                                                        }
                                                                        Else
                                                                        {
                                                                            Store (0x00010000, BUFF)
                                                                            Return (BUFF)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Method (WMBF, 3, NotSerialized)
                {
                    Name (_T_0, Zero)
                    Store (Arg2, BUFF)
                    Store (ToInteger (Arg1), Local0)
                    And (Arg1, 0x00FFFFFF, Local0)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Z00R (BF00)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Z00S (BF00)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Z00T (BF00)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x05))
                                {
                                    Z00V (BF00)
                                }
                                Else
                                {
                                    Store (0x02, BF00)
                                }
                            }
                        }
                    }

                    Store (Zero, BF01)
                    Store (Zero, BF02)
                    Store (Zero, BF03)
                    Return (BUFF)
                }

                Method (WMBG, 3, NotSerialized)
                {
                    Name (_T_0, Zero)
                    And (Arg1, 0x00FFFFFF, Local0)
                    Store (Local0, _T_0)
                    If (LEqual (_T_0, One))
                    {
                        Store (Arg2, BUFF)
                        Z00W (BF00)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Z00X ()
                        }
                        Else
                        {
                            Store (0x00010000, BUFF)
                        }
                    }

                    Store (Zero, BF01)
                    Store (Zero, BF02)
                    Store (Zero, BF03)
                    Return (BUFF)
                }
            }
        }
    }

    Scope (_TZ)
    {
        ThermalZone (THRM)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\_SB.ECOK)
                {
                    Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                    Store (\_SB.PCI0.LPCB.EC0.CTMP, Local0)
                    Release (\_SB.PCI0.LPCB.EC0.MUT1)
                    Return (Add (Multiply (Local0, 0x0A), 0x0AAC))
                }
                Else
                {
                    Return (0x0C3C)
                }
            }

            Method (_PSV, 0, NotSerialized)
            {
                Return (0x0E8A)
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Name (_TSP, 0x28)
            Name (_TC1, 0x02)
            Name (_TC2, 0x03)
            Method (_CRT, 0, NotSerialized)
            {
                Return (0x0EC6)
            }
        }
    }

    Scope (_SB)
    {
        Name (PR00, Package (0x1B)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x03, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                LNKH, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                One, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                One, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x02, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x03, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                LNKG, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                LNKB, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                LNKA, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                LNKC, 
                Zero
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                LNKD, 
                Zero
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                LNKE, 
                Zero
            }
        })
        Name (AR00, Package (0x1B)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x03, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                Zero, 
                0x14
            }
        })
        Name (PR02, Package (0x04)
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
        Name (AR02, Package (0x04)
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
        Name (PR08, Package (0x04)
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
        Name (AR08, Package (0x04)
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
        Name (PR01, Package (0x06)
        {
            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x02, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                0x03, 
                LNKE, 
                Zero
            }, 

            Package (0x04)
            {
                0x0005FFFF, 
                Zero, 
                LNKF, 
                Zero
            }, 

            Package (0x04)
            {
                0x0007FFFF, 
                Zero, 
                LNKG, 
                Zero
            }
        })
        Name (AR01, Package (0x01)
        {
            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x10
            }
        })
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
        Name (ECOK, Zero)
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, EisaId ("PNP0A03"))
            Name (_ADR, Zero)
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

            OperationRegion (HBUS, PCI_Config, 0x40, 0xC0)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                EPEN,   1, 
                    ,   11, 
                EPBR,   20, 
                        Offset (0x08), 
                MHEN,   1, 
                    ,   13, 
                MHBR,   18, 
                        Offset (0x14), 
                    ,   1, 
                PEGA,   1, 
                    ,   1, 
                IGDE,   1, 
                        Offset (0x20), 
                PXEN,   1, 
                PXSZ,   2, 
                    ,   23, 
                PXBR,   6, 
                        Offset (0x28), 
                DIEN,   1, 
                    ,   11, 
                DIBR,   20, 
                        Offset (0x30), 
                IPEN,   1, 
                    ,   11, 
                IPBR,   20, 
                        Offset (0x50), 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x51), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x52), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x53), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x54), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x55), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x56), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x57), 
                    ,   7, 
                HENA,   1, 
                        Offset (0x62), 
                TUUD,   16, 
                        Offset (0x70), 
                    ,   4, 
                TLUD,   12, 
                        Offset (0x89), 
                    ,   3, 
                GTSE,   1, 
                        Offset (0x8A)
            }

            OperationRegion (MCHT, SystemMemory, 0xFED11000, 0xFF)
            Field (MCHT, ByteAcc, NoLock, Preserve)
            {
                        Offset (0x1E), 
                T0IS,   16, 
                        Offset (0x5E), 
                T1IS,   16, 
                        Offset (0xEF), 
                ESCS,   8
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
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
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEBFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED40000,         // Range Minimum
                    0xFED44FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                If (PM1L)
                {
                    CreateDWordField (BUF0, 0x7C, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, One))
                {
                    CreateBitField (BUF0, 0x0358, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, 0x96, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, One))
                {
                    CreateBitField (BUF0, 0x0428, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, 0xB0, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, One))
                {
                    CreateBitField (BUF0, 0x04F8, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, 0xCA, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, One))
                {
                    CreateBitField (BUF0, 0x05C8, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, 0xE4, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, One))
                {
                    CreateBitField (BUF0, 0x0698, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, 0xFE, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, One))
                {
                    CreateBitField (BUF0, 0x0768, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, 0x0118, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, One))
                {
                    CreateBitField (BUF0, 0x0838, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, 0x0132, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, One))
                {
                    CreateBitField (BUF0, 0x0908, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, 0x014C, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, One))
                {
                    CreateBitField (BUF0, 0x09D8, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, 0x0166, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, One))
                {
                    CreateBitField (BUF0, 0x0AA8, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, 0x0180, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, One))
                {
                    CreateBitField (BUF0, 0x0B78, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, 0x019A, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, One))
                {
                    CreateBitField (BUF0, 0x0C48, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, 0x01B4, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, One))
                {
                    CreateBitField (BUF0, 0x0D18, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, 0x01C2, M1MN)
                CreateDWordField (BUF0, 0x01C6, M1MX)
                CreateDWordField (BUF0, 0x01CE, M1LN)
                ShiftLeft (TLUD, 0x14, M1MN)
                Add (Subtract (M1MX, M1MN), One, M1LN)
                Return (BUF0)
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (PEGA)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)
                    Name (DISW, One)
                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, DISW)
                        Store (ShiftRight (And (DISW, 0x04), 0x02), Local0)
                        PHSR (0x04, Local0)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x04)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x00010200, 
                            0x00010121
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Method (_BCL, 0, NotSerialized)
                        {
                            Store (Zero, BOWN)
                            Return (Package (0x0C)
                            {
                                0x50, 
                                0x32, 
                                0x0A, 
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
                        }

                        Method (_BCM, 1, NotSerialized)
                        {
                            If (LEqual (BOWN, Zero))
                            {
                                Store (Subtract (Divide (Arg0, 0x0A, ), One), Local0)
                                Store (Local0, BRTN)
                                Acquire (^^^^LPCB.EC0.MUT1, 0xFFFF)
                                Store (Local0, ^^^^LPCB.EC0.BLVL)
                                Release (^^^^LPCB.EC0.MUT1)
                                If (LLess (OSYS, 0x07D6))
                                {
                                    If (LEqual (^^^^^WMID.BAEF, One))
                                    {
                                        Sleep (0xC8)
                                        Store (0x05, ^^^^^WMID.WMIQ)
                                        Notify (WMID, 0x80)
                                    }
                                }
                            }
                            Else
                            {
                                Store (Zero, BOWN)
                            }
                        }

                        Method (_BQC, 0, NotSerialized)
                        {
                            Store (BRTN, Local0)
                            Return (Multiply (Add (Local0, One), 0x0A))
                        }

                        Name (_DCS, 0x1B)
                        Name (_DGS, Zero)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, One))
                            {
                                Or (NDSP, One, NDSP)
                            }
                            Else
                            {
                                And (NDSP, 0xFE, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, Zero))
                            {
                                Or (And (_DCS, 0xFD), ShiftLeft (And (NDSP, One), 
                                    One), _DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    One), ^^TV._DCS)
                                UDGS ()
                            }
                        }
                    }

                    Device (CRT)
                    {
                        Name (_ADR, 0x0100)
                        Name (_DCS, 0x1B)
                        Name (_DGS, Zero)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, One))
                            {
                                Or (NDSP, 0x02, NDSP)
                            }
                            Else
                            {
                                And (NDSP, 0xFD, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, Zero))
                            {
                                Store ("CRT._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, One), 
                                    One), ^^LCD._DCS)
                                Or (And (_DCS, 0xFD), And (NDSP, 0x02), _DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    One), ^^TV._DCS)
                                UDGS ()
                            }
                        }
                    }

                    Device (TV)
                    {
                        Name (_ADR, 0x0200)
                        Name (_DCS, 0x1B)
                        Name (_DGS, Zero)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, One))
                            {
                                Store ("TV_._DSS(1) called", Debug)
                                Or (NDSP, 0x04, NDSP)
                            }
                            Else
                            {
                                Store ("TV_._DSS(0) called", Debug)
                                And (NDSP, 0xFB, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, Zero))
                            {
                                Store ("TV_._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, One), 
                                    One), ^^LCD._DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (_DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    One), _DCS)
                                UDGS ()
                            }
                        }
                    }

                    Device (DFP)
                    {
                        Name (_ADR, 0x0121)
                        Name (_DCS, 0x1B)
                        Name (_DGS, Zero)
                        Method (_DSS, 1, NotSerialized)
                        {
                            Store (Arg0, Local0)
                            If (And (Local0, One))
                            {
                                Store ("DFP._DSS(1) called", Debug)
                                Or (NDSP, 0x04, NDSP)
                            }
                            Else
                            {
                                Store ("DFP._DSS(0) called", Debug)
                                And (NDSP, 0xFB, NDSP)
                            }

                            And (Local0, 0xC0000000, Local0)
                            And (Local0, 0x80000000, Local0)
                            If (LNotEqual (Local0, Zero))
                            {
                                Store ("DFP._DSS, update next _DGS", Debug)
                                Or (And (^^LCD._DCS, 0xFD), ShiftLeft (And (NDSP, One), 
                                    One), ^^LCD._DCS)
                                Or (And (^^CRT._DCS, 0xFD), And (NDSP, 0x02), ^^CRT._DCS)
                                Or (And (^^TV._DCS, 0xFD), ShiftRight (And (NDSP, 0x04), 
                                    One), ^^TV._DCS)
                                Or (And (_DCS, 0xFD), ShiftRight (And (NDSP, 0x08), 
                                    One), _DCS)
                                UDGS ()
                            }
                        }
                    }

                    Name (NDSP, Zero)
                    Name (VRSM, Zero)
                    Name (PDSP, Zero)
                    Name (CDSP, Zero)
                    Name (TGLT, Package (0x06)
                    {
                        Package (0x0A)
                        {
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One
                        }, 

                        Package (0x0A)
                        {
                            One, 
                            0x02, 
                            0x03, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One
                        }, 

                        Package (0x0A)
                        {
                            One, 
                            0x05, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One
                        }, 

                        Package (0x0A)
                        {
                            One, 
                            0x02, 
                            0x03, 
                            0x05, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One
                        }, 

                        Package (0x0A)
                        {
                            One, 
                            0x09, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One
                        }, 

                        Package (0x0A)
                        {
                            One, 
                            0x02, 
                            0x03, 
                            0x09, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One, 
                            One
                        }
                    })
                    Name (TGLP, Zero)
                    Method (_INI, 0, NotSerialized)
                    {
                        USTA ()
                        Store (CDSP, PDSP)
                        Store (CDSP, Local1)
                        Or (ShiftRight (And (Local1, 0x10), 0x03), 0x1D, ^LCD._DCS)
                        Or (Or (ShiftLeft (And (Local1, 0x02), 0x03), ShiftRight (
                            And (Local1, 0x20), 0x04)), 0x0D, ^CRT._DCS)
                        Or (Or (ShiftLeft (And (Local1, 0x04), 0x02), ShiftRight (
                            And (Local1, 0x40), 0x05)), 0x0D, ^TV._DCS)
                        Or (Or (ShiftLeft (And (Local1, 0x08), One), ShiftRight (
                            And (Local1, 0x80), 0x06)), 0x0D, ^DFP._DCS)
                        ShiftRight (Local1, 0x04, NDSP)
                        Store (ShiftRight (And (^LCD._DCS, 0x02), One), ^LCD._DGS)
                        Store (ShiftRight (And (^CRT._DCS, 0x02), One), ^CRT._DGS)
                        Store (ShiftRight (And (^TV._DCS, 0x02), One), ^TV._DGS)
                        Store (ShiftRight (And (^DFP._DCS, 0x02), One), ^DFP._DGS)
                    }

                    Method (DRUL, 1, NotSerialized)
                    {
                        USTA ()
                        UDGS ()
                        Store (CDSP, PDSP)
                        Store (CDSP, Local2)
                        Store (^LCD._DCS, Local1)
                        Or (Or (ShiftLeft (And (Local2, One), 0x04), ShiftRight (
                            And (Local2, 0x10), 0x03)), And (Local1, 0x0D), 
                            ^LCD._DCS)
                        Store (^CRT._DCS, Local1)
                        Or (Or (ShiftLeft (And (Local2, 0x02), 0x03), ShiftRight (
                            And (Local2, 0x20), 0x04)), And (Local1, 0x0D), 
                            ^CRT._DCS)
                        Store (^TV._DCS, Local3)
                        Or (Or (ShiftLeft (And (Local2, 0x04), 0x02), ShiftRight (
                            And (Local2, 0x40), 0x05)), And (Local3, 0x0D), 
                            ^TV._DCS)
                        Store (^DFP._DCS, Local4)
                        Or (Or (ShiftLeft (And (Local2, 0x08), One), ShiftRight (
                            And (Local2, 0x80), 0x06)), And (Local4, 0x0D), 
                            ^DFP._DCS)
                        If (LEqual (Arg0, One))
                        {
                            If (LOr (LAnd (^CRT._DGS, LNot (And (^CRT._DCS, 0x10))), LAnd (
                                ^TV._DGS, LNot (And (^TV._DCS, 0x10)))))
                            {
                                UDGS ()
                            }
                            Else
                            {
                                Notify (VGA, 0x80)
                            }
                        }
                    }

                    Method (USTA, 0, NotSerialized)
                    {
                        Store (PHSR (0x06, Zero), CDSP)
                        And (CDSP, 0x0F, Local1)
                        If (LEqual (And (Local1, 0x0C), 0x0C))
                        {
                            And (Local1, 0x77, Local1)
                        }

                        If (LEqual (Local1, 0x03))
                        {
                            Store (One, TGLP)
                        }
                        Else
                        {
                            If (LEqual (Local1, 0x05))
                            {
                                Store (0x02, TGLP)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x07))
                                {
                                    Store (0x03, TGLP)
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x09))
                                    {
                                        Store (0x04, TGLP)
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x0B))
                                        {
                                            Store (0x05, TGLP)
                                        }
                                        Else
                                        {
                                            Store (Zero, TGLP)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Method (UDGS, 0, NotSerialized)
                    {
                        And (^LCD._DGS, One, Local0)
                        Or (Local0, ShiftLeft (And (^CRT._DGS, One), One), Local0)
                        Or (Local0, ShiftLeft (And (^TV._DGS, One), 0x02), Local0)
                        Or (Local0, ShiftLeft (And (^DFP._DGS, One), 0x03), Local0)
                        Store (DerefOf (Index (DerefOf (Index (TGLT, TGLP)), Local0)), 
                            Local1)
                        And (Local1, One, ^LCD._DGS)
                        ShiftRight (And (Local1, 0x02), One, ^CRT._DGS)
                        ShiftRight (And (Local1, 0x04), 0x02, ^TV._DGS)
                        ShiftRight (And (Local1, 0x08), 0x03, ^DFP._DGS)
                    }
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)
                Method (_INI, 0, NotSerialized)
                {
                    Store (One, CLID)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (PEGA)
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Method (_DOS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x07), DSEN)
                }

                Method (_DOD, 0, NotSerialized)
                {
                    If (SCIP ())
                    {
                        Store (Zero, NDID)
                        If (LNotEqual (DIDL, Zero))
                        {
                            Store (SDDL (DID1), DID1)
                        }

                        If (LNotEqual (DDL2, Zero))
                        {
                            Store (SDDL (DID2), DID2)
                        }

                        If (LNotEqual (DDL3, Zero))
                        {
                            Store (SDDL (DID3), DID3)
                        }

                        If (LNotEqual (DDL4, Zero))
                        {
                            Store (SDDL (DID4), DID4)
                        }

                        If (LNotEqual (DDL5, Zero))
                        {
                            Store (SDDL (DID5), DID5)
                        }
                    }

                    If (LEqual (NDID, One))
                    {
                        Name (TMP1, Package (0x01)
                        {
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP1, Zero))
                        Return (TMP1)
                    }

                    If (LEqual (NDID, 0x02))
                    {
                        Name (TMP2, Package (0x02)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP2, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP2, One))
                        Return (TMP2)
                    }

                    If (LEqual (NDID, 0x03))
                    {
                        Name (TMP3, Package (0x03)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP3, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP3, One))
                        Store (Or (0x00010000, DID3), Index (TMP3, 0x02))
                        Return (TMP3)
                    }

                    If (LEqual (NDID, 0x04))
                    {
                        Name (TMP4, Package (0x04)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP4, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP4, One))
                        Store (Or (0x00010000, DID3), Index (TMP4, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP4, 0x03))
                        Return (TMP4)
                    }

                    If (LGreater (NDID, 0x04))
                    {
                        Name (TMP5, Package (0x05)
                        {
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF, 
                            0xFFFFFFFF
                        })
                        Store (Or (0x00010000, DID1), Index (TMP5, Zero))
                        Store (Or (0x00010000, DID2), Index (TMP5, One))
                        Store (Or (0x00010000, DID3), Index (TMP5, 0x02))
                        Store (Or (0x00010000, DID4), Index (TMP5, 0x03))
                        Store (Or (0x00010000, DID4), Index (TMP5, 0x04))
                        Return (TMP5)
                    }

                    Return (Package (0x01)
                    {
                        0x0400
                    })
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID1, Zero))
                        {
                            Return (One)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID1))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (CDDS (DID1))
                        }
                        Else
                        {
                            TRAP (TRTI, GCDD)
                            If (And (CSTE, One))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID1))
                        }
                        Else
                        {
                            If (And (NSTE, One))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD02)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID2, Zero))
                        {
                            Return (0x02)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID2))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (CDDS (DID2))
                        }
                        Else
                        {
                            TRAP (TRTI, GCDD)
                            If (And (CSTE, 0x02))
                            {
                                Return (0x1F)
                            }

                            Return (0x1D)
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID2))
                        }
                        Else
                        {
                            If (And (NSTE, 0x02))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD03)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID3, Zero))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID3))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID3, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            If (SCIP ())
                            {
                                Return (CDDS (DID3))
                            }
                            Else
                            {
                                TRAP (TRTI, GCDD)
                                If (And (CSTE, 0x04))
                                {
                                    Return (0x1F)
                                }

                                Return (0x1D)
                            }
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID3))
                        }
                        Else
                        {
                            If (And (NSTE, 0x04))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID4, Zero))
                        {
                            Return (0x04)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID4))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID4, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            If (SCIP ())
                            {
                                Return (CDDS (DID4))
                            }
                            Else
                            {
                                TRAP (TRTI, GCDD)
                                If (And (CSTE, 0x08))
                                {
                                    Return (0x1F)
                                }

                                Return (0x1D)
                            }
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID4))
                        }
                        Else
                        {
                            If (And (NSTE, 0x08))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }

                    Method (_BCL, 0, NotSerialized)
                    {
                        Store (Zero, BOWN)
                        Return (Package (0x0C)
                        {
                            0x50, 
                            0x32, 
                            0x0A, 
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
                    }

                    Method (_BCM, 1, NotSerialized)
                    {
                        If (LEqual (BOWN, Zero))
                        {
                            Store (Subtract (Divide (Arg0, 0x0A, ), One), Local0)
                            Store (Local0, BRTN)
                            Acquire (^^^LPCB.EC0.MUT1, 0xFFFF)
                            Store (Local0, ^^^LPCB.EC0.BLVL)
                            Release (^^^LPCB.EC0.MUT1)
                            If (LLess (OSYS, 0x07D6))
                            {
                                If (LEqual (^^^^WMID.BAEF, One))
                                {
                                    Sleep (0xC8)
                                    Store (0x05, ^^^^WMID.WMIQ)
                                    Notify (WMID, 0x80)
                                }
                            }
                        }
                        Else
                        {
                            Store (Zero, BOWN)
                        }
                    }

                    Method (_BQC, 0, NotSerialized)
                    {
                        Store (BRTN, Local0)
                        Return (Multiply (Add (Local0, One), 0x0A))
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)
                    {
                        If (LEqual (DID5, Zero))
                        {
                            Return (0x05)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID5))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)
                    {
                        If (LEqual (DID5, Zero))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            If (SCIP ())
                            {
                                Return (CDDS (DID5))
                            }
                            Else
                            {
                                TRAP (TRTI, GCDD)
                                If (And (CSTE, 0x10))
                                {
                                    Return (0x1F)
                                }

                                Return (0x1D)
                            }
                        }
                    }

                    Method (_DGS, 0, NotSerialized)
                    {
                        If (SCIP ())
                        {
                            Return (NDDS (DID5))
                        }
                        Else
                        {
                            If (And (NSTE, 0x10))
                            {
                                Return (One)
                            }

                            Return (Zero)
                        }
                    }

                    Method (_DSS, 1, NotSerialized)
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE)
                        }
                    }
                }

                Method (SDDL, 1, NotSerialized)
                {
                    Increment (NDID)
                    Store (And (Arg0, 0x0F0F), Local0)
                    Or (0x80000000, Local0, Local1)
                    If (LEqual (DIDL, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL2, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL3, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL4, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL5, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL6, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL7, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL8, Local0))
                    {
                        Return (Local1)
                    }

                    Return (Zero)
                }

                Method (CDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (Zero, Local0))
                    {
                        Return (0x1D)
                    }

                    If (LEqual (CADL, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL2, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL3, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL4, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL5, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL6, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL7, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL8, Local0))
                    {
                        Return (0x1F)
                    }

                    Return (0x1D)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (Zero, Local0))
                    {
                        Return (Zero)
                    }

                    If (LEqual (NADL, Local0))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL2, Local0))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL3, Local0))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL4, Local0))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL5, Local0))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL6, Local0))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL7, Local0))
                    {
                        Return (One)
                    }

                    If (LEqual (NDL8, Local0))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }

                Scope (^^PCI0)
                {
                    OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
                    Field (MCHP, AnyAcc, NoLock, Preserve)
                    {
                                Offset (0x60), 
                        TASM,   10, 
                                Offset (0x62)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                            Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                            Offset (0x18), 
                            Offset (0xA4), 
                    ASLE,   8, 
                            Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                            Offset (0xB0), 
                        ,   12, 
                    CDVL,   1, 
                            Offset (0xB2), 
                            Offset (0xB5), 
                    LBPC,   8, 
                            Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    DMOD,   32, 
                            Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                            Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                            Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                            Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                            Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    CBLV,   32, 
                    BCLM,   320, 
                    CPFM,   32, 
                    EPFM,   32, 
                    PLUT,   592, 
                    PFMB,   32, 
                    CCDV,   32, 
                    PCFT,   32, 
                            Offset (0x400), 
                    GVD1,   49152, 
                    PHED,   32, 
                    BDDC,   2048
                }

                Name (DBTB, Package (0x15)
                {
                    Zero, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x05)
                {
                    Package (0x02)
                    {
                        0xE4, 
                        0x0140
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        Zero, 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }
                })
                Name (SUCC, One)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, Zero))
                        {
                            Store (0x0679, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, One))
                        {
                            Store (0x0240, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            And (PARM, 0xEFFF0000, PARM)
                            And (PARM, ShiftLeft (DerefOf (Index (DBTB, IBTT)), 0x10), 
                                PARM)
                            Or (IBTT, PARM, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (IPSC, PARM)
                            Or (PARM, ShiftLeft (IPAT, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM)
                            Add (PARM, 0x00010000, PARM)
                            Or (PARM, ShiftLeft (IBIA, 0x14), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (ITVF, PARM)
                            Or (PARM, ShiftLeft (ITVM, 0x04), PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM)
                            XOr (PARM, One, PARM)
                            Or (PARM, ShiftLeft (GMFN, One), PARM)
                            Or (PARM, 0x1800, PARM)
                            Or (PARM, ShiftLeft (IDMS, 0x11), PARM)
                            Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), CDVL
                                )), 0x15), PARM, PARM)
                            Store (One, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (Zero, PARM)
                            If (ISSC)
                            {
                                Or (PARM, 0x03, PARM)
                            }

                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            Store (KSV0, PARM)
                            Store (KSV1, GESF)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (CRIT)
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, Zero))
                        {
                            Store (Zero, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, One))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x03))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (And (PARM, 0x0F), ITVF)
                            Store (ShiftRight (And (PARM, 0xF0), 0x04), ITVM)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            If (LEqual (PARM, Zero))
                            {
                                Store (CLID, Local0)
                                If (And (0x80000000, Local0))
                                {
                                    And (CLID, 0x0F, CLID)
                                    GLID (CLID)
                                }
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x08))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x09))
                        {
                            And (PARM, 0xFF, IBTT)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            And (PARM, 0xFF, IPSC)
                            If (And (ShiftRight (PARM, 0x08), 0xFF))
                            {
                                And (ShiftRight (PARM, 0x08), 0xFF, IPAT)
                                Decrement (IPAT)
                            }

                            And (ShiftRight (PARM, 0x14), 0x07, IBIA)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x0B))
                        {
                            And (ShiftRight (PARM, One), One, IF1E)
                            If (And (PARM, 0x0001E000))
                            {
                                And (ShiftRight (PARM, 0x0D), 0x0F, IDMS)
                            }
                            Else
                            {
                                And (ShiftRight (PARM, 0x11), 0x0F, IDMS)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x10))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x11))
                        {
                            Store (ShiftLeft (LIDS, 0x08), PARM)
                            Add (PARM, 0x0100, PARM)
                            Store (Zero, GESF)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x12))
                        {
                            If (And (PARM, One))
                            {
                                If (LEqual (ShiftRight (PARM, One), One))
                                {
                                    Store (One, ISSC)
                                }
                                Else
                                {
                                    Store (Zero, GESF)
                                    Return (CRIT)
                                }
                            }
                            Else
                            {
                                Store (Zero, ISSC)
                            }

                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x13))
                        {
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        If (LEqual (GESF, 0x14))
                        {
                            And (PARM, 0x0F, PAVP)
                            Store (Zero, GESF)
                            Store (Zero, PARM)
                            Return (SUCC)
                        }

                        Store (Zero, GESF)
                        Return (SUCC)
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC)
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC)
                    }

                    Store (Zero, GEFC)
                    Store (One, SCIS)
                    Store (Zero, GSSE)
                    Store (Zero, SCIE)
                    Return (Zero)
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (One)
                    }

                    Store (Arg0, CEVT)
                    Store (0x03, CSTS)
                    If (LAnd (LEqual (CHPD, Zero), LEqual (Arg1, Zero)))
                    {
                        If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                        {
                            Notify (PCI0, Arg1)
                        }
                        Else
                        {
                            Notify (GFX0, Arg1)
                        }
                    }

                    Notify (GFX0, 0x80)
                    Return (Zero)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX)
                    Return (GNOT (One, Zero))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (Arg0, CLID)
                    Return (GNOT (0x02, Zero))
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK)
                    Return (GNOT (0x04, Zero))
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (One, Arg0))))
                    {
                        Return (One)
                    }

                    If (PARD ())
                    {
                        Return (One)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        If (CPFM)
                        {
                            And (CPFM, 0x0F, Local0)
                            And (EPFM, 0x0F, Local1)
                            If (LEqual (Local0, One))
                            {
                                If (And (Local1, 0x06))
                                {
                                    Store (0x06, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x08))
                                    {
                                        Store (0x08, PFIT)
                                    }
                                    Else
                                    {
                                        Store (One, PFIT)
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                If (And (Local1, 0x08))
                                {
                                    Store (0x08, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, One))
                                    {
                                        Store (One, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x06, PFIT)
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x08))
                            {
                                If (And (Local1, One))
                                {
                                    Store (One, PFIT)
                                }
                                Else
                                {
                                    If (And (Local1, 0x06))
                                    {
                                        Store (0x06, PFIT)
                                    }
                                    Else
                                    {
                                        Store (0x08, PFIT)
                                    }
                                }
                            }
                        }
                        Else
                        {
                            XOr (PFIT, 0x07, PFIT)
                        }

                        Or (PFIT, 0x80000000, PFIT)
                        Store (0x04, ASLC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, One))
                        {
                            Store (Divide (Multiply (Arg1, 0xFF), 0x64, ), BCLP)
                            Or (BCLP, 0x80000000, BCLP)
                            Store (0x02, ASLC)
                        }
                        Else
                        {
                            If (LEqual (Arg0, Zero))
                            {
                                Store (Arg1, ALSI)
                                Store (One, ASLC)
                            }
                            Else
                            {
                                Return (One)
                            }
                        }
                    }

                    Store (Zero, LBPC)
                    Return (Zero)
                }

                Method (SCIP, 0, NotSerialized)
                {
                    If (LNotEqual (OVER, Zero))
                    {
                        Return (LNot (GSMI))
                    }

                    Return (Zero)
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x001E0000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR01)
                    }

                    Return (PR01)
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)
                Scope (\_SB)
                {
                    OperationRegion (PCI0.LPCB.LPC1, PCI_Config, 0x40, 0xC0)
                    Field (PCI0.LPCB.LPC1, AnyAcc, NoLock, Preserve)
                    {
                                Offset (0x20), 
                        PARC,   8, 
                        PBRC,   8, 
                        PCRC,   8, 
                        PDRC,   8, 
                                Offset (0x28), 
                        PERC,   8, 
                        PFRC,   8, 
                        PGRC,   8, 
                        PHRC,   8, 
                                Offset (0x69), 
                            ,   3, 
                        PUME,   1, 
                        PDME,   1, 
                                Offset (0x6B), 
                            ,   5, 
                        PCIB,   2
                    }

                    Device (LNKA)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))
                        Name (_UID, One)
                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x80, PARC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {1,3,4,5,6,7,10,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)
                        {
                            Name (RTLA, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, )
                                    {}
                            })
                            CreateWordField (RTLA, One, IRQ0)
                            Store (Zero, IRQ0)
                            ShiftLeft (One, And (PARC, 0x0F), IRQ0)
                            Return (RTLA)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateWordField (Arg0, One, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PARC)
                        }

                        Method (_STA, 0, Serialized)
                        {
                            If (And (PARC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKB)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))
                        Name (_UID, 0x02)
                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x80, PBRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {1,3,4,5,6,7,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)
                        {
                            Name (RTLB, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, )
                                    {}
                            })
                            CreateWordField (RTLB, One, IRQ0)
                            Store (Zero, IRQ0)
                            ShiftLeft (One, And (PBRC, 0x0F), IRQ0)
                            Return (RTLB)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateWordField (Arg0, One, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PBRC)
                        }

                        Method (_STA, 0, Serialized)
                        {
                            If (And (PBRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKC)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))
                        Name (_UID, 0x03)
                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x80, PCRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {1,3,4,5,6,7,10,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)
                        {
                            Name (RTLC, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, )
                                    {}
                            })
                            CreateWordField (RTLC, One, IRQ0)
                            Store (Zero, IRQ0)
                            ShiftLeft (One, And (PCRC, 0x0F), IRQ0)
                            Return (RTLC)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateWordField (Arg0, One, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PCRC)
                        }

                        Method (_STA, 0, Serialized)
                        {
                            If (And (PCRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKD)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))
                        Name (_UID, 0x04)
                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x80, PDRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {1,3,4,5,6,7,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)
                        {
                            Name (RTLD, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, )
                                    {}
                            })
                            CreateWordField (RTLD, One, IRQ0)
                            Store (Zero, IRQ0)
                            ShiftLeft (One, And (PDRC, 0x0F), IRQ0)
                            Return (RTLD)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateWordField (Arg0, One, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PDRC)
                        }

                        Method (_STA, 0, Serialized)
                        {
                            If (And (PDRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKE)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))
                        Name (_UID, 0x05)
                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x80, PERC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {1,3,4,5,6,7,10,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)
                        {
                            Name (RTLE, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, )
                                    {}
                            })
                            CreateWordField (RTLE, One, IRQ0)
                            Store (Zero, IRQ0)
                            ShiftLeft (One, And (PERC, 0x0F), IRQ0)
                            Return (RTLE)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateWordField (Arg0, One, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PERC)
                        }

                        Method (_STA, 0, Serialized)
                        {
                            If (And (PERC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKF)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))
                        Name (_UID, 0x06)
                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x80, PFRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {1,3,4,5,6,7,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)
                        {
                            Name (RTLF, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, )
                                    {}
                            })
                            CreateWordField (RTLF, One, IRQ0)
                            Store (Zero, IRQ0)
                            ShiftLeft (One, And (PFRC, 0x0F), IRQ0)
                            Return (RTLF)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateWordField (Arg0, One, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PFRC)
                        }

                        Method (_STA, 0, Serialized)
                        {
                            If (And (PFRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKG)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))
                        Name (_UID, 0x07)
                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x80, PGRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {1,3,4,5,6,7,10,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)
                        {
                            Name (RTLG, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, )
                                    {}
                            })
                            CreateWordField (RTLG, One, IRQ0)
                            Store (Zero, IRQ0)
                            ShiftLeft (One, And (PGRC, 0x0F), IRQ0)
                            Return (RTLG)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateWordField (Arg0, One, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PGRC)
                        }

                        Method (_STA, 0, Serialized)
                        {
                            If (And (PGRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKH)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))
                        Name (_UID, 0x08)
                        Method (_DIS, 0, Serialized)
                        {
                            Store (0x80, PHRC)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {1,3,4,5,6,7,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)
                        {
                            Name (RTLH, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, )
                                    {}
                            })
                            CreateWordField (RTLH, One, IRQ0)
                            Store (Zero, IRQ0)
                            ShiftLeft (One, And (PHRC, 0x0F), IRQ0)
                            Return (RTLH)
                        }

                        Method (_SRS, 1, Serialized)
                        {
                            CreateWordField (Arg0, One, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PHRC)
                        }

                        Method (_STA, 0, Serialized)
                        {
                            If (And (PHRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }
                }

                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                            Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                            Offset (0x48), 
                    Z00Y,   1, 
                            Offset (0xB0), 
                    RAEN,   1, 
                        ,   13, 
                    RCBA,   18
                }

                Device (DMAC)
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
                            0x11,               // Length
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
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))
                    Name (_CID, EisaId ("PNP0C01"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            If (HPAE)
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            If (HPAE)
                            {
                                Return (0x0B)
                            }
                        }

                        Return (Zero)
                    }

                    Method (_CRS, 0, Serialized)
                    {
                        If (HPAE)
                        {
                            CreateDWordField (BUF0, 0x04, HPT0)
                            If (LEqual (HPAS, One))
                            {
                                Store (0xFED01000, HPT0)
                            }

                            If (LEqual (HPAS, 0x02))
                            {
                                Store (0xFED02000, HPT0)
                            }

                            If (LEqual (HPAS, 0x03))
                            {
                                Store (0xFED03000, HPT0)
                            }
                        }

                        Return (BUF0)
                    }
                }

                Device (IPIC)
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
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, 0x02)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x006F,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
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
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0480,             // Range Minimum
                            0x0480,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFFFF,             // Range Minimum
                            0xFFFF,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0xFFFF,             // Range Minimum
                            0xFFFF,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1180,             // Range Minimum
                            0x1180,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x164E,             // Range Minimum
                            0x164E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0xFE00,             // Range Minimum
                            0xFE00,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
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
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (TIMR)
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
                }

                Device (CIR)
                {
                    Method (_HID, 0, NotSerialized)
                    {
                        If (LLess (OSYS, 0x07D6))
                        {
                            Return (0x2310A35C)
                        }
                        Else
                        {
                            Return (0x2010A35C)
                        }
                    }

                    OperationRegion (WBIO, SystemIO, 0x2E, 0x02)
                    Field (WBIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (WBMX, 0x00)
                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x07), 
                        LDN,    8, 
                                Offset (0x30), 
                        ACTR,   1, 
                                Offset (0x60), 
                        IOAH,   8, 
                        IOAL,   8, 
                                Offset (0x70), 
                        INTR,   8
                    }

                    Method (ENFG, 1, NotSerialized)
                    {
                        Acquire (WBMX, 0xFFFF)
                        Store (0x07, INDX)
                        Store (Arg0, DATA)
                    }

                    Method (EXFG, 0, NotSerialized)
                    {
                        Release (WBMX)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        ENFG (0x03)
                        Store (ACTR, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            Store (0x0F, Local0)
                        }
                        Else
                        {
                            Store (0x0D, Local0)
                            _DIS ()
                        }

                        If (LEqual (CIRI, Zero))
                        {
                            Store (Zero, Local0)
                            _DIS ()
                        }

                        If (LLess (OSYS, 0x07D6))
                        {
                            ENFG (0x03)
                            Store (Zero, IOAH)
                            Store (Zero, IOAL)
                            EXFG ()
                        }

                        Return (Local0)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        ENFG (0x03)
                        Store (Zero, ACTR)
                        Store (Zero, IOAH)
                        Store (Zero, IOAL)
                        Store (Zero, INTR)
                        EXFG ()
                        ENFG (0x04)
                        Store (Zero, ACTR)
                        Store (Zero, IOAH)
                        Store (Zero, IOAL)
                        EXFG ()
                        Store (Zero, Z00Y)
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Name (PRS1, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0600,             // Range Minimum
                                    0x0600,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0620,             // Range Minimum
                                    0x0620,             // Range Maximum
                                    0x01,               // Alignment
                                    0x20,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                        })
                        Name (PRS2, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0620,             // Range Minimum
                                    0x0620,             // Range Maximum
                                    0x01,               // Alignment
                                    0x20,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            EndDependentFn ()
                        })
                        If (LLess (OSYS, 0x07D6))
                        {
                            Return (PRS2)
                        }
                        Else
                        {
                            Return (PRS1)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Name (DCRS, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IRQNoFlags ()
                                {7}
                        })
                        Name (CRS1, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0600,             // Range Minimum
                                0x0600,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IO (Decode16,
                                0x0620,             // Range Minimum
                                0x0620,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                        })
                        Name (CRS2, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0620,             // Range Minimum
                                0x0620,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                        })
                        ENFG (0x03)
                        Store (ACTR, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            If (LLess (OSYS, 0x07D6))
                            {
                                Return (CRS2)
                            }
                            Else
                            {
                                Return (CRS1)
                            }
                        }
                        Else
                        {
                            Return (DCRS)
                        }
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        If (LLess (OSYS, 0x07D6))
                        {
                            CreateByteField (Arg0, 0x02, IO1L)
                            CreateByteField (Arg0, 0x03, IO1H)
                            CreateWordField (Arg0, 0x09, IRQX)
                            FindSetRightBit (IRQX, Local0)
                            Decrement (Local0)
                            ENFG (0x03)
                            Store (Zero, INTR)
                            Store (Zero, IOAH)
                            Store (Zero, IOAL)
                            Store (One, ACTR)
                            EXFG ()
                            ENFG (0x04)
                            Store (Local0, INTR)
                            Store (IO1H, IOAH)
                            Store (IO1L, IOAL)
                            Store (One, ACTR)
                            EXFG ()
                        }
                        Else
                        {
                            CreateByteField (Arg0, 0x02, AD1L)
                            CreateByteField (Arg0, 0x03, AD1H)
                            CreateByteField (Arg0, 0x0A, AD2L)
                            CreateByteField (Arg0, 0x0B, AD2H)
                            CreateWordField (Arg0, 0x11, IRQM)
                            FindSetRightBit (IRQM, Local0)
                            Decrement (Local0)
                            ENFG (0x03)
                            Store (Local0, INTR)
                            Store (AD1H, IOAH)
                            Store (AD1L, IOAL)
                            Store (One, ACTR)
                            EXFG ()
                            ENFG (0x04)
                            Store (Zero, INTR)
                            Store (AD2H, IOAH)
                            Store (AD2L, IOAL)
                            Store (One, ACTR)
                            EXFG ()
                        }

                        Store (One, Z00Y)
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
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
                    Name (_GPE, 0x18)
                    Name (SEL0, 0xF0)
                    Name (BFLG, Zero)
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Local0)
                            If (Local0)
                            {
                                Store (One, ECOK)
                            }
                            Else
                            {
                                Store (Zero, ECOK)
                            }
                        }

                        If (ECOK)
                        {
                            Acquire (MUT1, 0xFFFF)
                            Store (0x03, RG59)
                            Store (BTEN, BLTH)
                            Store (^^^^WLAN, WLAN)
                            Store (One, CPLE)
                            Store (PHSR (Zero, Zero), DOFF)
                            Release (MUT1)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
                    Field (ERAM, ByteAcc, NoLock, Preserve)
                    {
                                Offset (0x04), 
                        CMCM,   8, 
                        CMD1,   8, 
                        CMD2,   8, 
                        CMD3,   8, 
                                Offset (0x18), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   8, 
                        BATD,   16, 
                        ACDF,   1, 
                                Offset (0x41), 
                            ,   5, 
                        FLS4,   1, 
                                Offset (0x42), 
                                Offset (0x4C), 
                        ARCD,   1, 
                            ,   3, 
                        DOCK,   1, 
                        LANC,   1, 
                        LIDS,   1, 
                        CRTS,   1, 
                                Offset (0x51), 
                        BLVL,   8, 
                                Offset (0x53), 
                        DOFF,   8, 
                                Offset (0x58), 
                        CTMP,   8, 
                        RG59,   8, 
                                Offset (0x60), 
                        WLAN,   1, 
                        BLTH,   1, 
                        CPLE,   1, 
                            ,   3, 
                        WLST,   1, 
                        BLTS,   1, 
                            ,   2, 
                        ST3G,   1, 
                        MNST,   1, 
                            ,   1, 
                        ED3G,   1, 
                            ,   3, 
                                Offset (0x63), 
                        TJ85,   1, 
                            ,   6, 
                        VGAF,   1, 
                                Offset (0x70), 
                        BTMD,   8, 
                        MBTS,   1, 
                        MBTF,   1, 
                        BATF,   1, 
                            ,   3, 
                        MBDX,   1, 
                        MBAD,   1, 
                        MBTC,   1, 
                            ,   2, 
                        LION,   1, 
                                Offset (0x77), 
                        BA1C,   8, 
                        MCYC,   16, 
                        MTMP,   16, 
                        MDAT,   16, 
                        MCUR,   16, 
                        MBRM,   16, 
                        MBVG,   16, 
                        MRTF,   16, 
                        MMER,   8, 
                        BA2C,   8, 
                        LFCC,   16, 
                        BTSN,   16, 
                        BTDC,   16, 
                        BTDV,   16, 
                        BTMN,   8, 
                                Offset (0x93), 
                        BTST,   8, 
                                Offset (0x9D), 
                        OSTP,   1, 
                                Offset (0xA0), 
                        ABMD,   8, 
                        ABTS,   1, 
                        ABFC,   1, 
                            ,   4, 
                        ABDX,   1, 
                        ABAD,   1, 
                        ABCG,   1, 
                            ,   2, 
                        ABTP,   1, 
                                Offset (0xA8), 
                        ACYC,   16, 
                        ATMP,   16, 
                        ADAT,   16, 
                        ABCR,   16, 
                        ABRM,   16, 
                        ABVG,   16, 
                        ARTF,   16, 
                        AMER,   8, 
                                Offset (0xB8), 
                        AFCC,   16, 
                        ABSN,   16, 
                        ABDC,   16, 
                        ABDV,   16, 
                        ABMN,   8, 
                                Offset (0xD0), 
                        EBPL,   1, 
                                Offset (0xD1), 
                        PWRE,   1, 
                                Offset (0xD2), 
                            ,   6, 
                        VAUX,   1, 
                                Offset (0xD6), 
                        DBPL,   8, 
                                Offset (0xE0), 
                        DESP,   8, 
                        DTST,   8, 
                        DE0L,   8, 
                        DE0H,   8, 
                        DE1L,   8, 
                        DE1H,   8, 
                        DE2L,   8, 
                        DE2H,   8, 
                        DE3L,   8, 
                        DE3H,   8, 
                        DE4L,   8, 
                        DE4H,   8
                    }

                    Mutex (MUT1, 0x00)
                    Mutex (MUT0, 0x00)
                    Method (APOL, 1, NotSerialized)
                    {
                        Store (Arg0, DBPL)
                        Store (One, EBPL)
                    }

                    Name (PSTA, Zero)
                    Method (CPOL, 1, NotSerialized)
                    {
                        If (LEqual (PSTA, Zero))
                        {
                            If (LNotEqual (ECOK, Zero))
                            {
                                APOL (Arg0)
                                Store (One, PSTA)
                            }
                        }
                    }

                    Method (_Q20, 0, NotSerialized)
                    {
                        If (ECOK)
                        {
                            Acquire (MUT1, 0xFFFF)
                            If (And (SMST, 0x40))
                            {
                                Store (SMAA, Local0)
                                If (LEqual (Local0, 0x14))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (PWRE, Local1)
                                    If (Local1)
                                    {
                                        Store (Zero, PWRE)
                                        Store (0x12, BFLG)
                                        CPOL (One)
                                    }
                                }

                                If (LEqual (Local0, 0x16))
                                {
                                    And (SMST, 0xBF, SMST)
                                    Store (0x04, ^^^^BAT1.BCRI)
                                    Notify (BAT1, 0x80)
                                }
                                Else
                                {
                                    Store (Zero, ^^^^BAT1.BCRI)
                                }
                            }

                            Release (MUT1)
                        }
                    }

                    Method (_Q09, 0, NotSerialized)
                    {
                        If (ECOK)
                        {
                            Store (Zero, PSTA)
                            ^^^^BAT1.Z000 ()
                            Notify (ACAD, 0x80)
                            Sleep (0x01F4)
                            Notify (BAT1, 0x80)
                            If (^^^^BAT1.BTCH)
                            {
                                ^^^^BAT1.UBIF ()
                                Notify (BAT1, 0x81)
                                Store (Zero, ^^^^BAT1.BTCH)
                            }
                        }
                    }

                    Method (_Q8C, 0, NotSerialized)
                    {
                        Store (0x03, PCIB)
                        Store (Zero, PDME)
                        Store (Zero, PUME)
                        Store (0x06, DTYF)
                        Store (One, THTL)
                    }

                    Method (_Q8D, 0, NotSerialized)
                    {
                        Store (Zero, THTL)
                        Store (One, PUME)
                        Store (One, PDME)
                        Store (Zero, PCIB)
                    }

                    Method (_Q0D, 0, NotSerialized)
                    {
                        Notify (SLPB, 0x80)
                    }

                    Method (_Q0E, 0, NotSerialized)
                    {
                        If (PEGA)
                        {
                            ^^^PEGP.VGA.DRUL (One)
                        }
                        Else
                        {
                            ^^^GFX0.GHDS (Zero)
                        }
                    }

                    Method (_Q90, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (One, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q91, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x02, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q92, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x03, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q93, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x04, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x80)
                        }
                    }

                    Name (BRUD, Zero)
                    Method (_Q8E, 0, NotSerialized)
                    {
                        Store (0x86, BRUD)
                        _Q8F ()
                        Store (Zero, BRUD)
                    }

                    Method (_Q8F, 0, NotSerialized)
                    {
                        If (LLess (OSYS, 0x07D6))
                        {
                            If (LEqual (^^^^WMID.BAEF, One))
                            {
                                Store (0x05, ^^^^WMID.WMIQ)
                                Notify (WMID, 0x80)
                                Sleep (0xC8)
                            }
                        }

                        Store (0x03, BOWN)
                        Acquire (MUT1, 0xFFFF)
                        Store (BLVL, Local0)
                        Release (MUT1)
                        Store (Zero, Local1)
                        If (LNotEqual (Local1, 0x55))
                        {
                            ^^^^WMID.Z003 (Local0)
                        }

                        Store (Local0, BRTN)
                    }

                    Method (_Q94, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x09, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x82)
                        }
                    }

                    Method (_Q95, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x08, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x82)
                        }
                    }

                    Method (_Q8A, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x0B, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q8B, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x0C, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q9D, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x0F, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x80)
                        }
                    }

                    Method (_Q9E, 0, NotSerialized)
                    {
                        If (LEqual (^^^^WMID.BAEF, One))
                        {
                            Store (0x10, ^^^^WMID.WMIQ)
                            Notify (WMID, 0x80)
                        }
                    }
                }

                Device (PS2K)
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
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("SYN1B03"))
                    Name (_CID, Package (0x03)
                    {
                        EisaId ("SYN1B00"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x03, 
                    0x03
                })
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x04, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
            }

            Device (USBR)
            {
                Name (_ADR, 0x001D0003)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x20, 
                    0x03
                })
            }

            Device (EHC1)
            {
                Name (_ADR, 0x001D0007)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (USB3)
            {
                Name (_ADR, 0x001A0000)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x0E, 
                    0x03
                })
            }

            Device (USB4)
            {
                Name (_ADR, 0x001A0001)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (USB5)
            {
                Name (_ADR, 0x001A0002)
                OperationRegion (U1CS, PCI_Config, 0xC4, 0x04)
                Field (U1CS, DWordAcc, NoLock, Preserve)
                {
                    U1EN,   2
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x03, U1EN)
                    }
                    Else
                    {
                        Store (Zero, U1EN)
                    }
                }

                Method (_S3D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)
                {
                    Return (0x02)
                }

                Name (_PRW, Package (0x02)
                {
                    0x20, 
                    0x03
                })
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0007)
                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)
                OperationRegion (HDAR, PCI_Config, 0x4C, 0x10)
                Field (HDAR, WordAcc, NoLock, Preserve)
                {
                    DCKA,   1, 
                            Offset (0x01), 
                    DCKM,   1, 
                        ,   6, 
                    DCKS,   1, 
                            Offset (0x08), 
                        ,   15, 
                    PMES,   1
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDPX,   1, 
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }

                Device (PSL1)
                {
                    Name (_ADR, Zero)
                    Name (_RMV, One)
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDPX,   1, 
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
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

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDPX,   1, 
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDPX,   1, 
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
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

            Device (RP05)
            {
                Name (_ADR, 0x001C0004)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDPX,   1, 
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        Return (AR08)
                    }

                    Return (PR08)
                }
            }

            Device (RP06)
            {
                Name (_ADR, 0x001C0005)
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                            Offset (0x10), 
                        ,   4, 
                    LDPX,   1, 
                            Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                            Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                            Offset (0x1B), 
                    LSCX,   1, 
                            Offset (0x20), 
                            Offset (0x22), 
                    PSPX,   1, 
                            Offset (0x9C), 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Device (GLAN)
                {
                    Name (_ADR, Zero)
                    Name (_PRW, Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }
            }
        }
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0x00000410, 0x06) {}
        Processor (CPU1, 0x01, 0x00000410, 0x06) {}
        Processor (CPU2, 0x02, 0x00000410, 0x06) {}
        Processor (CPU3, 0x03, 0x00000410, 0x06) {}
    }

    Mutex (MUTX, 0x00)
    OperationRegion (PRT0, SystemIO, 0x80, 0x04)
    Field (PRT0, DWordAcc, Lock, Preserve)
    {
        P80H,   32
    }

    Method (P8XH, 2, Serialized)
    {
        If (LEqual (Arg0, Zero))
        {
            Store (Or (And (P80D, 0xFFFFFF00), Arg1), P80D)
        }

        If (LEqual (Arg0, One))
        {
            Store (Or (And (P80D, 0xFFFF00FF), ShiftLeft (Arg1, 0x08)
                ), P80D)
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Or (And (P80D, 0xFF00FFFF), ShiftLeft (Arg1, 0x10)
                ), P80D)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Or (And (P80D, 0x00FFFFFF), ShiftLeft (Arg1, 0x18)
                ), P80D)
        }

        Store (P80D, P80H)
    }

    OperationRegion (SPRT, SystemIO, 0xB2, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
        Store (Arg0, PICM)
    }

    Method (_PTS, 1, NotSerialized)
    {
        Store (Zero, P80D)
        P8XH (0x10, Arg0)
        If (LEqual (Arg0, 0x05))
        {
            \_SB.PHSR (0x07, Zero)
        }

        If (LEqual (Arg0, 0x03))
        {
            If (LAnd (DTSE, MPEN))
            {
                TRAP (TRTD, 0x1E)
            }
        }

        If (LEqual (Arg0, 0x05)) {}
        If (LEqual (Arg0, 0x04))
        {
            Store (One, INS4)
            If (\_SB.ECOK)
            {
                Acquire (\_SB.PCI0.LPCB.EC0.MUT1, 0xFFFF)
                Store (One, \_SB.PCI0.LPCB.EC0.FLS4)
                Release (\_SB.PCI0.LPCB.EC0.MUT1)
            }
        }

        \_SB.PHSR (One, Zero)
    }

    Method (_WAK, 1, NotSerialized)
    {
        P8XH (One, 0xAB)
        If (LEqual (Arg0, 0x03))
        {
            Notify (\_SB.PCI0.RP01, Zero)
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (LAnd (DTSE, MPEN))
            {
                TRAP (TRTD, 0x14)
            }

            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LAnd (LEqual (OSYS, 0x07D1), 
                    LNot (And (PDC0, 0x10)))))
                {
                    TRAP (TRTP, ESCS)
                }
            }

            If (LEqual (OSYS, 0x07D2))
            {
                If (And (CFGD, One))
                {
                    If (LGreater (\_PR.CPU0._PPC, Zero))
                    {
                        Subtract (\_PR.CPU0._PPC, One, \_PR.CPU0._PPC)
                        PNOT ()
                        Add (\_PR.CPU0._PPC, One, \_PR.CPU0._PPC)
                        PNOT ()
                    }
                    Else
                    {
                        Add (\_PR.CPU0._PPC, One, \_PR.CPU0._PPC)
                        PNOT ()
                        Subtract (\_PR.CPU0._PPC, One, \_PR.CPU0._PPC)
                        PNOT ()
                    }
                }
            }
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            Store (\_SB.BTEN, \_SB.PCI0.LPCB.EC0.BLTH)
            Store (\_SB.WLAN, \_SB.PCI0.LPCB.EC0.WLAN)
            Store (One, \_SB.PCI0.LPCB.EC0.CPLE)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (Zero, INS4)
            Notify (\_SB.PWRB, 0x02)
        }

        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }

    Method (GETB, 3, Serialized)
    {
        Multiply (Arg0, 0x08, Local0)
        Multiply (Arg1, 0x08, Local1)
        CreateField (Arg2, Local0, Local1, TBF3)
        Return (TBF3)
    }

    Method (PNOT, 0, Serialized)
    {
        If (MPEN)
        {
            If (And (PDC0, 0x08))
            {
                Notify (\_PR.CPU0, 0x80)
                If (And (PDC0, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU0, 0x81)
                }
            }

            If (And (PDC1, 0x08))
            {
                Notify (\_PR.CPU1, 0x80)
                If (And (PDC1, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU1, 0x81)
                }
            }
        }
        Else
        {
            Notify (\_PR.CPU0, 0x80)
            Sleep (0x64)
            Notify (\_PR.CPU0, 0x81)
        }
    }

    Method (TRAP, 2, Serialized)
    {
        Store (Arg1, SMIF)
        If (LEqual (Arg0, TRTP))
        {
            Store (Zero, TRPI)
        }

        If (LEqual (Arg0, TRTD))
        {
            Store (Arg1, DTSF)
            Store (Zero, TRPD)
            Return (DTSF)
        }

        If (LEqual (Arg0, TRTI))
        {
            Store (Zero, TRP0)
        }

        Return (SMIF)
    }

    Scope (_SB.PCI0)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store (One, PWRS)
            Store (0x07D0, OSYS)
            If (CondRefOf (_OSI, Local0))
            {
                If (_OSI ("Linux"))
                {
                    Store (0x03E8, OSYS)
                }

                If (_OSI ("Windows 2001"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x07D1, OSYS)
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x07D2, OSYS)
                }

                If (_OSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS)
                }

                If (LAnd (MPEN, LEqual (OSYS, 0x07D1))) {}
            }
        }
    }

    Scope (\)
    {
        Name (PICM, Zero)
    }

    Scope (_SB.PCI0)
    {
        Device (PDRC)
        {
            Name (_HID, EisaId ("PNP0C02"))
            Name (_UID, One)
            Name (BUF0, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00004000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00004000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00000000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFED20000,         // Address Base
                    0x00020000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFED40000,         // Address Base
                    0x00005000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFED45000,         // Address Base
                    0x0004B000,         // Address Length
                    )
            })
            Method (_CRS, 0, Serialized)
            {
                CreateDWordField (BUF0, 0x04, RBR0)
                ShiftLeft (^^LPCB.RCBA, 0x0E, RBR0)
                CreateDWordField (BUF0, 0x10, MBR0)
                ShiftLeft (MHBR, 0x0E, MBR0)
                CreateDWordField (BUF0, 0x1C, DBR0)
                ShiftLeft (DIBR, 0x0C, DBR0)
                CreateDWordField (BUF0, 0x28, EBR0)
                ShiftLeft (EPBR, 0x0C, EBR0)
                CreateDWordField (BUF0, 0x34, XBR0)
                ShiftLeft (PXBR, 0x1A, XBR0)
                CreateDWordField (BUF0, 0x38, XSZ0)
                ShiftRight (0x10000000, PXSZ, XSZ0)
                Return (BUF0)
            }
        }
    }

    Method (HKDS, 1, Serialized)
    {
        If (LEqual (Zero, And (0x03, DSEN)))
        {
            If (LEqual (TRAP (TRTI, Arg0), Zero))
            {
                If (LNotEqual (CADL, PADL))
                {
                    Store (CADL, PADL)
                    If (LOr (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                    {
                        Notify (\_SB.PCI0, Zero)
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.GFX0, Zero)
                    }

                    Sleep (0x02EE)
                }

                Notify (\_SB.PCI0.GFX0, 0x80)
            }
        }

        If (LEqual (One, And (0x03, DSEN)))
        {
            If (LEqual (TRAP (TRTI, Increment (Arg0)), Zero))
            {
                Notify (\_SB.PCI0.GFX0, 0x81)
            }
        }
    }

    Scope (\)
    {
        OperationRegion (IO_T, SystemIO, 0x0480, 0x10)
        Field (IO_T, ByteAcc, NoLock, Preserve)
        {
            TRPI,   16, 
                    Offset (0x04), 
                    Offset (0x06), 
                    Offset (0x08), 
            TRP0,   8, 
                    Offset (0x0A), 
                    Offset (0x0B), 
                    Offset (0x0C), 
                    Offset (0x0D), 
                    Offset (0x0E), 
                    Offset (0x0F), 
                    Offset (0x10)
        }

        OperationRegion (IO_D, SystemIO, 0x0900, 0x04)
        Field (IO_D, ByteAcc, NoLock, Preserve)
        {
            TRPD,   8
        }

        OperationRegion (IO_H, SystemIO, 0x0400, 0x04)
        Field (IO_H, ByteAcc, NoLock, Preserve)
        {
            TRPH,   8
        }

        OperationRegion (PMIO, SystemIO, PMBS, 0x80)
        Field (PMIO, ByteAcc, NoLock, Preserve)
        {
                    Offset (0x10), 
                ,   1, 
            TDTY,   3, 
            DTYE,   1, 
            DTYF,   3, 
            THTL,   1, 
                    Offset (0x22), 
                ,   6, 
            SLID,   1, 
                    Offset (0x28), 
                ,   2, 
            SPST,   1, 
                    Offset (0x42), 
                ,   1, 
            GPEC,   1, 
                    Offset (0x64), 
                ,   9, 
            SCIS,   1, 
                    Offset (0x66)
        }

        OperationRegion (GPIO, SystemIO, GPBS, 0x3C)
        Field (GPIO, ByteAcc, NoLock, Preserve)
        {
            GU00,   8, 
            GU01,   8, 
            GU02,   8, 
            GU03,   8, 
            GIO0,   8, 
            GIO1,   8, 
            GIO2,   8, 
            GIO3,   8, 
                    Offset (0x0C), 
            GL00,   8, 
            GL01,   8, 
            GL02,   8, 
                ,   3, 
            GP27,   1, 
            GP28,   1, 
                    Offset (0x10), 
                    Offset (0x18), 
            GB00,   8, 
            GB01,   8, 
            GB02,   8, 
            GB03,   8, 
                    Offset (0x2C), 
                ,   6, 
            LIDP,   1, 
                    Offset (0x2D), 
            GIV1,   8, 
            GIV2,   8, 
            GIV3,   8, 
            GU04,   8, 
            GU05,   8, 
            GU06,   8, 
            GU07,   8, 
            GIO4,   8, 
            GIO5,   8, 
            GIO6,   8, 
            GIO7,   8, 
                ,   5, 
                ,   1, 
                    Offset (0x39), 
            GL05,   8, 
            GL06,   8, 
            GL07,   8
        }

        OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
        Field (RCRB, DWordAcc, Lock, Preserve)
        {
                    Offset (0x1000), 
                    Offset (0x3000), 
                    Offset (0x3404), 
            HPAS,   2, 
                ,   5, 
            HPAE,   1, 
                    Offset (0x3418), 
                ,   1, 
                ,   1, 
            SATD,   1, 
            SMBD,   1, 
            HDAD,   1, 
                    Offset (0x341A), 
            RP1D,   1, 
            RP2D,   1, 
            RP3D,   1, 
            RP4D,   1, 
            RP5D,   1, 
            RP6D,   1
        }

        Method (GETP, 1, Serialized)
        {
            If (LEqual (And (Arg0, 0x09), Zero))
            {
                Return (0xFFFFFFFF)
            }

            If (LEqual (And (Arg0, 0x09), 0x08))
            {
                Return (0x0384)
            }

            ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
            ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
            Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
                ))
        }

        Method (GDMA, 5, Serialized)
        {
            If (Arg0)
            {
                If (LAnd (Arg1, Arg4))
                {
                    Return (0x14)
                }

                If (LAnd (Arg2, Arg4))
                {
                    Return (Multiply (Subtract (0x04, Arg3), 0x0F))
                }

                Return (Multiply (Subtract (0x04, Arg3), 0x1E))
            }

            Return (0xFFFFFFFF)
        }

        Method (GETT, 1, Serialized)
        {
            Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
                ), 0x03), And (Arg0, 0x03)))))
        }

        Method (GETF, 3, Serialized)
        {
            Name (TMPF, Zero)
            If (Arg0)
            {
                Or (TMPF, One, TMPF)
            }

            If (And (Arg2, 0x02))
            {
                Or (TMPF, 0x02, TMPF)
            }

            If (Arg1)
            {
                Or (TMPF, 0x04, TMPF)
            }

            If (And (Arg2, 0x20))
            {
                Or (TMPF, 0x08, TMPF)
            }

            If (And (Arg2, 0x4000))
            {
                Or (TMPF, 0x10, TMPF)
            }

            Return (TMPF)
        }

        Method (SETP, 3, Serialized)
        {
            If (LGreater (Arg0, 0xF0))
            {
                Return (0x08)
            }
            Else
            {
                If (And (Arg1, 0x02))
                {
                    If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                    {
                        Return (0x2301)
                    }

                    If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
                    {
                        Return (0x2101)
                    }
                }

                Return (0x1001)
            }
        }

        Method (SDMA, 1, Serialized)
        {
            If (LLessEqual (Arg0, 0x14))
            {
                Return (One)
            }

            If (LLessEqual (Arg0, 0x1E))
            {
                Return (0x02)
            }

            If (LLessEqual (Arg0, 0x2D))
            {
                Return (One)
            }

            If (LLessEqual (Arg0, 0x3C))
            {
                Return (0x02)
            }

            If (LLessEqual (Arg0, 0x5A))
            {
                Return (One)
            }

            Return (Zero)
        }

        Method (SETT, 3, Serialized)
        {
            If (And (Arg1, 0x02))
            {
                If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                {
                    Return (0x0B)
                }

                If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, One)))
                {
                    Return (0x09)
                }
            }

            Return (0x04)
        }
    }

    Scope (_SB.PCI0)
    {
        Device (SAT0)
        {
            Name (_ADR, 0x001F0002)
            OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
            Field (SACS, DWordAcc, NoLock, Preserve)
            {
                PRIT,   16, 
                SECT,   16, 
                PSIT,   4, 
                SSIT,   4, 
                        Offset (0x08), 
                SYNC,   4, 
                        Offset (0x0A), 
                SDT0,   2, 
                    ,   2, 
                SDT1,   2, 
                        Offset (0x0B), 
                SDT2,   2, 
                    ,   2, 
                SDT3,   2, 
                        Offset (0x14), 
                ICR0,   4, 
                ICR1,   4, 
                ICR2,   4, 
                ICR3,   4, 
                ICR4,   4, 
                ICR5,   4, 
                        Offset (0x50), 
                MAPV,   2
            }
        }

        Device (SAT1)
        {
            Name (_ADR, 0x001F0005)
            OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
            Field (SACS, DWordAcc, NoLock, Preserve)
            {
                PRIT,   16, 
                SECT,   16, 
                PSIT,   4, 
                SSIT,   4, 
                        Offset (0x08), 
                SYNC,   4, 
                        Offset (0x0A), 
                SDT0,   2, 
                    ,   2, 
                SDT1,   2, 
                        Offset (0x0B), 
                SDT2,   2, 
                    ,   2, 
                SDT3,   2, 
                        Offset (0x14), 
                ICR0,   4, 
                ICR1,   4, 
                ICR2,   4, 
                ICR3,   4, 
                ICR4,   4, 
                ICR5,   4, 
                        Offset (0x50), 
                MAPV,   2
            }
        }

        Device (SBUS)
        {
            Name (_ADR, 0x001F0003)
            OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
            Field (SMBP, DWordAcc, NoLock, Preserve)
            {
                    ,   2, 
                I2CE,   1
            }

            OperationRegion (SMBI, SystemIO, 0x1C00, 0x10)
            Field (SMBI, ByteAcc, NoLock, Preserve)
            {
                HSTS,   8, 
                        Offset (0x02), 
                HCON,   8, 
                HCOM,   8, 
                TXSA,   8, 
                DAT0,   8, 
                DAT1,   8, 
                HBDR,   8, 
                PECR,   8, 
                RXSA,   8, 
                SDAT,   16
            }

            Method (SSXB, 2, Serialized)
            {
                If (STRT ())
                {
                    Return (Zero)
                }

                Store (Zero, I2CE)
                Store (0xBF, HSTS)
                Store (Arg0, TXSA)
                Store (Arg1, HCOM)
                Store (0x48, HCON)
                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (One)
                }

                Return (Zero)
            }

            Method (SRXB, 1, Serialized)
            {
                If (STRT ())
                {
                    Return (0xFFFF)
                }

                Store (Zero, I2CE)
                Store (0xBF, HSTS)
                Store (Or (Arg0, One), TXSA)
                Store (0x44, HCON)
                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (DAT0)
                }

                Return (0xFFFF)
            }

            Method (SWRB, 3, Serialized)
            {
                If (STRT ())
                {
                    Return (Zero)
                }

                Store (Zero, I2CE)
                Store (0xBF, HSTS)
                Store (Arg0, TXSA)
                Store (Arg1, HCOM)
                Store (Arg2, DAT0)
                Store (0x48, HCON)
                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (One)
                }

                Return (Zero)
            }

            Method (SRDB, 2, Serialized)
            {
                If (STRT ())
                {
                    Return (0xFFFF)
                }

                Store (Zero, I2CE)
                Store (0xBF, HSTS)
                Store (Or (Arg0, One), TXSA)
                Store (Arg1, HCOM)
                Store (0x48, HCON)
                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (DAT0)
                }

                Return (0xFFFF)
            }

            Method (SWRW, 3, Serialized)
            {
                If (STRT ())
                {
                    Return (Zero)
                }

                Store (Zero, I2CE)
                Store (0xBF, HSTS)
                Store (Arg0, TXSA)
                Store (Arg1, HCOM)
                And (Arg2, 0xFF, DAT0)
                And (ShiftRight (Arg2, 0x08), 0xFF, DAT1)
                Store (0x4C, HCON)
                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (One)
                }

                Return (Zero)
            }

            Method (SRDW, 2, Serialized)
            {
                If (STRT ())
                {
                    Return (0xFFFF)
                }

                Store (Zero, I2CE)
                Store (0xBF, HSTS)
                Store (Or (Arg0, One), TXSA)
                Store (Arg1, HCOM)
                Store (0x4C, HCON)
                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (Or (ShiftLeft (DAT1, 0x08), DAT0))
                }

                Return (0xFFFFFFFF)
            }

            Method (SBLW, 4, Serialized)
            {
                If (STRT ())
                {
                    Return (Zero)
                }

                Store (Arg3, I2CE)
                Store (0xBF, HSTS)
                Store (Arg0, TXSA)
                Store (Arg1, HCOM)
                Store (SizeOf (Arg2), DAT0)
                Store (Zero, Local1)
                Store (DerefOf (Index (Arg2, Zero)), HBDR)
                Store (0x54, HCON)
                While (LGreater (SizeOf (Arg2), Local1))
                {
                    Store (0x0FA0, Local0)
                    While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                    }

                    If (LNot (Local0))
                    {
                        KILL ()
                        Return (Zero)
                    }

                    Store (0x80, HSTS)
                    Increment (Local1)
                    If (LGreater (SizeOf (Arg2), Local1))
                    {
                        Store (DerefOf (Index (Arg2, Local1)), HBDR)
                    }
                }

                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (One)
                }

                Return (Zero)
            }

            Method (SBLR, 3, Serialized)
            {
                Name (TBUF, Buffer (0x0100) {})
                If (STRT ())
                {
                    Return (Zero)
                }

                Store (Arg2, I2CE)
                Store (0xBF, HSTS)
                Store (Or (Arg0, One), TXSA)
                Store (Arg1, HCOM)
                Store (0x54, HCON)
                Store (0x0FA0, Local0)
                While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                {
                    Decrement (Local0)
                    Stall (0x32)
                }

                If (LNot (Local0))
                {
                    KILL ()
                    Return (Zero)
                }

                Store (DAT0, Index (TBUF, Zero))
                Store (0x80, HSTS)
                Store (One, Local1)
                While (LLess (Local1, DerefOf (Index (TBUF, Zero))))
                {
                    Store (0x0FA0, Local0)
                    While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                    }

                    If (LNot (Local0))
                    {
                        KILL ()
                        Return (Zero)
                    }

                    Store (HBDR, Index (TBUF, Local1))
                    Store (0x80, HSTS)
                    Increment (Local1)
                }

                If (COMP ())
                {
                    Or (HSTS, 0xFF, HSTS)
                    Return (TBUF)
                }

                Return (Zero)
            }

            Method (STRT, 0, Serialized)
            {
                Store (0xC8, Local0)
                While (Local0)
                {
                    If (And (HSTS, 0x40))
                    {
                        Decrement (Local0)
                        Sleep (One)
                        If (LEqual (Local0, Zero))
                        {
                            Return (One)
                        }
                    }
                    Else
                    {
                        Store (Zero, Local0)
                    }
                }

                Store (0x0FA0, Local0)
                While (Local0)
                {
                    If (And (HSTS, One))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                        If (LEqual (Local0, Zero))
                        {
                            KILL ()
                        }
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Return (One)
            }

            Method (COMP, 0, Serialized)
            {
                Store (0x0FA0, Local0)
                While (Local0)
                {
                    If (And (HSTS, 0x02))
                    {
                        Return (One)
                    }
                    Else
                    {
                        Decrement (Local0)
                        Stall (0x32)
                        If (LEqual (Local0, Zero))
                        {
                            KILL ()
                        }
                    }
                }

                Return (Zero)
            }

            Method (KILL, 0, Serialized)
            {
                Or (HCON, 0x02, HCON)
                Or (HSTS, 0xFF, HSTS)
            }
        }
    }

    Scope (_GPE)
    {
        Method (_L01, 0, NotSerialized)
        {
            P8XH (Zero, One)
            If (LAnd (LEqual (RP1D, Zero), \_SB.PCI0.RP01.HPSX))
            {
                Sleep (0x64)
                If (\_SB.PCI0.RP01.PDCX)
                {
                    Store (One, \_SB.PCI0.RP01.PDCX)
                    Store (One, \_SB.PCI0.RP01.HPSX)
                    Notify (\_SB.PCI0.RP01, Zero)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP01.HPSX)
                }
            }

            If (LAnd (LEqual (RP2D, Zero), \_SB.PCI0.RP02.HPSX))
            {
                If (\_SB.PCI0.RP02.PDCX)
                {
                    Store (One, \_SB.PCI0.RP02.PDCX)
                    Store (One, \_SB.PCI0.RP02.HPSX)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP02.HPSX)
                }
            }

            If (LAnd (LEqual (RP3D, Zero), \_SB.PCI0.RP03.HPSX))
            {
                If (\_SB.PCI0.RP03.PDCX)
                {
                    Store (One, \_SB.PCI0.RP03.PDCX)
                    Store (One, \_SB.PCI0.RP03.HPSX)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP03.HPSX)
                }
            }

            If (LAnd (LEqual (RP4D, Zero), \_SB.PCI0.RP04.HPSX))
            {
                If (\_SB.PCI0.RP04.PDCX)
                {
                    Store (One, \_SB.PCI0.RP04.PDCX)
                    Store (One, \_SB.PCI0.RP04.HPSX)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP04.HPSX)
                }
            }

            If (LAnd (LEqual (RP5D, Zero), \_SB.PCI0.RP05.HPSX))
            {
                If (\_SB.PCI0.RP05.PDCX)
                {
                    Store (One, \_SB.PCI0.RP05.PDCX)
                    Store (One, \_SB.PCI0.RP05.HPSX)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP05.HPSX)
                }
            }

            If (LAnd (LEqual (RP6D, Zero), \_SB.PCI0.RP06.HPSX))
            {
                If (\_SB.PCI0.RP06.PDCX)
                {
                    Store (One, \_SB.PCI0.RP06.PDCX)
                    Store (One, \_SB.PCI0.RP06.HPSX)
                }
                Else
                {
                    Store (One, \_SB.PCI0.RP06.HPSX)
                }
            }
        }

        Method (_L06, 0, NotSerialized)
        {
            If (LAnd (\_SB.PCI0.GFX0.GSSE, LNot (GSMI)))
            {
                \_SB.PCI0.GFX0.GSCI ()
            }
            Else
            {
                If (LEqual (And (\_SB.PCI0.ESCS, 0x08), 0x08))
                {
                    Store (One, Local0)
                    Store (\_SB.PCI0.T0IS, \_SB.PCI0.T0IS)
                    Store (\_SB.PCI0.T0IS, Local0)
                    Store (\_SB.PCI0.T1IS, \_SB.PCI0.T1IS)
                    Store (\_SB.PCI0.T1IS, Local0)
                    Store (One, SCIS)
                    Store (One, \_SB.PCI0.GTSE)
                    If (CondRefOf (\_SB.PCI0.TMEM.GPEH))
                    {
                        \_SB.PCI0.TMEM.GPEH ()
                    }
                }
                Else
                {
                    Store (One, SCIS)
                }
            }
        }

        Method (_L07, 0, NotSerialized)
        {
            Store (0x20, \_SB.PCI0.SBUS.HSTS)
        }

        Method (_L09, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.PEGP, 0x02)
            Notify (\_SB.PCI0.PEGP.VGA, 0x02)
            Notify (\_SB.PCI0.RP01, 0x02)
            Notify (\_SB.PCI0.RP02, 0x02)
            Notify (\_SB.PCI0.RP03, 0x02)
            Notify (\_SB.PCI0.RP04, 0x02)
            Notify (\_SB.PCI0.RP05, 0x02)
            Notify (\_SB.PCI0.RP06, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P0P1, 0x02)
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
        }

        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB1, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L20, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USBR, 0x02)
            Notify (\_SB.PCI0.USB5, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.EHC1, 0x02)
            Notify (\_SB.PCI0.EHC2, 0x02)
            Notify (\_SB.PCI0.HDEF, 0x02)
        }

        Method (_L0E, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB3, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB4, 0x02)
        }
    }

    Scope (_SB.PCI0)
    {
        Device (WMI1)
        {
            Name (_HID, "PNP0C14")
            Name (_UID, "MXM2")
            Name (_WDG, Buffer (0x3C)
            {
                /* 0000 */    0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E, 
                /* 0008 */    0xB5, 0x77, 0x93, 0x1E, 0xA3, 0x2A, 0x2C, 0xC0, 
                /* 0010 */    0x4D, 0x58, 0x01, 0x02, 0x57, 0x93, 0x8A, 0xF2, 
                /* 0018 */    0x4B, 0xCF, 0x1A, 0x4A, 0x88, 0x93, 0xBB, 0x1F, 
                /* 0020 */    0x58, 0xEE, 0xA1, 0xAF, 0xD1, 0x00, 0x01, 0x08, 
                /* 0028 */    0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11, 
                /* 0030 */    0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 
                /* 0038 */    0x58, 0x4D, 0x01, 0x00
            })
            Method (WMMX, 3, NotSerialized)
            {
                If (LGreaterEqual (SizeOf (Arg2), 0x04))
                {
                    CreateDWordField (Arg2, Zero, FUNC)
                    CreateDWordField (Arg2, 0x04, ARGS)
                    If (LEqual (FUNC, 0x494D584D))
                    {
                        Return (^^PEGP.VGA.MXMI (ARGS))
                    }
                    Else
                    {
                        If (LEqual (FUNC, 0x534D584D))
                        {
                            Return (^^PEGP.VGA.MXMS (ARGS))
                        }
                    }
                }

                Return (Zero)
            }

            Name (WQXM, Buffer (0x029C)
            {
                /* 0000 */    0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00, 
                /* 0008 */    0x8B, 0x02, 0x00, 0x00, 0x0C, 0x08, 0x00, 0x00, 
                /* 0010 */    0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54, 
                /* 0018 */    0x18, 0xD2, 0x83, 0x00, 0x01, 0x06, 0x18, 0x42, 
                /* 0020 */    0x10, 0x05, 0x10, 0x8A, 0xE6, 0x80, 0x42, 0x04, 
                /* 0028 */    0x92, 0x43, 0xA4, 0x30, 0x30, 0x28, 0x0B, 0x20, 
                /* 0030 */    0x86, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x04, 0x84, 
                /* 0038 */    0xBC, 0x0A, 0xB0, 0x29, 0xC0, 0x24, 0x88, 0xFA, 
                /* 0040 */    0xF7, 0x87, 0x28, 0x09, 0x0E, 0x25, 0x04, 0x42, 
                /* 0048 */    0x12, 0x05, 0x98, 0x17, 0xA0, 0x5B, 0x80, 0x61, 
                /* 0050 */    0x01, 0xB6, 0x05, 0x98, 0x16, 0xE0, 0x18, 0x92, 
                /* 0058 */    0x4A, 0x03, 0xA7, 0x04, 0x96, 0x02, 0x21, 0xA1, 
                /* 0060 */    0x02, 0x94, 0x0B, 0xF0, 0x2D, 0x40, 0x3B, 0xA2, 
                /* 0068 */    0x24, 0x0B, 0xB0, 0x0C, 0x23, 0x02, 0x8F, 0x82, 
                /* 0070 */    0xA1, 0x71, 0x68, 0xEC, 0x30, 0x2C, 0x13, 0x4C, 
                /* 0078 */    0x83, 0x38, 0x8C, 0xB2, 0x91, 0x45, 0x60, 0xDC, 
                /* 0080 */    0x4E, 0x05, 0xC8, 0x15, 0x20, 0x4C, 0x80, 0x78, 
                /* 0088 */    0x54, 0x61, 0x34, 0x07, 0x45, 0xE0, 0x42, 0x63, 
                /* 0090 */    0x64, 0x40, 0xC8, 0xA3, 0x00, 0xAB, 0xA3, 0xD0, 
                /* 0098 */    0xA4, 0x12, 0xD8, 0xBD, 0x00, 0x8D, 0x02, 0xB4, 
                /* 00A0 */    0x09, 0x70, 0x28, 0x40, 0xA1, 0x00, 0x6B, 0x18, 
                /* 00A8 */    0x72, 0x06, 0x21, 0x5B, 0xD8, 0xC2, 0x68, 0x50, 
                /* 00B0 */    0x80, 0x45, 0x14, 0x8D, 0xE0, 0x2C, 0x2A, 0x9E, 
                /* 00B8 */    0x93, 0x50, 0x02, 0xDA, 0x1B, 0x82, 0xF0, 0x8C, 
                /* 00C0 */    0xD9, 0x18, 0x9E, 0x10, 0x83, 0x54, 0x86, 0x21, 
                /* 00C8 */    0x88, 0xB8, 0x11, 0x8E, 0xA5, 0xFD, 0x41, 0x10, 
                /* 00D0 */    0xF9, 0xAB, 0xD7, 0xB8, 0x1D, 0x69, 0x34, 0xA8, 
                /* 00D8 */    0xB1, 0x26, 0x38, 0x76, 0x8F, 0xE6, 0x84, 0x3B, 
                /* 00E0 */    0x17, 0x20, 0x7D, 0x6E, 0x02, 0x39, 0xBA, 0xD3, 
                /* 00E8 */    0xA8, 0x73, 0xD0, 0x64, 0x78, 0x0C, 0x2B, 0xC1, 
                /* 00F0 */    0x7F, 0x80, 0x4F, 0x01, 0x78, 0xD7, 0x80, 0x9A, 
                /* 00F8 */    0xFE, 0xC1, 0x33, 0x41, 0x70, 0xA8, 0x21, 0x7A, 
                /* 0100 */    0xD4, 0xE1, 0x4E, 0xE0, 0xBC, 0x8E, 0x84, 0x41, 
                /* 0108 */    0x1C, 0xD1, 0x71, 0x63, 0x67, 0x75, 0x32, 0x07, 
                /* 0110 */    0x5D, 0xAA, 0x00, 0xB3, 0x07, 0x00, 0x0D, 0x2E, 
                /* 0118 */    0xC1, 0x69, 0x9F, 0x49, 0xE8, 0xF7, 0x80, 0xF3, 
                /* 0120 */    0xE9, 0x79, 0x6C, 0x6C, 0x10, 0xA8, 0x91, 0xF9, 
                /* 0128 */    0xFF, 0x0F, 0xED, 0x41, 0x9E, 0x56, 0xCC, 0x90, 
                /* 0130 */    0xCF, 0x02, 0x87, 0xC5, 0xC4, 0x1E, 0x19, 0xE8, 
                /* 0138 */    0x78, 0xC0, 0x7F, 0x00, 0x78, 0x34, 0x88, 0xF0, 
                /* 0140 */    0x66, 0xE0, 0xF9, 0x9A, 0x60, 0x50, 0x08, 0x39, 
                /* 0148 */    0x19, 0x0F, 0x4A, 0xCC, 0xF9, 0x80, 0xCC, 0x25, 
                /* 0150 */    0xC4, 0x43, 0xC0, 0x31, 0xC4, 0x08, 0x7A, 0x46, 
                /* 0158 */    0x45, 0x23, 0x6B, 0x22, 0x3E, 0x03, 0x78, 0xDC, 
                /* 0160 */    0x96, 0x05, 0x42, 0x09, 0x0C, 0xEC, 0x73, 0xC3, 
                /* 0168 */    0x3B, 0x84, 0x61, 0x71, 0xA3, 0x09, 0xEC, 0xF3, 
                /* 0170 */    0x85, 0x05, 0x0E, 0x0A, 0x05, 0xEB, 0xBB, 0x42, 
                /* 0178 */    0xCC, 0xE7, 0x81, 0xE3, 0x3C, 0x60, 0x0B, 0x9F, 
                /* 0180 */    0x28, 0x01, 0x3E, 0x24, 0x8F, 0x06, 0xDE, 0x20, 
                /* 0188 */    0xE1, 0x5B, 0x3F, 0x02, 0x10, 0xE0, 0x27, 0x06, 
                /* 0190 */    0x13, 0x58, 0x1E, 0x30, 0x7A, 0x94, 0xF6, 0x2B, 
                /* 0198 */    0x00, 0x21, 0xF8, 0x8B, 0xC5, 0x53, 0xC0, 0xEB, 
                /* 01A0 */    0x40, 0x84, 0x63, 0x81, 0x29, 0x72, 0x6C, 0x68, 
                /* 01A8 */    0x78, 0x7E, 0x70, 0x88, 0x1E, 0xF5, 0x5C, 0xC2, 
                /* 01B0 */    0x1F, 0x4D, 0x94, 0x53, 0x38, 0x1C, 0x1F, 0x39, 
                /* 01B8 */    0x8C, 0x10, 0xFE, 0x49, 0xE3, 0xC9, 0xC3, 0x9A, 
                /* 01C0 */    0xEF, 0x00, 0x9A, 0xD2, 0x5B, 0xC0, 0xFB, 0x83, 
                /* 01C8 */    0x47, 0x80, 0x11, 0x20, 0xE1, 0x68, 0x82, 0x89, 
                /* 01D0 */    0x7C, 0x3A, 0x01, 0xD5, 0xFF, 0xFF, 0x74, 0x02, 
                /* 01D8 */    0xB8, 0xBA, 0x01, 0x14, 0x37, 0x6A, 0x9D, 0x49, 
                /* 01E0 */    0x7C, 0x2C, 0xF1, 0xAD, 0xE4, 0xBC, 0x43, 0xC5, 
                /* 01E8 */    0x7F, 0x93, 0x78, 0x3A, 0xF1, 0x34, 0x1E, 0x4C, 
                /* 01F0 */    0x42, 0x44, 0x89, 0x18, 0x21, 0xA2, 0xEF, 0x27, 
                /* 01F8 */    0x46, 0x08, 0x15, 0x31, 0x6C, 0xA4, 0x37, 0x80, 
                /* 0200 */    0xE7, 0x13, 0xE3, 0x84, 0x08, 0xF4, 0x74, 0xC2, 
                /* 0208 */    0x42, 0x3E, 0x34, 0xA4, 0xE1, 0x74, 0x02, 0x50, 
                /* 0210 */    0xE0, 0xFF, 0x7F, 0x3A, 0x81, 0x1F, 0xF5, 0x74, 
                /* 0218 */    0x82, 0x1E, 0xAE, 0x4F, 0x19, 0x18, 0xE4, 0x03, 
                /* 0220 */    0xF2, 0xA9, 0xC3, 0xF7, 0x1F, 0x13, 0xF8, 0x78, 
                /* 0228 */    0xC2, 0x45, 0x1D, 0x4F, 0x50, 0xA7, 0x07, 0x1F, 
                /* 0230 */    0x4F, 0xD8, 0x19, 0xE1, 0x2C, 0x1E, 0x03, 0x7C, 
                /* 0238 */    0x3A, 0xC1, 0xDC, 0x13, 0x7C, 0x3A, 0x01, 0xDB, 
                /* 0240 */    0x68, 0x60, 0x1C, 0x4F, 0xC0, 0x77, 0x74, 0xC1, 
                /* 0248 */    0x1D, 0x4F, 0xC0, 0x30, 0x18, 0x18, 0xE7, 0x13, 
                /* 0250 */    0xE0, 0x31, 0x5E, 0xDC, 0x31, 0xC0, 0x43, 0xE0, 
                /* 0258 */    0x03, 0x78, 0xDC, 0x38, 0x3D, 0x2B, 0x9D, 0x14, 
                /* 0260 */    0xF2, 0x24, 0xC2, 0x07, 0x85, 0x39, 0xB0, 0xE0, 
                /* 0268 */    0x14, 0xDA, 0xF4, 0xA9, 0xD1, 0xA8, 0x55, 0x83, 
                /* 0270 */    0x32, 0x35, 0xCA, 0x34, 0xA8, 0xD5, 0xA7, 0x52, 
                /* 0278 */    0x63, 0xC6, 0xCE, 0x19, 0x0E, 0xF8, 0x10, 0xD0, 
                /* 0280 */    0x89, 0xC0, 0xF2, 0x9E, 0x0D, 0x02, 0xB1, 0x0C, 
                /* 0288 */    0x0A, 0x81, 0x58, 0xFA, 0xAB, 0x45, 0x20, 0x0E, 
                /* 0290 */    0x0E, 0xA2, 0xFF, 0x3F, 0x88, 0x23, 0xD2, 0x0A, 
                /* 0298 */    0xC4, 0xFF, 0x7F, 0x7F
            })
        }
    }

    Scope (_SB.PCI0.PEGP.VGA)
    {
        Method (MXMI, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x20))
            {
                Return (0x20)
            }
            Else
            {
                Return (0x21)
            }
        }

        Method (MXMS, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x20))
            {
                Return (MXM2)
            }
            Else
            {
                Return (MX21)
            }
        }

        Name (MXM2, Buffer (0x2B)
        {
            /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x02, 0x00, 0x23, 0x00, 
            /* 0008 */    0x30, 0x12, 0xB8, 0xFF, 0xF9, 0x3E, 0x00, 0x00, 
            /* 0010 */    0xFA, 0xFF, 0xF9, 0x3E, 0x20, 0x21, 0x8A, 0xFF, 
            /* 0018 */    0xF9, 0x3E, 0x01, 0x20, 0x03, 0x00, 0x02, 0x69, 
            /* 0020 */    0x00, 0x00, 0x03, 0x50, 0x40, 0x01, 0x13, 0x50, 
            /* 0028 */    0x40, 0x01, 0x62
        })
        Name (MX21, Buffer (0x2B)
        {
            /* 0000 */    0x4D, 0x58, 0x4D, 0x5F, 0x02, 0x01, 0x23, 0x00, 
            /* 0008 */    0x30, 0x12, 0xB8, 0xFF, 0xF9, 0x3E, 0x00, 0x00, 
            /* 0010 */    0xFA, 0xFF, 0xF9, 0x3E, 0x20, 0x21, 0x8A, 0xFF, 
            /* 0018 */    0xF9, 0x3E, 0x01, 0x20, 0x03, 0x00, 0x02, 0x69, 
            /* 0020 */    0x00, 0x00, 0x03, 0x50, 0x40, 0x01, 0x13, 0x50, 
            /* 0028 */    0x40, 0x01, 0x61
        })
    }

    Name (_S0, Package (0x04)
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x04)
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S4, Package (0x04)
    {
        0x06, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
}

